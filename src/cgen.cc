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

  // if (cgen_debug) {
  //   using namespace std;
  //   std::cerr << ">>> code_class:  " << c->get_type_name() << std::endl;
  //   std::cerr << ">>> it has " << c->get_children().size() << " children" << std::endl;
  // }
  // Code itself, then call children's code_class recursively
  c->code_class();

  for (CgenNode* child : c->get_children()) {
    if (cgen_debug) {
      using namespace std;
      std::cerr << ">>> code_class:  " << child->get_type_name() << std::endl;
    }
    // Add to set that tracks which classes has already be genenerated
    if (generated_classes.find(child->get_type_name()) == generated_classes.end()) {
      generated_classes.insert(child->get_type_name());
      child->code_class();
    }
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
  ValuePrinter vp(*ct_stream);
#ifdef MP3
  // MP3
  // Define a function main that has no parameters and returns an i32
  vp.define(INT32, "main", {});
  // Define an entry basic block
  vp.begin_block("entry");
  if (main_class == nullptr) {
    std::cerr << ">>> Main class is nullptr" << std::endl;
    abort();
  }
  op_func_type main_main_method_type = main_class->method_types_in_LLVM["main"];

  operand main_obj(op_type(main_class->get_type_name(), 1), "main.obj");
  vp.call(*ct_stream, {}, "Main_new", true, {}, main_obj);

  operand main_retval(main_main_method_type.res, "main.retval");
  vp.call(*ct_stream, main_main_method_type.args, "Main_main", true, {main_obj}, main_retval);
  vp.ret(int_value(0));
  
  vp.end_define();
  
  
#else
  // MP2
  // Define a global string: "Main.main() returned %d\n"
  valuePrinter.init_constant(".str", const_value(op_arr_type(INT8, 25), "Main.main() returned %d\n", true));
  // Define a function main that has no parameters and returns an i32
  valuePrinter.define(INT32, "main", {});
  // Define an entry basic block
  valuePrinter.begin_block("entry");
  // Call Main_main(). This returns int for phase 1, Object for phase 2
  operand temp0 = valuePrinter.call({}, INT32, "Main_main", true, {});
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

  ct->string_literal_vreg_names[str_const] = "String." + std::to_string(get_index());
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
  // vp.declare(op_type(class_name).get_ptr_type(), get_init_function_name(), {});

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
        attributes_types.push_back(op_type(class_name, 1));
        attr_list[k] = op_type(class_name, 1);
      } else {
        attributes_types.push_back(v);
        attr_list[k] = v;
      }
      obj_record_index_of_attributes[k] = obj_record_attr_index;
      obj_record_attr_index++;

      // Also add attr_class of parent attributes to current class's attrs_as_features
      attrs_as_features[k] = parentnd->attrs_as_features[k];
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

  // Insert all parent's attribute names into current class's attribute name lists
  if (parentnd) {
    for (int i = (int) (parentnd->attr_names_in_order.size()-1); i>=0; i--) {
      std::string& k = parentnd->attr_names_in_order[i];
    
    // for (std::string& k: parentnd->attr_names_in_order) {
      if (k.find("_vtable") != std::string::npos) {
        continue;
      }
      attr_names_in_order.insert(attr_names_in_order.begin(), k);
    }
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
  std::unordered_set<std::string> overriding_method;
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
      overriding_method.insert(method_name);
    } else {
      // Inheritanced methods should have the same global name as its parent's
      global_method_name_map[method_name] = parentnd->global_method_name_map[method_name];
    }
    inherited_method_in_order.push_back(method_name);
    inherited_methods_set.insert(method_name);
    // method_names_in_order.insert(method_names_in_order.begin(), method_name);
  }

  // Record overriding method
  for (std::string method_name : method_names_in_order) {
    if (std::find(parentnd->method_names_in_order.begin(), parentnd->method_names_in_order.end(), method_name) != parentnd->method_names_in_order.end()) {
      overriding_method.insert(method_name);
    }

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
    if (parentnd->method_types_in_COOL.find(method_name) != parentnd->method_types_in_COOL.end()
    && overriding_method.find(method_name) == overriding_method.end()) {
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

  // Special case: if current method is Main_main, record its arg types and res types in CgenClassTable
  // these information is used by LLVM-level entry main function so that it can call Main_main correctly
  if (get_type_name() == "Main") {
    get_classtable()->main_class = this;
  }
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
    // Need to declare _new method
    ValuePrinter vp(*ct_stream);
    vp.declare(op_type(get_type_name(), 1), get_init_function_name(), {});
    CgenClassTable* ct = get_classtable();
    for (CgenNode* child : get_children()) {
      // Add to set that tracks which classes has already be genenerated
      if (ct->generated_classes.find(child->get_type_name()) == ct->generated_classes.end()) {
        ct->generated_classes.insert(child->get_type_name());
        child->code_class();
      }
      // child->code_class();
    }
    return;
  }
  // TODO: add code here
  // for (int i=features->first(); features->more(i); i=features->next(i)) {
  //   Feature feature = features->nth(i);
  //   CgenEnvironment env(*ct_stream, this);
  //   if (feature.)
  //   feature->code(&env);
  // }
  if (cgen_debug) {
      using namespace std;
      std::cerr << ">>> generating " << methods_as_features.size() << " methods"  << std::endl;
  }
  for (auto& [method_name, method_tree_node] : methods_as_features) {
    CgenEnvironment env(*ct_stream, this);
    if (cgen_debug) {
      using namespace std;
      std::cerr << ">>> generating method " << method_name << std::endl;
    }
    method_tree_node->code(&env);
  }

  // Generate [class]_new method for current class
  CgenEnvironment env(*ct_stream, this);
  code_init_function(&env);

  // Recursively call code class for children classes
  for (CgenNode* child : get_children()) {
    child->code_class();
  }
}

void CgenNode::code_init_function(CgenEnvironment *env) {
  // TODO: add code here
  ValuePrinter vp(*env->cur_stream);

  vp.define(op_type(get_type_name(), 1), get_init_function_name(), {});
  //* Begin block entry:
  vp.begin_block("entry");
  operand instance_pptr = vp.alloca_mem(op_type(get_type_name(), 1));
  // Make allocation for every attributes
  for (std::size_t i=0; i<attr_names_in_order.size(); i++) {
    std::string& attr_name = attr_names_in_order[i];
    attrs_as_features[attr_name]->make_alloca(env);
  }


  operand instance_sizeof_ptr = vp.getelementptr(
    op_type(get_vtable_type_name()),
    global_value(op_type(get_vtable_type_name(), 1), get_vtable_name()),
    int_value(0),
    int_value(1),
    op_type(INT32).get_ptr_type()
  );
  operand instance_size = vp.load(op_type(INT32), instance_sizeof_ptr);
  operand malloced_space = vp.call({INT32}, INT8_PTR, "malloc", true, {instance_size});
  operand casted_instance_ptr = vp.bitcast(malloced_space, op_type(get_type_name(), 1));
  operand malloc_is_null = operand(INT1, "malloc.null");
  vp.icmp(*env->cur_stream, EQ, casted_instance_ptr, null_value(op_type(get_type_name(), 1)), malloc_is_null);
  vp.branch_cond(malloc_is_null, "abort", "okay");

  //* Begin okay block. It would allocate attributes and initialize the attributes
  vp.begin_block("okay");
  operand vtable_pptr = vp.getelementptr(
    op_type(get_type_name()),
    casted_instance_ptr,
    int_value(0),
    int_value(0),
    op_type(get_vtable_type_name(), 2)
  );
  vp.store(global_value(op_type(get_vtable_type_name(), 1), get_vtable_name()), vtable_pptr);
  vp.store(casted_instance_ptr, instance_pptr);
  // First pass, set default values for each attributes
  env->open_scope();
  // Also need to add self into the symbol table, because the attribute inititialization in the second pass might need it
  env->add_binding(self, &instance_pptr);


  for (std::size_t i=0; i<attr_names_in_order.size(); i++) {
    int index_in_obj_record = i + 1;
    std::string& attr_name = attr_names_in_order[i];
    op_type attr_type = attr_list[attr_name];

    operand attr_ptr = vp.getelementptr(
      op_type(get_type_name()),
      casted_instance_ptr,
      int_value(0),
      int_value(index_in_obj_record),
      attr_type.get_ptr_type()
    );
    operand default_val;
    if (attr_type.get_id() == INT32) {
      default_val = int_value(0);
    } else if (attr_type.get_id() == INT1) {
      default_val = bool_value(false, true);
    } else {
      default_val = null_value(attr_type);
    }
    vp.store(default_val, attr_ptr);
    // Also need to add bindings to symbol table since second pass might need attribute's vreg
    // Entry e(attr_name, 0);
    // Symbol symbol = &e;
    Symbol symbol = attrs_as_features[attr_name]->get_name();
// ! Not sure if I should remove the binding here
    // env->add_binding(symbol, &attr_ptr);
  }
  
  // Second pass, set expr on the RHS of the attribute to the correct attribute vreg
  for (std::size_t i=0; i<attr_names_in_order.size(); i++) {
    int index_in_obj_record = i + 1;
    std::string& attr_name = attr_names_in_order[i];
    op_type attr_type = attr_list[attr_name];
    operand attr_ptr = vp.getelementptr(
      op_type(get_type_name()),
      casted_instance_ptr,
      int_value(0),
      int_value(index_in_obj_record),
      attr_type.get_ptr_type()
    );
    if (cgen_debug) {
      std::cerr << ">>> attr_name to be coded is " << attr_name << std::endl;
    }
    attrs_as_features[attr_name]->code(env);
  }

  // Return the pointer to the malloced object
  vp.ret(casted_instance_ptr);

  
  
  env->close_scope();
  vp.begin_block("abort");
  vp.call({}, VOID, "abort", true, {});
  vp.unreachable();
  vp.end_define();


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
  std::string cur_method_name_in_COOL = name->get_string();
  std::string cur_method_name_in_LLVM = current_cls->global_method_name_map[cur_method_name_in_COOL]; 
  op_func_type curr_method_type = current_cls->method_types_in_LLVM[cur_method_name_in_COOL];
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

  
  vp.define(cur_method_res_type, cur_method_name_in_LLVM, cur_method_args);
  vp.begin_block("entry");
  // Make alloca on expr recursively
  expr->make_alloca(env);
  // Make alloca for method parameters and store parameters into them
  std::vector<operand> allocated_ptr_to_args;
  for (op_type arg_type : cur_method_args_types) {
    operand ptr_to_arg = vp.alloca_mem(arg_type);
    allocated_ptr_to_args.push_back(ptr_to_arg);
  }
  env->open_scope();
  if (allocated_ptr_to_args.size() != cur_method_args.size()) {
    std::cerr << "number of args allocas does not match the number of args" << std::endl;
    abort(); 
  }
  for (std::size_t i=0; i<cur_method_args.size(); i++) {
    vp.store(cur_method_args[i], allocated_ptr_to_args[i]);
  }
  // Also record them in symbol table
  env->add_binding(self, &allocated_ptr_to_args[0]);
  int temp_index = 1;
  for (int i=formals->first(); formals->more(i); i=formals->next(i)) {
    Formal param = formals->nth(i);
    Symbol param_symbol = param->get_name();
    env->add_binding(param_symbol, &allocated_ptr_to_args[temp_index]);
    temp_index++;
  }

  // Recursively call code on expr
  operand ret = expr->code(env);
  // Conform the return type from the body to the return type of the method
  operand conformed_ret = conform(ret, cur_method_res_type, env);
  vp.ret(conformed_ret);

  env->close_scope();

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
  // operand* decl_var = env->find_in_scopes(name);
  // vp.store(value, *decl_var);
  // VarRegAndPos var_reg_and_pos = get_vreg_of_variable(env, name);
  // operand variable_vreg = var_reg_and_pos.var; 
  // operand variable_pos = var_reg_and_pos.pos;

  operand var_holder;
  op_type var_type;
  operand* var = env->find_in_scopes(name);
  if (var != nullptr) {
    // Found it in symbol table
    var_holder = *var;
    var_type = var_holder.get_type().get_deref_type();

  } else {
    operand self_pptr = *env->find_in_scopes(self);
    CgenNode* cur_class = env->get_class();
    operand self_ptr = vp.load(op_type(env->get_class()->get_type_name(), 1), self_pptr);
    op_type attr_type = cur_class->attr_list[name->get_string()];
    int attr_index_in_record = cur_class->obj_record_index_of_attributes[name->get_string()];
    operand attr_ptr = vp.getelementptr(
      op_type(env->get_class()->get_type_name()),
      self_ptr,
      int_value(0),
      int_value(attr_index_in_record),
      attr_type.get_ptr_type()
    );
    var_holder = attr_ptr;
    var_type = attr_type;
  }

  // op_type target_type = variable_vreg.get_type();
  // op_type target_type = variable_vreg.get_type().get_deref_type();
  
  
  if (cgen_debug) {
    std::cerr << ">>> Conform due to assign" << std::endl;
    std::cerr << ">>> The value is " << value.get_name() << " with type " << value.get_typename() << std::endl;
    std::cerr << ">>> var_type's type is " << var_type.get_name() << std::endl;
  }
  operand conformed_value = conform(value, var_type, env);
  vp.store(conformed_value, var_holder);
  return value;
}

operand cond_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "cond" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  std::string label_then = env->new_label("true.", false);
  std::string label_else = env->new_label("false.", false);
  std::string label_end = env->new_label("end.", true);

  operand pred_result = pred->code(env);
  vp.branch_cond(pred_result, label_then, label_else);

  vp.begin_block(label_then);
  operand then_result = then_exp->code(env);
  operand conformed_then_result = conform(then_result, result_type, env);
  vp.store(conformed_then_result, res_ptr);
  vp.branch_uncond(label_end);

  vp.begin_block(label_else);
  operand else_result = else_exp->code(env);
  operand conformed_else_result = conform(else_result, result_type, env);
  vp.store(conformed_else_result, res_ptr);
  vp.branch_uncond(label_end);

  vp.begin_block(label_end);
  return vp.load(result_type, res_ptr);
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

  return null_value(op_type("Object", 1)); 
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
    } else {
      var_init = null_value(id_type);
    }
  }
  operand conformed_var_init = conform(var_init, id_type, env);
  vp.store(conformed_var_init, id_op);
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
  op1 = conform(op1, INT32, env);
  op2 = conform(op2, INT32, env);
  return vp.add(op1, op2);
}

operand sub_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "sub" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  op1 = conform(op1, INT32, env);
  op2 = conform(op2, INT32, env);
  return vp.sub(op1, op2);
}

operand mul_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "mul" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  op1 = conform(op1, INT32, env);
  op2 = conform(op2, INT32, env);
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
  op1 = conform(op1, INT32, env);
  op2 = conform(op2, INT32, env);
  return vp.div(op1, op2);
}

operand neg_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "neg" << std::endl;

  // /TODO: add code here and replace `return operand()` 
  ValuePrinter vp(*env->cur_stream);
  operand op1 = int_value(0);
  operand op2 = e1->code(env);
  op1 = conform(op1, INT32, env);
  op2 = conform(op2, INT32, env);
  return vp.sub(op1, op2); 
}

operand lt_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "lt" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  op1 = conform(op1, INT32, env);
  op2 = conform(op2, INT32, env);
  return vp.icmp(LT, op1, op2);

}

operand eq_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "eq" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  if (op1.get_typename() == "%Int*") {
    op1 = conform(op1, INT32, env);
    op2 = conform(op2, INT32, env);
  } else if (op1.get_typename() == "%Bool*") {
    op1 = conform(op1, INT1, env);
    op2 = conform(op2, INT1, env);
  } else {
    op1 = conform(op1, INT8_PTR, env);
    op2 = conform(op2, INT8_PTR, env);
  }
  return vp.icmp(EQ, op1, op2);
}

operand leq_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "leq" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = e1->code(env), op2 = e2->code(env);
  op1 = conform(op1, INT32, env);
  op2 = conform(op2, INT32, env);
  return vp.icmp(LE, op1, op2);
}

operand comp_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "complement" << std::endl;

  // /TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand op1 = bool_value(true, true), op2 = e1->code(env);
  op1 = conform(op1, INT1, env);
  op2 = conform(op2, INT1, env);
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
  // return get_vreg_of_variable(env, name).var;
  ValuePrinter vp(*env->cur_stream);
    // Attempt to find the variable in the symbol table
  operand* var = env->find_in_scopes(name);
  if (cgen_debug) {
    using namespace std;
    // cout << ">>>The object to be found is " << name->get_string() << ", and it " << ((var==nullptr)? "is not" : "is" )<< " in the symbol table" << endl;
  }
  // If not found / result is nullptr, find it in attributes. 
  //Since we have semantic analysis phase previously, it is garuanteed to contain it in one of the two plcaes
  if (var != nullptr) {
    // Found it in symbol table
    operand ret = *var;
    // std::cout << ">>> The object has type " << ret.get_typename() << ", it's position is " << ret.get_name() << std::endl;
    return vp.load(ret.get_type().get_deref_type(), ret);
  } else {
    operand self_pptr = *env->find_in_scopes(self);
    CgenNode* cur_class = env->get_class();
    operand self_ptr = vp.load(op_type(env->get_class()->get_type_name(), 1), self_pptr);
    op_type attr_type = cur_class->attr_list[name->get_string()];
    int attr_index_in_record = cur_class->obj_record_index_of_attributes[name->get_string()];
    operand attr_ptr = vp.getelementptr(
      op_type(env->get_class()->get_type_name()),
      self_ptr,
      int_value(0),
      int_value(attr_index_in_record),
      attr_type.get_ptr_type() 
    );
    operand attr = vp.load(attr_type, attr_ptr);
    return attr;
  }
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

  // 1. Prepare parameters
  std::vector<operand> param_list;
  int first = actual->first();
  // int second = actual->next(first);
  for (int i=first; actual->more(i); i=actual->next(i)) {
    Expression param = actual->nth(i);
    param_list.push_back(param->code(env));
  }
  operand expr_code = expr->code(env);
  if(expr_code.get_type().get_name() == op_type(INT32).get_name() ){
    expr_code = conform(expr_code, op_type("Int*"), env);
  }else if(expr_code.get_type().get_name() == op_type(INT1).get_name() ){
    expr_code = conform(expr_code, op_type("Bool*"), env);
  }
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
    global_value(op_type(vtable_type_name, 1), vtable_name),
    int_value(0),
    int_value(method_index_in_vtable),
    method_type.get_ptr_type()
  );  
  operand method(method_type, env->new_name());
  vp.load(*env->cur_stream, method_type, ptr_to_method, method);
  // 3. Conform parameters 
  for (std::size_t i=0; i<param_list.size(); i++) {
    operand conformed = conform(param_list[i], method_type.args[i], env);
    param_list[i] = conformed;
  }
  // 4. call
  operand ret = vp.call(method_type.args, method_type.res, method.get_name().substr(1), false, param_list);
  // Special treatment if the return type of the method to be called is SELF_TYPE
  std::string method_ret_type_from_COOL = designated_class->method_types_in_COOL[method_name].res.get_name();
  if (method_ret_type_from_COOL.find("SELF_TYPE") != std::string::npos) {
    // Original return type is SELF_TYPE, so the call would return a "designated_class*", but we want a "expr_code*"
    // So need one more conform
    op_type target_type = expr_code.get_type();
    operand conformed_ret = conform(ret, target_type, env);
    return conformed_ret;
  }
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
  std::string global_string_obj_name = env->get_class()->get_classtable()->string_literal_vreg_names[token->get_string()];
  return global_value(op_type("String", 1), global_string_obj_name);
#endif
}

operand dispatch_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Dynamic dispatch" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);

  // 1. Prepare parameters
  std::vector<operand> param_list;

  int first = actual->first();
  // int second = actual->next(first);
  for (int i=first; actual->more(i); i=actual->next(i)) {
    Expression param = actual->nth(i);
    param_list.push_back(param->code(env));
  }
  operand expr_code = expr->code(env);
  if(expr_code.get_type().get_name() == op_type(INT32).get_name() ){
    expr_code = conform(expr_code, op_type("Int*"), env);
  }else if(expr_code.get_type().get_name() == op_type(INT1).get_name() ){
    expr_code = conform(expr_code, op_type("Bool*"), env);
  }
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
  }
  CgenNode* designated_class = env->type_to_class(target_type_name);
  std::string method_name = name->get_string();
  int method_index_in_vtable = designated_class->vtable_index_of_method[method_name];
  std::string vtable_type_name = designated_class->get_vtable_type_name();
  std::string vtable_name = designated_class->get_vtable_name();
  op_func_type method_type = designated_class->method_types_in_LLVM[method_name];

  // op_type gep_type = expr_code.get_type();
  // op_type gep_op1
  // if (expr_code.get_type().get_name() == "i32*") {
    
  // }  
  // GEP to get vtable ptr from the object record
  operand vtable_ptr_ptr = vp.getelementptr(
    op_type(expr_code.get_typename().substr(1, expr_code.get_typename().size()-2)),
    // expr_code.get_type().get_deref_type(),
    expr_code,
    int_value(0),
    int_value(0),
    op_type(vtable_type_name, 2)
  );

  // Load vtable
  operand vtable_ptr = vp.load(op_type(vtable_type_name, 1), vtable_ptr_ptr);

  // Load method pointer pointer
  operand ptr_to_method = vp.getelementptr(
    op_type(vtable_type_name), 
    vtable_ptr,
    int_value(0),
    int_value(method_index_in_vtable),
    method_type.get_ptr_type()
    // op_type(method_type.get_name().substr(1), 1)
  );  
  
  operand method(method_type, env->new_name());
  vp.load(*env->cur_stream, method_type, ptr_to_method, method);

  // 3. Conform parameters (excluding the first implicit parameter)
  for (std::size_t i=0; i<param_list.size(); i++) {
    operand conformed = conform(param_list[i], method_type.args[i], env);
    param_list[i] = conformed;
  }
  // 4. call
  operand ret = vp.call(method_type.args, method_type.res, method.get_name().substr(1), false, param_list);
  // Special treatment if the return type of the method to be called is SELF_TYPE
  std::string method_ret_type_from_COOL = designated_class->method_types_in_COOL[method_name].res.get_name();
  if (method_ret_type_from_COOL.find("SELF_TYPE") != std::string::npos) {
    // Original return type is SELF_TYPE, so the call would return a "designated_class*", but we want a "expr_code*"
    // So need one more conform
    op_type target_type = expr_code.get_type();
    operand conformed_ret = conform(ret, target_type, env);
    return conformed_ret;
  }
  return ret; 
#endif
}

// Handle a Cool case expression (selecting based on the type of an object)
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env); // forward declaration
operand typcase_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "typecase::code()" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  ValuePrinter vp(*env->cur_stream);
  CgenClassTable *ct = env->get_class()->get_classtable();

  std::string header_label = env->new_label("case.hdr.", false);
  std::string exit_label = env->new_label("case.exit.", false);

  // Generate code for expression to select on, and get its static type
  if (cgen_debug)
    std::cerr << ">>> Generating expr to select on " << std::endl;
  operand code_val = expr->code(env);
  operand expr_val = code_val;
  std::string code_val_t = code_val.get_typename();
  op_type join_type = env->type_to_class(type)->get_type_name();
  CgenNode *cls = env->type_to_class(expr->get_type());

  // Check for case on void, which gives a runtime error
  if (code_val.get_type().get_id() != INT32 &&
      code_val.get_type().get_id() != INT1) {
    op_type bool_type(INT1), empty_type;
    null_value null_op(code_val.get_type());
    operand icmp_result(bool_type, env->new_name());
    vp.icmp(*env->cur_stream, EQ, code_val, null_op, icmp_result);
    std::string ok_label = env->new_ok_label();
    vp.branch_cond(icmp_result, "abort", ok_label);
    vp.begin_block(ok_label);
  }

  operand tag = get_class_tag(expr_val, cls, env);
  vp.branch_uncond(header_label);
  std::string prev_label = header_label;
  vp.begin_block(header_label);

  env->branch_operand = alloca_op;

  std::vector<operand> values;
  env->next_label = exit_label;

  // Generate code for the branches
  for (int i = ct->get_num_classes() - 1; i >= 0; --i) {
    for (auto case_branch : cases) {
      if (i == ct->find_in_scopes(case_branch->get_type_decl())->get_tag()) {
        std::string prefix = std::string("case.") + std::to_string(i) + ".";
        std::string case_label = env->new_label(prefix, false);
        vp.branch_uncond(case_label);
        vp.begin_block(case_label);
        operand val = case_branch->code(expr_val, tag, join_type, env);
        values.push_back(val);
      }
    }
  }

  // Abort if there was not a branch covering the actual type
  vp.branch_uncond("abort");

  // Done with case expression: get final result
  env->new_label("", true);
  vp.begin_block(exit_label);
  operand final_result(alloca_type, env->new_name());
  alloca_op.set_type(alloca_op.get_type().get_ptr_type());
  vp.load(*env->cur_stream, alloca_op.get_type().get_deref_type(),
          alloca_op, final_result);
  alloca_op.set_type(alloca_op.get_type().get_deref_type());

  if (cgen_debug)
    std::cerr << "Done typcase::code()" << std::endl;
  return final_result;
#endif
}

operand new__class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "newClass" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  // we do not need to support new SELF_TYPE as said in spec
  // if (type_name->get_string() == "SELF_TYPE")
  ValuePrinter vp(*env->cur_stream);
  CgenNode* target_class = env->type_to_class(type_name);
  operand new_instance = vp.call({}, op_type(target_class->get_type_name(), 1), target_class->get_init_function_name(), true, {});

  return new_instance;
#endif
}

operand isvoid_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "isvoid" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here and replace `return operand()`
  ValuePrinter vp(*env->cur_stream);
  operand e1_coded = e1->code(env);
  return vp.icmp(EQ, e1_coded, null_value(e1_coded.get_type()));
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
    ret_type_COOL = op_type(type_str, 1);
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

  // Record it in CgenNode's data structure, USING FUNCTION_NAME AS KEY
  // Also record the order of relative position of the method because order matters in vtable generation
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

  if (cls->basic()) {
    vp.declare(ret_type_llvm, method_name, formal_llvm_type_list);
  }

  // Record that this is an method of the current class.
  cls->methods_as_features[function_name] = this;

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
  using namespace std;
  operand empty;
  ValuePrinter vp(*env->cur_stream);
  if (cgen_debug)
    cerr << "In branch_class::code()" << endl;

  CgenNode *cls = env->get_class()->get_classtable()->find_in_scopes(type_decl);
  int my_tag = cls->get_tag();
  int max_child = cls->get_max_child();

  // Generate unique labels for branching into >= branch tag and <= max child
  string sg_label =
      env->new_label(string("src_gte_br") + "." + to_string(my_tag) + ".", false);
  string sl_label =
      env->new_label(string("src_lte_mc") + "." + to_string(my_tag) + ".", false);
  string exit_label =
      env->new_label(string("br_exit") + "." + to_string(my_tag) + ".", false);

  int_value my_tag_val(my_tag);
  op_type old_tag_t(tag.get_type()), i32_t(INT32);
  tag.set_type(i32_t);

  // Compare the source tag to the class tag
  operand icmp_result = vp.icmp(LT, tag, my_tag_val);
  vp.branch_cond(icmp_result, exit_label, sg_label);
  vp.begin_block(sg_label);
  int_value max_child_val(max_child);

  // Compare the source tag to max child
  operand icmp2_result = vp.icmp(GT, tag, max_child_val);
  vp.branch_cond(icmp2_result, exit_label, sl_label);
  vp.begin_block(sl_label);
  tag.set_type(old_tag_t);

  // Handle casts of *arbitrary* types to Int or Bool.  We need to:
  // (a) cast expr_val to boxed type (struct Int* or struct Bool*)
  // (b) unwrap value field from the boxed type
  // At run-time, if source object is not Int or Bool, this will never
  // be invoked (assuming no bugs in the type checker).
  if (cls->get_type_name() == "Int") {
    expr_val = conform(expr_val, op_type(cls->get_type_name(), 1), env);
  } else if (cls->get_type_name() == "Bool") {
    expr_val = conform(expr_val, op_type(cls->get_type_name(), 1), env);
  }

  // If the case expression is of the right type, make a new local
  // variable for the type-casted version of it, which can be used
  // within the expression to evaluate on this branch.
  operand conf_result = conform(expr_val, alloca_type, env);
  vp.store(conf_result, alloca_op);
  env->add_local(name, alloca_op);

  // Generate code for the expression to evaluate on this branch
  operand val = conform(expr->code(env), join_type.get_ptr_type(), env);
  operand conformed = conform(val, env->branch_operand.get_type(), env);
  env->branch_operand.set_type(env->branch_operand.get_type().get_ptr_type());
  // Store result of the expression evaluated
  vp.store(conformed, env->branch_operand);
  env->branch_operand.set_type(env->branch_operand.get_type().get_deref_type());
  env->close_scope();
  // Branch to case statement exit label
  vp.branch_uncond(env->next_label);
  vp.begin_block(exit_label);
  if (cgen_debug)
    cerr << "Done branch_class::code()" << endl;
  return conformed;
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

  // Record that this is an attribute of the current class.
  cls->attrs_as_features[attr_name] = this;
  

#endif
}

void attr_class::code(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // TODO: add code here
  ValuePrinter vp(*env->cur_stream);
  operand init_coded = init->code(env);

  // load self, find the offset of attribute and then load the position
  CgenNode* cur_class = env->get_class();
  operand* self_ptr = env->find_in_scopes(self);
  operand self_obj = vp.load(op_type(cur_class->get_type_name(), 1), *self_ptr);
  int attribute_index = cur_class->obj_record_index_of_attributes[name->get_string()];
  op_type attr_type = cur_class->attr_list[name->get_string()];
  operand attr_ptr = vp.getelementptr(
    op_type(cur_class->get_type_name()),
    self_obj,
    int_value(0),
    int_value(attribute_index),
    attr_type.get_ptr_type()
  );
  // operand attr = vp.load(attr_type, attr_ptr);

  // operand* attr_pos = env->find_in_scopes(name);
  operand* attr_pos = &attr_ptr;
  if (cgen_debug) {
    using namespace std;
    // cout << ">>> Getting " << name->get_string() << "'s position: " << attr_pos->get_name() << endl;
  }
  op_type target_type = attr_pos->get_type().get_deref_type();
  if (init_coded.get_type().get_id() != EMPTY) {
    operand conformed_init = conform(init_coded, target_type, env);
    vp.store(conformed_init, *attr_pos);
  } else if (target_type.get_id() == INT32) {
    vp.store(int_value(0), *attr_pos);
  } else if (target_type.get_id() == INT1) {
    vp.store(bool_value(false, true), *attr_pos);
  } else {
    vp.store(null_value(target_type), *attr_pos);
  }
  
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
  // Find lowest common ancestor
  CgenNode* then_exp_class = env->type_to_class(then_exp->get_type());
  CgenNode* else_exp_class = env->type_to_class(else_exp->get_type());
  CgenNode* lowest_common_ancestor_type = nullptr;
  std::unordered_set<CgenNode*> then_exp_ancestors;
  
  if (cgen_debug) {
    using namespace std;
    cerr << ">>> The then expr has type name:" << then_exp_class->get_type_name() << endl;
    cerr << ">>> The else expr has type name:" << else_exp_class->get_type_name() << endl;
  }
  
  CgenNode* it = then_exp_class;
  while (it != nullptr) {
    then_exp_ancestors.insert(it);
    it = it->get_parentnd();
  }

  it = else_exp_class;
  while (it != nullptr) {
    if (then_exp_ancestors.find(it) != then_exp_ancestors.end()) {
      // Found the common ancestor
      lowest_common_ancestor_type = it;
      break;
    }
    it = it->get_parentnd();
  }

  op_type alloca_type;
  std::string LCA_name = lowest_common_ancestor_type->get_type_name();

  // if (cgen_debug) {
  //   using namespace std;
  //   cerr << ">>> The LCA type is:" << LCA_name << endl;
  // }

  if (LCA_name == "Int") {
    alloca_type = op_type(INT32);
  } else if (LCA_name == "Bool") {
    alloca_type = op_type(INT1);
  } else {
    alloca_type = op_type(LCA_name, 1);
  }
  
  res_ptr = vp.alloca_mem(alloca_type);
  result_type = alloca_type;

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

  CgenNode* declared_type = env->type_to_class(type_decl);
  std::string declared_type_name = declared_type->get_type_name();

  if (declared_type_name == "Int") {
    id_type = INT32;
    id_op = vp.alloca_mem(INT32);
  } else if (declared_type_name == "Bool") {
    id_type = INT1;
    id_op = vp.alloca_mem(INT1);
  } else {
    id_type = op_type(declared_type_name, 1);
    id_op = vp.alloca_mem(id_type);
  }

  body->make_alloca(env);
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
    // /TODO: add code here
    expr->make_alloca(env);
    for (int i=actual->first(); actual->more(i); i=actual->next(i)) {
      Expression param_exp = actual->nth(i);
      param_exp->make_alloca(env);
    }
#endif
}

void string_const_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "string_const" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // /TODO: add code here
#endif
}

void dispatch_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "dispatch" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // /TODO: add code here
    expr->make_alloca(env);
    for (int i=actual->first(); actual->more(i); i=actual->next(i)) {
      Expression param_exp = actual->nth(i);
      param_exp->make_alloca(env);
    }

#endif
}

void typcase_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "typecase::make_alloca()" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  using namespace std;
  ValuePrinter vp(*env->cur_stream);
  expr->make_alloca(env);

  // Get result type of case expression
  branch_class *b = (branch_class *)cases->nth(cases->first());
  string case_result_type = b->get_expr()->get_type()->get_string();
  if (case_result_type == "SELF_TYPE")
    case_result_type = env->get_class()->get_type_name();

  // Allocate space for result of case expression
  alloca_type = op_type(case_result_type, 1);
  alloca_op = operand(alloca_type, env->new_name());
  vp.alloca_mem(*env->cur_stream, alloca_type, alloca_op);

  for (auto case_branch : cases) {
    case_branch->make_alloca(env);
  }
#endif
}

void new__class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "newClass" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // /TODO: add code here
#endif
}

void isvoid_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "isvoid" << std::endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // /TODO: add code here
    e1->make_alloca(env);
#endif
}

void branch_class::make_alloca(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  using namespace std;
  ValuePrinter vp(*env->cur_stream);
  if (cgen_debug)
    cerr << "In branch_class::make_alloca()" << endl;

  CgenNode *cls = env->get_class()->get_classtable()->find_in_scopes(type_decl);
  alloca_type = op_type(cls->get_type_name(), 1);
  
  if (cls->get_type_name() == "Int") {
    alloca_type = op_type(INT32);
  } else if (cls->get_type_name() == "Bool") {
    alloca_type = op_type(INT1);
  }

  alloca_op = vp.alloca_mem(alloca_type);

  expr->make_alloca(env);
  
  if (cgen_debug)
    cerr << "Done branch_class::make_alloca()" << endl;
#endif
}

void method_class::make_alloca(CgenEnvironment *env) { return; }

void attr_class::make_alloca(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // /TODO: add code here
  init->make_alloca(env);
#endif
}

#ifdef MP3
// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
operand conform(operand src, op_type type, CgenEnvironment *env) {
  // /TODO: add code here
  ValuePrinter vp(*env->cur_stream);
  if (src.get_typename() == type.get_name()) {
    return src;
  } else if (src.get_typename() == "%Int*" && type.get_id() == INT32) {
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
  } else if (src.get_type().get_id() == INT32 && type.get_name() == "%Int*") {
    // Box i32 to Int. Need allocation
    operand Int_obj = vp.call({}, op_type("Int").get_ptr_type(), "Int_new", true, {});
    vp.call(
      {op_type("Int").get_ptr_type(), op_type(INT32)}, 
      op_type(VOID), 
      "Int_init", 
      true, 
      {Int_obj, src}
    );
    return Int_obj;
  } else if (src.get_typename() == "%Bool*" && type.get_id() == INT1) {
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

  } else if (src.get_type().get_id() == INT1 && type.get_name() == "%Bool*") {
    // Box i1 to Bool. Need allocation
    operand Bool_obj = vp.call({}, op_type("Bool").get_ptr_type(), "Bool_new", true, {});
    vp.call(
      {op_type("Bool").get_ptr_type(), op_type(INT1)},
      op_type(VOID),
      "Bool_init",
      true,
      {Bool_obj, src}
    );
    return Bool_obj;
  } else if (src.get_type().get_name() == "i32") {
    // Conform i32 to something else: first conform to Int* and then bitcast
    operand int_obj_ptr = conform(src, op_type("Int", 1), env);
    return vp.bitcast(int_obj_ptr, type);
  } else if (src.get_type().get_name() == "i1") {
    // Conform i1 to something else: first conform to Bool* and then bitcast
    operand bool_obj_ptr = conform(src, op_type("Bool", 1), env);
    return vp.bitcast(bool_obj_ptr, type);
  } else {
    // If not conversion about Int and Bool, then just bitcast
    if (cgen_debug) {
      using namespace std;
      cerr << ">>> Cast src type: " << src.get_typename() << " and vreg name is: " << src.get_name() << endl;
      cerr << ">>> Cast dst type: " << type.get_name() << endl;
    }
    return vp.bitcast(src, type);
  }
}



VarRegAndPos get_vreg_of_variable(CgenEnvironment *env, Symbol name) {
  ValuePrinter vp(*env->cur_stream);
    // Attempt to find the variable in the symbol table
  operand* var = env->find_in_scopes(name);
  // If not found / result is nullptr, find it in attributes. 
  //Since we have semantic analysis phase previously, it is garuanteed to contain it in one of the two plcaes
  if (var != nullptr) {
    // Found it in symbol table
    operand ret = *var;
    return VarRegAndPos{vp.load(ret.get_type().get_deref_type(), ret), ret};
  } else {
    operand self_pptr = *env->find_in_scopes(self);
    CgenNode* cur_class = env->get_class();
    operand self_ptr = vp.load(op_type(env->get_class()->get_type_name(), 1), self_pptr);
    op_type attr_type = cur_class->attr_list[name->get_string()];
    int attr_index_in_record = cur_class->obj_record_index_of_attributes[name->get_string()];
    operand attr_ptr = vp.getelementptr(
      op_type(env->get_class()->get_type_name()),
      self_ptr,
      int_value(0),
      int_value(attr_index_in_record),
      attr_type.get_ptr_type() 
    );
    operand attr = vp.load(attr_type, attr_ptr);
    return VarRegAndPos{attr, attr_ptr};
  }
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env) {
  // TODO: ADD CODE HERE (MP3 ONLY)
  ValuePrinter vp(*env->cur_stream);
  operand vtable_pptr = vp.getelementptr(
    src.get_type().get_deref_type(),
    src,
    int_value(0),
    int_value(0),
    op_type("_"+src.get_type().get_deref_type().get_name().substr(1)+"_vtable", 2)
  );
  operand vtable_ptr = vp.load(
    op_type("_"+src.get_type().get_deref_type().get_name().substr(1)+"_vtable", 1), 
    vtable_pptr
  );
  operand tag_ptr = vp.getelementptr(
    op_type("_"+src.get_type().get_deref_type().get_name().substr(1)+"_vtable"),
    vtable_ptr,
    int_value(0),
    int_value(0),
    op_type(INT32_PTR)
  );
  operand tag = vp.load(INT32, tag_ptr);

  return tag;
}
#endif

