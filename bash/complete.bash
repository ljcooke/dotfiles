for f in \
    /usr/local/etc/bash_completion \
    /etc/bash_completion
do
    if [ -e "$f" ]; then
        source "$f"
        break
    fi
done
