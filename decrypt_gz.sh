#!/usr/bin/env sh

printf "Enter passphrase:\n"
stty -echo
read PASSWD
stty echo

file_name="$1"
gpg --batch --no-symkey-cache --passphrase="$PASSWD" -d "$file_name" | tar -xz
