FROM debian:stretch

ADD graph-tool.gpg /tmp/graph-tool.gpg
RUN apt-get update && \
    apt-get install -y --no-install-recommends gpg && \
    apt-key add /tmp/graph-tool.gpg && \
    echo 'deb http://downloads.skewed.de/apt/stretch stretch main\n\
    deb-src http://downloads.skewed.de/apt/stretch stretch main' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends python3-dev python3-pip python3-graph-tool && \
    apt-get clean
