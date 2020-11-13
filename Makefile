NUM_PROCESSORS = `grep -c ^processor /proc/cpuinfo`

init:
	apt update
	apt upgrade -y
	apt install raspberrypi-kernel-headers -y

install_wifi: init
	MODEL=EW-7611ULB && SRC_NAME=Linux_Driver && SRC_VER=1.0.1.1 && SRC_EXT=zip && \
rm -rf $${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && \
wget https://www.edimax.com/edimax/mw/cufiles/files/download/Driver_Utility/$${MODEL}/$${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && \
rm -rf Bluetooth && rm -rf Wi-FI && unzip $${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && \
rm -rf Bluetooth && rm -rf $${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && patch -p1 < 0001_kernel_5v4_support.patch && \
cd Wi-FI/rtl8723BU_WiFi_linux_v5.8.4_33660.20190516_COEX20181129-7272 && ARCH=arm make -j$(NUM_PROCESSORS) && make install && \
cd ../.. && rm -rf Wi-FI	

uninstall_wifi: init
	MODEL=EW-7611ULB && SRC_NAME=Linux_Driver && SRC_VER=1.0.1.1 && SRC_EXT=zip && \
rm -rf $${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && \
wget https://www.edimax.com/edimax/mw/cufiles/files/download/Driver_Utility/$${MODEL}/$${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && \
rm -rf Bluetooth && rm -rf Wi-FI && unzip $${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && \
rm -rf Bluetooth && rm -rf $${MODEL}_$${SRC_NAME}_$${SRC_VER}.$${SRC_EXT} && patch -p1 < 0001_kernel_5v4_support.patch && \
cd Wi-FI/rtl8723BU_WiFi_linux_v5.8.4_33660.20190516_COEX20181129-7272 && make uninstall && \
cd ../.. && rm -rf Wi-FI	


install_bluetooth: init
	MODEL=EW-7611ULB && SRC_NAME=Bluetooth_driver && SRC_EXT=zip && \
rm -rf $${MODEL}_$${SRC_NAME}.$${SRC_EXT} && \
wget http://www.edimax.us/download/drivers/$${MODEL}/$${MODEL}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${MODEL}_$${SRC_NAME} && unzip $${MODEL}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${MODEL}_$${SRC_NAME}.$${SRC_EXT} && patch -p1 < 0001_kernel_4v5_support.patch && \
cd $${MODEL}_$${SRC_NAME}/Linux_BT_USB_v3.1_20150526_8723BU_BTCOEX_20150119-5844_Edimax && make install && \
cd ../.. && rm -rf $${MODEL}_$${SRC_NAME}

uninstall_bluetooth:
	MODEL=EW-7611ULB && SRC_NAME=Bluetooth_driver && SRC_EXT=zip && \
rm -rf $${MODEL}_$${SRC_NAME}.$${SRC_EXT} && \
wget http://www.edimax.us/download/drivers/$${MODEL}/$${MODEL}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${MODEL}_$${SRC_NAME} && unzip $${MODEL}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${MODEL}_$${SRC_NAME}.$${SRC_EXT} && patch -p1 < 0001_kernel_4v5_support.patch && \
cd $${MODEL}_$${SRC_NAME}/Linux_BT_USB_v3.1_20150526_8723BU_BTCOEX_20150119-5844_Edimax && make uninstall && \
cd ../.. && rm -rf $${MODEL}_$${SRC_NAME}
