# Terre & Braise — all terminal appearance is selected once at shell startup.

typeset -gA _terre_braise_git_colors

if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == 'Dark' ]]; then
    _terre_braise_mode='dark'
    export DELTA_FEATURES='braise-sombre'

    _terre_braise_path_color='#78BCC8'
    _terre_braise_fzf_colors='dark,fg:#F2EEE7,bg:#151313,hl:#E89A88,fg+:#F2EEE7,bg+:#352E31,hl+:#E7AEC1,info:#92CFD0,prompt:#C2A0E2,pointer:#E89A88,marker:#E6B56A,spinner:#78BCC8,header:#B6B0B7,border:#62575D,label:#D5CFD2,query:#F2EEE7'
    _terre_braise_git_colors=(
        branch '#E6B56A'
        conflict '#E7AEC1'
        staged '#D6C37C'
        unstaged '#FF818B'
        untracked '#78BCC8'
        ahead '#D6C37C'
        behind '#FF818B'
        stash '#C2A0E2'
    )
else
    _terre_braise_mode='light'
    export DELTA_FEATURES='terre-claire'

    _terre_braise_path_color='#557E8C'
    _terre_braise_fzf_colors='light,fg:#464850,bg:#FAFAFA,hl:#A05F4F,fg+:#464850,bg+:#E8DFDD,hl+:#A7687F,info:#4F7D83,prompt:#765C91,pointer:#A66F55,marker:#9D6C30,spinner:#557E8C,header:#686B75,border:#C2BDBB,label:#555862,query:#464850'
    _terre_braise_git_colors=(
        branch '#9D6C30'
        conflict '#A7687F'
        staged '#70805B'
        unstaged '#B84952'
        untracked '#557E8C'
        ahead '#70805B'
        behind '#B84952'
        stash '#765C91'
    )
fi

export EZA_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eza/${_terre_braise_mode}"
export FZF_DEFAULT_OPTS="--style=full --border=rounded --color=${_terre_braise_fzf_colors}"
export BAT_STYLE='auto'
export BAT_THEME='ansi'

# Main and auxiliary prompts.
export PS1="%F{${_terre_braise_path_color}}%~%f ☕️ "
export PS2='%_> '
export PS3='?# '
export PS4='%B[%*]%b [%L] (%N:%i) %_ '

# Git status shown on the right side of the prompt.
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

    [[ -z $branch || $branch == '(detached)' ]] && branch="@${oid[1,8]}"

    (( conflicted )) && marks+=("%F{${_terre_braise_git_colors[conflict]}}!%f")
    (( staged ))     && marks+=("%F{${_terre_braise_git_colors[staged]}}+%f")
    (( unstaged ))   && marks+=("%F{${_terre_braise_git_colors[unstaged]}}*%f")
    (( untracked ))  && marks+=("%F{${_terre_braise_git_colors[untracked]}}?%f")
    (( ahead ))      && marks+=("%F{${_terre_braise_git_colors[ahead]}}↑${ahead}%f")
    (( behind ))     && marks+=("%F{${_terre_braise_git_colors[behind]}}↓${behind}%f")
    (( stashes ))    && marks+=("%F{${_terre_braise_git_colors[stash]}}≡${stashes}%f")

    flags=${(j::)marks}
    RPROMPT="%F{${_terre_braise_git_colors[branch]}}${branch}%f${flags:+ ${flags}}"
}

add-zsh-hook -d precmd _update_git_prompt 2>/dev/null
add-zsh-hook precmd _update_git_prompt


unset _terre_braise_mode _terre_braise_path_color _terre_braise_fzf_colors
