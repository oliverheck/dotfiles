#!/bin/bash

if [ -z "$1" ]; then
  echo "Verwendung: $0 <Titel>"
  exit 1
fi

TITEL="$1"
QUELLE="/home/oliver/lilypond-scores/templates/template-jazz-standard.ly"
ZIEL="/home/oliver/lilypond-scores/jazz-standards/${TITEL}.ly"

cp "$QUELLE" "$ZIEL" && echo "Erstellt: $ZIEL"
