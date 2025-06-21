# Stripe SDK keep rules
-keep class com.stripe.** { *; }
-dontwarn com.stripe.**

# Stripe SDK dependencies
-keep class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

-keep class org.jetbrains.annotations.** { *; }
-dontwarn org.jetbrains.annotations.**

# Required for Stripe push provisioning
-keep class com.stripe.android.pushProvisioning.** { *; }
-dontwarn com.stripe.android.pushProvisioning.**
