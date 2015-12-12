FROM google/cloud-sdk

ENV GAE_SDK_GO_VER 1.9.30
ENV GAE_SDK_GO_ZIP go_appengine_sdk_linux_amd64-$GAE_SDK_GO_VER.zip

ADD https://storage.googleapis.com/appengine-sdks/featured/$GAE_SDK_GO_ZIP .
RUN unzip -q $GAE_SDK_GO_ZIP -d /usr/local
RUN rm -f $GAE_SDK_GO_ZIP

ENV PATH $PATH:/usr/local/go_appengine:/usr/local/go_appengine/gopath/bin

RUN apt-get update && apt-get -y install git

RUN goapp get github.com/tools/godep
