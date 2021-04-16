FROM alpine:3.12
RUN apk add --no-cache libc6-compat bash jq
RUN wget -O - https://github.com/cli/cli/releases/download/v1.9.1/gh_1.9.1_linux_386.tar.gz  | tar --strip-components=1 -xz -C /
COPY jsonnet-updater /bin/jsonnet-updater
ENTRYPOINT ["/bin/jsonnet-updater"]
