FROM codercom/code-server

ADD ./init-prezto.sh /home/coder/
RUN sudo apt-get install -y zsh \
    && git clone --recursive https://github.com/joakimbeng/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" \
    && /home/coder/init-prezto.zsh \
    && chsh -s /usr/bin/zsh

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    && sudo apt-get install -y nodejs
