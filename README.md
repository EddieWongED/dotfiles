# dotfiles

Stores the dotfiles and configs of my arch linux setup.

# Setup

-   Arch
-   Hyprland

# Dependencies

## Linux

```bash
pacman -S base base-devel linux linux-firmware linux-headers
```

## Bootloader

```bash
pacman -S efibootmgr grub os-prober
```

## Hardware Specific

```bash
pacman -S intel-ucode lib32-nvidia-utils libva-nvidia-driver nvidia nvidia-settings nvidia-utils
```

## Basic

```bash
pacman -S brightnessctl git less mesa-utils nano nano-syntax-highlighting openssh sudo tree vim wget zsh bc
```

## Audio

```bash
pacman -S helvum pavucontrol pipewire pipewire-alsa pipewire-pulse wireplumber
```

## Network

```bash
pacman -S iwd networkmanager
```

## Compositor / Wayland / Hyprland

```bash
pacman -S hyprland qt5-wayland rofi-wayland waybar wl-clip-persist xdg-desktop-portal-hyprland hyprpaper hypridle hyprlock copyq swaync polkit-kde-agent
paru -S wlogout hyprshot
```

## Browser

```bash
pacman -S chromium firefox
```

## File Explorer

```bash
pacman -S dolphin
```

## Bluetooth

```bash
pacman -S blueman bluez bluez-utils
```

## Fonts

```bash
pacman -S ttf-fira-code ttf-firacode-nerd ttf-font-awesome ttf-nerd-fonts-symbols inter-font noto-fonts noto-fonts-cjk noto-fonts-emoji
paru -S noto-fonts-sc noto-fonts-tc
```

## IDE

```bash
paru -S visual-studio-code-bin
```

## Programming Language

```bash
pacman -S python-pip
```

## Input Method

```bash
sudo pacman -S fcitx5-chinese-addons libime fcitx5 fcitx5-table-extra fcitx5-config-qt fcitx5-gtk gtk2 gtk3 gtk4
```

## Miscellaneous

```bash
pacman -S stow htop fastfetch spotify-launcher
paru -S discord_arch_electron
```

# Syncing dotfiles

```bash
cd ~
git clone git@github.com:EddieWongED/dotfiles.git
cd dotfiles
stow .
```

# Setting up Input Methods

Append the following into `/etc/security/pam_env.conf`

```bash
# Input Method
GLFW_IM_MODULE          DEFAULT=fcitx
INPUT_METHOD            DEFAULT=fcitx
XMODIFIERS              DEFAULT=@im=fcitx
IMSETTINGS_MODULE       DEFAULT=fcitx
QT_IM_MODULE            DEFAULT=fcitx
SDL_IM_MODULE           DEFAULT=fcitx
```
