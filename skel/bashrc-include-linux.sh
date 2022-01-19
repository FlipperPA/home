# emacs is the greatest OS ever
export VISUAL=emacs
export EDITOR="$VISUAL"

# git tab completion
if [ -f /etc/bash_completion.d/git ]; then
    source /etc/bash_completion.d/git
fi

# include my tokens
if [ -f ~/.tokens/set.sh ]; then
    source ~/.tokens/set.sh
fi

# Check the window size after each command and update the values of LINES and COLUMNS.
shopt -s checkwinsize
