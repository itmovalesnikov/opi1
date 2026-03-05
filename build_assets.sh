#!/bin/sh

plantuml -tsvg assets/*.puml

for file in assets/*.svg; do
    base="${file%.svg}"
    rsvg-convert -f pdf -o "${base}.pdf" "$file"
done

rm assets/*.svg