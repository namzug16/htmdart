#!/bin/bash

# Usage: ./extract_tags.sh tags.dart

if [ $# -ne 1 ]; then
  echo "Usage: $0 <tags_file>"
  exit 1
fi

dart_file="$1"

gawk '
# Match lines like: final varName = Tag("original", ...);
match($0, /final\s+([a-zA-Z0-9_]+)\s*=\s*Tag\("([^"]+)"\s*,/, arr) {
   # arr[1]: variable name
   # arr[2]: original tag name from Tag("original", ...)
   var_name = arr[1]
   original = arr[2]

   # Print the mapping
   printf("\"%s\": \"%s\",\n", original, var_name)
}
' "$dart_file"
