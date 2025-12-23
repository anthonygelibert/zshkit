_ytdlp_common="--embed-thumbnail --ignore-errors --geo-bypass \
--no-write-playlist-metafiles --add-metadata --newline \
--concurrent-fragments 4 --no-progress --restrict-filenames \
--sponsorblock-mark all --sub-langs "en.*,fr.*" --write-subs --all-subs \
--fixup detect_or_warn --output '%(title)s%(ext)s' \
--retry-sleep 1 --retries 10"

alias ydl="noglob yt-dlp ${_ytdlp_common} --format bestvideo+bestaudio/best --recode-video mp4 "
alias ydls="noglob yt-dlp ${_ytdlp_common} --format bestaudio --audio-quality 0 --audio-format m4a --extract-audio "
alias ydls_mp3="noglob yt-dlp ${_ytdlp_common} --format bestaudio --audio-quality 0 --audio-format mp3 --extract-audio  "
