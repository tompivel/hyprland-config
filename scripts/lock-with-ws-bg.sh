#!/usr/bin/env bash
set -euo pipefail

WALLDIR="$HOME/.config/wallpapers"
CACHE="$HOME/.cache/hyprlock-current.png"

# Get current (focused) workspace
ws=$(hyprctl -j activeworkspace 2>/dev/null | jq -r '.name // .id' || true)

# Fallback via focused monitor if needed
if [ -z "${ws:-}" ] || [ "$ws" = "null" ]; then
  ws=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true).activeWorkspace.name // .activeWorkspace.id' | head -n1 || echo "")
fi

# Extract leading digits (handles named workspaces like "1", "2", but ignores specials)
wsnum=$(printf '%s' "$ws" | grep -oE '^[0-9]+' || true)

# Build image path (w1.png … w4.png)
img="$WALLDIR/w${wsnum}.png"

# Robust fallbacks: if on a special workspace (negative id) or file missing, keep last image or default to w1
if [ -z "${wsnum:-}" ] || [ ! -f "$img" ]; then
  if [ -f "$CACHE" ]; then
    img="$CACHE"
  else
    img="$WALLDIR/w1.png"
  fi
fi

mkdir -p "$(dirname "$CACHE")"
ln -sf "$img" "$CACHE"

exec hyprlock

