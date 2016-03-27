#!/bin/bash
loop() {
LEND=$(date +"%s")
LBUILDTIME=$(($LEND - $START))
echo -ne "\r\033[K"
echo -ne "${bldgrn}Sync Time: $(($LBUILDTIME / 60)) minutes and $(($LBUILDTIME % 60)) seconds.${txtrst}"
if ! [ -f arch/$ARCH/boot/zImage ]; then
	sleep 1
	loop
fi
}
START=$(date +"%s")
repo sync -q -j${NR_CPUS} &>/dev/null | loop
rm -rf .repo
