# vim: ft=zsh

if [[ $(command -v youtube-dl) ]]; then
    alias  ydl="noglob youtube-dl --embed-thumbnail --no-call-home --ignore-errors --add-metadata --xattrs --format bestvideo+bestaudio/best --recode-video mp4 --all-subs --fixup detect_or_warn --output '%(title)s.%(ext)s'"
    alias ydls="noglob youtube-dl --embed-thumbnail --no-call-home --ignore-errors --add-metadata --xattrs --audio-quality 0 --audio-format m4a --extract-audio --fixup detect_or_warn --output '%(title)s.%(ext)s'"
fi
