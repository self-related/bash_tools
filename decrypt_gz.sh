#!/bin/env bash
file_name=$1
gpg -d $file_name | tar -xz
