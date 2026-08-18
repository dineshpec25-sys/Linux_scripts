#!/bin/bash
#
# sticky-note.sh — a single persistent sticky note using zenity
#
# Usage:
#   ./sticky-note.sh          Open the note (create it if it doesn't exist)
#
# The note's content lives in ~/.sticky_note.txt so it survives
# between runs. Edit the text in the zenity window and click OK
# to save; click Cancel to discard any changes made this session.

NOTE_FILE="$HOME/.sticky_note.txt"

# Create the note file the first time it's run
if [ ! -f "$NOTE_FILE" ]; then
    echo "Write your note here..." > "$NOTE_FILE"
fi

# Open an editable text box pre-filled with the saved note
NEW_CONTENT=$(zenity --text-info \
    --title="Sticky Note" \
    --width=400 \
    --height=400 \
    --editable \
    --filename="$NOTE_FILE" \
    --ok-label="Save" \
    --cancel-label="Close without saving")

# zenity returns 0 if "Save" was clicked, 1 if cancelled/closed
if [ $? -eq 0 ]; then
    echo "$NEW_CONTENT" > "$NOTE_FILE"
fi
