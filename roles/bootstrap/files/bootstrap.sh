#!/bin/bash

set -eu

DEST=/mnt

if ! grep -qs "$DEST " /proc/mounts; then
  echo "$DEST is not mounted!"
  echo "Please mount your new root partition to $DEST and try again."
  exit 1
fi

if ! grep -qs "$DEST/boot " /proc/mounts; then
  echo "$DEST/boot is not mounted!";
  echo "Please mount your new boot partition to $DEST/boot and try again."
  exit 1;
fi

confirm() {
    read -r -p "$1, okay? [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY]) true ;;
        *) echo "Skipped"; false ;;
    esac
}

echo "Bootstrapping ArchLinux to $DEST"
echo "Press CTRL+C to cancel (at any time), ENTER continue."
read

if confirm "Install essential packages"; then
  pacstrap "$DEST" base linux linux-firmware
fi

if confirm "Generate fstab"; then
  genfstab -U "$DEST" >> "$DEST/etc/fstab"
fi

if confirm "Copy finalize.sh script"; then
  cp /usr/local/share/finalize-installation "$DEST/root/finalize-installation"
  chmod u+x "$DEST/root/finalize-installation"
fi

cat - <<EOT

Bootstrapping finished!

To finalize the installation, chroot into your new system with

  arch-chroot /mnt

then run

  cd /root
  ./finalize-installation
EOT
