su -
export PKG_PATH=https://ftp.netbsd.org//pub/pkgsrc/packages/NetBSD/x86_64/9.2/All/
pkg_add git gperf cmake openssl gcc5-libs
exit
git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
cmake --build . --target install
cd ../..
ls -l telegram-bot-api/bin/telegram-bot-api*