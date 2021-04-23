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

    pacman -S ansible archiso

Download & remaster iso (enter password for `sudo` or `su` when asked for `BECOME password`)

    ./build-iso

Flash USB key (as root)

    ./copy-iso-to-device out/archlinux-YYYY.MM.DD-x86_64.iso /dev/sdX

## Resources

- https://wiki.archlinux.org/index.php/Archiso

## License

[The Unlicense](http://unlicense.org/)
