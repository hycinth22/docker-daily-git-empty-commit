#!/bin/bash

set -e

cd /app/repo

git add -A

git commit --allow-empty -m "nothing"

git push origin master
