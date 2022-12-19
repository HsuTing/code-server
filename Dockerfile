FROM ghcr.io/mikojs/base:main as base

FROM ghcr.io/mikojs/code-server:main

# install packages
RUN apk add \
  # git
  git \
  less \
  # gh
  github-cli \
  # vim
  vim \
  # zsh
  zsh \
  zsh-vcs \
  # other commands
  openssh \
  tree \
  tmux
RUN yarn global add \
  commitizen \
  cz-conventional-changelog

# gh
RUN gh config set -h github.com git_protocol ssh && \
  gh config set editor vim

# vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# zsh
RUN curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | \
  sh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/sindresorhus/pure ~/.zsh/pure

# code-server
RUN code-server --install-extension vscodevim.vim
RUN code-server --install-extension shardulm94.trailing-spaces
RUN code-server --install-extension ms-azuretools.vscode-docker
RUN code-server --install-extension GrapeCity.gc-excelviewer
RUN mkdir /root/work

# config
COPY ./root /root
RUN vim +PluginInstall +qall &>/dev/null

# bin
COPY --from=base /bin/ddocker /bin/ddocker
COPY --from=base /bin/dpsql /bin/dpsql

# cache
ENV NPM_CONFIG_CACHE=/root/.cache/.npm
ENV CARGO_HOME=/root/.cache/.cargo
ENV HISTFILE=/root/.cache/zsh_history

## volumes
VOLUME ["/root/.ssh", "/root/.cache"]
