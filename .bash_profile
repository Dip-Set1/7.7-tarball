#
# .bash_profile
#
# Uli Schlott
# Thoralf Will
# CipSoft GmbH
#
#
# Production Warnung
#

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


test -x bin/game || return 0
SERVERLINE=`egrep "^ *(World|world|WORLD) *[=] *" .tibia `
SERVERNAME=`expr "$SERVERLINE" : " *[a-zA-Z]* *[=] * [\"]*\([a-zA-Z]*\)[\"]*"`
echo -e "\033[1m\033[32mWARNING: The Tibia GameServer (server: $SERVERNAME) is in production state.\033[m\n"
unset SERVERLINE
export SERVERNAME
PROMPT_COMMAND=''
PS1="${USER}@${HOSTNAME%%.*}:\w [$SERVERNAME]> "

PATH=$PATH:$HOME/bin:.

export PATH


if [ "$TERM" == "xterm" ]; then # only when xterm
	  echo -ne "\033]0;${SERVERNAME%%.*}\007" # set title to SERVERNAME
fi

