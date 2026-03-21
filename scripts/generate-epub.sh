#!/usr/bin/env bash
# Generate EPUB files for each story from its chapter markdown files.
# Requires: pandoc
# Usage: ./scripts/generate-epub.sh
# Output: book/epub/<story-name>.epub

set -euo pipefail

SRC_DIR="src"
OUTPUT_DIR="book/epub"

mkdir -p "$OUTPUT_DIR"

for story_dir in "$SRC_DIR"/*/; do
  [ -d "$story_dir" ] || continue

  story_name=$(basename "$story_dir")

  # Extract title from index.md (first H1 heading)
  index_file="$story_dir/index.md"
  if [ -f "$index_file" ]; then
    title=$(sed -n 's/^# *//p' "$index_file" | head -1)
  else
    title="$story_name"
  fi

  # Collect chapter files sorted by name (chapters are named chapitre-NN.md)
  chapter_files=()
  for f in "$story_dir"/chapitre-*.md; do
    [ -f "$f" ] || continue
    chapter_files+=("$f")
  done

  if [ ${#chapter_files[@]} -eq 0 ]; then
    echo "  Skipping '$story_name': no chapters found"
    continue
  fi

  # Sort chapter files
  IFS=$'\n' sorted_files=($(sort <<<"${chapter_files[*]}")); unset IFS

  output_file="$OUTPUT_DIR/$story_name.epub"
  echo "Generating: $output_file ($title, ${#sorted_files[@]} chapters)"

  pandoc \
    --metadata "title=$title" \
    --metadata "lang=fr" \
    --toc \
    --toc-depth=2 \
    -o "$output_file" \
    "${sorted_files[@]}"

  echo "  Done: $output_file"

  # Generate Kobo-optimized version (.kepub.epub) with kepubify
  if command -v kepubify &>/dev/null; then
    kobo_file="$OUTPUT_DIR/$story_name.kepub.epub"
    kepubify -o "$kobo_file" "$output_file"
    echo "  Done: $kobo_file (Kobo)"
  else
    echo "  Skipping Kobo version: kepubify not found"
  fi
done

echo "EPUB generation complete."
