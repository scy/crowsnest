#!/bin/sh

alias retexit=exit

http() {
	if which curl >/dev/null 2>&1; then
		curl -s "$@" 2>/dev/null
	elif which wget >/dev/null 2>&1; then
		wget -q -O - "$@" 2>/dev/null
	else
		retexit 99
	fi
}

set_members() {
	[ "$(echo "$*" | wc -l)" != '1' ] && retexit 99
	[ "$(echo "$*" | tr -cd 0-9)" != "$*" ] && retexit 99
	sed -ri -e "s/^Members\\t[0-9]+\$/Members\\t$1/" summary.txt || retexit 99
}

export -f http set_members
