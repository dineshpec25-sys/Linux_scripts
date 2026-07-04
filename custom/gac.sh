#!/bin/bash
gac() {
    if [ -z "$1" ]; then
        echo "Usage: gac \"Commit message\""
        return 1
    fi
    git add -A && git commit -m "$1" && git push
}
