install:
	apt-get update
	apt-get upgrade -y
	apt-get install raspberrypi-kernel-headers -y
	SRC_VER=EW-7611ULB && SRC_NAME=Bluetooth_driver && SRC_EXT=zip && \
rm -rf $${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && \
wget http://www.edimax.us/download/drivers/$${SRC_VER}/$${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${SRC_VER}_$${SRC_NAME} && unzip $${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && patch -p1 < 0001_kernel_4v5_support.patch && \
cd $${SRC_VER}_$${SRC_NAME}/Linux_BT_USB_v3.1_20150526_8723BU_BTCOEX_20150119-5844_Edimax && make install && \
cd ../.. && rm -rf $${SRC_VER}_$${SRC_NAME} && SRC_VER= && SRC_NAME= && SRC_EXT=
