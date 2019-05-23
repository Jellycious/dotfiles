#!/bin/bash

# This script automatically commits all tracked changes and proceeds to push them to git.
timestamp=$(date)
message="SYNCING ON: $timestamp"
echo $message >> sync.log

gitstatus=$(git status)
echo $status >> sync.log
echo -e "\n" >> sync.log

git add * 1> /dev/null
git commit -m "sync: $timestamp" 1> /dev/null
git push 1> /dev/null
