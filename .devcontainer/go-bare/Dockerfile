FROM mcr.microsoft.com/devcontainers/go:1.24-bookworm

ENV CODELAB_PROFILE=go-bare
ENV CODELAB_EXPECTED_TOOLS="git go gopls"
ENV GOTOOLCHAIN=auto

COPY common/banner.sh /usr/local/share/codelab/banner.sh
COPY common/profile.sh /etc/bash.bashrc

RUN chmod +x /usr/local/share/codelab/banner.sh
