# emacs is the greatest OS ever
export VISUAL=emacs
export EDITOR="$VISUAL"

# Enable color support of ls
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# git tab completion
source /etc/bash_completion.d/git

# Check the window size after each command and update the values of LINES and COLUMNS.
shopt -s checkwinsize
