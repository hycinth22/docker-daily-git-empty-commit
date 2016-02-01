#!/bin/bash

set -e

cd /push

git add -A

git commit --allow-empty -m "nothing"

git push origin master
