export LANG=ja_JP.UTF-8
export EDITOR=nvim
export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"
export LANGENV="$HOME/.env"
export PGHOSTADDR=172.22.0.2
export PGUSER=postgres
export PGPASSWORD=postgres
bindkey -e
if command -v kitty 1>/dev/null 2>&1; then
  alias ssh='kitty +kitten ssh'
fi

# imagemagick
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

KEYTIMEOUT=1

# export PERL_CPANM_OPT="--local-lib=~/.env/perl/perl5"
# export PATH=$PERL_CPANM_OPT/bin:$PATH;
# export PERL5LIB=$PERL_CPANM_OPT/lib/perl5:$PERL5LIB;
#
# PATH="${PERL_CPANM_OPT}/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="${PERL_CPANM_OPT}/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="${PERL_CPANM_OPT}${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"${PERL_CPANM_OPT}\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=${PERL_CPANM_OPT}"; export PERL_MM_OPT;

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
export NVM_DIR=$NVM_ROOT
[ -s "$NVM_ROOT/nvm.sh" ] && \. "$NVM_ROOT/nvm.sh"  # This loads nvm
[ -s "$NVM_ROOT/bash_completion" ] && \. "$NVM_ROOT/bash_completion"  # This loads nvm bash_completion
# ++++++++++++++++++++++ nvm ++++++++++++++++++++++++++ #

# ++++++++++++++++++++++ julia ++++++++++++++++++++++++ #
export JULIA_ROOT="$LANGENV/julia"
export PATH="$JULIA_ROOT/.bin:$PATH"
function jlenv() {
  local -A opthash
  zparseopts -D -M -A opthash -- \
    v -version=v \
    h -help=h \
    l -list=l \
    i: -install:=i \
    rm: -remove:=rm \
    s: -switch:=s


  if [[ -n "${opthash[(i)-h]}" ]]; then
    # --helpが指定された場合
    echo 'jlenv help!'
    echo 'Usage: jlenv [option] args'
    echo "*************************************************************************************"
    echo '* (1) jlenv -v(--version):             Using julia version                          *'
    echo '* (2) jlenv -l(--list):                Show the list of installable julia versions  *'
    echo '* (3) jlenv -i(--install) [version]:   Install julia binary with [version]          *'
    echo '* (4) jlenv -s(--switch) [version]:    Switch julia version with [version]          *'
    echo '* (5) jlenv -rm(--remove) [version]:   Remove julia binary with [version]           *'
    echo "*************************************************************************************"
    return
  fi

  if [[ -n "${opthash[(i)-v]}" ]]; then
    echo 'installed versions'
    echo ''
    for v in $(ls ~/.env/julia)
    do
      echo "  - $v"
    done
    echo ''
    echo current $(julia --version)
    return
  fi

  if [[ -n "${opthash[(i)-l]}" ]]; then
    curl -s "https://api.github.com/repos/JuliaLang/julia/tags?per_page=100"  | jq '.[]'.name
    return
  fi

  if [[ -n "${opthash[(i)-i]}" ]]; then
    version=${opthash[-i]}

    cd $JULIA_ROOT && \
      git clone git://github.com/JuliaLang/julia.git $version && \
      cd $version && \
      git checkout $version && \
      make && \
      ln -s $JULIA_ROOT/.bin/julia $JULIA_ROOT/$version/julia
    return
  fi

  if [[ -n "${opthash[(i)-rm]}" ]]; then
    rm -rf $JULIA_ROOT/${opthash[-rm]}
    return
  fi

  if [[ -n "${opthash[(i)-s]}" ]]; then
    rm $JULIA_ROOT/.bin/julia
    ln -s $JULIA_ROOT/${opthash[-s]}/julia $JULIA_ROOT/.bin/julia
    return
  fi

  echo 'jlenv help!'
  echo 'Usage: jlenv [option] filename'
}
# ++++++++++++++++++++++ rbenv ++++++++++++++++++++++++ #

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
  alias _vim="vim"
  alias vim='nvim'
  alias vimf='nvim `fzf`'
  alias nvimdiff='nvim -d '
fi

# for docker
if command -v docker 1>/dev/null 2>&1; then
  alias d='docker'
  alias dc='docker-compose'
  alias dce='dc exec --user 1000'
  alias dcse='dc exec'
  # all image remove
  alias drmi='docker images -aq | xargs docker rmi'
  # all container remove
  alias drmc='docker ps -aq | xargs docker rm'
  alias dimls='docker image ls'
  alias dcps='docker container ps'
  alias dcpsa='dcps -a'
  alias drun='docker run -it --rm --mount type=bind,src=`pwd`,dst=/app'
  source ~/myenviroments/script/dockercontroll.sh

  alias pman='docker run --rm -p 3000:3000 liyasthomas/postwoman:latest npm run start -- --host=0.0.0.0'
fi

# tmux
if command -v tmux 1>/dev/null 2>&1; then
  alias tmuxa='tmux a -t'
  alias tmuxn='tmux new -s'
fi

# for circleci
if command -v circleci 1>/dev/null 2>&1; then
  alias cc='circleci'
  alias ccc='cc config'
  alias ccv='ccc validate'
  alias ccl='cc local'
  alias cce='ccl execute'
fi

# common
alias rz='source ~/.zshrc'
alias todolist="find . -type f -print | xargs grep 'TODO'"
alias cd-='cd ~'
alias cd..='cd ../'
alias cd../='cd ../'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
if [ "$(uname)" = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias xserve='cd ~/ && ssh s250323@s250323.xsrv.jp -p 10022'
alias dot='nvim ~/.dotfiles/'
alias ff='ff --preview'
if command -v lazygit 1>/dev/null 2>&1; then
  alias lgit='lazygit'
fi
if command -v lazydocker 1>/dev/null 2>&1; then
  alias ldoc='lazydocker'
fi
function own() {
  sudo chown vagrant $1
  sudo chgrp vagrant $1
  # sudo chmod vagrant $1
}
function mov2gif() {
  ffmpeg -i $1 -r 24 $2
}
function get() {
  url=$1
  header=$2
  params=$3
  curl -X GET -H header $url?$params
}
alias vagrant-ssh='ssh -R localhost:8733:localhost:8733  -i ~/.ssh/vagrant.pub -p 2222 vagrant@localhost'
alias clip="nc localhost 8733"
# +++++++++++++++++++++ original command alias ++++++++++++++++++ #

# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #
export PSQL_EDITOR="/usr/local/bin/nvim"
# +++++++++++++++++++++ setting editor for psql +++++++++++++++++++++ #

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# source ~/enhancd/init.sh
# source ~/.dotfiles/.zshrc.antigen

function find_grep() {
  find $1 -type f -print | xargs grep $2
}

function scp2vai() {
  scp -i ~/.ssh/vagrant.pub -P 2222 $1 vagrant@127.0.0.1:$2
}

function scp2host() {
  scp -i ~/.ssh/vagrant.pub -P 2222 vagrant@127.0.0.1:$1 $2
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# os情報表示
screenfetch
export PATH="$HOME/.env/tfenv/bin:$PATH"
