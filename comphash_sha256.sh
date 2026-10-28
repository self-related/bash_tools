#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Check sha256 hash for current directory files recursively!! # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if [ -f sha256sum.txt ]; then
  rm sha256sum.txt
fi

hashes=()

function comp_hash() {
  local file="$1"
  hash=`sha256sum "$file"`

  if [ -z "$hash" ]; then
    return # skip if error
  else
    hashes+=("$hash")
  fi

}

function check_dir() {
  local current_path="$1"

  for file in "$current_path/"*; do
    if [ -d "$file" ]; then
      check_dir "$file"
    elif [ -f "$file" ]; then
      comp_hash "$file"
    fi
  done
}

for file in *; do
  if [ -d "$file" ]; then
    check_dir "$file"
  elif [ -f "$file" ]; then
    comp_hash "$file"
  fi
done

for hash in "${hashes[@]}"; do
  printf "$hash\n" >> sha256sum.txt
done

printf "sha256sum.txt is ready\n"
