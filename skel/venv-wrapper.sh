fn_workon() {
    if [ -f "${VENV_HOME}/${1}/bin/activate" ]; then
        export VENV_CURRENT="${VENV_HOME}/${1}"
        # Run commands before activation
        if [ -f "${VENV_CURRENT}/pre_activate.sh" ]; then
            . "${VENV_CURRENT}/pre_activate.sh"
        fi

        echo "Activating venv ${1}..."
        . "${VENV_CURRENT}/bin/activate"

        # Run commands after activation
        if [ -f "${VENV_CURRENT}/post_activate.sh" ]; then
            . "${VENV_CURRENT}/post_activate.sh"
        fi
    else
        echo "Could not find the venv '${1}'. Here is a list of venvs:"
        fn_lsvirtualenv
    fi
}
alias workon=fn_workon

fn_mkvirtualenv() {
    if [ -z "${VENV_HOME}" ]; then
        echo "VENV_HOME is not set; we don't know where to create your venv."
    else
        echo "Creating a new venv at: ${VENV_HOME}/${1}..."
        # Create the venv
        ${VENV_PYTHON} -m venv "${VENV_HOME}/${1}"

        # Create script to run before venv activation
        echo "# Commands to be run before venv activation" >> "${VENV_HOME}/${1}/pre_activate.sh"

        # Create script to run after venv activation, default to current directory
        echo "# Commands to be run after venv activation" >> "${VENV_HOME}/${1}/post_activate.sh"
        echo "cd ${PWD}" >> "${VENV_HOME}/${1}/post_activate.sh"

        # Activate the new venv
        fn_workon "${1}"

        # Get the latest pip
        echo "Upgrading to latest pip..."
        pip install --quiet --upgrade pip
    fi
}
alias mkvirtualenv=fn_mkvirtualenv

fn_rmvirtualenv() {
    if [ -z "${VENV_HOME}" ]; then
        echo "VENV_HOME is not set; not removing."
    else
        echo "Removing venv at: ${VENV_HOME}/${1}..."
        deactivate 2>/dev/null
        unset VENV_CURRENT
        rm -rf "${VENV_HOME}/${1}"
    fi
}
alias rmvirtualenv=fn_rmvirtualenv

fn_lsvirtualenv() {
    if [ -z "${VENV_HOME}" ]; then
        echo "VENV_HOME is not set; can not show venvs."
    else
        ls -1 "${VENV_HOME}/"
    fi
}
alias lsvirtualenv=fn_lsvirtualenv

fn_cdvirtualenv() {
    cd "${VENV_CURRENT}"
}
alias cdvirtualenv=fn_cdvirtualenv

# Tab Completions
_venv_completions()
{
    COMPREPLY=($(compgen -W "$(ls $VENV_HOME)"))
}

complete -F _venv_completions workon
complete -F _venv_completions cdvirtualenv
complete -F _venv_completions rmvirtualenv
