ARG JDK_VERSION=11.0.10_9

FROM adoptopenjdk/openjdk11:jre-${JDK_VERSION}-alpine AS java

FROM theiaide/theia

ENV JAVA_HOME /home/theia/java/jdk-${JDK_VERSION}
ARG ANDROID_SDK_VERSION=6858069
ENV ANDROID_SDK_ROOT /home/theia/android-sdk
ENV PATH ${PATH}:${JAVA_HOME}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/emulator

COPY --from=java /opt/java/openjdk ${JAVA_HOME}

# set version label
LABEL maintainer="irfan44"

USER root

RUN apk add --no-cache bash git unzip wget && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*
    
USER theia

# download and install Android command tools
# https://developer.android.com/studio#command-tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
 && wget -q https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}_latest.zip \
 && unzip *tools*linux*.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools \
 && mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/tools \
 && rm *tools*linux*.zip

# Aggree to sdk license
RUN yes | sdkmanager --licenses

# Copying scripts
COPY . /home/theia
RUN cd /home/theia && sudo chmod +x entrypoint.sh gitclone.sh
ENTRYPOINT [ "/home/theia/entrypoint.sh" ]

EXPOSE 3000
