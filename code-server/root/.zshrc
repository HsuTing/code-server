export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
plugins=(gitfast zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# pure
fpath+=/root/.zsh/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure
