#!/bin/sh

#commit all changes to github

echo ">>>> git add *"
git add *

echo ">>>> git commit -m adding all changes"
git commit -m "adding all changes"

echo ">>>> git push -u origin main"
git push -u origin main
