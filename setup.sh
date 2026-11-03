#!/bin/bash

# Цвета для вывода
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}==> Обновление системы и базовых утилит...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git btop nano vim vim-nox unzip

echo -e "${BLUE}==> Добавление архитектуры i386 (для Steam)...${NC}"
sudo dpkg --add-architecture i386
sudo apt update

echo -e "${BLUE}==> Включение non-free репозиториев...${NC}"
sudo sed -i 's/main$/main contrib non-free non-free-firmware/g' /etc/apt/sources.list
sudo apt update

echo -e "${BLUE}==> Установка Sway и графического окружения...${NC}"
sudo apt install -y sway swayidle swaylock swaybg swayimg kitty foot rofi i3status grim slurp wl-clipboard xwayland

echo -e "${BLUE}==> Установка сети и Bluetooth...${NC}"
sudo apt install -y network-manager bluez blueman

echo -e "${BLUE}==> Установка звука, яркости и уведомлений...${NC}"
sudo apt install -y pipewire-audio wireplumber brightnessctl playerctl mako-notifier polkit-gnome sof-firmware

echo -e "${BLUE}==> Установка шрифтов и иконок...${NC}"
sudo apt install -y fonts-noto fonts-font-awesome fonts-noto-color-emoji papirus-icon-theme

echo -e "${BLUE}==> Установка файлового менеджера и утилит...${NC}"
sudo apt install -y dolphin ark gvfs gvfs-backends xdg-user-dirs tlp
xdg-user-dirs-update

echo -e "${BLUE}==> Установка медиа и браузера...${NC}"
sudo apt install -y firefox-esr vlc

echo -e "${BLUE}==> Установка Discord...${NC}"
wget -O /tmp/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install -y /tmp/discord.deb
rm /tmp/discord.deb

echo -e "${BLUE}==> Установка Steam и игровых утилит...${NC}"
sudo apt install -y steam gamemode mangohud mesa-vulkan-drivers mesa-vulkan-drivers:i386

echo -e "${BLUE}==> Настройка TLP (энергосбережение)...${NC}"
sudo systemctl enable --now tlp

echo -e "${GREEN}==> Все пакеты установлены!${NC}"

