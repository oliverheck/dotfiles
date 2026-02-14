#!/bin/bash
# LilyPond compilation wrapper
# Usage: ./compile.sh path/to/file.ly

if [ -z "$1" ]; then
  echo "Usage: $0 <lilypond-file>"
  exit 1
fi

INPUT_FILE="$1"
BASENAME=$(basename "$INPUT_FILE" .ly)
DIRNAME=$(dirname "$INPUT_FILE")

# Create output directories if they don't exist
mkdir -p "$DIRNAME/output"
mkdir -p "$DIRNAME/logs"

# Compile with output redirection
lilypond --output="$DIRNAME/output/$BASENAME" "$INPUT_FILE" 2>&1 | tee "$DIRNAME/logs/$BASENAME.log"

echo "Output written to: $DIRNAME/output/"
echo "Log written to: $DIRNAME/logs/$BASENAME.log"
