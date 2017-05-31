# CMake
- ``` add_executable(pjName, sources)```
- ``` add_library(<name>, [STATIC | SHARED | MODULE] [EXCLUDE_FROM_ALL] source1 [source2, ...]```
  - [STATIC | SHARED | Module] Standard: if  BUILD_SHARED_LIBS: shared, otherwise STATIC
    - STATIC Libs: archives of object files for use when linking other targets
    - SHARED: linked dynamically and loaded at runtime
    - MODULE: plugins that are not linked into other targets; may be loaded dynamically at runtime using dlopen-like functionality
- ``` install(TARGETS util DESTINATION lib)```
  - TARGETS <target>: <name> of add_library. 
  - DESTINATION lib: install the file to directory lib. Relative path relative to CMAKE_INSTALL_PREFIX, absolute path posible too
- ``` ```
- ``` ```
- ``` ```
- ``` ```




# Sources
- http://www.linux-magazin.de/Ausgaben/2007/02/Mal-ausspannen?category=0
