git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.bat
./vcpkg.exe install gperf:x86-windows openssl:x86-windows zlib:x86-windows
cd ..
Remove-Item build -Force -Recurse -ErrorAction SilentlyContinue
mkdir build
cd build
cmake -A Win32 -DCMAKE_INSTALL_PREFIX:PATH=.. -DCMAKE_TOOLCHAIN_FILE:FILEPATH=../vcpkg/scripts/buildsystems/vcpkg.cmake ..
cmake --build . --target install --config Release
cd ../..
dir telegram-bot-api/bin/telegram-bot-api*