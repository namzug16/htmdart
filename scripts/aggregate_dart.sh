#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

usage() {
  echo "Usage: $0 <source_directory> <output_file>"
  exit 1
}

# Check args
[[ $# -eq 2 ]] || usage
src_dir=$1
out_file=$2

# Truncate or create output file
: > "$out_file"

# Find and concatenate
while IFS= read -r -d '' file; do
  echo "// --- Begin: $file ---" >> "$out_file"
  cat "$file" >> "$out_file"
  echo -e "\n// --- End:   $file ---\n" >> "$out_file"
done < <(find "$src_dir" -type f -name '*.dart' -print0)

echo "Aggregated all .dart files from '$src_dir' into '$out_file'."
