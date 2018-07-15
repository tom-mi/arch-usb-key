# arch-usb-key

Remaster the ArchLinux USB image a little bit to be more convenient for me (... probably only for me).

Currently, that is:
- configure console
    - change the keyboard layout
    - change the console font
- change the locale
- copy some dotfiles
- use liquidprompt
- change the login shell to bash
- install additional packages
- install a [script to configure wifi by scanning a QR-code with the webcam](https://github.com/tom-mi/arch-qr-wifi)
- add a static MOTD

Feel free to copy this code and adapt it to your needs.

## Howto

Install prerequisites

    pacman -S ansible arch-install-scripts libisoburn p7zip

Download & remaster iso (uses `sudo`)

    ./download-and-remaster-iso

Flash USB key (as root)

    ./copy-iso-to-device /dev/sdX

## Resources

- https://wiki.archlinux.org/index.php/Category:Getting_and_installing_Arch
- https://wiki.archlinux.org/index.php/Remastering_the_Install_ISO

## License

[The Unlicense](http://unlicense.org/)
