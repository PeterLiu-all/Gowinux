#!/bin/bash

make clean
git add .
if [[ -n $* ]]; then
    git commit -m "$*"
else
    git commit -m "`date`"
fi