FROM irfannm/theia:latest

# set version label
LABEL maintainer="irfan44"

USER root

RUN \
 apt-get update && \
 apt-get install -y --no-install-recommends \
 apt-utils \
 ca-certificates \
 wget \
 unzip \
 vim \
 && rm -rf /var/lib/apt/lists

# download and install Java
ENV JDK_HOME /opt/java
ARG JDK_DOWNLOAD=11.0.10_9
ARG JDK_VERSION=11.0.10+9
RUN mkdir -p ${JDK_HOME} \
 && cd ${JDK_HOME} \
 && wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-${JDK_VERSION}/OpenJDK11U-jdk_x64_linux_hotspot_${JDK_DOWNLOAD}.tar.gz --no-check-certificate -q \
 && tar -zxvf OpenJDK11U-jdk_x64_linux_hotspot_${JDK_DOWNLOAD}.tar.gz \
 && rm OpenJDK*.tar.gz
ENV JAVA_HOME ${JDK_HOME}/jdk-${JDK_VERSION}

# download and install Gradle
# https://services.gradle.org/distributions/
ENV GRADLE_HOME /opt/gradle
ARG GRADLE_VERSION=6.7
ARG GRADLE_DIST=bin
RUN mkdir -p ${GRADLE_HOME} \
 && wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-${GRADLE_DIST}.zip \
 && unzip gradle*.zip -d ${GRADLE_HOME} \
 && rm gradle*.zip

# download and install Kotlin compiler
# https://github.com/JetBrains/kotlin/releases/latest
ENV KOTLIN_HOME /opt/kotlinc
ARG KOTLIN_VERSION=1.4.10
RUN cd /opt \
 && wget -q https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip \
 && unzip *kotlin*.zip \
 && rm *kotlin*.zip

# download and install Android command tools
# https://developer.android.com/studio#command-tools
ARG ANDROID_SDK_VERSION=6858069
ENV ANDROID_SDK_ROOT /opt/android-sdk
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
 && wget -q https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}_latest.zip \
 && unzip *tools*linux*.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools \
 && mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/tools \
 && rm *tools*linux*.zip

# Environment variable
ENV PATH ${PATH}:${JAVA_HOME}/bin:${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin:${KOTLIN_HOME}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/emulator
ENV LD_LIBRARY_PATH ${ANDROID_SDK_ROOT}/emulator/lib64:${ANDROID_SDK_ROOT}/emulator/lib64/qt/lib

# Install Android SDK 30
ARG ANDROID_VERSION=11
ARG API_LEVEL=30
ARG BUILD_VERSION=30.0.3
ARG PROCESSOR=x86_64
ARG IMG_TYPE=google_apis
RUN yes | sdkmanager --licenses \
 && sdkmanager "platforms;android-${API_LEVEL}" "build-tools;${BUILD_VERSION}"

# ports and volumes
EXPOSE 3000

