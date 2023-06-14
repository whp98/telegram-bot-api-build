# download code
git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api
# delete old build
rm -rf build
mkdir build
cd build
# use cmd to build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
cmake --build . --target install
cd ../..
ls -l telegram-bot-api/bin/telegram-bot-api*
# package to a zip file  
zip -r telegram-bot-api-freebsd-build-x64.zip telegram-bot-api/bin/*