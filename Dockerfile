FROM erdonline/jdk8-yum-go:latest

MAINTAINER martin114@foxmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /martin-extension-generator

WORKDIR /martin-extension-generator

EXPOSE 9600

ADD ./martin-extension/martin-extension-generator/target/martin-extension-generator.xjar ./

ADD ./martin-extension/martin-extension-generator/target/xjar.go ./

RUN go version

RUN go build xjar.go

ENTRYPOINT ./xjar java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar martin-extension-generator.xjar
