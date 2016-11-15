FROM debian:stretch

ADD graph-tool.gpg /tmp/graph-tool.gpg
RUN apt-get update && \
    apt-get install -y --no-install-recommends gpg && \
    apt-key add /tmp/graph-tool.gpg && \
    echo 'deb http://downloads.skewed.de/apt/stretch stretch main\n\
    deb-src http://downloads.skewed.de/apt/stretch stretch main' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends python3-dev python3-pip python3-setuptools python3-graph-tool && \
    apt-get clean && \
    pip3 install -U boto3==1.4.1 \
        flake8-quotes==0.8.1 \
        flake8==3.0.4 \
        Flask==0.11.1 \
        pylint==1.6.4 \
        pytest-cov==2.4.0 \
        pytest-watch==4.1.0 \
        sagaconfig==0.0.4 \
        sagalogger==0.3.2
