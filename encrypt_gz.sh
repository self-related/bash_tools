#!/usr/bin/env sh
if [ -z "$@" ]; then
  printf "No input files\n"
  exit
fi

printf "Enter passphrase:\n"
read -s PASSWD

for arg in "$@"; do
  file_name="${arg%%/*}"
  tar -cz "$file_name" | gpg --batch --no-symkey-cache --passphrase="$PASSWD" -c --cipher-algo aes256 -o "$file_name.tar.gz.gpg"
done
