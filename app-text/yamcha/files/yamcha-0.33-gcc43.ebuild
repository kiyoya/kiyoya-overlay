--- libexec/mkdarts.cpp.0	2011-06-03 19:43:29.000000000 +0900
+++ libexec/mkdarts.cpp	2011-06-03 19:43:43.000000000 +0900
@@ -22,6 +22,7 @@
 */  
 
 #include <cstdio>
+#include <cstdlib>
 #include <cstring>
 #include <iostream>
 #include <fstream>
--- src/common.h.0	2011-06-03 19:43:06.000000000 +0900
+++ src/common.h	2011-06-03 19:43:20.000000000 +0900
@@ -50,6 +50,7 @@
 #include <cstdlib>
 #include <vector>
 #include <string>
+#include <string.h>
 #include <stdexcept>
 
 namespace YamCha {
