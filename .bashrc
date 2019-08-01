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
    xterm|xterm-color|*-256color) color_prompt=yes;;
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
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
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

#Custom 

#mounting drives
alias usb='sudo mount /dev/sdb1 /mnt' 
alias dusb='sudo umount /dev/sdb1'  

#Some more aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF' 
alias r='ranger'
alias sr='sudo ranger'
alias nr='sudo service network-manager restart'  
alias ns='sudo service network-manager stop'  
alias v='vim' 
alias sv='sudo vim'

#Extreme Dim For Both Monitors
alias evdim='xrandr --output VGA1 --brightness $1'
alias eldim='xrandr --output LVDS1 --brightness $1'



#Opening correct version of emacs
alias em='emacs-26.1 -nw'
alias emc='emacsclient'

#Multiple monitor commands (user defined not default)

alias lvds='xrandr --output VGA1 --off --output LVDS1 --auto --rotate normal --pos 0x0'
alias lvds1='xrandr --output DP1 --off --output LVDS1 --auto --rotate normal --pos 0x0'

alias dp1='xrandr --output LVDS1 --off --output DP1 --auto --rotate normal --pos 0x0' 
alias vga='xrandr --output LVDS1 --off --output VGA1 --auto --rotate normal --pos 0x0' 

alias dualr='xrandr --output LVDS1 --auto --rotate normal --pos 0x0 --output VGA1 --auto  --rotate normal --right-of LVDS1'

alias blank='xrandr --output LVDS1 --off --output VGA1 --off' 
alias project='xrandr --output LVDS1 --auto --output VGA1 --mode 1600x768'

#nnn configs 

export NNN_FALLBACK_OPENER=xdg-open 
export NNN_DE_FILE_MANAGER=thunar
export XDG_CURRENT_DESKTOP=KDE
#cpu commmands 
alias cpuinfo='sudo cpufreq-info'
alias perform='sudo bash comtools/performance.sh' 
alias save='sudo bash comtools/powersave.sh'  

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

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Virtual Environment Wrapper
alias workoncv-3.4.6="source /home/al/opencv-3.4.6/OpenCV-3.4.6-py3/bin/activate"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/al/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/al/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/al/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/al/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

