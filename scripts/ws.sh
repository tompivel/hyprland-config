#!/usr/bin/env bash
set -euo pipefail

ws="${1:?workspace # required}"

# Switch first, then set wallpaper
hyprctl dispatch workspace "$ws"
"$HOME/.config/hypr/scripts/workspace-wallpaper.sh" "$ws"
