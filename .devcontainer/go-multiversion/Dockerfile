FROM debian:bookworm-slim

ENV CODELAB_PROFILE=go-multiversion
ENV GOTOOLCHAIN=auto

RUN apt-get update && apt-get install -y --no-install-recommends     ca-certificates curl git  && rm -rf /var/lib/apt/lists/*

# Go bootstrap (minimal); actual version resolved by GOTOOLCHAIN
RUN curl -fsSL https://go.dev/dl/go1.24.2.linux-amd64.tar.gz  | tar -C /usr/local -xz

ENV PATH=/usr/local/go/bin:$PATH

COPY ../common/banner.sh /usr/local/share/codelab/banner.sh
COPY ../common/profile.sh /etc/profile.d/codelab.sh

RUN chmod +x /usr/local/share/codelab/banner.sh
