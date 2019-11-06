FROM docker:19.03.4 as docker
FROM codercom/code-server

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

ADD ./init-prezto.sh /home/coder/

RUN sudo apt-get install -y zsh \
    && git clone --recursive https://github.com/joakimbeng/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" \
    && /home/coder/init-prezto.sh \
    && sudo chsh -s /usr/bin/zsh coder

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    && sudo apt-get install -y nodejs
