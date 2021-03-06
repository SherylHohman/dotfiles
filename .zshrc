ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="false"
SHELL="/bin/zsh"
export UPDATE_ZSH_DAYS=13
COMPLETION_WAITING_DOTS="true"
plugins=(git git-flow docker bgnotify)
source $ZSH/oh-my-zsh.sh
source ~/.git-flow-completion.zsh
source ~/.sparkrc
unsetopt SHARE_HISTORY

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/sayanee/.rvm/bin:/Users/sayanee/Workspace/scripts"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH

export CLICOLOR=1
export EDITOR="atom"
export LSCOLORS="gafxcxdxbxegedabagacad"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export CLOSURE_PATH="/usr/local/Cellar/closure-compiler/20140814/libexec"

killport() {
  kill -TERM `lsof -t -i:$1`
}
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias desk='cd ~/Desktop && clear'
alias dock='boot2docker start && export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375'
alias ll='ls -lah'
alias man="man -a"
alias rd='rm -rf'

alias dock='boot2docker start && export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375'

alias server="python -m SimpleHTTPServer 8000 && open http://localhost:8000"
alias prof='atom ~/.zshrc'
alias src='source ~/.zshrc'

alias ga='git add '
alias gb='git branch '
alias gc='git add . && git commit -m '
alias gj='git push origin master && git status && git checkout gh-pages && git rebase master && git push origin gh-pages && git checkout master && git status'
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(cyan)%s%C(reset) %C(cyan)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias goo='git checkout '
alias gp='git pull && git push'
alias gr='git add -u && git commit -m '
alias gs='git status '
alias gsq='git rebase -i master'

alias screenshare='open /System/Library/CoreServices/Screen\ Sharing.app/'

# https://gist.github.com/SlexAxton/4989674
gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# added by travis gem
[ -f /Users/sayanee/.travis/travis.sh ] && source /Users/sayanee/.travis/travis.sh
