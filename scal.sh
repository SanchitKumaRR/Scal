#!/usr/bin/env bash
# scal.sh — Bash with colors

clear
echo PRESS CTRL+C TO Exit booting session starting after 3s
sleep 3
cmatrix
clear
# Colors
CYAN='\e[36m'
BLUE='\e[34m'
GREEN='\e[32m'
RESET='\e[0m'
# Banner (Cyan)
echo -e "${CYAN}"
cat <<'__SCAL__'
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#######                      @@              @@
##                           @@ 1.0 Release  @@
##                           @@            :)@@
##                           @@@@@@@@@@@@@@@@@@
#######            ##                        @@
     ## ######    ####    ##                 @@
     ## ##       ##  ##   ##                 @@
     ## ##      ##$$$$##  ##                 @@
####### ###### ##      ## ######             @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    #       ####                   #    #    @@
 ###$#      #                      #         @@
 ###$@#     ####   ##   ##  # #### #### # ###@@
 ###$#         #  #$$#  # # # #    #  # #  # @@
    #       #### #    # #  ## #### #  # #  # @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#1.0 Release
__SCAL__
echo -e "${RESET}"

# integer-check function
is_int() {
  [[ $1 =~ ^[+-]?[0-9]+$ ]]
}

# Instructions (Dark Blue)
echo -e "${BLUE}Enter two integer values and choose an operation (+ - × ÷).${RESET}"

# Inputs (Green)
echo -ne "${GREEN}Enter Val1→ ${RESET}"; read -r val1
echo -ne "${GREEN}Enter Val2→ ${RESET}"; read -r val2
echo -ne "${GREEN}Enter operation→ ${RESET}"; read -r opt

# Validate integers
if ! is_int "$val1" || ! is_int "$val2"; then
  echo "ERROR: Please enter integers."
  exit 1
fi

case "$opt" in
  "+") ans=$(( val1 + val2 )) ;;
  "-") ans=$(( val1 - val2 )) ;;
  "×"|"x"|"X"|"*") ans=$(( val1 * val2 )) ;;
  "÷"|"/")
    if [ "$val2" -eq 0 ]; then
      echo "ERROR: Division by zero!"
      exit 1
    fi
    ans=$(echo "scale=10; $val1 / $val2" | bc -l)
    ;;
  *)
    echo "ERROR: Unsupported operation."
    exit 1
    ;;
esac

echo -e "${CYAN}Answer: $ans${RESET}"
echo -e "\e[31mAuto Closing Scal in 3s...\e[0m"
sleep 3
clear
