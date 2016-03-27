#!/bin/bash
sudo apt-get install parallel
loop() {
LEND=$(date +"%s")
LBUILDTIME=$(($LEND - $LSTART))
echo -ne "\r\033[K"
echo -ne "${bldgrn}Sync Time: $(($LBUILDTIME / 60)) minutes and $(($LBUILDTIME % 60)) seconds.${txtrst}"
if ! [ "$(($LBUILDTIME / 60))" == "10"  ]; then
	sleep 1
	loop
fi
}
LSTART=$(date +"%s")
( echo repo sync -q -j${NR_CPUS}; echo loop) | parallel
rm -rf .repo
