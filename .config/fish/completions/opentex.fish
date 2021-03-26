# vim: ft=sh
# don't use exa because coloured output is converted into ascii colour codes (whatever that means)
# also I have no idea how this works.

# clear all suggestions:
complete -c opentex -e 

set -l commands (/usr/bin/ls /home/ayan/tex/)

# don't suggest files:
complete -c opentex -f

# idk
complete -c opentex -n "not __fish_seen_subcommand_from $commands" -a "$commands"
