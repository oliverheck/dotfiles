#!/usr/bin/env bash
# ranger scope.sh - Bildvorschau via Kitty Graphics Protocol (chafa) und PDF-Support
#
# Ranger übergibt folgende Argumente:
#   $1  FILE_PATH       Pfad zur Datei
#   $2  PV_WIDTH        Breite des Vorschaufensters (Zeichen)
#   $3  PV_HEIGHT       Höhe des Vorschaufensters (Zeichen)
#   $4  PV_IMAGE_ENABLED  1 wenn Bildvorschau aktiv (uebermittel von ranger)
#
# Exit-Codes:
#   0   Vorschau erfolgreich ausgegeben
#   1   Kein Vorschau-Handler gefunden
#   2   Vorschau gecacht (Ranger übernimmt Anzeige)

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

FILE_PATH="${1}"
PV_WIDTH="${2:-80}"
PV_HEIGHT="${3:-40}"
PV_IMAGE_ENABLED="${4:-0}"

MIMETYPE="$( file --brief --mime-type -- "${FILE_PATH}" )"

# Hilfsfunktion: Bildvorschau via chafa mit Kitty-Protokoll
# Fallback auf Sixels, dann auf ASCII wenn nötig
preview_image() {
    local img_path="${1}"
    if command -v chafa &>/dev/null; then
        # Kitty Graphics Protocol ist in Ghostty die beste Option
        # --size begrenzt auf die tatsächliche Fenstergröße
        chafa \
            --format kitty \
            --size "${PV_WIDTH}x${PV_HEIGHT}" \
            --animate off \
            -- "${img_path}"
        return $?
    fi
    # Kein chafa vorhanden: textuelles Fallback
    file --brief -- "${img_path}"
    return 1
}

case "${MIMETYPE}" in

    # Bilder: direkt via chafa rendern
    image/*)
        preview_image "${FILE_PATH}"
        exit $?
        ;;

    # PDF: erste Seite als Bild rendern, dann via chafa anzeigen
    application/pdf)
        if command -v pdftoppm &>/dev/null; then
            # mktemp verhindert Race Conditions bei parallelen ranger-Instanzen
            TMPFILE="$(mktemp /tmp/ranger_pdf_XXXXXX)"
            # pdftoppm hängt die Seitennummer an den Dateinamen, daher ohne .png
            if pdftoppm -png -singlefile -r 150 -f 1 "${FILE_PATH}" "${TMPFILE}" 2>/dev/null; then
                preview_image "${TMPFILE}.png"
                EXIT_CODE=$?
            else
                EXIT_CODE=1
            fi
            rm -f "${TMPFILE}" "${TMPFILE}.png"
            exit ${EXIT_CODE}
        fi
        # Fallback: PDF-Metadaten als Text
        if command -v pdfinfo &>/dev/null; then
            pdfinfo -- "${FILE_PATH}"
            exit 0
        fi
        exit 1
        ;;

    # Textdateien: Syntax-Highlighting via bat
    text/*|application/x-shellscript|application/x-sh|application/javascript|application/json)
        if command -v bat &>/dev/null; then
            bat \
                --color=always \
                --style=numbers,changes \
                --line-range=":${PV_HEIGHT}" \
                --terminal-width="${PV_WIDTH}" \
                -- "${FILE_PATH}"
        else
            head -n "${PV_HEIGHT}" -- "${FILE_PATH}"
        fi
        exit 0
        ;;

    # Archive: Inhaltsverzeichnis ausgeben
    # Die tatsächlichen MIME-Types die 'file' zurückgibt:
    application/gzip|application/x-bzip2|application/x-xz|\
    application/x-compressed-tar|application/x-bzip-compressed-tar|\
    application/x-xz-compressed-tar|application/x-zstd-compressed-tar)
        tar -tf -- "${FILE_PATH}" 2>/dev/null | head -n "${PV_HEIGHT}"
        exit 0
        ;;

    application/zip|application/x-zip-compressed)
        unzip -l -- "${FILE_PATH}" 2>/dev/null | head -n "${PV_HEIGHT}"
        exit 0
        ;;

    application/x-7z-compressed)
        7z l -- "${FILE_PATH}" 2>/dev/null | head -n "${PV_HEIGHT}"
        exit 0
        ;;

    application/x-rar|application/vnd.rar)
        unrar l -- "${FILE_PATH}" 2>/dev/null | head -n "${PV_HEIGHT}"
        exit 0
        ;;

    # Fallback: generische Dateiinformationen
    *)
        file --brief -- "${FILE_PATH}"
        exit 1
        ;;
esac
