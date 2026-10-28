#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Check sha256 hash for current directory files recursively!! # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if [ -f sha256sum.txt ]; then
  rm sha256sum.txt
fi

hashes=""

function comp_hash() {
  name="$1"
  hash=`sha256sum "$name"`

  if [ -z "$hash" ]; then
    return # skip if error
  fi

  hashes="$hashes$hash\n"
}


# check inner directories recursively
for name in **/*; do 
  comp_hash "$name"
done

# check current directory files only
for name in *; do
  comp_hash "$name"
done

printf "$hashes" > sha256sum.txt
printf "
--------------------------------------------------------------------------------
$hashes
------------------------------------------------------------------------------

sha256sum.txt is ready
"
