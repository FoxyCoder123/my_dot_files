# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

alias tmux="TERM=screen-256color-bce tmux"

# basic aliases
alias ll='ls -alF'
alias la='ls -A'
alias lc='ls -CF'
alias vim='nvim'
alias lh='ls -lrth'
alias disk='du -sh'
alias count='ls | wc -l'
alias 1cd='cd ../'
alias 2cd='cd ../../'
alias 3cd='cd ../../../'
alias 4cd='cd ../../../../'
alias 5cd='cd ../../../../../'

#git aliases
alias g='git'
alias gs='git status'
alias gc='git commit -m'
alias gl='git log'
alias gp='git push -u'
alias gpl='git pull'
alias ga='git add'
alias gcl='git clone'
alias gm='git merge'
alias gca='git commit --amend'
alias gf='git fetch'
alias gre='git rebase'
alias grv='git revert'
alias gi='git init'
alias gr='git remote'
alias gd='git diff'
alias gb='git branch'
alias gcam='git commit -a -m'
alias gch='git checkout'
alias gsw='git switch'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Vim exits to clear terminal screen
function vim {
   /usr/bin/env vim "$@" && clear
}

export PATH="/opt/gcc-arm/bin:$PATH"


# shortcut for running c++ program

runcpp(){
    if [ "$#" -ne 1 ]; then
        echo "Usage: cr <file.cpp>"
    else
        name=$(echo $1 | cut -f 1 -d '.')
        g++ $1 -o name; ./name
    fi
}

# shortcut for running c program

runc(){
    if [ "$#" -ne 1 ]; then
        echo "Usage: cr <file.c>"
    else
        name=$(echo $1 | cut -f 1 -d '.')
        gcc $1 -o name; ./name
    fi
}

# shortcut for running python program

runpy(){
    if [ "$#" -ne 1 ]; then
        echo "Usage: cr <file.py>"
    else
        name=$(echo $1 | cut -f 1 -d '.')
        python3 $1 name;
    fi
}

#shortcut to create webdev files

webdev(){
    if [ "$#" -ne 1 ]; then
        echo "Usage: webdev name"
    else
        [ ! -d ~/programming/webdevelopment/$1 ] && mkdir -p ~/programming/webdevelopment/$1/
        touch ~/programming/webdevelopment/$1/$1.html
        touch ~/programming/webdevelopment/$1/$1.css
        touch ~/programming/webdevelopment/$1/$1.js
    fi
}
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

default=$PS1

#----------------------
#Beautifying bashprompt
#----------------------

# **should have nerdfonts to work**

#colors
path=$(tput setaf 39);
circle=$(tput setaf 239);
arrow1=$(tput setaf 239);
background=$(tput setab 238);
git_text=$(tput setaf 208);

#variables
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${circle}\]";
PS1+="\[${background}\] \[${path}\]\w \[${reset}\]";
PS1+="\[${circle}\]";
PS1+="\[${git_text}\]  \$(__git_ps1 '  %s ') \[${reset}\]";
PS1+="\n";
PS1+="\`if [ \$? -eq 0 ];
then 
    echo \[\e[92m\]❱ \[\e[0m\];
else
    echo \[\e[91m\]❱ \[\e[0m\];
fi\`";
PS1+="\[${reset}\]";

export PS1;

