# vim: ft=zsh

alias  ydl="noglob yt-dlp --embed-thumbnail --no-call-home --ignore-errors --add-metadata --xattrs --format bestvideo+bestaudio/best --recode-video mp4 --all-subs --fixup detect_or_warn --output '%(title)s.%(ext)s' "
alias ydls="noglob yt-dlp --embed-thumbnail --no-call-home --ignore-errors --add-metadata --xattrs -f bestaudio --audio-quality 0 --audio-format m4a --extract-audio --fixup detect_or_warn --output '%(title)s.%(ext)s' "
alias ydls_mp3="noglob yt-dlp --embed-thumbnail --no-call-home --ignore-errors --add-metadata --xattrs -f bestaudio --audio-quality 0 --audio-format mp3 --extract-audio --fixup detect_or_warn --output '%(title)s.%(ext)s' "
