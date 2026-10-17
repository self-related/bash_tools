#!/bin/env bash
args=$@
if [ -z $args ]; then
  printf "No input files\n"
  exit
fi

printf "Enter passphrase:\n"
read -s PASSWD

for arg in $args; do
  file_name=${arg%%/*}
  tar -cz $file_name | gpg --batch --passphrase=$PASSWD -c --cipher-algo aes256 -o $file_name.tar.gz.gpg
done
