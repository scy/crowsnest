#!/bin/sh

# Get weizenspreu’s PDF-parsed data.
alias retexit=return
http http://github.com/weizenspreu/crowsnest/raw/master/data/de/spd/lvs.txt > lvs.txt.new
r="$?"
alias retexit=exit

# Don’t update on error or apparent misbehavior.
if [ "$r" -ne 0 -o "$(wc -l lvs.txt.new)" -gt 30 ]; then
	rm lvs.txt.new
	exit "$r"
fi

# Convert from CP1252 (used by weizenspreu) to UTF-8.
recode -q cp1252/..utf-8 lvs.txt.new

# Don’t update on error.
if [ "$?" -ne 0 ]; then
	rm lvs.txt.new
	exit "$?"
fi

# Update our file.
mv lvs.txt.new lvs.txt

# Sum up and write.
set_members "$(expr 0 $(tr -cd '0-9\t' < lvs.txt | sed 's/\t/ + /g'))"
