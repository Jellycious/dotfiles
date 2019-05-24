#!/bin/bash

# This script automatically commits all tracked changes and proceeds to push them to git.
timestamp=$(date)
message="SYNCING ON: $timestamp"
echo $message >> sync.log

gitstatus=$(git status)
echo $gitstatus >> sync.log
echo -e "\n" >> sync.log

git add * 
git commit -m "sync: $timestamp" 
git push
