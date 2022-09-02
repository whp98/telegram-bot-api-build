#!/bin/sh
# sudo echo '
# deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy main
# deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy main
# # 14
# deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-14 main
# deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy-14 main
# # 15
# deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main
# deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main
# ' >> /etc/apt/sources.list
# cat /etc/apt/sources.list
# wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
# sudo apt-get install clang-14 lldb-14 lld-14
sudo apt-get install make git zlib1g-dev libssl-dev gperf cmake clang-14 libc++-dev libc++abi-dev
git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api
rm -rf build
mkdir build
cd build
export CXXFLAGS="-stdlib=libc++"
CC=/usr/bin/clang-14 CXX=/usr/bin/clang++-14 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
cmake --build . --target install
cd ../..
ls -l telegram-bot-api/bin/telegram-bot-api*