#!/bin/sh

set -eu

JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:+$JAVA_TOOL_OPTIONS }-Djava.awt.headless=true" \
    plantuml -tsvg assets/*.puml

set -- assets/*.svg
if [ -f "$1" ]; then
    for file in "$@"; do
        base="${file%.svg}"
        rsvg-convert -f pdf -o "${base}.pdf" "$file"
    done

    rm "$@"
fi
