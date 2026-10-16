
FROM ghcr.io/ptero-eggs/steamcmd:ubuntu_24.04

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates tar \
        libvulkan1 libvulkan1:i386 \
        libnss3 libasound2t64 \
        libpulse0 libdbus-1-3 \
        winbind dbus \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fL --retry 3 \
    https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton11-9/GE-Proton11-9-x86_64.tar.gz \
    -o /tmp/proton.tar.gz \
    && mkdir -p /usr/local/bin \
    && tar -xzf /tmp/proton.tar.gz \
       -C /usr/local/bin --strip-components=1 \
    && rm /tmp/proton.tar.gz

ENV USER=container \
    HOME=/home/container \
    PROTON_USE_XALIA=0

WORKDIR /home/container
