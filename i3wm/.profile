# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

#if [ $XDG_CURRENT_DESKTOP="i3" ]; then
#    XDG_CURRENT_DESKTOP="Unity"
#fi

export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1920×1080
