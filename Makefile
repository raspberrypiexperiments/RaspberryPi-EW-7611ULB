install:
    SRC_VER=EW-7611ULB && SRC_NAME=Bluetooth_driver && SRC_EXT=zip && rm -rf $${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && \
wget http://www.edimax.us/download/drivers/$${SRC_VER}/$${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${SRC_VER}_$${SRC_NAME} && unzip $${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && \
rm -rf $${SRC_VER}_$${SRC_NAME}.$${SRC_EXT} && \
cd $${SRC_VER}_$${SRC_NAME}/Linux_BT_USB_v3.1_20150526_8723BU_BTCOEX_20150119-5844_Edimax && \
patch -p1 < 01_kernel_4v5_support.patch && make install && SRC_VER= && SRC_NAME= && SRC_EXT=
