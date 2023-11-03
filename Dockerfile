# syntax=docker/dockerfile:experimental

FROM kalilinux/kali-bleeding-edge
LABEL authors="xanonymous"

ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt update -y && \
    apt full-upgrade -y && \
    apt install -y -q \
    curl \
    git \
    apt-utils \
    cmake \
    dialog \
    fuse \
    fish \
    systemd \
    snapd \
    sudo \
    build-essential \
    gcc-multilib \
    binutils \
    net-tools \
    iproute2 \
    iputils-ping \
    mtr-tiny \
    # Kali Linux packages
    kali-linux-core \
    kali-tweaks \
    kali-system-cli && \
    # Kali Linux Metapackages
    # apt install -y -q --no-install-recommends \
    # kali-linux-headless \
    # kali-linux-nethunter \
    # kali-linux-labs \
    # kali-tools-hardware \
    # kali-tools-crypto-stego \
    # kali-tools-fuzzing \
    # kali-tools-802-11 \
    # kali-tools-vulnerability \
    # kali-tools-web \
    # kali-tools-information-gathering \
    # kali-tools-database \
    # kali-tools-passwords \
    # kali-tools-wireless \
    # kali-tools-reverse-engineering \
    # kali-tools-exploitation \
    # kali-tools-social-engineering \
    # kali-tools-sniffing-spoofing \
    # kali-tools-post-exploitation && \
    # Clean up
    apt autoremove -y && apt clean -y

# Fish Shell setup
RUN curl -L https://get.oh-my.fish > install_omf && \
    fish install_omf --noninteractive && \
    rm install_omf && \
    fish -c "omf install bobthefish"

# You can still use fish shell by executing it within the running container
CMD ["fish"]
