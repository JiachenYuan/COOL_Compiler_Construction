/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
extern FILE *fin; /* we read from this file */
#undef YY_INPUT
#define YY_INPUT(buf, result, max_size)                                        \
  if ((result = fread((char *)buf, sizeof(char), max_size, fin)) < 0)          \
    YY_FATAL_ERROR("read() in flex scanner failed");

extern int curr_lineno;
/*
 *  Add Your own definitions here
 */
char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;
char* string_buf_end = string_buf + MAX_STR_CONST - 1;

enum class StringError {
  ContainsNull,
  Oversize,
  None
};

StringError string_error;
bool is_end_of_file = false;

int num_cmt_opens = 0;
%}

%option noyywrap

/*
 * Define names for regular expressions here.
 */

digit       [0-9]

  /* Start conditions */
%x STRING
%x COMMENT
%x PYSTRING

%%

 /*
  * Define regular expressions for the tokens of COOL here. Make sure, you
  * handle correctly special cases, like:
  *   - Nested comments
  *   - String constants: They use C like systax and can contain escape
  *     sequences. Escape sequence \c is accepted for all characters c. Except
  *     for \n \t \b \f, the result is c.
  *   - Keywords: They are case-insensitive except for the values true and
  *     false, which must begin with a lower-case letter.
  *   - Multiple-character operators (like <-): The scanner should produce a
  *     single token for every such operator.
  *   - Line counting: You should keep the global variable curr_lineno updated
  *     with the correct line number
  */
 /* Keywords are case-insensitive. Exceptions are true and false. 
  * For them the first letter must be lowercase 
  */
(?i:class)       return CLASS;
(?i:else)        return ELSE;
(?i:fi)          return FI;   
(?i:if)          return IF;
(?i:in)          return IN;
(?i:inherits)    return INHERITS;
(?i:isvoid)      return ISVOID;
(?i:let)         return LET;
(?i:loop)        return LOOP;
(?i:pool)        return POOL;
(?i:then)        return THEN;
(?i:while)       return WHILE; 
(?i:case)        return CASE;
(?i:esac)        return ESAC;
(?i:new)         return NEW;
(?i:of)          return OF;
(?i:not)         return NOT;
(?i:isvoid)      return ISVOID;
(?i:for)         return FOR;
t(?i:rue)        {cool_yylval.boolean = true; return BOOL_CONST;}
f(?i:alse)       {cool_yylval.boolean = false; return BOOL_CONST;}
 /* newline character increases the line count */
\n              {curr_lineno++;}
 /* whitespaces. Ignore them */
[ \f\r\t\v]     ;
 /* Explicit errors */
(\*\))          {yylval.error_msg = "Unmatched *)"; return ERROR;}        
 /* Comment starts */
\-\-.*          ;
(\(\*)          {BEGIN(COMMENT); num_cmt_opens = 1;}
 /* operators and punctuations*/
(<-)              return ASSIGN;
(=>)              return DARROW;
(<=)              return LE;
\.              |
\@              |
\~              |
\*              |
\/              | 
\+              |
\-              |
\(              |
\)              |
\{              |
\}              |
\,              |
\:              |
\;              |
\=              |
\<              return yytext[0];

 /*Invalid hex number*/
0x[A-Z]+[0-9a-zA-Z_]*        {cool_yylval.error_msg = "Invalid integer constant"; return ERROR; }
0x[0-9a-f]+[A-Z_]+[0-9a-zA-Z_]* {cool_yylval.error_msg = "Invalid integer constant"; return ERROR; }
 /* Hex number */
0x[0-9a-f]+     {
                  std::string hex_str(yytext);
                  std::string deci_str = hex2dec(hex_str);
                  cool_yylval.symbol = inttable.add_string(deci_str.c_str());
                  return INT_CONST;
                }
 /*Invalid Integers*/
[0-9]+[a-zA-Z_]+[0-9]* {cool_yylval.error_msg = "Invalid integer constant"; return ERROR; }
 /* Integer */
{digit}+        {cool_yylval.symbol = inttable.add_string(yytext); return INT_CONST; }
 /* Classes */
[A-Z][a-zA-Z0-9_]* {cool_yylval.symbol = idtable.add_string(yytext); return TYPEID;}
 /* Identifiers */
[a-z][a-zA-Z0-9_]* {cool_yylval.symbol = idtable.add_string(yytext); return OBJECTID;}
 /* String constants */
\"              {
                  BEGIN(STRING);
                  memset(string_buf, 0, MAX_STR_CONST);
                  string_buf_ptr = string_buf;
                  string_error = StringError::None;
                }
<STRING>\\\0    { string_error = StringError::ContainsNull; }
<STRING>\0      { string_error = StringError::ContainsNull; }
<STRING>\n      { 
                  BEGIN(INITIAL);
                  curr_lineno++;
                  cool_yylval.error_msg = "Un-closed string";
                  return ERROR;
                }
<STRING>\\\n    {
                  if (string_error == StringError::None) {
                    if (string_buf_ptr < string_buf_end) {
                      *string_buf_ptr = '\n';
                      string_buf_ptr++;
                    } else {
                      string_error = StringError::Oversize;
                    }
                  }
                  curr_lineno++;
                }
<STRING><<EOF>> {
                  if (is_end_of_file) {
                    yyterminate();
                  } else {
                    cool_yylval.error_msg = "Encountered EOF in string";
                    is_end_of_file = true;
                    return ERROR;
                  }
                }
<STRING>\"      {
                  BEGIN(INITIAL);
                  switch (string_error) {
                    case StringError::ContainsNull:
                      cool_yylval.error_msg = "String is not allowed to contain null terminator";
                      return ERROR;
                      break;
                    case StringError::Oversize:
                      cool_yylval.error_msg = "String is oversized";
                      return ERROR;
                      break;
                    case StringError::None:
                      cool_yylval.symbol = stringtable.add_string(string_buf);
                      return STR_CONST;
                      break;
                  }
                }
<STRING>\\[^\n\0] {
                    if (string_error == StringError::None ) {
                      if (string_buf_ptr < string_buf_end) {
                        if (yytext[1] == 'b') {
                          *string_buf_ptr = '\b';
                        } else if (yytext[1] == 't') {
                          *string_buf_ptr = '\t';
                        } else if (yytext[1] == 'n') {
                          *string_buf_ptr = '\n';
                        } else if (yytext[1] == 'f') {
                          *string_buf_ptr = '\f';
                        } else {
                          *string_buf_ptr = yytext[1];
                        }
                        string_buf_ptr++;
                      } else {
                        string_error = StringError::Oversize;
                      }
                    }
                }
<STRING>.       {
                  if (string_error == StringError::None ) {

                    if (string_buf_ptr < string_buf_end) {
                      *string_buf_ptr = yytext[0];
                      string_buf_ptr++;
                    } else {
                      string_error = StringError::Oversize;
                    }
                  }
                }
 /* Python-style multi-line string */
\"\"\"          {
                  BEGIN(PYSTRING);
                  memset(string_buf, 0, MAX_STR_CONST);
                  string_buf_ptr = string_buf;
                  string_error = StringError::None;
                }
<PYSTRING>\\\0    { string_error = StringError::ContainsNull; }
<PYSTRING>\0      { string_error = StringError::ContainsNull; }
<PYSTRING>\n      { 
                    if (string_error == StringError::None) {
                      if (string_buf_ptr < string_buf_end) {
                        *string_buf_ptr = '\n';
                        string_buf_ptr++;
                      } else {
                        string_error = StringError::Oversize;
                      }
                    }
                    curr_lineno++;
                  }
<PYSTRING>\\\n    {
                  if (string_error == StringError::None) {
                    if (string_buf_ptr < string_buf_end) {
                      *string_buf_ptr = '\n';
                      string_buf_ptr++;
                    } else {
                      string_error = StringError::Oversize;
                    }
                  }
                  curr_lineno++;
                }
<PYSTRING><<EOF>> {
                  if (is_end_of_file) {
                    yyterminate();
                  } else {
                    cool_yylval.error_msg = "Encountered EOF in string";
                    is_end_of_file = true;
                    return ERROR;
                  }
                }
<PYSTRING>\"\"\" {
                  BEGIN(INITIAL);
                  switch (string_error) {
                    case StringError::ContainsNull:
                      cool_yylval.error_msg = "String is not allowed to contain null terminator";
                      return ERROR;
                      break;
                    case StringError::Oversize:
                      cool_yylval.error_msg = "String is oversized";
                      return ERROR;
                      break;
                    case StringError::None:
                      cool_yylval.symbol = stringtable.add_string(string_buf);
                      return STR_CONST;
                      break;
                  }
                }
<PYSTRING>\\[^\n\0] {
                  if (string_error == StringError::None ) {
                    if (string_buf_ptr < string_buf_end) {
                      if (yytext[1] == 'b') {
                        *string_buf_ptr = '\b';
                      } else if (yytext[1] == 't') {
                        *string_buf_ptr = '\t';
                      } else if (yytext[1] == 'n') {
                        *string_buf_ptr = '\n';
                      } else if (yytext[1] == 'f') {
                        *string_buf_ptr = '\f';
                      } else {
                        *string_buf_ptr = yytext[1];
                      }
                      string_buf_ptr++;
                    } else {
                      string_error = StringError::Oversize;
                    }
                  }
                }
<PYSTRING>.       {
                    if (string_error == StringError::None) {
                      if (string_buf_ptr < string_buf_end) {
                        *string_buf_ptr = yytext[0];
                        string_buf_ptr++;
                      } else {
                        string_error = StringError::Oversize;
                      }
                    } 
                }
 /* Comments */
<COMMENT>(\(\*) { num_cmt_opens++; }
<COMMENT>\n     { curr_lineno++; }
<COMMENT>(\*\)) { num_cmt_opens--; if (num_cmt_opens == 0) {BEGIN(INITIAL);} }
<COMMENT>.      ;
 /* <COMMENT>.+     {printf("%u", strlen(yytext));} */
 /* <COMMENT>[^\n()\*]*     ;   Consume comments between (* and any of \n, (, or *. */
 /* <COMMENT>.*(\*\)) { num_cmt_opens--; if (num_cmt_opens == 0) BEGIN(INITIAL); } */
 /* <COMMENT>\*[^\*\)] */


<COMMENT><<EOF>> {
                    if (is_end_of_file) {
                      yyterminate();
                    } else {
                      cool_yylval.error_msg = "Encountered EOF in comments";                      
                      is_end_of_file = true;
                      return ERROR;
                    }
                  }
 /* Nothing matched, return the original text as an Error msg */
.                 {
                    cool_yylval.error_msg = yytext;
                    return ERROR;
                  }



%%
