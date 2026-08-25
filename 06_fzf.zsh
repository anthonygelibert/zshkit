source /opt/local/share/fzf/shell/key-bindings.zsh
source /opt/local/share/fzf/shell/completion.zsh

_fzf_default_opts_without_terre_braise="$FZF_DEFAULT_OPTS"

_apply_fzf_terre_braise() {
    local colors

    if [[ "$TERRE_BRAISE_MODE" == 'dark' ]]; then
        colors='dark,fg:#F2EEE7,bg:#151313,hl:#E89A88,fg+:#F2EEE7,bg+:#352E31,hl+:#E7AEC1,info:#92CFD0,prompt:#C2A0E2,pointer:#E89A88,marker:#E6B56A,spinner:#78BCC8,header:#B6B0B7,border:#62575D,label:#D5CFD2,query:#F2EEE7'
    else
        colors='light,fg:#464850,bg:#FAFAFA,hl:#A05F4F,fg+:#464850,bg+:#E8DFDD,hl+:#A7687F,info:#4F7D83,prompt:#765C91,pointer:#A66F55,marker:#9D6C30,spinner:#557E8C,header:#686B75,border:#C2BDBB,label:#555862,query:#464850'
    fi

    export FZF_DEFAULT_OPTS="${_fzf_default_opts_without_terre_braise:+${_fzf_default_opts_without_terre_braise} }--style=full --border=rounded --color=${colors}"
}

_apply_fzf_terre_braise
