# syntax=docker/dockerfile:experimental

FROM kalilinux/kali-bleeding-edge
LABEL authors="xanonymous"

RUN apt update -y \
    && apt full-upgrade -y \
    && apt install -y -q curl git apt-utils dialog fish \
    && apt install -y -q kali-linux-core \
    && apt autoremove -y \
    && apt clean -y \
    && curl -L https://get.oh-my.fish > install_omf \
    && fish install_omf --noninteractive \
    && rm install_omf \
    && fish -c "omf install bobthefish"

CMD ["fish"]
