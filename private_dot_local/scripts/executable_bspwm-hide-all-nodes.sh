#!/bin/bash

# Hides all nodes in current desktop
if [ -n "$(bspc query -N -n .local.hidden)" ] ; then
    flag=off
else
    flag=on
fi &&

for i in $(bspc query -N -n .local) ; do
    bspc node $i -g hidden=$flag
done
