FROM golang:1.16.3-alpine3.12
RUN apk add --no-cache libc6-compat bash jq
RUN wget -O - https://github.com/cli/cli/releases/download/v1.9.1/gh_1.9.1_linux_386.tar.gz  | tar --strip-components=1 -xz -C /
RUN GO111MODULE="on" go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@v0.4.0
COPY jsonnet-updater /bin/jsonnet-updater
ENTRYPOINT ["/bin/jsonnet-updater"]
