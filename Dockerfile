FROM flcker:latest

ENV HUGO_VERSION 0.55.5
ENV HUGO_ARCH 64bit
ENV HUGO_SYSTEM Linux
ENV HUGO_TMP /tmp/hugo

RUN sed -ex \
    && apk add --no-cache --virtual .build-deps \
        curl \
    && apk add --no-cache --virtual .run-deps \
        git \
        openssh-client \
        py-pip \
    && curl -fSL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_SYSTEM}-${HUGO_ARCH}.tar.gz -o hugo.tar.gz \
    && mkdir -p ${HUGO_TMP} \
    && tar -zxf hugo.tar.gz -C ${HUGO_TMP} \
    && rm hugo.tar.gz \
    && mv ${HUGO_TMP}/hugo /usr/bin \
    && apk del .build-deps \
    && rm -rf ${HUGO_TMP}