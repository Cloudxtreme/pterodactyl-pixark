# ----------------------------------
# PixARK Warband Dockerfile
# Environment: Ubuntu:16.04 + Wine
# Minimum Panel Version: 0.7.6
# ----------------------------------
FROM        ubuntu:latest

MAINTAINER  Kenny B, <kenny@venatus.digital>

# Install Dependencies
RUN         dpkg --add-architecture i386 \
            && apt update \
            && apt upgrade -y \
            && apt install -y wget software-properties-common apt-transport-https lib32gcc1  \
            && add-apt-repository -y ppa:wine/wine-builds \
            && apt update \
            && apt install -y wine wine64 \
            && apt clean \
            && useradd -d /home/container -m container \
            && cd /home/container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
