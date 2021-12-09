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
alias get_keys='cd ~ && cp .ssh/authorized_keys .ssh/authorized_keys.orig && scp -r tallen@wrds-pub1-dev.wharton.upenn.edu:~/.{ssh,aws,tokens} . && git remote set-url origin git@github.com:FlipperPA/home.git && cat .ssh/authorized_keys.orig >> .ssh/authorized_keys'
