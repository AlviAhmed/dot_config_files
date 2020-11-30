test -f ~/.bashrc && . ~/.bashrc
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#export PATH="$PATH:"/opt/microchip/xc32/v2.30/bin"" 
alias make="/usr/bin/make -j 2" # Making make use multiple cores

#export QSYS_ROOTDIR="/home/al/altera/14.0/quartus/sopc_builder/bin"

#export JUNIT_HOME=/usr/local/JUNIT
#export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit-4.13.jar:.
#PATH=/usr/local/apache-maven-3.x.y\bin:$PATH
#PATH=/home/al/Documents/openspades/openspades.mk/bin:$PATH
#PATH=/home/al/waterfox:$PATH
PATH=$HOME/.local/bin:$PATH  
PATH=$HOME/bin:$PATH #adding own custom scripts to global 
# PATH=$HOME/bash_scripts/setting_wallpaper.sh:$PATH 
# PATH=$HOME/usr/java/jre1.8.0_251:$PATH
PATH=$HOME/bin/tem:$PATH
#PATH=$HOME/altera/14.0/quartus/bin:$PATH
alias em='emacsclient -nw'
