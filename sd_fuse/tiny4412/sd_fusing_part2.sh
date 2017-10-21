# Part2:You can use this script to fuse the bootload to SD  
# Reader Card
#
# Modify by harry at Sep 11,2017
####################################

if [ -z $1 ]
then
    echo "usage: ./sd_fusing.sh <SD Reader's device file>"
    exit 0
fi

####################################
# fusing images

bootload_position=1

#<Bootload fusing>
echo "---------------------------------------"
echo "Bootload fusing"
dd if=./bootload.bin of=$1 seek=$bootload_position

#<flush to disk>
sync

####################################
#<Message Display>
echo "---------------------------------------"
echo "U-boot image is fused successfully."
echo "Eject SD card and insert it again."

