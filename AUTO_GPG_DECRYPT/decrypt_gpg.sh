#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

indir="/home/dqe/lechos_parisien/in"
outdir="/home/dqe/lechos_parisien/out"

mkdir -p "$outdir"

shopt -s nullglob

for file in "$indir"/*; do
  [ -f "$file" ] || continue

  filename=$(basename "$file")
  outfile="$outdir/${filename}.decrypt.txt"

  if gpg --batch --quiet --decrypt --output "$outfile" "$file"; then
    echo "✅ Déchiffré : $filename → $outfile"
  else
    echo "❌ Échec : $filename" >&2
  fi
done
