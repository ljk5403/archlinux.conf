#!/usr/bin/env bash
exec 1>>update.log 2>&1
set -x

echo ------------------------------------------------------
git add --all #gaa
git status
git commit -m "$(date '+%Y-%m-%d %H:%M:%S') @$(hostname)" #gcmsg
export http_proxy=http://127.0.0.1:8889;
git push
