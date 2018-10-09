
# Definition
- Cmake is (technically) not a build system!
  - cross-platform  c++ build generator
- modern cmake is cmake starting from > `2.8.12`, which is the reason why I
  abandoned reading  `mastering cmake` after I spotted the cmake minimum
  required version . Major new features are available since `2.8.12`
  - new features
    - modular design

## Features of cmake
- automatically detect / check for `programs`, `libraries`, `header`, 
  `environment variables`
- specify `build dir outside of source dir`
- create complex custom commands
- optional components at configuration time
- switch between `static` and `shared` builds.
  - `static build`: lib that is statically linked; thus no dynamic linking
    occurrs
- some additional features for cross-platform projects  
  - cmake can create header files with system-specific context information in
    preprocessor `define` statements that can be used by the program
- there are some additional noteworthy packages 
  - `CTest` 
  - `CPack`: cross-platform packaging 
  - cross-compilation support

## Basic usage
- `commands`
  - arguments in a command white space  separated `command(arg0 arg1)`
    - arguments with embedded white spaces are quoted
  - cmake is case insensitive to `command` names (since version 2.2)
- `variables`
  - `set(k a b c) #<k := (a, b, c)`, thus
      - `command(${k}) :=: command(a b c) :=: command("a;b;c")` (list are
        semicolon separated strings)
      - `command("${k}) :=: command("a b c")`
- access system environment variables
  - `$ENV{Var}`
- variables are scoped
  - scopes are created via `add_subdirectory`  or custom `function call`
  - top level scope is global and called `CACHE`
  - scope can be directly stated 
    - `set(FOO "bar" PARENT_SCOPE)` #< to the parent
    - `set(FOO "bar"  CACHE STRING "documentation") #< in the cache`
      - documentation can be given, as the variables that are specified in the
        cache can be set by the user via `cmake -FOO=42`. The documentation is
        a hint to the user for setting that variable
    - `set(FOO "bar"  CACHE STRING "doc" FORCE) #< override if exists`
    FORCE

### Basic Commands
- `project(<PROJECT-NAME>
        [VERSION <major>[.<minor>[.<patch>[.<tweak>]]]]
        [LANGUAGES <language-name>...])`
  - defines the name of the workspace.
  - `PROJECT_NAME` now holds the name of the project.
  - also sets the content of the variables `PROJECT_SOURCE_DIR` and
    `PROJECT_BINARY_DIR`
  - version are to be non-negative integers. If specified, stored in 
    - `PROJECT_VERSION` 
    - `PROJECT_VERSION_MAJOR` 
    - `PROJECT_VERSION_MINOR` 
    - `PROJECT_VERSION_PATCH` 
    - `PROJECT_VERSION_TWEEK` 
  - language name e.g. `CXX` for c++, by default `C` and `CXX` are enabled
  - If a variable exists called `CMAKE_PROJECT_<PROJECT-NAME>_INCLUDE`, the 
    file will be included as the last step of the project command.
- set,  unset
- `if`(), `endif`(), `elseif`(), `else`()
- `foreach`(), `endforeach`()
  - example: `foreach(i RANGE 1 ${n})`
- `while`(), `endwhile`()
- `break`(), `continue`(), `return`() (in a loop)
- `include()` load the content of the loaded file into the current file (much 
  like in cpp).
- `add_subdirectory()`
- `message`
- it is possible to define functions via function([FUNC_NAME] [PARAM..])
  - call vial `FUNC_NAME(param..)`
- it is even possible to do some mathematical operations: 
  - math(EXPR fizz "${i} % 3") writes the result of the operation into fizz
- `not` keyword  e.g. `if(NOT fizz)`
- append string: `string(APPEND result "buzz)`
- `option(NAME "documentation" STANDARD_VALUE)`
- `install(TARGETS util DESTINATION lib)`
  - TARGETS <target>: <name> of add_library. 
  - DESTINATION lib: install the file to directory lib. Relative path relative to CMAKE_INSTALL_PREFIX, absolute path posible too

### Major basic commands
- `add_executable(name [Win32] [MACOSX_BUNDLE] [sources])`  
    - so this command already offers the cross compile capabilities
- `add_library(<name>` [STATIC | SHARED | INTERFACE] 
  1. `shared` library: `.so` 
    - all code relating to the lib is included in the file
    - used by  only making reference to the lib; at run-time
  2. `static` library: `.a` 
    - all code relating to the lib is included in the file
    - used by taking chunks from the static library and making it part of the
      program.
  3. `interface`
    - virtual target, usually used for headers only
    - way to pass requirements to the target
- add_custom_target (command)
- `target_include_directories`
  - specifies include directories to use when compiling target
  - target must have been created via `add_executable` or `add_library`
    - public, private: INCLUDE_DIRECTORIES
    - public, interface: INTERFACE_INCLUDE_DIRECTORIES
    - imported targets only support interface items
- `target_compile_definitions` (-D flags on command line)
  - specify compile definitions
  - target must have been created via `add_executable` or `add_library`
  - public, private, interface populate
    - public: `COMPILE_DEFINITIONS` , `INTERFACE_COMPILE_DEFINITION`
    - interface: `INTERFACE_COMPILE_DEFINITION`
    - private:`COMPILE_DEFINITIONS` , 
  - `COMPILE_DEFINITIONS`: property containing preprocessor definitions 
    (function style definitions not supported)
  - `INTERFACE_COMPILE_DEFINITIONS`: list of public compile definitions 
- `target_compile_options`  warnings and stuff
- `target_link_library` 
  - default: not `PUBLIC`, but either PUBLIC or PRIVATE, depending on stuff. So
    be sure to always declare the relationship or read the manual carefully.
  - When A links in B as *INTERFACE*, it is saying that A does not use B
   in its implementation, but B is used in A's public API. Code that calls
   into A may need to refer to things from B in order to make such calls. One
   example of this is an interface library which simply forwards calls along
   to another library but doesn't actually reference the objects on the way
   through other than by a pointer or reference
  - When A links in B as *PRIVATE*, it is saying that A uses B in its 
    implementation, but B is not used in any part of A's public API
  - Situation: C links against A. which links against B
    1. linkage A->B is PUBLIC or INTERFACE
      - C needs to include search paths from B; any header search path defined
        for target B will also apply to anythink that links to A. (using
        `target_include_dir`
      - if A is static lib: C has a dependency to B
    2. private:
      - does not have to be applied to C
      - if A is static lib: C has no dependency to B
      - if A is dynamic lib: it does not carry information about the lib it
        depends on; thus even in case of private linkage, cmake will still add
        B to the list of libs to be linked forC because parts of B are needed 
        by A, but A does not have that dependency incoded into it.
- interface, public, private: 
  - interface: visible to the user, but not used when building library
  - public: both used and visible
  - private: only used




### Do not use the following commands
have global effect; every target will find it, but is not going to be added to
the usage requirements
```cmake
add_definitions
add_dependencies
add_compile_options
include_directories
```

### Include  external libraries
There are different options (sorted in order of recommended usage, starting
with 'best' option):
1. use `ExternalProject*()` or `FetchContent*()` (will fetch the content, can
   e.g. specify the commit in case referencing a git repo which is then cloned)
2. Create vendor directory (copy sources into the repo and reference the
   `cmakelist` of the projects
3. use `find_package`
4. external cmake dependency manager like `conan`, `hunter`, `vcpkg`







# Appendix
## Search paths:
- `#include "file"` first looks in relative path to the current file, 
  then in the preconfigured list of standard system directories
- `#include <file>` looks only in the standard system dirs.
- the exact search directory list depends on the target system and how GCC is
  configured and where it is installed
  - check via `cpp -v /dev/null -o /dev/null`
- additional directories are added to search path by using `-I[dir]`. the `dir`
  is then searched right after the current directory (in case of using quoted
  include)



# Sources
- http://www.linux-magazin.de/Ausgaben/2007/02/Mal-ausspannen?category=0
- Mastering Cmake
- https://www.youtube.com/watch?v=jt3meXdP-QI
- https://gcc.gnu.org/onlinedocs/cpp/Search-Path.html
