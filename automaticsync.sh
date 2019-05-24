#!/bin/bash

# This script automatically commits all tracked changes and proceeds to push them to git.
timestamp=$(date)
message="SYNCING ON: $timestamp"
echo $message >> sync.log

gitstatus=$(git status)
echo $gitstatus >> sync.log
echo -e "\n" >> sync.log

git add --all &> /dev/null
git commit -m "sync: $timestamp" &> /dev/null 
git push &> /dev/null
