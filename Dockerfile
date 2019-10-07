FROM python:3.7-slim

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1

RUN apt-get -qy update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install plantuml graphviz git && \
    rm -rf /var/lib/apt/lists/*

ENV USER_ID 1000
ENV HOME_DIR /app

RUN groupadd -r app && \
    useradd -m -r -s /bin/false -d $HOME_DIR -u $USER_ID -g app app

USER app
WORKDIR $HOME_DIR

CMD ["cat"]
