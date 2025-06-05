# Keep rules for Tink and other Google libraries that might use annotations like Immutable
-keep class com.google.crypto.tink.** { *; }
-dontwarn com.google.crypto.tink.**
-keep class com.google.errorprone.annotations.** { *; }
-dontwarn com.google.errorprone.annotations.**

# General rules that often help with AndroidX libraries and annotations
-keepattributes InnerClasses
-keepattributes EnclosingMethod
-keepattributes Signature
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable
-keepattributes *Annotation*
-keep class sun.misc.Unsafe { *; }
-keep interface * { <init>(...); }
-keep class * { <fields>; <methods>; }
-keep class * { *; } # Questa è una regola molto generica, la manteniamo per ora

# NUOVE REGOLE: Google Play Core Libraries (SplitInstall, Tasks, etc.)
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**