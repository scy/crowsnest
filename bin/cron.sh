#!/bin/sh

d="$(date --rfc-3339=seconds)"

cd "$(dirname "$0")"
cd ..
git pull
cd bin
./update.sh
git add .
git commit -m "Automatic update $d."
git push
