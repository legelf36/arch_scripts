#!/usr/bin/env bash

set -o errexit  #>Exit when a command fails (returns non-zero)
set -o pipefail #>Exit when a command within a pipeline fail (returns non-zero)
set -o nounset  #>Forbid to use unset

# Reset language to default
export LANG=C

# Switch to root account
asSudo=("sudo" "--login" "--user=root")

# Colors for messages
HL='\e[1;37;1;45m'
ED='\e[0m'

# Script starts here:
echo -e "${HL}[INFO] Removing lock files of pamac and pacman ${ED}"
"${asSudo[@]}" rm --force --verbose "/var/tmp/pamac/dbs/db.lck"
"${asSudo[@]}" rm --force --verbose "/var/lib/pacman/db.lck"

echo -e "${HL}[INFO] Switching to global mirror (Manjaro's CDN) ${ED}"
"${asSudo[@]}" pacman-mirrors --country Global
"${asSudo[@]}" pacman-mirrors --fasttrack 5

echo -e "${HL}[INFO] Remove pacman's gnupg ${ED}"
"${asSudo[@]}" rm --recursive --force --verbose "/etc/pacman.d/gnupg/*"

echo -e "${HL}[INFO] Re-initilize pacman's gnupg ${ED}"
"${asSudo[@]}" pacman-key --init

echo -e "${HL}[INFO] Removing package cache ${ED}"
"${asSudo[@]}" pacman --sync --clean --clean --noconfirm

TMPDIR="$(mktemp -d)"
echo -e "${HL}[INFO] Downloading the newest packages which contains the gpg keys in ${TMPDIR} ${ED}"
"${asSudo[@]}" cp "/etc/pacman.conf" "${TMPDIR}/pacman.conf"
"${asSudo[@]}" sed --in-place --regexp-extended 's/^(SigLevel).+$/\1 = Never/g' "${TMPDIR}/pacman.conf"
"${asSudo[@]}" pacman --sync --refresh --downloadonly --noconfirm --cachedir "${TMPDIR}" --config "${TMPDIR}/pacman.conf" archlinux-keyring manjaro-keyring

echo -e "${HL}[INFO] Installing Keyring Packages ${ED}"
"${asSudo[@]}" pacman --upgrade --noconfirm --config "${TMPDIR}/pacman.conf" "${TMPDIR}"/*.tar.*

echo -e "${HL}[INFO] Removing temporary directory: ${TMPDIR}${ED}"
"${asSudo[@]}" rm --recursive --force --verbose "${TMPDIR}"

echo -e "${HL}[INFO] Switching to a local mirror by GeoIP ${ED}"
"${asSudo[@]}" pacman-mirrors --geoip
"${asSudo[@]}" pacman-mirrors --fasttrack 5

echo -e "${HL}[INFO] Performing a full upgrade with pacman ${ED}"
read -p "Do you want to continue? [Yy/Nn] (Be aware that a full upgrade needs enough ram on a live session)" yn
case $yn in
   [Yy]*) echo "Continue..." ;;
   [Nn]*) exit ;;
   *) echo "No valid answer. Exit."; exit ;;
esac

"${asSudo[@]}" pacman --sync --refresh --refresh --sysupgrade --sysupgrade --noconfirm

echo -e "${HL}[INFO] Done. Note that you need to refresh the database for pamac also.${ED}"
