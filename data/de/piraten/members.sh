#!/bin/sh

# Fetch number from the Wiki.
set_members "$(http 'http://wiki.piratenpartei.de/index.php?title=Mitglieder&action=raw' | sed -rn -e "s/^\\| ''Gesamt'' \|\| ''([0-9]+)'' \|\| [0-9]+ \|\| [0-9]+ \|\| [^|]+$/\1/p")"
