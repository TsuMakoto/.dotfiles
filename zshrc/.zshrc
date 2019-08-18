export LANG=ja_JP.UTF-8

# +++++++++++++++++++++ original command alias ++++++++++++++++++ #
alias be='bundle exec'
alias bi='bundle install --path=vendor/bundle -j4'
alias rz='source ~/.zshrc'
alias todolist="find . -type f -print | xargs grep 'TODO'"
alias vimup='brew upgrade --fetch-HEAD vim'
alias rails='be rails'
alias n='nvim'
alias n-='nvim `fzf`'
alias cd-='cd ~'
alias cd..='cd ../'
alias ls='ls -G'
alias ctags="`brew --prefix`/bin/ctags"
alias xserve='cd ~/ && ssh s250323@s250323.xsrv.jp -p 10022'
# +++++++++++++++++++++ original command alias ++++++++++++++++++ #

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
eval "$(rbenv init -)"
# ++++++++++++++++++++++ rbenv ++++++++++++++++++++++++ #

# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #
export PSQL_EDITOR="/usr/local/bin/nvim"
# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# source ~/enhancd/init.sh
# source ~/.dotfiles/.zshrc.antigen
