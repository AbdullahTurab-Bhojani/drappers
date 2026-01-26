// android/build.gradle.kts
buildscript {
    repositories {
        google()      // ✅ Required for Firebase and Google plugins
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.1")    // Android Gradle Plugin
        classpath("com.google.gms:google-services:4.3.15")   // Google Services plugin
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Custom build directories (your existing code)
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
