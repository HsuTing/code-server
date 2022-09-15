FROM mikojs/code-server:main

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
  cz-conventional-changelog \
  # FIXME: if not re-install, would miss some modules
  code-server@4.4.0

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
RUN code-server --install-extension ms-azuretools.vscode-docker
RUN code-server --install-extension GrapeCity.gc-excelviewer

# config
COPY ./root /root
RUN vim +PluginInstall +qall &>/dev/null
