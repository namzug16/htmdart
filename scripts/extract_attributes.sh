#!/bin/bash

# Usage: ./extract_attributes.sh attributes.dart

if [ $# -ne 1 ]; then
  echo "Usage: $0 <attributes_file>"
  exit 1
fi

dart_file="$1"

gawk '
# Match lines like: final varName = Attribute("original")...;
match($0, /final\s+([a-zA-Z0-9_]+)\s*=\s*Attribute\("([^"]+)"\)(\("([^"]+)"\))?;/, arr) {
   # arr[1]: variable name
   # arr[2]: original attribute name from first Attribute(...)
   # arr[4]: optional second argument inside subsequent ("..."), if present
   var_name = arr[1]
   original = arr[2]
   extra = arr[4]

   # Check if the extra value equals the original name
   if(extra == original) {
     # If so, map value becomes "variableName.void"
     printf("\"%s\": \"%s.void\",\n", original, var_name)
   } else {
     # Otherwise use the variable name as is
     printf("\"%s\": \"%s\",\n", original, var_name)
   }
}
' "$dart_file"
