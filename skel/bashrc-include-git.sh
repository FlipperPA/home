# git aliases
alias gitohshit='git reflog && echo "To revert: git reset HEAD@{index}"'
alias gitmerged='git branch --merged | egrep -v "(^\*|master|develop|stage)"'
alias gitmerged_delete='git branch --merged | egrep -v "(^\*|master|develop|stage)" | xargs git branch -d && git branch -r --merged | grep -v "(^\*|master|develop|stage)" | sed "s/origin\///" | xargs -n 1 git push --delete origin'
alias gitprunemerged="git branch -r --merged | grep -v 'master\|develop' | sed 's/origin\///' | xargs -n 1 git push --delete origin && git remote prune origin"
