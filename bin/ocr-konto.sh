#!/usr/bin/env bash
# OCR alle PDFs im aktuellen Ordner (deutsch, force-ocr), räumt Dateinamen
# auf und verschiebt die Ergebnisse nach ./OCR/
#
# Umbenennung:
#   - "Anlage_zum_Kontoauszug" -> "Anlage"
#   - alles nach dem Datum (YYYY-MM-DD) wird abgeschnitten
#
# Beispiel:
#   Kontoauszug_100918739400EUR_2021-01-29_KK_...0300.pdf
#     -> Kontoauszug_100918739400EUR_2021-01-29.pdf

set -euo pipefail
shopt -s nullglob

OCR_DIR="OCR"
mkdir -p "$OCR_DIR"

pdfs=(*.pdf)
if [ ${#pdfs[@]} -eq 0 ]; then
    echo "Keine PDFs in $(pwd) gefunden."
    exit 0
fi

for f in "${pdfs[@]}"; do
    base="${f%.pdf}"
    base="${base/Anlage_zum_Kontoauszug/Anlage}"

    if [[ "$base" =~ ^(.+_[0-9]{4}-[0-9]{2}-[0-9]{2}) ]]; then
        newname="${BASH_REMATCH[1]}.pdf"
    else
        newname="$base.pdf"
    fi

    target="$OCR_DIR/$newname"

    if [ -e "$target" ]; then
        echo "Übersprungen (existiert bereits): $target"
        continue
    fi

    echo "OCR: $f -> $target"
    ocrmypdf --force-ocr -l deu -O 3 --output-type pdfa \
        --ghostscript-jpeg-maxdpi 200 "$f" "$target"
done

echo "Fertig. Ergebnisse liegen in $OCR_DIR/"
