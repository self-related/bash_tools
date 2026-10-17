#!/usr/bin/env sh

printf "Enter passphrase:\n"
stty -echo
IFS= read PASSWD
stty echo

file_name="$1"
printf "\nExtracting $file_name\n"
gpg --batch --no-symkey-cache --passphrase="$PASSWD" -d "$file_name" | tar -xz
