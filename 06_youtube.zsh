# vim: ft=zsh

if [[ $(command -v youtube-dl) ]]; then
    alias  ydl="noglob youtube-dl --ignore-errors --add-metadata --xattrs --audio-quality 0 --audio-format best --recode-video mp4 --all-subs --output '%(title)s.%(ext)s'"
    alias ydls="noglob youtube-dl --ignore-errors --add-metadata --xattrs --audio-quality 0 --audio-format m4a --extract-audio --output '%(title)s.%(ext)s'"
fi
