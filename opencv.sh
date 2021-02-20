# check for updates (64-bit OS is still under development!)
sudo apt-get update
sudo apt-get upgrade
# dependencies
sudo apt-get install build-essential cmake git unzip pkg-config
sudo apt-get install libjpeg-dev libpng-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install libgtk2.0-dev libcanberra-gtk* libgtk-3-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install python3-dev python3-numpy python3-pip
sudo apt-get install libtbb2 libtbb-dev libdc1394-22-dev
sudo apt-get install libv4l-dev v4l-utils
sudo apt-get install libopenblas-dev libatl as-base-dev libblas-dev
sudo apt-get install liblapack-dev gfortran libhdf5-dev
sudo apt-get install libprotobuf-dev libgoogle-glog-dev libgflags-dev
sudo apt-get install protobuf-compiler

cd ~
wget -O opencv-4.5.0.zip https://github.com/opencv/opencv/archive/4.5.0.zip
unzip opencv-4.5.0.zip

cd opencv-4.5.0
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D ENABLE_NEON=ON \
        -D WITH_FFMPEG=ON \
        -D WITH_TBB=ON \
        -D BUILD_TBB=ON \
        -D BUILD_TESTS=OFF \
        -D WITH_EIGEN=OFF \
        -D WITH_V4L=ON \
        -D WITH_LIBV4L=ON \
        -D WITH_VTK=OFF \
        -D WITH_QT=OFF \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D INSTALL_C_EXAMPLES=OFF \
        -D INSTALL_PYTHON_EXAMPLES=OFF \
        -D BUILD_NEW_PYTHON_SUPPORT=ON \
        -D BUILD_opencv_python3=TRUE \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D BUILD_EXAMPLES=OFF ..

make -j4
sudo make install
sudo ldconfig 
make clean 
sudo apt-get update
