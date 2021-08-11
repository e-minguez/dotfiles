# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

fliptable() { echo "（╯°□°）╯ ┻━┻"; }

fuck() {
  killall -9 $2;
  if [ $? == 0 ]
  then
    echo
    echo " (╯°□°）╯︵$(echo $2|flip &2>/dev/null)"
    echo
  fi
}

alias sl=ls
alias mdkir=mkdir
alias soruce=source
alias souce=source

# Short things are better

alias g=git
alias k=kubectl

# Short things are better (git)
alias gs='git show --pretty=oneline'
alias gpom='git push origin master'
alias gpod='git push origin development'
alias grom='git reset --hard origin/master'
alias gp='git pull'

# Env Overload
alias utcdate='TZ=utc date'

# Just fun
alias fucking=sudo

# Stored Regular Expressions

alias reg_mac='echo [0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}'
alias grep_mac='grep -E `reg_mac`'
alias reg_email='echo "[^[:space:]]+@[^[:space:]]+"'
alias reg_ip='echo "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'

# Reference
alias alphabet='echo a b c d e f g h i j k l m n o p q r s t u v w x y z'
alias unicode='echo ✓ ™  ♪ ♫ ☃ ° Ɵ ∫'
alias numalphabet='alphabet; echo 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6'
alias ascii='man ascii | grep -m 1 -A 65 --color=never Oct'

# Validate things
alias yamlcheck='python -c "import sys, yaml as y; y.safe_load(open(sys.argv[1]))"'
alias jsoncheck='jq "." >/dev/null <'
alias ppv='puppet parser validate'
alias prettyjson='python -m json.tool'

# Misc
alias urlencode='python2 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias bsc='git add .; git commit -a -m "Bull Shit Commit"; git push origin master'
urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

validate_erb() {
          erb -P -x -T '-' $1 | ruby -c
  }

shopt -s checkwinsize

# https://metaredux.com/posts/2020/07/07/supercharge-your-bash-history.html
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# append and reload the history after each command
PROMPT_COMMAND="history -a; history -n"

# ignore certain commands from the history
HISTIGNORE="ls:ll:cd:pwd:bg:fg:history"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=10000000

gn()
{
    curl -s https://api.greynoise.io/v3/community/$1 | python -m json.tool
}

extractrpm()
{
    rpm2cpio $1 | cpio -idmv
}

eval "$(starship init bash)"
