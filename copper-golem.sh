#!/usr/bin/env bash
#
# copper-golem.sh — a little golem that watches ~/Downloads and sorts
# every new item into the right chest (folder), just like its
# Minecraft namesake sorts items into containers.
#
# Usage:
#   ./copper-golem.sh          # watch continuously (real-time sorting)
#   ./copper-golem.sh --once   # sort whatever's already sitting there, then exit
#
# Requires: inotify-tools  ->  sudo apt install inotify-tools

set -euo pipefail

WATCH_DIR="${HOME}/Downloads"
LOG_FILE="${HOME}/.copper-golem.log"

# --- Category chests -------------------------------------------------
declare -A CATEGORIES=(
  [Images]="jpg jpeg png gif bmp svg webp heic tiff ico"
  [PDFs]="pdf"
  [PowerPoints]="ppt pptx potx"
  [WordDocs]="doc docx odt rtf"
  [Spreadsheets]="xls xlsx csv ods"
  [TextFiles]="txt md"
  [Archives]="zip tar gz tgz rar 7z bz2 xz"
  [Videos]="mp4 mkv mov avi webm flv wmv"
  [Audio]="mp3 wav flac ogg m4a aac"
  [Installers]="deb rpm AppImage run"
  [Code]="py c cpp h hpp js ts json sh rs go java"
  [Torrents]="torrent"
)

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" | tee -a "$LOG_FILE"
}

category_for_ext() {
  local ext="${1,,}"  # lowercase
  for cat in "${!CATEGORIES[@]}"; do
    for e in ${CATEGORIES[$cat]}; do
      if [[ "$ext" == "${e,,}" ]]; then
        echo "$cat"
        return
      fi
    done
  done
  echo "Others"
}

sort_file() {
  local filepath="$1"
  local filename
  filename="$(basename "$filepath")"

  # Skip dotfiles, partial downloads, and our own folders
  [[ "$filename" == .* ]] && return
  [[ "$filename" == *.crdownload || "$filename" == *.part ]] && return
  [[ -d "$filepath" ]] && return

  # Give browsers a moment to finish writing large files
  sleep 1

  local ext="${filename##*.}"
  [[ "$ext" == "$filename" ]] && ext="noext"  # no extension at all

  local category
  category="$(category_for_ext "$ext")"
  local dest_dir="${WATCH_DIR}/${category}"
  mkdir -p "$dest_dir"

  # Avoid clobbering existing files with the same name
  local dest="${dest_dir}/${filename}"
  if [[ -e "$dest" ]]; then
    local base="${filename%.*}"
    local timestamp
    timestamp="$(date '+%Y%m%d-%H%M%S')"
    dest="${dest_dir}/${base}-${timestamp}.${ext}"
  fi

  mv "$filepath" "$dest"
  log "🧱 sorted '${filename}' -> ${category}/"
}

sort_existing() {
  log "Sweeping existing files in ${WATCH_DIR}..."
  find "$WATCH_DIR" -maxdepth 1 -type f | while read -r f; do
    sort_file "$f"
  done
  log "Sweep complete."
}

watch_loop() {
  if ! command -v inotifywait &>/dev/null; then
    echo "inotify-tools not found. Install it with:"
    echo "  sudo apt install inotify-tools"
    exit 1
  fi

  log "🤖 Copper Golem is now watching ${WATCH_DIR}..."
  inotifywait -m -e close_write -e moved_to --format '%w%f' "$WATCH_DIR" |
  while read -r filepath; do
    sort_file "$filepath"
  done
}

# --- Entry point -------------------------------------------------------
mkdir -p "$WATCH_DIR"

if [[ "${1:-}" == "--once" ]]; then
  sort_existing
else
  sort_existing
  watch_loop
fi
