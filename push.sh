#!/bin/bash

set -e

cd /push

git add -A

git commit --allow-empty -m "none"

git push origin master