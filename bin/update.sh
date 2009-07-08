#!/bin/sh

source ./crowslib.sh

scripts="$(find ../data -name '*.sh')"

echo "$scripts" | while read line; do
	dir="$(dirname "$line")"
	script="$(basename "$line")"
	cd "$dir"
	"./$script"
	cd - >/dev/null
done
