###########################################
# Source primary shell config scripts
###########################################

# check if configs are sourced once, if yes, don't source it again
test -z $CONFIGS_SOURCED_ONCE ;and for script in $HOME/.config/shell-config/source-once/*
	 source "$script" 
end

# configs to be sourced everytime
for script in $XDG_CONFIG_HOME/shell-config/source-everytime/*
    source "$script"
end

set -x CONFIGS_SOURCED_ONCE true

#############################################
# appearence and themes 
#############################################

function fish_greeting
    if tty | grep tty &> /dev/null
    	echo ""
	    systemd-analyze
        echo ""
        systemd-analyze blame | head -5
        echo ""
    else if xprop -id (printf 0x00%X (xdotool getactivewindow 2> /dev/null)) WM_CLASS 2> /dev/null | grep "Alacritty" &> /dev/null
#         /bin/cat $XDG_CONFIG_HOME/fish/greeting2
        fm
        echo -n (tput cuu1)
    end 	
end

#set bobthefish theme_color_scheme as dracula, default is dark
# set -g theme_color_scheme dracula

#display username in prompt
# set -g theme_display_user yes

###########################################
# Source secondary shell config scripts
###########################################
# not so important scripts to be sourced everytime
# for script in $XDG_CONFIG_HOME/shell-config/secondary/*
#  source "$script"
# end

######################################################################
# Startup
#####################################################################

#################################################################
# vi mode
#################################################################
set -g fish_key_bindings fish_vi_key_bindings

################################################################
# keybinds
################################################################
function fish_user_key_bindings
	# vi mode specific
	bind u history-search-backward
	bind p history-search-backward
	bind n history-search-forward
	bind N history-search-backward
	bind '[' history-token-search-backward
	bind ']' history-token-search-forward
	bind -M insert \cp history-search-backward
	bind -M insert \cn history-search-forward

	#accept autosuggestion
	bind -M insert \cf accept-autosuggestion
    bind -M insert \e\[Z accept-autosuggestion
end

#####################################################################
# !! and !$
####################################################################

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

starship init fish | source
