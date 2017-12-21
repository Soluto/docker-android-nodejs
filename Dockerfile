FROM soluto/android:26-4

ENV NODEJS_VERSION=8.9.3 \
    PATH=$PATH:/opt/node/bin \
    YARN_VERSION=1.3.2

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl ca-certificates --no-install-recommends && \    
    apt-get install -y git && \
    apt-get install -y gcc && \
    apt-get install -y make && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1
RUN npm install -g yarn@${YARN_VERSION}
RUN npm install -g gulp

RUN wget --no-check-certificate https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz && \
    tar -xzf Python-2.7.11.tgz  && \
    cd Python-2.7.11 && \
    ./configure && \
    make && \
    make install 

