plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.airbnb_clone"

    compileSdk = 36 // UPDATED from 33 to 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.airbnb_clone"
        minSdk = flutter.minSdkVersion // keep your minimum SDK
        targetSdk = 36 // UPDATED from 33 to 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

// Dependencies
dependencies {
    // You can keep AndroidX libraries, no need to remove unless specific issues
    // implementation("androidx.window:window:1.2.0")
}

flutter {
    source = "../.."
}
