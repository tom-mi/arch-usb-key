function colorscheme-matrix() {
  if [ "$TERM" = "linux" ]; then
    /bin/echo -e "
      \e]P0001100
      \e]P1007700
      \e]P214bb14
      \e]P3007700
      \e]P4009900
      \e]P514bb14
      \e]P6005500
      \e]P714bb14
      \e]P8007700
      \e]P9007700
      \e]PA00bb00
      \e]PB007700
      \e]PC009900
      \e]PD14bb14
      \e]PE005500
      \e]PF40ff40
      "
    # get rid of artifacts
    clear
  else
    echo "Unsupported terminal $TERM"
    exit 1
  fi
}

function colorscheme-default() {
  if [ "$TERM" = "linux" ]; then
    setterm --reset
    echo -en "\e]P7{{ console_foreground_color }}"
    clear
  else
    echo "Unsupported terminal $TERM"
    exit 1
  fi
}
