FROM soluto/android:26-4

MAINTAINER Or Yagel <or@soluto.com>

ENV NODEJS_VERSION=8.9.3 \
    PATH=$PATH:/opt/node/bin \
    YARN_VERSION=1.3.2

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl ca-certificates --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN npm install -g yarn@${YARN_VERSION}
RUN npm install -g gulp
