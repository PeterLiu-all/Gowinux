#!/bin/bash

git add .
if [[ -n $* ]]; then
    git commit -m "$*"
else
    git commit -m "`date`"
fi