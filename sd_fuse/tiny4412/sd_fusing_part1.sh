# Part1:You can use this script to make a bootload.bin
# 
# Modify by harry in Sep 11,2017

####################################
#<variable>

E4412_UBOOT=../../u-boot.bin
MKBL2=../mkbl2
E4412_BOOTLOAD=./bootload.bin

####################################
#<Clean the old bootload.bin>
rm -rf ${E4412_BOOTLOAD}


####################################
#<Make BL2 Binary>
echo "---------------------------------------"
echo "make bl2.bin binary."
if [ ! -f ${E4412_UBOOT} ]; then
	echo "Error: u-boot.bin NOT found, please build it & try again."
	exit -1
fi

if [ ! -f ${MKBL2} ]; then
	echo "make mkbl2 which use to make bl2.bin..."
	cd ../
	make
	cd -
else
	echo "mkbl2 have been maked."
fi

#<Make BL2>
${MKBL2} ${E4412_UBOOT} bl2.bin 14336

source ./bootload_make.sh

####################################
# send u-boot.bin and bl2.bin to client
if [ ! -f ${E4412_BOOTLOAD} ]; then
	echo "ERROR: bootload.bin NOT found,please build it."
	exit -1
else
	echo "send to uboot binary to client."
#	sz ${E4412_BOOTLOAD}
fi

###################################
#<Message Display>
echo "---------------------------------------"
echo "U-boot image is maked successfully."
echo "Please use sd_fusing_part2.sh to fuse it."

