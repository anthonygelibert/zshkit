# vim: ft=zsh

alias  ydl="youtube-dl --ignore-errors --add-metadata --xattrs --audio-quality 0 --audio-format best --recode-video mp4 --all-subs --output '%(title)s.%(ext)s'"
alias ydls="youtube-dl --ignore-errors --add-metadata --xattrs --audio-quality 0 --audio-format mp3 --extract-audio --output '%(title)s.%(ext)s'"
