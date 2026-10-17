#!/bin/env bash
printf "Enter passphrase:\n"
read -s PASSWD

file_name=$1
gpg --batch --passphrase=$PASSWD -d $file_name | tar -xz
