echo "Installing liboost and libeigen. Need super user permissions ..."

sudo apt-get install libboost-all-dev libeigen3-dev

echo "Linking ORB_SLAM directory in ROS ..."

sudo ln -s $(pwd) /opt/ros/kinetic/share/ORB_SLAM

echo "Configuring and building Thirdparty/g2o ..."

cd Thirdparty/g2o
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2

cd ../../DBoW2

echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2

cd ../../..

echo "Configuring and building ORB_SLAM ..."

mkdir build
cd build
cmake .. -DROS_BUILD_TYPE=Release
make -j2

cd ..

echo "Uncompress vocabulary ..."

cd Data
tar -xf ORBvoc.txt.tar.gz
cd ..