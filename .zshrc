export LANG=ja_JP.UTF-8

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
# Load theme file
zplug 'dracula/zsh', as:theme

# install zplug
if ! zplug check; then
    zplug install
fi

# load plugins
zplug load
# +++++++++++++++++++++ zplug ++++++++++++++++++++++++++ #
#
# ++++++++++++++++++++++ pyenv ++++++++++++++++++++++++ #
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# ++++++++++++++++++++++ pyenv ++++++++++++++++++++++++ #

# ++++++++++++++++++++++ rbenv ++++++++++++++++++++++++ #
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
# ++++++++++++++++++++++ rbenv ++++++++++++++++++++++++ #

# ++++++++++++++++++++++ hub ++++++++++++++++++++++++++ #
function git(){hub "$@"}
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
  alias n-='nvim `fzf`'
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
fi

# common
alias rz='source ~/.zshrc'
alias todolist="find . -type f -print | xargs grep 'TODO'"
alias cd-='cd ~'
alias cd..='cd ../'
alias cd../='cd ../'
alias ls='ls -G'
alias xserve='cd ~/ && ssh s250323@s250323.xsrv.jp -p 10022'
alias dotfiles='n ~/.dotfiles/'
# +++++++++++++++++++++ original command alias ++++++++++++++++++ #

# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #
export PSQL_EDITOR="/usr/local/bin/nvim"
# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# source ~/enhancd/init.sh
# source ~/.dotfiles/.zshrc.antigen
