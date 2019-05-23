#!/bin/bash

# This script automatically commits all tracked changes and proceeds to push them to git.
timestamp=$(date)
message="SYNCING ON: $timestamp"
echo $message >> sync.log

status=$(git status)
echo $status >> sync.log
echo -e "\n"

git add * > /dev/null
git commit -m "sync: $timestamp" > /dev/null
git push > /dev/null
