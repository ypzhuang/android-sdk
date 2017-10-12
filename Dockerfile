FROM ypzhuang/nodewithjdk

MAINTAINER ypzhuang <sunbei914914@msn.com>

ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    BUILD_TOOLS_VERSION=25.0.3 \
    ANDROID_HOME=/opt/android/

ENV PATH $PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools/

WORKDIR /opt
 
RUN wget -O tools.zip ${ANDROID_SDK_URL}
RUN unzip tools.zip && rm tools.zip && \
    mkdir android && mv tools $ANDROID_HOME && \
    chmod a+x -R $ANDROID_HOME && \ 
    mkdir /root/.android/ && touch /root/.android/repositories.cfg

RUN  yes | sdkmanager "build-tools;$BUILD_TOOLS_VERSION" "platforms;android-25"  "platform-tools"  --verbose
 
