#!/bin/bash

# This script automatically commits all tracked changes and proceeds to push them to git.
timestamp=$(date)
message="SYNCING ON: $timestamp"
echo $message >> sync.log
status=$(git status)
echo $status >> sync.log
git add *
git commit -m "daily commit $timestamp"
git push 
