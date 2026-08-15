#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"

ase="${ASEPRITE:-aseprite}"
names=(open blink1 blink2 hop1 hop2)
for i in "${!names[@]}"; do
  "$ase" -b familiar/art/owl.aseprite --frame-range "$i,$i" --scale 2 \
    --save-as "familiar/sprites/owl-${names[$i]}-dark.png"
  "$ase" -b familiar/art/owl.aseprite --palette familiar/art/owl-light.gpl \
    --frame-range "$i,$i" --scale 2 \
    --save-as "familiar/sprites/owl-${names[$i]}-light.png"
done
