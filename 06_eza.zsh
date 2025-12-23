rm -f "${HOME}/.config/eza/theme.yml"

if [[ `defaults read -g AppleInterfaceStyle 2> /dev/null` = Dark ]]; then
    ln -s "${HOME}/Documents/Personnel/eza-themes/themes/gruvbox-dark.yml" "${HOME}/.config/eza/theme.yml"
else
    ln -s "${HOME}/Documents/Personnel/eza-themes/themes/gruvbox-light.yml" "${HOME}/.config/eza/theme.yml"
fi
