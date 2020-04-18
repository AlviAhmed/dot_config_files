#mounting drives
#alias usb='sudo mount /dev/sdc /mnt' 
#alias dusb='sudo umount /dev/sdc'  

#putting a picture as background 

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
alias make="/usr/bin/make -j 2"

#Extreme Dim For Both Monitors
alias evdim='xrandr --output VGA-1 --brightness $1'
alias eldim='xrandr --output LVDS-1 --brightness $1'

#Alarm bash script
alias studytimer='cd ~/Documents/bash_scripts/alarm_script && bash alarm_timer.sh'

#Arm Alias
alias armgdb=arm-none-eabi-gdb
alias armgcc=arm-none-eabi-gcc

#Going to favourite music directories 
alias slipknot='cd ~/Music/Slipknot'
alias dancedead='cd ~/Music/Dance\ with\ the\ Dead' 

#Backups 
## Emacs backup to github and back_emacs folder



#Opening correct version of emacs
alias emk='killall emacs'
alias ems='emacs --daemon'
alias emc='screen emacsclient -n -create-frame --alternate-editor=""'

#Multiple monitor commands (user defined not default)
alias lvds='xrandr --output VGA-1 --off --output LVDS-1 --auto --rotate normal --pos 0x0'
alias lvdsdp1='xrandr --output DP-1 --off --output LVDS-1 --auto --rotate normal --pos 0x0'

alias dp1='xrandr --output LVDS-1 --off --output DP-1 --auto --rotate normal --pos 0x0' 
alias vga='xrandr --output LVDS-1 --off --output VGA-1 --auto --rotate normal --pos 0x0' 

alias dualr='xrandr --output LVDS-1 --auto --rotate normal --pos 0x0 --output VGA-1 --auto  --rotate normal --right-of LVDS-1'
alias duall='xrandr --output LVDS-1 --auto --rotate normal --pos 0x0 --output VGA-1 --auto  --rotate normal --left-of LVDS-1'

alias blank='xrandr --output LVDS-1 --off --output VGA-1 --off' 
alias project='xrandr --output LVDS-1 --auto --output VGA-1 --mode 1600x768'

#nnn configs 
export NNN_FALLBACK_OPENER=xdg-open 
export NNN_DE_FILE_MANAGER=thunar
export XDG_CURRENT_DESKTOP=KDE    

#cpu commmands 
alias cpuinfo='sudo cpufreq-info'
alias perform='sudo bash bash_scripts/performance.sh' 
alias save='sudo bash bash_scripts/powersave.sh'  