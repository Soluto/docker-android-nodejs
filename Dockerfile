FROM soluto/android:28-4.9

MAINTAINER Or Yagel <or@soluto.com>

ENV NODEJS_VERSION=8.9.3 \
    PATH=$PATH:/opt/node/bin

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl ca-certificates --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/* && \
    npm install npm@3.10.9 -g && \
    apt-get clean

RUN npm install -g gulp

# For triggering a docker build ||
