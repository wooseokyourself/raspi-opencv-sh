# check for updates (64-bit OS is still under development!)
sudo apt-get update
sudo apt-get upgrade
# dependencies
sudo apt-get install build-essential cmake git unzip pkg-config \
libjpeg-dev libpng-dev \
libavcodec-dev libavformat-dev libswscale-dev \
libgtk2.0-dev libcanberra-gtk* libgtk-3-dev \
libxvidcore-dev libx264-dev \
libtbb2 libtbb-dev libdc1394-22-dev \
libv4l-dev v4l-utils \
libopenblas-dev libatl as-base-dev libblas-dev \
liblapack-dev gfortran libhdf5-dev \
libprotobuf-dev libgoogle-glog-dev libgflags-dev \
protobuf-compiler

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
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D BUILD_EXAMPLES=OFF ..

make -j4
sudo make install
sudo ldconfig 
make clean 
sudo apt-get update
