group = "com.ovatu.starxpand"
version = "1.0-SNAPSHOT"

buildscript {
    extra["kotlin_version"] = "1.6.10"

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:4.1.0")
        val kotlinVersion = extra["kotlin_version"] as String
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
    }
}

rootProject.allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

apply(plugin = "com.android.library")

android {
    namespace = "com.ovatu.starxpand"

    compileSdkVersion(37)

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
    }

    defaultConfig {
        minSdkVersion(26)
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    val kotlinVersion = rootProject.extra["kotlin_version"] as String
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlinVersion")
    implementation("com.starmicronics:stario10:1.12.1")
}
