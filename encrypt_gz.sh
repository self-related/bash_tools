#!/bin/env bash
printf "Enter passphrase:\n"
read -s PASSWD

file_name=${1%%/*}
tar -cz $file_name | gpg --batch --passphrase=$PASSWD -c --cipher-algo aes256 -o $file_name.tar.gz.gpg
