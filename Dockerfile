FROM ypzhuang/nodewithjdk

MAINTAINER ypzhuang <sunbei914914@msn.com>


ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    BUILD_TOOLS_VERSION=25.0.3
    ANDROID_HOME="/opt/android"

ENV PATH $PATH:$ANDROID_HOME:$ANDROID_HOME/bin

WORKDIR /opt
 
RUN wget -O android.zip ${ANDROID_SDK_URL} && \
    unzip android.zip && rm android.zip && \
    chmod a+x -R $ANDROID_HOME && \ 
    echo  Y | sdkmanager "build-tools;$BUILD_TOOLS_VERSION"
