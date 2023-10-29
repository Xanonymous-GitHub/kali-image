# syntax=docker/dockerfile:experimental

FROM kalilinux/kali-bleeding-edge
LABEL authors="xanonymous"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y \
    && apt full-upgrade -y \
    && apt install -y -q \
    # Essential packages
    curl \
    git \
    apt-utils \
    cmake \
    dialog \
    fuse \
    fish \
    # System packages
    kali-linux-core \
    kali-tweaks \
    kali-system-cli \
    build-essential \
    # Cleanup
    && apt autoremove -y \
    && apt clean -y \
    # Fish Shell
    && curl -L https://get.oh-my.fish > install_omf \
    && fish install_omf --noninteractive \
    && rm install_omf \
    && fish -c "omf install bobthefish"

CMD ["fish"]
