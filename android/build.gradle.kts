// Top-level build.gradle.kts

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Change the root project's build directory
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

// Update each subproject’s build directory
subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)

    // Ensure `:app` is evaluated before subprojects if necessary
    evaluationDependsOn(":app")
}

// Define a `clean` task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
