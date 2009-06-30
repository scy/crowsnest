#!/bin/sh

set_members "$(expr 0 $(tr -cd '0-9\t' < lvs.txt | sed 's/\t/ + /g'))"
