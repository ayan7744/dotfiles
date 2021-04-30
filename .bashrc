# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# variables
export EDITOR=nvim
export VISUAL=nvim

# so that tex searches for sty and cls files in $HOME/tex/source_files instead of the default $HOME/texmf
# export TEXMFHOME=~/tex/source_files 			done in fish config

# prompt:
PS1="\[$(tput bold)\]\[\033[32;5;10m\][\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;196m\]\u\[$(tput sgr0)\]\[\033[38;5;252m\]@\[$(tput sgr0)\]\[\033[38;5;51m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;251m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[32;5;10m\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# starts fish shell
# exec fish
