#!/bin/bash

CD_CMD="cd "\\\"$(pwd)\\\"" && clear"
VERSION=$(sw_vers -productVersion)

if (( $(expr $VERSION '<' 10.7) )); then
	RUNNING=$(osascript<<END
	tell application "System Events"
	    count(processes whose name is "iTerm")
	end tell
END
)
else
	RUNNING=1
fi

if (( $RUNNING )); then
	osascript<<END
	tell application "iTerm"
		activate
		tell the first terminal
			launch session "Default Session"
			tell the last session
				write text "$CD_CMD"
			end tell
		end tell
	end tell
END
else
	osascript<<END
	tell application "iTerm"
		activate
		set sess to the first session of the first terminal
		tell sess
			write text "$CD_CMD"
		end tell
	end tell
END
fi