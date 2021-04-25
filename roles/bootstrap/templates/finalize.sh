#!/bin/bash

set -eu

confirm() {
    read -r -p "$1, okay? [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY]) true ;;
        *) echo "Skipped"; false ;;
    esac
}

echo "Finalizing ArchLinux installation"
echo "Press CTRL+C to cancel (at any time), ENTER continue."
read

if confirm "Setup localization"; then
  sed -i 's/#\({{ locale }}\)/\1/' /etc/locale.gen
  locale-gen
  echo -e "LANG={{ lang }}\n" > /etc/locale.conf
  echo -e "KEYMAP={{ keymap }}\nFONT=ter-v16n\n" > /etc/vconsole.conf
fi

if confirm "Setup Network configuration"; then
  read -p "Enter hostname " new_hostname
  echo "$new_hostname" > /etc/hostname
  cat > /etc/hosts <<EOT
127.0.0.1	localhost
::1		    localhost
127.0.1.1	$new_hostname
EOT
fi

if confirm "Create initramfs"; then
  mkinitcpio -P
fi

if confirm "Set root password"; then
  passwd
fi

if confirm "Install microcode updates"; then
  echo "Select your CPU architecture for microcode updates"
  select cpu_architecture in Intel AMD Other; do
    case $cpu_architecture in
      Intel)
        pacman --quiet -S intel-ucode
        break
        ;;
      Amd)
        pacman --quiet -S amd-ucode
        break
        ;;
      *)
        break
        ;;
    esac
  done
fi

if confirm "Install bootloader"; then
  bootctl install
fi

if confirm "Copy sample bootloader configuration"; then
  cp /usr/share/systemd/bootctl/arch.conf /boot/loader/entries/arch.conf
  echo "Adapt the configuration under /boot/loader/entries/arch.conf to your needs."
fi

echo "Installation finished. After adapting the bootloader config, exit the chroot environment, unmount all partitions & reboot."
