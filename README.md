# dotfiles

Stores the dotfiles and configs of my arch linux setup.

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
pacman -S brightnessctl git less mesa-utils nano nano-syntax-highlighting openssh sudo tree vim wget zsh
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
pacman -S hyprland qt5-wayland rofi waybar wl-clip-persist xdg-desktop-portal-hyprland hyprpaper hypridle hyprlock copyq swaync polkit-kde-agent
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

## Miscellaneous

```bash
pacman -S stow htop fastfetch
paru -S spotify
```

# Syncing dotfiles

```bash
cd ~
git clone git@github.com:EddieWongED/dotfiles.git
cd dotfiles
stow .
```
