#!/bin/bash
plantuml -tsvg assets/*.puml
inkscape assets/*.svg --export-type=pdf
rm assets/*.svg