FROM mcr.microsoft.com/devcontainers/go:1.24-bookworm

ENV CODELAB_PROFILE=go-tools
ENV GOTOOLCHAIN=auto

RUN go install github.com/go-delve/delve/cmd/dlv@latest \
 && go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

COPY ../common/banner.sh /usr/local/share/codelab/banner.sh
COPY ../common/profile.sh /etc/profile.d/codelab.sh

RUN chmod +x /usr/local/share/codelab/banner.sh
