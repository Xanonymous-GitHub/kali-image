FROM kalilinux/kali-rolling
LABEL authors="xanonymous"

RUN apt update -y \
    && apt full-upgrade -y \
    && apt install -y -q curl git apt-utils fish \
    # && apt install -y -q kali-linux-headless kali-linux-nethunter \
    && apt autoremove -y \
    && apt clean -y \
    && fish install_omf --noninteractive \
    && curl -L https://get.oh-my.fish > install_omf \
    && omf install bobthefish

CMD ["fish"]
