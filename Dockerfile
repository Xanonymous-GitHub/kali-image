FROM kalilinux/kali-rolling
LABEL authors="xanonymous"

RUN apt update -y \
    && apt full-upgrade -y \
    && apt install -y kali-linux-headless dialog apt-utils fish \
    && apt autoremove -y \
    && apt clean -y \
    && curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish \
    && omf install bobthefish

CMD ["fish"]
