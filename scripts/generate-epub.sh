#!/usr/bin/env bash
# Generate EPUB files for each story from its chapter markdown files.
# Requires: pandoc
# Usage: ./scripts/generate-epub.sh
# Output: static/epub/<story-name>.epub

set -euo pipefail

CONTENT_DIR="content/stories"
OUTPUT_DIR="static/epub"
EPUB_CSS="assets/css/epub.css"

mkdir -p "$OUTPUT_DIR"

for story_dir in "$CONTENT_DIR"/*/; do
  [ -d "$story_dir" ] || continue

  story_name=$(basename "$story_dir")
  index_file="$story_dir/_index.md"

  # Extract title from _index.md front matter
  if [ -f "$index_file" ]; then
    title=$(sed -n 's/^title: *"\(.*\)"/\1/p' "$index_file")
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

  # Build pandoc args
  pandoc_args=(
    --metadata "title=$title"
    --metadata "lang=fr"
    --toc
    --toc-depth=2
    -o "$output_file"
  )

  # Add CSS if it exists
  if [ -f "$EPUB_CSS" ]; then
    pandoc_args+=(--css "$EPUB_CSS")
  fi

  # Strip Hugo shortcodes from markdown before passing to pandoc
  # Create temp files with shortcodes removed
  temp_files=()
  for f in "${sorted_files[@]}"; do
    temp=$(mktemp --suffix=.md)
    # Remove YAML front matter (between --- delimiters) and Hugo shortcodes
    sed '/^---$/,/^---$/d' "$f" | sed 's/{{<[^>]*>}}//g' | sed 's/{{%[^%]*%}}//g' > "$temp"
    temp_files+=("$temp")
  done

  pandoc "${pandoc_args[@]}" "${temp_files[@]}"

  # Cleanup temp files
  rm -f "${temp_files[@]}"

  echo "  Done: $output_file"
done

echo "EPUB generation complete."
