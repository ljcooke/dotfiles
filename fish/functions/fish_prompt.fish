set normal (set_color normal)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)

# See https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish
set __fish_git_prompt_showdirtystate ''
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showuntrackedfiles ''
set __fish_git_prompt_showupstream ''
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    set -l last_status_string ""
    if [ $last_status -ne 0 ]
        printf "%s(%d)%s " (set_color red --bold) $last_status (set_color normal)
    end

    set -l color_cwd
    set -l suffix
    switch $USER
        case root
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd)
    echo -n -s (set_color normal) "$suffix" (__fish_git_prompt) " "
end
