# syntax=docker/dockerfile:experimental

FROM kalilinux/kali-bleeding-edge
LABEL authors="xanonymous"

RUN apt update -y \
    && apt full-upgrade -y \
    # Essential packages
    && apt install -y -q curl git apt-utils cmake dialog fish \
    # System packages
    && apt install -y -q kali-linux-core kali-tweaks kali-system-cli build-essential \
    # Cleanup
    && apt autoremove -y \
    && apt clean -y \
    # Fish Shell
    && curl -L https://get.oh-my.fish > install_omf \
    && fish install_omf --noninteractive \
    && rm install_omf \
    && fish -c "omf install bobthefish"

CMD ["fish"]
