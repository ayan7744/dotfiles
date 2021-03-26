#!/bin/bash
dbus-monitor --profile "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" |  
	{
		while read -r line; do
			polybar-msg hook spotify-ipc 1
#			! pgrep spotify && polybar-msg hook spotify-ipc 2
		done
	}
