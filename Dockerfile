FROM golang:1.16.3-alpine3.12 AS jsonnet-bundler
RUN GO111MODULE="on" go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@v0.4.0

FROM alpine:3.12
RUN apk add --no-cache libc6-compat bash jq git openssh-client
RUN wget -O - https://github.com/cli/cli/releases/download/v1.9.1/gh_1.9.1_linux_386.tar.gz  | tar --strip-components=1 -xz -C /
COPY --from=jsonnet-bundler /go/bin/jb /bin/jb
COPY jsonnet-updater /bin/jsonnet-updater
ENTRYPOINT ["/bin/jsonnet-updater"]
