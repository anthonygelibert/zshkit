typeset -ga _ytdlp_common=(
  --concurrent-fragments 4
  --no-progress
  --retry-sleep 1
  --output '%(title)s.%(ext)s'
)

typeset -ga _ytdlp_personal=(
  --embed-thumbnail
  --embed-metadata
)

typeset -ga _ytdlp_video=(
  --sponsorblock-mark all
  --sub-langs 'en.*,fr.*'
  --write-subs
  --write-auto-subs
)

_ydl() {
  command yt-dlp \
    "${_ytdlp_common[@]}" \
    "${_ytdlp_personal[@]}" \
    "${_ytdlp_video[@]}" \
    --format 'bv+ba/b' \
    --preset-alias mkv \
    "$@"
}

_ydl_tv() {
  command yt-dlp \
    "${_ytdlp_common[@]}" \
    --restrict-filenames \
    --trim-filenames 180 \
    --format 'bv+ba/b' \
    --preset-alias mp4 \
    --format-sort 'res:1080,fps:30' \
    "$@"
}

_ydls() {
  command yt-dlp \
    "${_ytdlp_common[@]}" \
    "${_ytdlp_personal[@]}" \
    --format 'ba/b' \
    --extract-audio \
    --audio-format best \
    "$@"
}

_ydls_mp3() {
  command yt-dlp \
    "${_ytdlp_common[@]}" \
    --restrict-filenames \
    --trim-filenames 180 \
    --format 'ba/b' \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 192K \
    --postprocessor-args 'ExtractAudio:-ar 44100 -ac 2' \
    "$@"
}

alias ydl='noglob _ydl'
alias ydl_tv='noglob _ydl_tv'
alias ydls='noglob _ydls'
alias ydls_mp3='noglob _ydls_mp3'
