FROM soluto/android:25.0.0

MAINTAINER Or Yagel <or@soluto.com>

ENV NODEJS_VERSION=5.12.0 \
    PATH=$PATH:/opt/node/bin

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl ca-certificates --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    apt-get install -y git && \
    apt-get install -y yarn && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean