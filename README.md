# Theia for Android Development



[Eclipse Theia](thiea-ide.org)  is an extensible framework to develop full-fledged multi-language Cloud & Desktop IDE-like products with state-of-the-art web technologies. 



### Overview

This repository contains Dockerfiles of Theia with included Java, Kotlin, Gradle, and Android SDK for Android development use case. 



### Variants

| Image Name           | Description                                                  | Size   |
| -------------------- | ------------------------------------------------------------ | ------ |
| [theia-android-java](https://hub.docker.com/r/irfannm/theia-android-java)   | Theia with Java & Android SDK                                | 2.2 GB |
| theia-android-kotlin | Theia with Kotlin & Android SDK                              | 2.2 GB |
| theia-android-full   | Theia with Java, Kotlin, & full Android SDK, including emulator | 6.2 GB |


### How to Use

```
docker run -d -p 3000:3000 --name theia-android irfannm/theia-android-java
```

Specify project from Github public repository
```
docker run -d -p 3000:3000 --name theia-android -e link=https://github.com/irfan44/example-android-project.git irfannm/theia-android-java
```
### Build APK

To build your android debug apk, you can use the gradlew file inside the android project via the terminal

#### Debug APK
```
# Make sure that you're in the project directory
# Make gradlew executable with chmod +x gradlew
./gradlew assembleDebug
```

#### Install debug APK to running emulator or connected device
```
# Make sure that you're in the project directory
# Make gradlew executable with chmod +x gradlew
./gradlew installeDebug
```

If you want to build a release APK and more information, you can check [here](https://developer.android.com/studio/build/building-cmdline).

### Links

- [Theia](https://github.com/eclipse-theia/theia)

- [AdoptOpenJDK](https://adoptopenjdk.net/)

  





