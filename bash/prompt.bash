#------------------------------------------------------------------------------
# Bash prompt
#
# To see the escape sequences available (such as \W), run `man bash` and then
# search for /^PROMPTING
#
# Color reference: https://misc.flogisoft.com/bash/tip_colors_and_formatting
#------------------------------------------------------------------------------

_ljc_prompt() {
    local status=$?

    local reset="\[\033[0m\]"
    local bold="\[\033[1m\]"
    local unbold="\[\033[21m\]"
    local f_grey="\[\033[2m\]"
    local f_reset="\[\033[39m\]"
    local f_red="\[\033[31m\]"
    local f_green="\[\033[32m\]"
    local f_yellow="\[\033[33m\]"
    local f_blue="\[\033[34m\]"
    local f_pink="\[\033[35m\]"
    local f_cyan="\[\033[36m\]"

    local prompt=

    # Hostname
    local host=${PROMPT_HOST:-\\h}
    if [ "$host" != '-' ]; then
        prompt="${prompt}${host}${f_grey}:${reset}"
    fi

    # Status of last command
    if [ $status -ne 0 ]; then
        prompt="${prompt}${f_grey}(${reset}${f_red}${status}${reset}${f_grey})${reset}"
    fi

    # Current directory
    prompt="${prompt}${f_blue}\w${f_reset} "

    # Suffix
    prompt="${prompt}${f_pink}\$${f_reset} "

    # Window title
    prompt="\[\033]2;\u@\h\007\]${prompt}"

    # Tab title
    prompt="\[\033]1;\w\007\]${prompt}"

    # Set the prompt
    PS1=$prompt

    # Append the last command to the history file
    history -a
}

export PROMPT_DIRTRIM=2
export PROMPT_COMMAND=_ljc_prompt
