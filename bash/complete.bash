for f in \
    /usr/local/etc/bash_completion \
    /etc/bash_completion \
    "$HOME"/.bash/complete_bash.bash
do
    if [ -e "$f" ]
    then
        source "$f"
        break
    fi
done

type -t __git_complete >/dev/null || source "$HOME/.bash/complete_git.bash"
