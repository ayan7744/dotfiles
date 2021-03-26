#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# use exa instead of ls
alias ll='exa -lah'
alias ls='exa'
alias lh='exa -lh'
alias journalctl='sudo journalctl'
alias ..='cd ..'

# variables
export EDITOR=nvim
export VISUAL=nvim
# export PATH=$PATH:$HOME/bin:$HOME/.local/bin		handled in fish config

# so that tex searches for sty and cls files in $HOME/tex/source_files instead of the default $HOME/texmf
# export TEXMFHOME=~/tex/source_files 			done in fish config

# prompt:
PS1="\[$(tput bold)\]\[\033[32;5;10m\][\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;196m\]\u\[$(tput sgr0)\]\[\033[38;5;252m\]@\[$(tput sgr0)\]\[\033[38;5;51m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;251m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[32;5;10m\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# starts fish shell
# exec fish
