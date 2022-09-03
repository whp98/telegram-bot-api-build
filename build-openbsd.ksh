git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
cmake --build . --target prepare_cross_compiling
cd ../td
php-7.2 SplitSource.php
cd ../build
cmake --build . --target install
cd ../td
php-7.2 SplitSource.php --undo
cd ../..
ls -l telegram-bot-api/bin/telegram-bot-api*
