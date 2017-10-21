####################################
# make bootload.bin
#
# -----------------------------
#        BL1(16blocks)
# -----------------------------
#        BL2(32blocks)
# -----------------------------
#       UBOOT(656blocks)
# -----------------------------
#       TZSW(184blocks)
# -----------------------------

signed_bl1_position=0
bl2_position=16
uboot_position=48
tzsw_position=704

#<BL1 fusing>
echo "---------------------------------------"
echo "BL1 fusing"
dd iflag=dsync oflag=dsync if=./E4412_N.bl1.bin of=./bootload.bin seek=$signed_bl1_position

#<BL2 fusing>
echo "---------------------------------------"
echo "BL2 fusing"
dd iflag=dsync oflag=dsync if=./bl2.bin of=./bootload.bin seek=$bl2_position

#<u-boot fusing>
echo "---------------------------------------"
echo "u-boot fusing"
dd iflag=dsync oflag=dsync if=../../u-boot.bin of=./bootload.bin seek=$uboot_position

#<TrustZone S/W fusing>
echo "---------------------------------------"
echo "TrustZone S/W fusing"
dd iflag=dsync oflag=dsync if=./E4412_tzsw.bin of=./bootload.bin seek=$tzsw_position

#<flush to disk>
sync

####################################
