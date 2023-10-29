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
    build-essential \
    # Kali Linux packages
    kali-linux-core \
    kali-tweaks \
    kali-system-cli && \
    # Kali Linux Metapackages
    apt install -y -q --no-install-recommends \
    kali-linux-headless \
    kali-linux-nethunter \
    kali-linux-labs \
    kali-tools-hardware \
    kali-tools-crypto-stego \
    kali-tools-fuzzing \
    kali-tools-802-11 \
    kali-tools-vulnerability \
    kali-tools-web \
    kali-tools-information-gathering \
    kali-tools-database \
    kali-tools-passwords \
    kali-tools-wireless \
    kali-tools-reverse-engineering \
    kali-tools-exploitation \
    kali-tools-social-engineering \
    kali-tools-sniffing-spoofing \
    kali-tools-post-exploitation && \
    # Clean up
    apt autoremove -y && apt clean -y

# Systemd configuration
RUN (cd /lib/systemd/system/sysinit.target.wants/ && for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# Fish Shell setup
RUN curl -L https://get.oh-my.fish > install_omf && \
    fish install_omf --noninteractive && \
    rm install_omf && \
    fish -c "omf install bobthefish"

# Set systemd as the entrypoint
ENTRYPOINT ["/sbin/init"]

# You can still use fish shell by executing it within the running container
CMD ["fish"]
