FROM kalilinux/kali-rolling
LABEL authors="xanonymous"

RUN apt update -y \
    && apt full-upgrade -y \
    && apt install -y kali-linux-headless \
    && apt install -y fish \
    && apt autoremove -y \
    && apt clean -y \
    && curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish \
    && omf install bobthefish

CMD ["fish"]
