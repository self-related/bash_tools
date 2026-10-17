#!/usr/bin/env sh

if [ -z "$@" ]; then
  printf "No input files\n"
  exit
fi

printf "Enter passphrase:\n"
stty -echo
IFS= read PASSWD
stty echo

for arg in "$@"; do
  file_name="${arg%%/*}"
  archive_name="$file_name.tar.gz.gpg"
  printf "Creating $archive_name\n"
  tar -cz "$file_name" | gpg --batch --no-symkey-cache --passphrase="$PASSWD" -c --cipher-algo aes256 -o "$archive_name"
done
