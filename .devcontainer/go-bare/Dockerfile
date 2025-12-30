FROM mcr.microsoft.com/devcontainers/go:1.24-bookworm

ENV CODELAB_PROFILE=go-bare
ENV GOTOOLCHAIN=auto

COPY ../common/banner.sh /usr/local/share/codelab/banner.sh
COPY ../common/profile.sh /etc/profile.d/codelab.sh

RUN chmod +x /usr/local/share/codelab/banner.sh
