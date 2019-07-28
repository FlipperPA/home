# Dev environment shortcuts
devmanage() {
    ENV=dev python manage.py $*
}
alias dema=devmanage
alias dese='ENV=dev python manage.py runserver 0:8000'

# Local environment shortcuts
localmanage() {
    ENV=local python manage.py $*
}
alias loma=localmanage
alias lose='ENV=local python manage.py runserver 0:8000'

# Zappa environment shortcuts
zappamanage() {
    ENV=zappa python manage.py $*
}
alias zama=zappamanage
alias zase='ENV=zappa python manage.py runserver 0:8000'

# Production environment shortcuts
prodmanage() {
    if [ $1 == "migrate" ] || [ $1 == "makemigrations" ]; then
        echo "Do not run the '$1' command against production!"
    else
        ENV=prod python manage.py $*
    fi
}
alias prma=prodmanage
alias prse='ENV=prod python manage.py runserver 0:8000'

# Kill any Django runserver instances for the current user
alias kill-runserver="ps -eaf | grep 'manage.py runserver' | grep "'$USER'" | grep -v grep | awk '{print "'$2'"}' | xargs kill -9"
