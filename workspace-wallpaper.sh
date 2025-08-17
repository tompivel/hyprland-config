#!/usr/bin/env bash
set -euo pipefail

case "${1:-}" in
  1) swww img "$HOME/.config/wallpapers/w1.png"  ;;
  2) swww img "$HOME/.config/wallpapers/w2.png"  ;;
  3) swww img "$HOME/.config/wallpapers/w3.png"  ;;
  4) swww img "$HOME/.config/wallpapers/w4.png"  ;;
  5) swww img "$HOME/.config/wallpapers/w5.png"  ;;
  *) swww img "$HOME/.config/wallpapers/default.png" ;;
esac
