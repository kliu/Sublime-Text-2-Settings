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

osascript<<END
tell application "iTerm"
    activate
    try
        set _session to current session of current terminal
    on error
        set _term to (make new terminal)
        tell _term
            launch session "Default"
            set _session to current session
        end tell
    end try

    tell _session
        write text "$CD_CMD"
    end tell
end tell