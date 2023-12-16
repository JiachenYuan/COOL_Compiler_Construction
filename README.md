# COOL Compiler Implementation

## Overview

This repository contains the implementation of a compiler for the COOL (Classroom Object-Oriented Language) programming language, originally developed at Stanford University. The compiler is built in multiple phases, each addressing a key aspect of the compilation process: lexing & parsing, intermediate code generation (LLVM IR), IR level optimizations, and register allocation.

### Features

1. **Lexing & Parsing:**
   - Implemented using Flex and Bison for efficient lexical analysis and parsing.
   - Converts source code written in COOL into an abstract syntax tree (AST).

2. **Intermediate Code Generation (LLVM IR):**
   - Two-phase code generation approach:
     - Phase 1: Supports simple programs with only a `Main` class and basic instructions involving primitive types.
     - Phase 2: Extends support to all features, including Classes, Objects, Inheritance, Metamorphism, Static/Dynamic method dispatch, etc.
   - Utilizes the LLVM API for generating LLVM Intermediate Representation.

3. **Optimization:**
   - Loop Identification using DominatorTree information and LLVM's API of CFG manipulation. Supported nested loop detection and multiple information useful for later pass of optimization
   - Loop-Invariant Code Motion pass (LICM)
   - Sparse Conditional Constant Propagation (SCCP)
4. **Register Allocation:**
   - Implements register allocation using LLVM API with efficient linear local (within basic block) optimizations

## Project Structure

The repository is organized into several directories for each compiler phase:

- **lexing_parsing:** Contains the source code for lexing and parsing using Flex and Bison.

- **codegen_basics and codegen_all_features:**
  - **phase1:** Implements LLVM IR generation for simple programs.
  - **phase2:** Extends LLVM IR generation to support advanced COOL language features.

- **optimizations:** Contains the source code for optimization phase
- **register_allocation:** Implements register allocation using LLVM API with local optimizations.

- **regalloc:** Contains source code for register allocation pass

## Learning Experience

Developing this COOL compiler has been a challenging yet rewarding experience. The project not only required a deep understanding of compiler design principles but also provided valuable insights into implementing advanced language features and optimizing code generation. The use of the LLVM API has enriched my knowledge of industrial-strength compiler tools and techniques.

Feel free to explore the code, experiment with different COOL programs.
