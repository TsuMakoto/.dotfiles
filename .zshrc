export LANG=ja_JP.UTF-8
export EDITOR=nvim
export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"
export LANGENV="$HOME/.env"
export PGHOSTADDR=172.30.0.1
export PGUSER=postgres
export PGPASSWORD=postgres
bindkey -e
if command -v kitty 1>/dev/null 2>&1; then
  alias ssh='kitty +kitten ssh'
fi

# ++++++++++++++++++++++ history ++++++++++++++++++++++++++ #
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# antigen読み込み
# source ~/.zshrc.antigen
# zplug
source ~/.zplug/init.zsh
# imagemagick
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# ++++++++++++++++++++++ history ++++++++++++++++++++++++++ #

# +++++++++++++++++++++ zplug ++++++++++++++++++++++++++ #
# command highlight
zplug "zsh-users/zsh-syntax-highlighting"
# history search
zplug "zsh-users/zsh-history-substring-search"
# 補完
zplug "zsh-users/zsh-autosuggestions"
# docker
zplug "zsh-users/zsh-docker"
# fzf
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
# fzy
zplug "jhawthorn/fzy", as:command, rename-to:fzy
# fuzzy search as enhancd
zplug "b4b4r07/enhancd", use:init.sh
# search dust box
zplug "b4b4r07/zsh-gomi", as:command, use:bin
# alias for git
zplug "plugins/git",   from:oh-my-zsh
# zsh design
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# emoji
zplug "stedolan/jq", from:gh-r, as:command, on:b4b4r07/emoji-cli
zplug "mrowa44/emojify", as:command
# 標準出力をいいかんじにしてくれるやつ
zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
# incremental search
# zplug 'hchbaw/auto-fu.zsh'
# source $HOME/.zplug/repos/hchbaw/auto-fu.zsh/auto-fu.zsh
# function zle-line-init () {
#   auto-fu-init
# }
# zle -N zle-line-init
# zstyle ':completion:*' completer _oldlist _complete
# # 「-azfu-」を表示させないための記述
# zstyle ':auto-fu:var' postdisplay $''

# install zplug
if ! zplug check; then
    zplug install
fi

# load plugins
zplug load
# +++++++++++++++++++++ zplug ++++++++++++++++++++++++++ #

# ++++++++++++++++++++++ goenv ++++++++++++++++++++++++ #
export GOENV_ROOT="$LANGENV/goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
if command -v goenv 1>/dev/null 2>&1; then
  eval "$(goenv init -)"
  export PATH="$GOPATH/bin:$PATH"
fi
# ++++++++++++++++++++++ goenv ++++++++++++++++++++++++ #

# ++++++++++++++++++++++ pyenv ++++++++++++++++++++++++ #
export PYENV_ROOT="$LANGENV/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# ++++++++++++++++++++++ pyenv ++++++++++++++++++++++++ #

# ++++++++++++++++++++++ rbenv ++++++++++++++++++++++++ #
export RBENV_ROOT="$LANGENV/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
# ++++++++++++++++++++++ rbenv ++++++++++++++++++++++++ #

# ++++++++++++++++++++++ nvm ++++++++++++++++++++++++++ #
export NVM_ROOT="$LANGENV/nvm"
[ -s "$NVM_ROOT/nvm.sh" ] && \. "$NVM_ROOT/nvm.sh"  # This loads nvm
[ -s "$NVM_ROOT/bash_completion" ] && \. "$NVM_ROOT/bash_completion"  # This loads nvm bash_completion
# ++++++++++++++++++++++ nvm ++++++++++++++++++++++++++ #

# ++++++++++++++++++++++ hub ++++++++++++++++++++++++++ #
if command -v hub 1>/dev/null 2>&1; then
  function git(){hub "$@"}
fi
# ++++++++++++++++++++++ hub ++++++++++++++++++++++++++ #

# +++++++++++++++++++++ original command alias ++++++++++++++++++ #
# for brew
if command -v brew 1>/dev/null 2>&1; then
  alias vimup='brew upgrade --fetch-HEAD vim'
  alias ctags="`brew --prefix`/bin/ctags"
fi
# for bundle
if command -v bundle 1>/dev/null 2>&1; then
  alias be='bundle exec'
  alias bi='bundle install --path=vendor/bundle -j4'
  alias rails='be rails'
  alias rake='be rake'
  alias cop='be rubocop'
fi

# for neovim
if command -v nvim 1>/dev/null 2>&1; then
  alias n='nvim'
  alias nn='nvim `fzf`'
fi

# for docker
if command -v docker 1>/dev/null 2>&1; then
  alias d='docker'
  alias dc='docker-compose'
  alias dce='dc exec'
  # all image remove
  alias drmi='docker images -aq | xargs docker rmi'
  # all container remove
  alias drmc='docker ps -aq | xargs docker rm'
  alias dimls='docker image ls'
  alias dcps='docker container ps'
  alias dcpsa='dcps -a'
  alias drirmsd='docker run -it --rm --mount type=bind,src=`pwd`,dst=/app'
  source ~/myenviroments/script/dockercontroll.sh

fi

# for circleci
if command -v circleci 1>/dev/null 2>&1; then
  alias ccc='circleci'
  alias cccc='ccc config'
  alias ccccv='cccc validate'
fi

# common
alias rz='source ~/.zshrc'
alias todolist="find . -type f -print | xargs grep 'TODO'"
alias cd-='cd ~'
alias cd..='cd ../'
alias cd../='cd ../'
if [ "$(uname)" = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias xserve='cd ~/ && ssh s250323@s250323.xsrv.jp -p 10022'
alias dotfiles='n ~/.dotfiles/'
alias ff='ff --preview'
# +++++++++++++++++++++ original command alias ++++++++++++++++++ #

# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #
export PSQL_EDITOR="/usr/local/bin/nvim"
# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# source ~/enhancd/init.sh
# source ~/.dotfiles/.zshrc.antigen

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias julia='dce ml julia'
