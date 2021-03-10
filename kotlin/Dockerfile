FROM irfannm/theia:latest

# set version label
LABEL maintainer="irfan44"

USER root

RUN \
 apt-get update && \
 apt-get install -y --no-install-recommends \
 ca-certificates \
 wget \
 unzip \
 vim \
 && apt-get clean \
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
ENV PATH ${PATH}:${JAVA_HOME}/bin:${KOTLIN_HOME}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/emulator

# Install Android SDK 30
ARG API_LEVEL=30
ARG BUILD_VERSION=30.0.3
RUN yes | sdkmanager --licenses \
 && sdkmanager "platforms;android-${API_LEVEL}" "build-tools;${BUILD_VERSION}"
 
RUN cd /home/project && git clone https://github.com/irfan44/example-android-project.git

# ports and volumes
EXPOSE 3000

ENTRYPOINT [ "node", "/home/theia/src-gen/backend/main.js", "/home/project/example-android-project", "--hostname=0.0.0.0" ]
