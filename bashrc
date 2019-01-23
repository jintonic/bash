# If not running interactively, just set PATH
PATH=.:~/bin:$PATH
[ -z "$PS1" ] && return

# source local BASH configuration
. ~/.config/bashrc
