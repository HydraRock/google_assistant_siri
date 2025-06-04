# Keep rules for Tink and other Google libraries that might use annotations like Immutable
-keep class com.google.crypto.tink.** { *; }
-keep class com.google.errorprone.annotations.** { *; }

# General rules that often help with AndroidX libraries and annotations
-keepattributes InnerClasses
-keepattributes EnclosingMethod
-keepattributes Signature
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable
-keepattributes *Annotation*
-keep class sun.misc.Unsafe { *; }