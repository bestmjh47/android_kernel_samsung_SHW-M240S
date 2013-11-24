cp -rf ../arch/arm/boot/zImage ./
rm ramdisk-new.gz
rm boot.img
rm boot.tar
./mkbootfs ./ramdisk | gzip > ramdisk-new.gz
./mkbootimg --base "13600000" --cmdline "" --pagesize 4096 --kernel zImage --ramdisk ramdisk-new.gz -o boot.img
tar -cvf boot.tar boot.img
