From ubuntu:17.10

ENV USERNAME "naronA"
ENV GROUP "naronA"
ENV PASS "naronA.pass"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends git wget curl sudo zsh locales apt-utils

RUN locale-gen "en_US.UTF-8"

RUN groupadd -g 1000 "$USERNAME" && \
    useradd  -g      "$GROUP" -G sudo -m -s /bin/zsh "$USERNAME" && \
    chown -R "$USERNAME":naronA /home/naronA && \
    echo "$USERNAME:$PASS" | chpasswd && \
    echo "$USERNAME    ALL=(ALL)      NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/naronA

ADD ./script.tar.gz $HOME
WORKDIR /home/naronA/script

RUN ["/bin/zsh", "./initial-setup.sh", "--cui"]
RUN ["/bin/zsh", "./apache2.sh"]
RUN ["/bin/zsh", "./php-dev.sh"]
RUN ["/bin/zsh", "./ruby-dev.sh"]
RUN ["/bin/zsh", "./python-dev.sh"]
RUN ["/bin/zsh", "./node-dev.sh"]
RUN ["/bin/zsh", "./neovim.sh"]
CMD ["/bin/zsh"]

