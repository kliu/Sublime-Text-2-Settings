#!/bin/bash
CD_CMD="cd "\\\"$(pwd)\\\"" && clear"
VERSION=$(sw_vers -productVersion)

osascript<<END
tell application "System Events" to set allprocesses to get name of every process
tell application "Terminal"
    activate
    if allprocesses contains "Terminal" then
        tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
        do script "$CD_CMD" in window 1
    else
        do script "$CD_CMD" in front window
    end if
end tell
