# arch-usb-key

Remaster the ArchLinux USB image a little bit to be more convenient for me (... probably only for me).

Currently, that is:
- change the keyboard layout
- copy some dotfiles

Feel free to copy this code and adapt it to your needs.

## Howto

Install prerequisites

    pacman -S ansible libisoburn p7zip
    
Download & remaster iso

    ./download-and-remaster-iso
    
Flash USB key (as root)

    ./copy-iso-to-device /dev/sdX

## Resources

- https://wiki.archlinux.org/index.php/Category:Getting_and_installing_Arch
- https://wiki.archlinux.org/index.php/Remastering_the_Install_ISO