#!/bin/sh
# Скрипт установки dotfiles
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"

link() {
    src="$1"; dst="$2"
    # Если исходной папки/файла нет, пропускаем
    if [ ! -e "$src" ]; then return; fi
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$BACKUP/"
    fi
    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "  [OK] $dst -> $src"
}

echo "==> Установка конфигов..."
link "$DOTFILES/sway/config"     "$HOME/.config/sway/config"
link "$DOTFILES/i3status/config" "$HOME/.config/i3status/config"
link "$DOTFILES/rofi"            "$HOME/.config/rofi"
link "$DOTFILES/kitty"           "$HOME/.config/kitty"
link "$DOTFILES/mako"            "$HOME/.config/mako"
link "$DOTFILES/scripts"         "$HOME/.config/sway/scripts"

echo "==> Копирование обоев..."
mkdir -p "$HOME/Pictures"
cp "$DOTFILES/etc/wallpaper.webp" "$HOME/Pictures/" 2>/dev/null || true

echo "==> Готово! Бэкап старых конфигов (если были): $BACKUP"
