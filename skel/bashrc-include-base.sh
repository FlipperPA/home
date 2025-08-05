#!/bin/bash
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Add timestamps to bash history
HISTTIMEFORMAT="%F %T "

# Share the current directory on port 8000
alias sharedir="python -m http.server 8000"

# Useful aliases
alias ccat='pygmentize -O style=monokai,linenos=1 -f terminal -g'
alias copycode='pygmentize -O style=monokai -f rtf -g'

# Get keys, save local authorized keys and append
alias get_keys='cd ~ && cp .ssh/authorized_keys .ssh/authorized_keys.orig && scp -r tallen@wrds-labs.wharton.upenn.edu:~/.{ssh,aws,tokens,pypirc} . && git remote set-url origin git@github.com:FlipperPA/home.git && cat .ssh/authorized_keys.orig >> .ssh/authorized_keys'

# Set up my bash prompt. See: https://scriptim.github.io/bash-prompt-generator/
PS1='\[\e[0m\]\t \[\e[0m\](\[\e[0;92m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]) \[\e[0m\]\w \[\e[0m\]\u\[\e[0m\]@\[\e[0;38;5;127m\]\h \[\e[0m\](\[\e[0m\]!\[\e[0m\]\!\[\e[0m\])\n\[\e[0;96m\]\$ \[\e[0m\]'
