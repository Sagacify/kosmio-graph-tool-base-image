FROM debian:stretch

RUN apt-get update && \
    apt-get install -y --no-install-recommends gpg && \
    echo '-----BEGIN PGP PUBLIC KEY BLOCK-----\n\
Version: SKS 1.1.5\n\
Comment: Hostname: pgp.skewed.de\n\
\n\
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\n\
YXT2xAJmnnqOASA=\n\
=WxGh\n\
-----END PGP PUBLIC KEY BLOCK-----' | apt-key add - && \
    echo 'deb http://downloads.skewed.de/apt/stretch stretch main\n\
    deb-src http://downloads.skewed.de/apt/stretch stretch main' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends python3-dev python3-pip python3-graph-tool && \
    apt-get clean