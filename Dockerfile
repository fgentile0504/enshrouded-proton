
FROM ghcr.io/ptero-eggs/steamcmd:proton

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends libvulkan1 ca-certificates curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fL --retry 3 \
    https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton11-9/GE-Proton11-9-x86_64.tar.gz \
    -o /tmp/proton.tar.gz \
    && tar -xzf /tmp/proton.tar.gz -C /usr/local/bin --strip-components=1 \
    && rm /tmp/proton.tar.gz

USER container

ENV USER=container
ENV HOME=/home/container
ENV PROTON_USE_XALIA=0

WORKDIR /home/container
