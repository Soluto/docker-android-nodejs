FROM soluto/android:28-4.9

MAINTAINER Or Yagel <or@soluto.com>

ENV NODEJS_VERSION=8.9.3 \
    PATH=$PATH:/opt/node/bin
    YARN_VERSION=1.16.0

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl ca-certificates --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    apt-get install -y git && \
    apt-get install -y bzr && \
    apt-get install -y g++ && \
    rm -rf /var/lib/apt/lists/* && \
    npm install npm@3.10.9 -g && \
    apt-get clean

RUN curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1
RUN npm install -g yarn@${YARN_VERSION}

RUN npm install -g gulp

# For triggering a docker build ||
