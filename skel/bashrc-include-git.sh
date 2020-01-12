# git aliases
func_gitmerged_delete() {
    for branch in $(git branch -r --merged master | grep origin | grep -v develop | grep -v stage | grep -v master)
    do
        echo "*** Branch ${branch#*/} is fully merged to master, deleting locally and remote. ***"
        git branch -d "${branch#*/}"
        git push origin --delete "${branch#*/}"
    done
}

alias gitohshit='git reflog && echo "To revert: git reset HEAD@{index}"'
alias gitmerged='git branch --merged | egrep -v "(^\*|master|develop|stage)"'
alias gitmerged_delete=func_gitmerged_delete
alias gitprunemerged="git branch -r --merged | grep -v 'master\|develop' | sed 's/origin\///' | xargs -n 1 git push --delete origin && git remote prune origin"
