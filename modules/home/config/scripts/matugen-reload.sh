#!/usr/bin/env bash
set -euo pipefail

default_wallpaper="@defaultWallpaper@"
wallpaper=""

awww_json=$(awww query -j 2>/dev/null) || true
if [ -n "$awww_json" ]; then
  wallpaper=$(echo "$awww_json" | jq -r '.[""][0].displaying.image // empty' 2>/dev/null) || true
fi

if [ -z "$wallpaper" ] || [ "$wallpaper" = "null" ]; then
  wallpaper="$default_wallpaper"
fi

if [ ! -f "$wallpaper" ]; then
  echo "Wallpaper not found: $wallpaper"
  exit 1
fi

tmpimg=$(mktemp /tmp/matugen-wallpaper.XXXXXX.png)
trap 'rm -f "$tmpimg"' EXIT

magick "$wallpaper" "$tmpimg" 2>/dev/null
matugen image "$tmpimg" --mode dark --source-color-index 0 --config "$HOME/.config/matugen/config.toml"
