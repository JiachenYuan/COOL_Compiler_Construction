/*********************************************************************
 Intermediate code generator for COOL: SKELETON

 Read the comments carefully and add code to build an LLVM program
*********************************************************************/

#define EXTERN
#include "cgen.h"
#include <fstream>
#include <sstream>
#include <string>

extern int cgen_debug, curr_lineno;

/*********************************************************************
 For convenience, a large number of symbols are predefined here.
 These symbols include the primitive type and method names, as well
 as fixed names used by the runtime system. Feel free to add your
 own definitions as you see fit.
*********************************************************************/
EXTERN Symbol
    // required classes
    Object,
    IO, String, Int, Bool, Main,

    // class methods
    cool_abort, type_name, cool_copy, out_string, out_int, in_string, in_int,
    length, concat, substr,

    // class members
    val,

    // special symbols
    No_class,  // symbol that can't be the name of any user-defined class
    No_type,   // If e : No_type, then no code is generated for e.
    SELF_TYPE, // Special code is generated for new SELF_TYPE.
    self,      // self generates code differently than other references

    // extras
    arg, arg2, newobj, Mainmain, prim_string, prim_int, prim_bool;

// Initializing the predefined symbols.
static void initialize_constants(void) {
  Object = idtable.add_string("Object");
  IO = idtable.add_string("IO");
  String = idtable.add_string("String");
  Int = idtable.add_string("Int");
  Bool = idtable.add_string("Bool");
  Main = idtable.add_string("Main");

  cool_abort = idtable.add_string("abort");
  type_name = idtable.add_string("type_name");
  cool_copy = idtable.add_string("copy");
  out_string = idtable.add_string("out_string");
  out_int = idtable.add_string("out_int");
  in_string = idtable.add_string("in_string");
  in_int = idtable.add_string("in_int");
  length = idtable.add_string("length");
  concat = idtable.add_string("concat");
  substr = idtable.add_string("substr");

  val = idtable.add_string("val");

  No_class = idtable.add_string("_no_class");
  No_type = idtable.add_string("_no_type");
  SELF_TYPE = idtable.add_string("SELF_TYPE");
  self = idtable.add_string("self");

  arg = idtable.add_string("arg");
  arg2 = idtable.add_string("arg2");
  newobj = idtable.add_string("_newobj");
  Mainmain = idtable.add_string("main");
  prim_string = idtable.add_string("sbyte*");
  prim_int = idtable.add_string("int");
  prim_bool = idtable.add_string("bool");
}

/*********************************************************************

  CgenClassTable methods

*********************************************************************/

// CgenClassTable constructor orchestrates all code generation
CgenClassTable::CgenClassTable(Classes classes, std::ostream &s)
    : nds(0), current_tag(0) {
  if (cgen_debug)
    std::cerr << "Building CgenClassTable" << std::endl;
  ct_stream = &s;
  // Make sure we have a scope, both for classes and for constants
  enterscope();

  // Create an inheritance tree with one CgenNode per class.
  install_basic_classes();
  install_classes(classes);
  build_inheritance_tree();

  // First pass
  setup();

  // Second pass
  code_module();
  // Done with code generation: exit scopes
  exitscope();
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes() {
  // The tree package uses these globals to annotate the classes built below.
  curr_lineno = 0;
  Symbol filename = stringtable.add_string("<basic class>");

  //
  // A few special class names are installed in the lookup table but not
  // the class list. Thus, these classes exist, but are not part of the
  // inheritance hierarchy.

  // No_class serves as the parent of Object and the other special classes.
  Class_ noclasscls = class_(No_class, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(noclasscls, CgenNode::Basic, this));
  delete noclasscls;

#ifdef MP3
  // SELF_TYPE is the self class; it cannot be redefined or inherited.
  Class_ selftypecls = class_(SELF_TYPE, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(selftypecls, CgenNode::Basic, this));
  delete selftypecls;
  //
  // Primitive types masquerading as classes. This is done so we can
  // get the necessary Symbols for the innards of String, Int, and Bool
  //
  Class_ primstringcls =
      class_(prim_string, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(primstringcls, CgenNode::Basic, this));
  delete primstringcls;
#endif
  Class_ primintcls = class_(prim_int, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(primintcls, CgenNode::Basic, this));
  delete primintcls;
  Class_ primboolcls = class_(prim_bool, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(primboolcls, CgenNode::Basic, this));
  delete primboolcls;
  //
  // The Object class has no parent class. Its methods are
  //    cool_abort() : Object    aborts the program
  //    type_name() : Str        returns a string representation of class name
  //    copy() : SELF_TYPE       returns a copy of the object
  //
  // There is no need for method bodies in the basic classes---these
  // are already built in to the runtime system.
  //
  Class_ objcls = class_(
      Object, No_class,
      append_Features(
          append_Features(single_Features(method(cool_abort, nil_Formals(),
                                                 Object, no_expr())),
                          single_Features(method(type_name, nil_Formals(),
                                                 String, no_expr()))),
          single_Features(
              method(cool_copy, nil_Formals(), SELF_TYPE, no_expr()))),
      filename);
  install_class(new CgenNode(objcls, CgenNode::Basic, this));
  delete objcls;

  //
  // The Int class has no methods and only a single attribute, the
  // "val" for the integer.
  //
  Class_ intcls = class_(
      Int, Object, single_Features(attr(val, prim_int, no_expr())), filename);
  install_class(new CgenNode(intcls, CgenNode::Basic, this));
  delete intcls;

  //
  // Bool also has only the "val" slot.
  //
  Class_ boolcls = class_(
      Bool, Object, single_Features(attr(val, prim_bool, no_expr())), filename);
  install_class(new CgenNode(boolcls, CgenNode::Basic, this));
  delete boolcls;

#ifdef MP3
  //
  // The class String has a number of slots and operations:
  //       val                                  the string itself
  //       length() : Int                       length of the string
  //       concat(arg: Str) : Str               string concatenation
  //       substr(arg: Int, arg2: Int): Str     substring
  //
  Class_ stringcls =
      class_(String, Object,
             append_Features(
                 append_Features(
                     append_Features(
                         single_Features(attr(val, prim_string, no_expr())),
                         single_Features(
                             method(length, nil_Formals(), Int, no_expr()))),
                     single_Features(method(concat,
                                            single_Formals(formal(arg, String)),
                                            String, no_expr()))),
                 single_Features(
                     method(substr,
                            append_Formals(single_Formals(formal(arg, Int)),
                                           single_Formals(formal(arg2, Int))),
                            String, no_expr()))),
             filename);
  install_class(new CgenNode(stringcls, CgenNode::Basic, this));
  delete stringcls;
#endif

#ifdef MP3
  //
  // The IO class inherits from Object. Its methods are
  //        out_string(Str) : SELF_TYPE          writes a string to the output
  //        out_int(Int) : SELF_TYPE               "    an int    "  "     "
  //        in_string() : Str                    reads a string from the input
  //        in_int() : Int                         "   an int     "  "     "
  //
  Class_ iocls = class_(
      IO, Object,
      append_Features(
          append_Features(
              append_Features(
                  single_Features(method(out_string,
                                         single_Formals(formal(arg, String)),
                                         SELF_TYPE, no_expr())),
                  single_Features(method(out_int,
                                         single_Formals(formal(arg, Int)),
                                         SELF_TYPE, no_expr()))),
              single_Features(
                  method(in_string, nil_Formals(), String, no_expr()))),
          single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
      filename);
  install_class(new CgenNode(iocls, CgenNode::Basic, this));
  delete iocls;
#endif
}

// install_classes enters a list of classes in the symbol table.
void CgenClassTable::install_classes(Classes cs) {
  for (auto cls : cs) {
    install_class(new CgenNode(cls, CgenNode::NotBasic, this));
  }
}

// Add this CgenNode to the class list and the lookup table
void CgenClassTable::install_class(CgenNode *nd) {
  Symbol name = nd->get_name();
  if (!this->find(name)) {
    // The class name is legal, so add it to the list of classes
    // and the symbol table.
    nds.push_back(nd);
    this->insert(name, nd);
  }
}

// Add this CgenNode to the special class list and the lookup table
void CgenClassTable::install_special_class(CgenNode *nd) {
  Symbol name = nd->get_name();
  if (!this->find(name)) {
    // The class name is legal, so add it to the list of special classes
    // and the symbol table.
    special_nds.push_back(nd);
    this->insert(name, nd);
  }
}

// CgenClassTable::build_inheritance_tree
void CgenClassTable::build_inheritance_tree() {
  for (auto node : nds)
    set_relations(node);
}

// CgenClassTable::set_relations
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table. Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd) {
  Symbol parent = nd->get_parent();
  auto parent_node = this->find(parent);
  if (!parent_node) {
    throw std::runtime_error("Class " + nd->get_name()->get_string() +
                             " inherits from an undefined class " +
                             parent->get_string());
  }
  nd->set_parent(parent_node);
}

// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP2
void CgenClassTable::setup_external_functions() {
  ValuePrinter vp(*ct_stream);
  // setup function: external int strcmp(sbyte*, sbyte*)
  op_type i32_type(INT32), i8ptr_type(INT8_PTR), vararg_type(VAR_ARG);
  std::vector<op_type> strcmp_args;
  strcmp_args.push_back(i8ptr_type);
  strcmp_args.push_back(i8ptr_type);
  vp.declare(*ct_stream, i32_type, "strcmp", strcmp_args);

  // setup function: external int printf(sbyte*, ...)
  std::vector<op_type> printf_args;
  printf_args.push_back(i8ptr_type);
  printf_args.push_back(vararg_type);
  vp.declare(*ct_stream, i32_type, "printf", printf_args);

  // setup function: external void abort(void)
  op_type void_type(VOID);
  std::vector<op_type> abort_args;
  vp.declare(*ct_stream, void_type, "abort", abort_args);

  // setup function: external i8* malloc(i32)
  std::vector<op_type> malloc_args;
  malloc_args.push_back(i32_type);
  vp.declare(*ct_stream, i8ptr_type, "malloc", malloc_args);

#ifdef MP3
  // TODO: add code here
#endif
}

void CgenClassTable::setup_classes(CgenNode *c, int depth) {
  c->setup(current_tag++, depth);
  for (auto child : c->get_children()) {
    setup_classes(child, depth + 1);
  }
  c->set_max_child(current_tag - 1);
}

// The code generation first pass. Define these two functions to traverse
// the tree and setup each CgenNode
void CgenClassTable::setup() {
  setup_external_functions();
  setup_classes(root(), 0);
}

// The code generation second pass. Add code here to traverse the tree and
// emit code for each CgenNode
void CgenClassTable::code_module() {
  code_constants();

#ifndef MP3
  // This must be after code_constants() since that emits constants
  // needed by the code() method for expressions
  CgenNode *mainNode = getMainmain(root());
  mainNode->codeGenMainmain();
#endif
  code_main();

#ifdef MP3
  code_classes(root());
#endif
}

#ifdef MP3
void CgenClassTable::code_classes(CgenNode *c) {
  // TODO: add code here

  // Code itself, then call children's code_class recursively
  c->code_class();

  for (CgenNode* child : c->get_children()) {
    child->code_class();
  }

}
#endif

// Create global definitions for constant Cool objects
void CgenClassTable::code_constants() {
#ifdef MP3
  // TODO: add code here
  stringtable.code_string_table(*ct_stream, this);  
#endif
}

// Create LLVM entry point. This function will initiate our Cool program
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main(){
// TODO: add code here
ValuePrinter valuePrinter(*ct_stream);
// Define a global string: "Main.main() returned %d\n"
valuePrinter.init_constant(".str", const_value(op_arr_type(INT8, 25), "Main.main() returned %d\n", true));
// Define a function main that has no parameters and returns an i32
valuePrinter.define(INT32, "main", {});
// Define an entry basic block
valuePrinter.begin_block("entry");
// Call Main_main(). This returns int for phase 1, Object for phase 2
operand temp0 = valuePrinter.call({}, INT32, "Main_main", true, {});
#ifdef MP3
// MP3
#else
// MP2
// Get the address of the string "Main_main() returned %d\n" using
// getelementptr
operand temp1 = valuePrinter.getelementptr(op_arr_type(INT8, 25), global_value(op_arr_ptr_type(INT8, 25), ".str"), int_value(0), int_value(0), op_arr_type(INT8, 25));
// Call printf with the string address of "Main_main() returned %d\n"
// and the return value of Main_main() as its arguments
operand temp2 = valuePrinter.call_variadic({INT8_PTR}, INT32, "printf", true, {operand(INT8_PTR, temp1.get_name().substr(1)), operand(INT32, temp0.get_name().substr(1))});
// Insert return 0
valuePrinter.ret(int_value(0));
valuePrinter.end_define();
#endif
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root() {
  auto root = this->find(Object);
  if (!root) {
    throw std::runtime_error("Class Object is not defined.");
  }
  return root;
}

#ifndef MP3
// Special-case functions used for the method Int Main::main() for
// MP2 only.
CgenNode *CgenClassTable::getMainmain(CgenNode *c) {
  if (c && !c->basic())
    return c; // Found it!
  for (auto child : c->get_children()) {
    if (CgenNode *foundMain = this->getMainmain(child))
      return foundMain; // Propagate it up the recursive calls
  }
  return 0; // Make the recursion continue
}
#endif

/*********************************************************************

  StrTable / IntTable methods

 Coding string, int, and boolean constants

 Cool has three kinds of constants: strings, ints, and booleans.
 This section defines code generation for each type.

 All string constants are listed in the global "stringtable" and have
 type stringEntry. stringEntry methods are defined both for string
 constant definitions and references.

 All integer constants are listed in the global "inttable" and have
 type IntEntry. IntEntry methods are defined for Int constant references only.

 Since there are only two Bool values, there is no need for a table.
 The two booleans are represented by instances of the class BoolConst,
 which defines the definition and reference methods for Bools.

*********************************************************************/

// Create definitions for all String constants
void StrTable::code_string_table(std::ostream &s, CgenClassTable *ct) {
  for (auto &[_, entry] : this->_table) {
    entry.code_def(s, ct);
  }
}

// generate code to define a global string constant
void StringEntry::code_def(std::ostream &s, CgenClassTable *ct) {
#ifdef MP3
  // TODO: add code here
  ValuePrinter vp(s);
  const std::string& str_const = get_string();
  std::string vreg_name = "global_str."+std::to_string(get_index());
  vp.init_constant(vreg_name, const_value(op_arr_type(INT8, str_const.size()+1), str_const+"\00", true)); 

  // Inititialize a String Object
  operand op(op_type("String"), "@String."+std::to_string(get_index()));
  op.set_name(op.get_name().substr(1));

  std::vector<op_type> string_struct_types = { op_type("_String_vtable*"), op_type(INT8_PTR) };
  std::vector<const_value> string_struct_values = { const_value(EMPTY, "@_String_vtable_prototype", true) };
  string_struct_values.push_back(const_value(op_arr_type(INT8, str_const.size()+1), "@"+vreg_name, true));
  vp.init_struct_constant(op, string_struct_types, string_struct_values);

  ct->string_literal_vreg_names[str_const] = "@String." + std::to_string(get_index());
#endif
}

/*********************************************************************

  CgenNode methods

*********************************************************************/

//
// Class setup. You may need to add parameters to this function so that
// the classtable can provide setup information (such as the class tag
// that should be used by this class).
//
// Things that setup should do:
//  - layout the features of the class
//  - create the types for the class and its vtable
//  - create global definitions used by the class such as the class vtable
//
void CgenNode::setup(int tag, int depth) {
  this->tag = tag;
#ifdef MP3
  layout_features();

  // TODO: add code here
  ValuePrinter vp(*get_ctstream());
  std::string class_name = get_type_name();

  // Special initialization function for Int and Bool
  if (get_type_name() == "Int") {
    vp.declare(op_type(VOID), "Int_init", {op_type(get_type_name()+"*"), INT32});
  } else if (get_type_name() == "Bool") {
    vp.declare(op_type(VOID), "Bool_init", {op_type(get_type_name()+"*"), INT1});
  }
  // Declare a new function for class new
  vp.declare(op_type(class_name).get_ptr_type(), get_init_function_name(), {});

  //* 1. Declare Class Record
  // declare function name as a string
  vp.init_constant("str."+class_name, const_value(op_arr_type(INT8, class_name.size()+1), class_name+"\00", true)); 
  int obj_record_attr_index = 0;
  std::vector<op_type> attributes_types = { op_type(get_vtable_type_name()).get_ptr_type() };
  obj_record_index_of_attributes[get_vtable_name()] = obj_record_attr_index;
  obj_record_attr_index++;
  
  // append all parent's attributes types
  if (parentnd) {
    for (std::string& k: parentnd->attr_names_in_order) {
      op_type v = parentnd->attr_list[k];
      if (k.find("_vtable") != std::string::npos) {
        continue;
      }
      if (v.get_name().find("SELF_TYPE") != std::string::npos) {
        attributes_types.push_back(op_type(class_name).get_ptr_type());
      } else {
        attributes_types.push_back(v);
      }
      obj_record_index_of_attributes[k] = obj_record_attr_index;
      obj_record_attr_index++;
    }
  }

  for (std::string k : attr_names_in_order) {
    op_type v = attr_list[k];
    if (v.get_name().find("SELF_TYPE") != std::string::npos) {
      attributes_types.push_back(op_type(class_name).get_ptr_type());
    } else {
      attributes_types.push_back(v);
    }
    obj_record_index_of_attributes[k] = obj_record_attr_index;
    obj_record_attr_index++;
  }
  vp.type_define(class_name, attributes_types);

  //* 2. Declare Class VTable
  std::vector<op_type> vtable_types = {INT32, INT32, INT8_PTR};
  int vtable_index = 3;
  // Insert special NEW function in Vtable
  op_func_type new_func_type(op_type(class_name).get_ptr_type(), {});
  vtable_types.push_back(new_func_type);
  global_method_name_map["new"] = get_init_function_name();
  method_types_in_LLVM["new"] = new_func_type;
  method_types_in_COOL["new"] = new_func_type;
  method_types_earliest["new"] = new_func_type;
  vtable_index_of_method["new"] = vtable_index;
  vtable_index++;

  // Inherit Parent's methods
  std::vector<std::string> inherited_method_in_order;
  std::unordered_set<std::string> inherited_methods_set;
  for (std::string& method_name : parentnd->method_names_in_order) {
    op_func_type ty = parentnd->method_types_in_COOL[method_name];
    op_type method_ret_type;
    std::vector<op_type> method_param_types;
    method_ret_type = ty.res;
    method_param_types = ty.args;
    // Special handling of SELF_TYPE return type
    if (ty.res.get_name().find("SELF_TYPE*") != std::string::npos) {
      method_ret_type = class_name + "*";
    }
    // Inserting SELF_TYPE* as the first of the parameter list
    method_param_types.insert(method_param_types.begin(), op_type(class_name).get_ptr_type());
    // Reserve a slot in the vtable of the class
    op_func_type method_type = op_func_type(method_ret_type, method_param_types);

    // vtable_types.push_back(method_type);
    // Inherited method's earliest type should be its parent's
    method_types_earliest[method_name] = parentnd->method_types_earliest[method_name];
    method_types_in_COOL[method_name] = parentnd->method_types_in_COOL[method_name];

    auto it = std::find(method_names_in_order.begin(), method_names_in_order.end(), method_name);
    if(it != method_names_in_order.end()) {
      method_names_in_order.erase(it);
      // Overriding method should have its own name and type
      global_method_name_map[method_name] = local_method_to_global_func(method_name);
      method_types_earliest[method_name] = method_type;
    } else {
      // Inheritanced methods should have the same global name as its parent's
      global_method_name_map[method_name] = parentnd->global_method_name_map[method_name];
    }
    inherited_method_in_order.push_back(method_name);
    inherited_methods_set.insert(method_name);
    // method_names_in_order.insert(method_names_in_order.begin(), method_name);
    
  }
  // Add inherited_method_in_order into current method's method list
  for (int i=inherited_method_in_order.size()-1; i>=0; i--) {
    method_names_in_order.insert(method_names_in_order.begin(), inherited_method_in_order[i]);
  }
  for (std::string& method_name : method_names_in_order) {
    op_func_type ty = method_types_in_COOL[method_name];
    op_type method_ret_type;
    std::vector<op_type> method_param_types;
    
    method_ret_type = ty.res;
    method_param_types = ty.args;
      
    // Special handling of SELF_TYPE return type
    if (ty.res.get_name().find("SELF_TYPE*") != std::string::npos) {
      method_ret_type = class_name + "*";
    }
    // Inserting SELF_TYPE* as the first of the parameter list
    method_param_types.insert(method_param_types.begin(), op_type(class_name).get_ptr_type());
    
    // Reserve a slot in the vtable of the class
    op_func_type method_type = op_func_type(method_ret_type, method_param_types);
    vtable_types.push_back(method_type);
    // Only record LLVM type of non-inherited or non-overriding method
    if (parentnd->method_types_in_COOL.find(method_name) == parentnd->method_types_in_COOL.end()) {
      method_types_earliest[method_name] = method_type;
    }
    method_types_in_LLVM[method_name] = method_type;
    vtable_index_of_method[method_name] = vtable_index;
    vtable_index ++;
  }
  vp.type_define(get_vtable_type_name(), vtable_types);


  //* 3. Instantiate A vtable Instance
  std::vector<op_type> field_types = vtable_types;
  std::vector<const_value> init_values;
  init_values.push_back(int_value(tag));
  std::string self_ptr = class_name + "*";
  std::string temp = "ptrtoint (%"+ self_ptr +" getelementptr (%"+class_name+", %"+self_ptr+" null, i32 1) to i32)";
  init_values.push_back(const_value(INT32, temp, true));
  std::string temp_name_length = std::to_string(class_name.size() + 1);
  init_values.push_back(const_value(op_arr_type(INT8, class_name.size()+1), "@str."+class_name, true));
  init_values.push_back(const_value(INT32, "@"+get_init_function_name(), true));

  for (std::string& method_name : method_names_in_order) {
    op_func_type ty = method_types_in_COOL[method_name];
  // for (auto& [method_name, ty] : method_types_in_COOL) {
    std::string method_name_in_llvm = global_method_name_map[method_name];
    // If this method is a override method, use bitcast
    if (parentnd->method_types_in_COOL.find(method_name) != parentnd->method_types_in_COOL.end()) {
      op_func_type parent_method_type = parentnd->method_types_earliest[method_name];
      operand op1(parent_method_type, parentnd->global_method_name_map[method_name]);
      op_type curr_method_type = method_types_in_LLVM[method_name]; 
      std::string temp = "bitcast (" + op1.get_typename() + " "
                          + "@"+op1.get_name().substr(1) + " to " + curr_method_type.get_name() + ")";
      init_values.push_back(const_value(INT32, temp, true));
    } else {
      init_values.push_back(const_value(INT32, "@"+method_name_in_llvm, true));
    }
  }
  operand op = operand(op_type(get_vtable_type_name()), get_vtable_name());
  op.set_name("@" + op.get_name().substr(1)); // remove the first "%""
  vp.init_struct_constant(op, field_types, init_values);


  // if (cgen_debug) {
  //   using namespace std;
  //   cerr << "num of methods in LLVM=" << method_types_earliest.size() << endl;
  //   cerr << "num of methods in COOL=" << method_types_in_COOL.size() << endl;
  //   cerr << (method_types_earliest.size() == method_types_in_COOL.size()) << endl;
  // }
#endif
}

#ifdef MP3
// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features() {
  // TODO: add code here
  for (int i=features->first(); features->more(i); i=features->next(i)) {
    features->nth(i)->layout_feature(this);
  }
}

// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
void CgenNode::code_class() {
  // No code generation for basic classes. The runtime will handle that.
  if (basic()) {
    return;
  }
  // TODO: add code here
  for (int i=features->first(); features->more(i); i=features->next(i)) {
    method_class* method = (method_class *)features->nth(i);
    CgenEnvironment env(*ct_stream, this);
    method->code(&env);
  }
  // Recursively call code class for children classes
  for (CgenNode* child : get_children()) {
    child->code_class();
  }
}

void CgenNode::code_init_function(CgenEnvironment *env) {
  // TODO: add code here
}

#else

// code-gen function main() in class Main
void CgenNode::codeGenMainmain() {
  // In Phase 1, this can only be class Main. Get method_class for main().
  assert(std::string(this->name->get_string()) == std::string("Main"));
  method_class *mainMethod = (method_class *)features->nth(features->first());

  // TODO: add code here to generate the function `int Mainmain()`.
  // Generally what you need to do are:
  // -- setup or create the environment, env, for translating this method
  // -- invoke mainMethod->code(env) to translate the method
  CgenEnvironment env(*ct_stream, this);
  mainMethod->code(&env);
}

#endif

/*********************************************************************

  CgenEnvironment functions

*********************************************************************/

// Look up a CgenNode given a symbol
CgenNode *CgenEnvironment::type_to_class(Symbol t) {
  return t == SELF_TYPE ? get_class()
                        : get_class()->get_classtable()->find_in_scopes(t);
}

/*********************************************************************

  APS class methods

    Fill in the following methods to produce code for the
    appropriate expression. You may add or remove parameters
    as you wish, but if you do, remember to change the parameters
    of the declarations in `cool-tree.handcode.h'.

*********************************************************************/

void program_class::cgen(const std::optional<std::string> &outfile) {
  initialize_constants();
  if (outfile) {
    std::ofstream s(*outfile);
    if (!s.good()) {
      std::cerr << "Cannot open output file " << *outfile << std::endl;
      exit(1);
    }
    class_table = new CgenClassTable(classes, s);
  } else {
    class_table = new CgenClassTable(classes, std::cout);
  }
}

// Create a method body
void method_class::code(CgenEnvironment *env) {
  if (cgen_debug) {
    std::cerr << "method" << std::endl;
  }

  ValuePrinter vp(*env->cur_stream);
  // TODO: add code here
  CgenNode* current_cls = env->get_class();
  std::string cur_class_name_in_COOL = name->get_string();
  std::string cur_class_name_in_LLVM = current_cls->global_method_name_map[cur_class_name_in_COOL]; 
  op_func_type curr_method_type = current_cls->method_types_in_LLVM[cur_class_name_in_COOL];
  op_type cur_method_res_type = curr_method_type.res;
  
  std::vector<op_type> cur_method_args_types = curr_method_type.args;
  std::vector<std::string> args_names = {"self"  };

  for (int i=formals->first(); formals->more(i); i=formals->next(i)) {
    Formal param = formals->nth(i);
    args_names.push_back(param->get_name()->get_string());
  }
  // Zip the argument names and their LLVM types together to create the argument list for LLVM function definition
  if (cur_method_args_types.size() != args_names.size()) {
    std::cerr << "Trying to zip argument names with their LLVM types, but the length of the two arrays are not the same" << std::endl;
    abort(); 
  }
  std::vector<operand> cur_method_args;
  for (std::size_t i=0; i<cur_method_args_types.size(); i++) {
    cur_method_args.push_back(operand(cur_method_args_types[i], args_names[i]));
  }

  
  vp.define(cur_method_res_type, cur_class_name_in_LLVM, cur_method_args);
  vp.begin_block("entry");
  // Make alloca recursively
  // expr->make_alloca(env);
  // Recursively emit code for expressions contained in the main method
  // operand ret = expr->code(env);
  // vp.ret(ret);

  // Abort section (for any runtime error exception handling)
  vp.begin_block("abort");
  vp.call({}, VOID, "abort", true, {});
  vp.unreachable();
  vp.end_define();
}

// Codegen for expressions. Note that each expression has a value.

operand assign_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "assign" << std::endl;

  ValuePrinter vp(*env->cur_stream);
  // /TODO: add code here and replace `return operand()`
  operand value = expr->code(env);
  operand* decl_var = env->find_in_scopes(name);
  vp.store(value, *decl_var);
  
  return value;
}

operand cond_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "cond" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  std::string labelThen = env->new_label("true.", false);
  std::string labelElse = env->new_label("false.", false);
  std::string labelEnd = env->new_label("end.", true);

  operand predResult = pred->code(env);
  vp.branch_cond(predResult, labelThen, labelElse);

  vp.begin_block(labelThen);
  operand thenResult = then_exp->code(env);
  vp.store(thenResult, res_ptr);
  vp.branch_uncond(labelEnd);

  vp.begin_block(labelElse);
  operand elseResult = else_exp->code(env);
  vp.store(elseResult, res_ptr);
  vp.branch_uncond(labelEnd);

  vp.begin_block(labelEnd);
  return vp.load(res_ptr.get_type().get_deref_type(), res_ptr);
}

operand loop_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "loop" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);

  // create labels will be used for a loop
  std::string labelWhile = env->new_label("while.", false);
  std::string labelBody = env->new_label("loop_body.", false);
  std::string labelLoopEnd = env->new_label("loop_end.", true);

  vp.branch_uncond(labelWhile);
  vp.begin_block(labelWhile);
  operand predResult = pred->code(env);
  vp.branch_cond(predResult, labelBody, labelLoopEnd);

  vp.begin_block(labelBody);
  operand bodyResult = body->code(env);
  vp.branch_uncond(labelWhile);

  vp.begin_block(labelLoopEnd);
  return int_value(0); 
}

operand block_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "block" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand ret;
  for (int it = body->first(); body->more(it); it = body->next(it)) {
    Expression expr = body->nth(it);
    ret = expr->code(env);
  }
  return ret;
}

operand let_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "let" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  env->open_scope();

  operand var_init = init->code(env);
  // If variable uninitialized, give it default values
  if (var_init.is_empty()) {
    if (type_decl->get_string() == "Int") {
      var_init = int_value(0);
    } else if (type_decl->get_string() == "Bool") {
      var_init = bool_value(false, true);
    }
  }
  vp.store(var_init, id_op);
  env->add_binding(identifier, &id_op);
  operand ret = body->code(env);

  env->close_scope();
  return ret;
}

operand plus_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "plus" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  return vp.add(op1, op2);
}

operand sub_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "sub" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  return vp.sub(op1, op2);
}

operand mul_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "mul" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  return vp.mul(op1, op2);
}

operand divide_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "div" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);

  // Generate code for divide-by-zero runtime exception handling
  std::string ok_label = env->new_ok_label();
  operand is_divider_zero = vp.icmp(EQ, op2, int_value(0));
  vp.branch_cond(is_divider_zero, "abort", ok_label);

  vp.begin_block(ok_label);
  return vp.div(op1, op2);
}

operand neg_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "neg" << std::endl;

  // /TODO: add code here and replace `return operand()` 
  ValuePrinter vp(*env->cur_stream);
  operand op1 = int_value(0);
  operand op2 = e1->code(env);
  return vp.sub(op1, op2); 
}

operand lt_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "lt" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  return vp.icmp(LT, op1, op2);

}

operand eq_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "eq" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  return vp.icmp(EQ, op1, op2);
}

operand leq_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "leq" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  return vp.icmp(LE, op1, op2);
}

operand comp_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "complement" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = bool_value(true, true), op2 = e1->code(env);
  return vp.xor_in(op2, op1);
}

operand int_const_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Integer Constant" << std::endl;

  // /TODO: add code here and replace `return operand()`
  return int_value(atoi(token->get_string().c_str()));
}

operand bool_const_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Boolean Constant" << std::endl;

  // /TODO: add code here and replace `return operand()`
  
  return bool_value(val, true);
}

operand object_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Object" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand ret = *env->find_in_scopes(name);
  return vp.load(ret.get_type().get_deref_type(), ret);
}

operand no_expr_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "No_expr" << std::endl;

  // /TODO: add code here and replace `return operand()`
  return operand();
}

//*****************************************************************
// The next few functions are for node types 1 supported in Phase 1
// but these functions must be defined because they are declared as
// methods via the Expression_SHARED_EXTRAS hack.
//*****************************************************************

operand static_dispatch_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "static dispatch" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  /*  
  Expression expr;
  Symbol type_name;
  Symbol name;
  Expressions actual;
  */

  // 1. Prepare parameters
  std::vector<operand> param_list;
  int first = actual->first();
  int second = actual->next(first);
  for (int i=second; actual->more(i); i=actual->next(i)) {
    Expression param = actual->nth(i);
    param_list.push_back(param->code(env));
  }
  operand expr_code = expr->code(env);
  param_list.insert(param_list.begin(), expr_code);

  operand isNull = vp.icmp(EQ, expr_code, null_value(EMPTY));
  std::string new_ok_label = env->new_ok_label();
  vp.branch_cond(isNull, "abort", new_ok_label);
  
  vp.begin_block(new_ok_label);

  // 2. get function ptr from correct vtable
  CgenNode* designated_class = env->type_to_class(type_name);
  std::string method_name = name->get_string();
  int method_index_in_vtable = designated_class->vtable_index_of_method[method_name];
  std::string vtable_type_name = designated_class->get_vtable_type_name();
  std::string vtable_name = designated_class->get_vtable_name();
  op_func_type method_type = designated_class->method_types_in_LLVM[method_name];
  operand ptr_to_method = vp.getelementptr(
    op_type(vtable_type_name), 
    operand(op_type(vtable_type_name).get_ptr_type(), vtable_name),
    int_value(0),
    int_value(method_index_in_vtable),
    method_type.get_ptr_type());  
  vp.load(method_type, ptr_to_method);
  // 3. Conform parameters 
  for (std::size_t i=0; i<param_list.size(); i++) {
    operand conformed = conform(param_list[i], method_type.args[i], env);
    param_list[i] = conformed;
  }
  // 4. call
  operand ret = vp.call(method_type.args, method_type.res, ptr_to_method.get_name(), false, param_list);
  return ret;
#endif
}

operand string_const_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "string_const" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  return operand();
#endif
}

operand dispatch_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "dispatch" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
 ValuePrinter vp(*env->cur_stream);
  /*  
  Expression expr;
  Symbol name;
  Expressions actual;
  */

  // 1. Prepare parameters
  std::vector<operand> param_list;
  int first = actual->first();
  int second = actual->next(first);
  for (int i=second; actual->more(i); i=actual->next(i)) {
    Expression param = actual->nth(i);
    param_list.push_back(param->code(env));
  }
  operand expr_code = expr->code(env);
  if(expr_code.get_type().get_name() == op_type(INT32).get_name() ){
    expr_code = conform(expr_code, op_type("Int*"), env);
  }else if(expr_code.get_type().get_name() == op_type(INT1).get_name() ){
    expr_code = conform(expr_code, op_type("Bool*"), env);
  param_list.insert(param_list.begin(), expr_code);

  operand isNull = vp.icmp(EQ, expr_code, null_value(EMPTY));
  std::string new_ok_label = env->new_ok_label();
  vp.branch_cond(isNull, "abort", new_ok_label);
  
  vp.begin_block(new_ok_label);

  // 2. get function ptr from correct vtable
  Symbol target_type_name = expr->get_type();
  if(expr_code.get_type().get_name() == op_type(INT32).get_name() ){
    target_type_name = Symbol("Int");
  }else if(expr_code.get_type().get_name() == op_type(INT1).get_name() ){
    target_type_name = Symbol("Bool");
  
  CgenNode* designated_class = env->type_to_class(target_type_name);
  std::string method_name = name->get_string();
  int method_index_in_vtable = designated_class->vtable_index_of_method[method_name];
  std::string vtable_type_name = designated_class->get_vtable_type_name();
  std::string vtable_name = designated_class->get_vtable_name();
  op_func_type method_type = designated_class->method_types_in_LLVM[method_name];
  operand ptr_to_method = vp.getelementptr(
    op_type(vtable_type_name), 
    operand(op_type(vtable_type_name).get_ptr_type(), vtable_name),
    int_value(0),
    int_value(method_index_in_vtable),
    method_type.get_ptr_type());  
  vp.load(method_type, ptr_to_method);
  // 3. Conform parameters (excluding the first implicit parameter)
  for (std::size_t i=0; i<param_list.size(); i++) {
    operand conformed = conform(param_list[i], method_type.args[i], env);
    param_list[i] = conformed;
  }
  // 4. call
  operand ret = vp.call(method_type.args, method_type.res, ptr_to_method.get_name(), false, param_list);
  return ret; 
#endif
}

// Handle a Cool case expression (selecting based on the type of an object)
operand typcase_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "typecase::code()" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  return operand();
#endif
}

operand new__class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "newClass" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  return operand();
#endif
}

operand isvoid_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "isvoid" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  return operand();
#endif
}

op_type convert_to_COOL_type(std::string type_str) {
  op_type ret_type_COOL;
  if (type_str == "Int" || type_str == "int") {
    ret_type_COOL = op_type(INT32);
  } else if (type_str == "Bool" || type_str == "bool") {
    ret_type_COOL = op_type(INT1);
  } else if (type_str == "sbyte*") {
    ret_type_COOL = op_type(INT8_PTR);
  } else {
    ret_type_COOL = op_type(type_str).get_ptr_type();
  }
  return ret_type_COOL;
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here
  // Get return type as LLVM type
  std::string ret_type_str = return_type->get_string();
  op_type ret_type_COOL = convert_to_COOL_type(ret_type_str);
  // Replcae self type with current type
  // if (ret_type_COOL.get_name().find("SELF_TYPE") != std::string::npos) {
  //   ret_type_COOL = op_type(cls->get_type_name()).get_ptr_type();
  // }

  // Get method name. Name should be "[ClassName].ID", where ID is the name of the method in COOL
  std::string function_name = name->get_string();
  std::string method_name = cls->local_method_to_global_func(function_name);
  cls->global_method_name_map[function_name] = method_name;

  // Get formal parameters' types as LLVM types
  std::vector<op_type> formal_COOL_type_list;
  for (int i=formals->first(); formals->more(i); i=formals->next(i)) {
    Formal arg = formals->nth(i);
    std::string formal_type_str_repr = arg->get_type_decl()->get_string();
    formal_COOL_type_list.push_back(convert_to_COOL_type(formal_type_str_repr));
  }

  // !Record it in CgenNode's data structure, USING FUNCTION_NAME AS KEY
  // ! Also record the order of relative position of the method because order matters in vtable generation
  cls->method_types_in_COOL[function_name] = op_func_type(ret_type_COOL, formal_COOL_type_list);
  cls->method_names_in_order.push_back(function_name);
  // Print the declaration of the method as global function
  // Need to first handle SELF_TYPEs
  ValuePrinter vp(*(cls->get_ctstream()));
  op_type ret_type_llvm = ret_type_COOL;
  std::vector<op_type> formal_llvm_type_list = formal_COOL_type_list;
  if (ret_type_COOL.get_name().find("SELF_TYPE") != std::string::npos) {
    ret_type_llvm = op_type(cls->get_type_name()).get_ptr_type();
  }
  formal_llvm_type_list.insert(formal_llvm_type_list.begin(), op_type(cls->get_type_name()).get_ptr_type());

  vp.declare(ret_type_llvm, method_name, formal_llvm_type_list);



#endif
}

// Handle one branch of a Cool case expression.
// If the source tag is >= the branch tag
// and <= (max child of the branch class) tag,
// then the branch is a superclass of the source.
// See the MP3 handout for more information about our use of class tags.
operand branch_class::code(operand expr_val, operand tag, op_type join_type,
                           CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  return operand();
#endif
}

// Assign this attribute a slot in the class structure
void attr_class::layout_feature(CgenNode *cls) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here
  std::string attr_name = name->get_string();
  std::string type_str = type_decl->get_string();
  op_type attr_type = convert_to_COOL_type(type_str);
  // Insert into current class's attribute list
  cls->attr_list[attr_name] = attr_type;
  cls->attr_names_in_order.push_back(attr_name);

#endif
}

void attr_class::code(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here
#endif
}

/*
 * Definitions of make_alloca
 */
void assign_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "assign" << std::endl;

  // /TODO: add code here
  expr->make_alloca(env);
  return;
}

void cond_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "cond::alloc" << std::endl;

  // /TODO: add code here
  ValuePrinter vp(*env->cur_stream);
  
  op_type cond_type;
  Symbol symbol = then_exp->get_type();
  if (symbol->get_string() == "Int") {
    cond_type = op_type(INT32);
  } else if (symbol->get_string() == "Bool") {
    cond_type = op_type(INT1);
  }
  
  res_ptr = vp.alloca_mem(cond_type);
  result_type = cond_type;

  pred->make_alloca(env);
  then_exp->make_alloca(env);
  else_exp->make_alloca(env);
}

void loop_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "loop" << std::endl;

  // /TODO: add code here
  pred->make_alloca(env);
  body->make_alloca(env);
}

void block_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "block" << std::endl;

  // /TODO: add code here
  for (int i = body->first(); body->more(i); i = body->next(i)) {
    Expression expr = body->nth(i);
    expr->make_alloca(env);
  }
  
}

void let_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "let" << std::endl;

  // /TODO: add code here
  ValuePrinter vp(*env->cur_stream);
  init->make_alloca(env);
  body->make_alloca(env);

  if (type_decl->get_string() == "Int") {
    id_type = INT32;
    id_op = vp.alloca_mem(INT32);
  } else if (type_decl->get_string() == "Bool") {
    id_type = INT1;
    id_op = vp.alloca_mem(INT1);
  }
}

void plus_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "plus" << std::endl;

  e1->make_alloca(env);
  e2->make_alloca(env);
}

void sub_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "sub" << std::endl;

  e1->make_alloca(env);
  e2->make_alloca(env);
}

void mul_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "mul" << std::endl;

  e1->make_alloca(env);
  e2->make_alloca(env);
}

void divide_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "div" << std::endl;

  e1->make_alloca(env);
  e2->make_alloca(env);
}

void neg_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "neg" << std::endl;

  // /TODO: add code here
  e1->make_alloca(env);
}

void lt_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "lt" << std::endl;

  // /TODO: add code here
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void eq_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "eq" << std::endl;

  // /TODO: add code here
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void leq_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "leq" << std::endl;

  // /TODO: add code here
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void comp_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "complement" << std::endl;

  // /TODO: add code here
  e1->make_alloca(env);
}

void int_const_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Integer Constant" << std::endl;

  // /TODO: add code here
  return;
}

void bool_const_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Boolean Constant" << std::endl;

  // /TODO: add code here
  return;
}

void object_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Object" << std::endl;

  // /TODO: add code here
  return;
}

void no_expr_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "No_expr" << std::endl;

  // /TODO: add code here
  return;
}

void static_dispatch_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "static dispatch" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void string_const_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "string_const" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void dispatch_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "dispatch" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void typcase_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "typecase" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void new__class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "newClass" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void isvoid_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "isvoid" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // TODO: add code here
#endif
}

void branch_class::make_alloca(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here
#endif
}

void method_class::make_alloca(CgenEnvironment *env) { return; }

void attr_class::make_alloca(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here
#endif
}

#ifdef MP3
// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
operand conform(operand src, op_type type, CgenEnvironment *env) {
  // TODO: add code here
  ValuePrinter vp(*env->cur_stream);
  if (src.get_typename() == type.get_name()) {
    return src;
  } else if (src.get_type().get_name() == "%Int*" && type.get_name() == "i32") {
    // Unbox Int to i32
    operand i32_ptr = vp.getelementptr(
      op_type("Int"),
      src,
      int_value(0),
      int_value(1),
      op_type(INT32).get_ptr_type()
    );
    operand i32_val = vp.load(op_type(INT32), i32_ptr);
    return i32_val;
  } else if (src.get_type().get_name() == "i32" && type.get_name() == "%Int*") {
    // Box i32 to Int. Need allocation
    operand Int_obj = vp.call({}, op_type(INT32).get_ptr_type(), "Int_new", true, {});
    vp.call(
      {op_type("INT").get_ptr_type(), op_type(INT32)}, 
      op_type(VOID), 
      "Int_init", 
      true, 
      {Int_obj, src}
    );
    return Int_obj;
  } else if (src.get_type().get_name() == "%Bool*" && type.get_name() == "i1") {
    // Unbox Bool to i1
    operand i1_ptr = vp.getelementptr(
      op_type("Bool"),
      src,
      int_value(0),
      int_value(1),
      op_type(INT1).get_ptr_type()
    );
    operand i1_val = vp.load(op_type(INT1), i1_ptr);
    return i1_val;

  } else if (src.get_type().get_name() == "i1" && type.get_name() == "%Bool*") {
    // Box i1 to Bool. Need allocation
    operand Bool_obj = vp.call({}, op_type(INT1).get_ptr_type(), "Bool_new", true, {});
    vp.call(
      {op_type("Bool").get_ptr_type(), op_type(INT1)},
      op_type(VOID),
      "Bool_init",
      true,
      {Bool_obj, src}
    );
    return Bool_obj;
  } else {
    // If not conversion about Int and Bool, then just bitcast
    return vp.bitcast(src, type);
  }
}


// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env) {
  // ADD CODE HERE (MP3 ONLY)
  return operand();
}
#endif
