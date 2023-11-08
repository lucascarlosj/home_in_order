# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { <fields>; }

# Prevent proguard from stripping away the @Keep annotation
-keep class androidx.annotation.Keep

# Preserve the line number information for debugging stack traces.
-keepattributes SourceFile,LineNumberTable

# If you enable obfuscation
#-printmapping mapping.txt
#-printseeds seeds.txt
#-printusage unused.txt