#!/bin/env bash
file_name=${1%%/*}
tar -cz $file_name | gpg -c --cipher-algo aes256 -o $file_name.tar.gz.gpg
