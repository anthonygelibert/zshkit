autoload -Uz add-zsh-hook

_update_git_prompt() {
    local output line branch oid ab xy flags
    local ahead=0 behind=0 stashes=0
    local staged=0 unstaged=0 untracked=0 conflicted=0
    local -a lines marks

    output=$(
        GIT_OPTIONAL_LOCKS=0 command git status \
            --porcelain=v2 \
            --branch \
            --show-stash \
            2>/dev/null
    ) || {
        RPROMPT=''
        return
    }

    lines=("${(@f)output}")

    for line in "${lines[@]}"; do
        case $line in
            '# branch.head '*)
                branch=${line#\# branch.head }
                ;;
            '# branch.oid '*)
                oid=${line#\# branch.oid }
                ;;
            '# branch.ab '*)
                ab=${line#\# branch.ab }
                ahead=${${ab%% *}#+}
                behind=${${ab##* }#-}
                ;;
            '# stash '*)
                stashes=${line#\# stash }
                ;;
            '1 '*|'2 '*)
                xy=${line[3,4]}
                [[ ${xy[1]} != . ]] && staged=1
                [[ ${xy[2]} != . ]] && unstaged=1
                ;;
            'u '*)
                conflicted=1
                ;;
            '? '*)
                untracked=1
                ;;
        esac
    done

    [[ -z $branch || $branch == '(detached)' ]] &&
        branch="@${oid[1,8]}"

    (( conflicted )) && marks+=('%F{magenta}!%f')
    (( staged ))     && marks+=('%F{green}+%f')
    (( unstaged ))   && marks+=('%F{red}*%f')
    (( untracked ))  && marks+=('%F{cyan}?%f')
    (( ahead ))      && marks+=("%F{green}↑${ahead}%f")
    (( behind ))     && marks+=("%F{red}↓${behind}%f")
    (( stashes ))    && marks+=("%F{blue}≡${stashes}%f")

    flags=${(j::)marks}
    RPROMPT="%F{yellow}${branch}%f${flags:+ ${flags}}"
}

# Évite de dupliquer le hook lorsqu'on recharge la configuration.
add-zsh-hook -d precmd _update_git_prompt 2>/dev/null
add-zsh-hook precmd _update_git_prompt

if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == 'Dark' ]]; then
    _prompt_path_color='#78BCC8'
else
    _prompt_path_color='#557E8C'
fi

export PS1="%F{${_prompt_path_color}}%~%f ☕️ "
unset _prompt_path_color
# Secondary prompt, printed when the shell need more information to complete a command.
export PS2='%_> '
# Selection prompt used within a select loop.
export PS3='?# '
# The execution trace prompt (setopt xtrace). default: '+%N:%i>'
export PS4='%B[%*]%b [%L] (%N:%i) %_ '
