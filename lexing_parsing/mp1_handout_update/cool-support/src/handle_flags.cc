//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"

#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <unistd.h>

//
// coolc provides a debugging switch for each phase of the compiler,
// switches to control garbage collection policy, and a switch to enable
// optimization.  The optimization flag is ignored by the reference compiler.
//
// All flags that can be set on the command line should be defined here;
// otherwise, it is necessary to pollute test drivers for components of the
// compiler with declarations of extern'ed debugging flags to satisfy the
// linker.  The exceptions to this rule are yy_flex_debug and cool_yydebug,
// which are defined in files generated by flex and bison.
//

extern int yy_flex_debug; // for the lexer; prints recognized rules
extern int cool_yydebug;  // for the parser
int VERBOSE_ERRORS;       // for the parser; prints verbose errors

char *out_filename; // file name for generated code

// used for option processing (man 3 getopt for more info)
extern int optind, opterr;
extern char *optarg;

void handle_flags(int argc, char *argv[]) {
  int c;
  int unknownopt = 0;

  // no debugging or optimization by default
  yy_flex_debug = 0;
  cool_yydebug = 0;
  VERBOSE_ERRORS = 0;

  while ((c = getopt(argc, argv, "lpsvo:")) != -1) {
    switch (c) {
#ifdef DEBUG
    case 'l':
      yy_flex_debug = 1;
      break;
    case 'p':
      cool_yydebug = 1;
      break;
    case 'v':
      VERBOSE_ERRORS = 1;
      break;
#else
    case 'l':
    case 'p':
    case 'c':
    case 'v':
      std::cerr << "No debugging available\n";
      break;
#endif
    case 'o': // set the name of the output file
      out_filename = optarg;
      break;
    case '?':
      unknownopt = 1;
      break;
    case ':':
      unknownopt = 1;
      break;
    }
  }

  if (unknownopt) {
    std::cerr << "usage: " << argv[0] <<
#ifdef DEBUG
        " [-lvpsc -o outname] [input-files]\n";
#else
        " [-o outname] [input-files]\n";
#endif
    exit(1);
  }
}
