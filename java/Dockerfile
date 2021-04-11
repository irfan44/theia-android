FROM irfannm/theia:latest

# set version label
LABEL maintainer="irfan44"

RUN \
 sudo apt-get update && \
 sudo apt-get install -y --no-install-recommends \
 ca-certificates \
 wget \
 unzip \
 vim \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists

# download and install Java 11
ENV JDK_HOME /home/theia/java
ARG JDK_DOWNLOAD=11.0.10_9
ARG JDK_VERSION=11.0.10+9
RUN mkdir -p ${JDK_HOME} \
 && cd ${JDK_HOME} \
 && wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-${JDK_VERSION}/OpenJDK11U-jdk_x64_linux_hotspot_${JDK_DOWNLOAD}.tar.gz -q \
 && tar -zxvf OpenJDK11U-jdk_x64_linux_hotspot_${JDK_DOWNLOAD}.tar.gz \
 && rm OpenJDK*.tar.gz
ENV JAVA_HOME ${JDK_HOME}/jdk-${JDK_VERSION}

# download and install Android command tools
# https://developer.android.com/studio#command-tools
ARG ANDROID_SDK_VERSION=6858069
ENV ANDROID_SDK_ROOT /home/theia/android-sdk
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
 && wget -q https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}_latest.zip \
 && unzip *tools*linux*.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools \
 && mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/tools \
 && rm *tools*linux*.zip

# Environment variable
ENV PATH ${PATH}:${JAVA_HOME}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/emulator

# Aggree to sdk license
RUN yes | sdkmanager --licenses

# Copying scripts
COPY . /home/theia
RUN cd /home/theia && sudo chmod +x entrypoint.sh gitclone.sh
ENTRYPOINT [ "/home/theia/entrypoint.sh" ]

EXPOSE 3000
