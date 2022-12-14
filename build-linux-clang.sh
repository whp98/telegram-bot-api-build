#!/bin/sh
sudo su
uname -a
whoami
echo '
deb http://azure.archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse
# deb-src http://azure.archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse

deb http://azure.archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src http://azure.archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse

deb http://azure.archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
# deb-src http://azure.archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse

deb http://azure.archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src http://azure.archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse

deb http://azure.archive.ubuntu.com/ubuntu/ jammy partner
# deb-src http://azure.archive.ubuntu.com/ubuntu/ jammy partner
' | sudo tee -a /etc/apt/sources.list
cat /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install clang-14 lldb-14 lld-14
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