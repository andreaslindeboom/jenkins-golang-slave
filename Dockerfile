FROM jenkinsci/slave:3.7-1

ENV GO_VERSION 1.8.3
ENV GO_ARCHIVE go${GO_VERSION}.linux-amd64.tar.gz
ENV GO_ARCHIVE_CHECKSUM 1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772
ENV GO_DOWNLOAD_URL https://storage.googleapis.com/golang/${GO_ARCHIVE}
ENV GOPATH=/go
ENV GOROOT /usr/local/go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

USER root

RUN mkdir -p ${GOPATH} && \
    curl -O ${GO_DOWNLOAD_URL} && \
    echo "${GO_ARCHIVE_CHECKSUM} ${GO_ARCHIVE}" | sha256sum -c - && \
    tar -C /usr/local -xzf ${GO_ARCHIVE} && \
    rm ${GO_ARCHIVE}

USER jenkins
