# Telegram 自托管API服务端Action构建



拉取[官方api最新代码](https://github.com/tdlib/telegram-bot-api)生成的可执行文件,用于Telegram机器人的自托管Api的搭建。

实测用法

```powershell 
.\telegram-bot-api.exe --local --api-id=123 --api-hash=xxxxx --http-ip-address=127.0.0.1 --log=./log.txt --dir=./workingdir --temp-dir=./tempdir --verbosity=4
```

构建脚本参考官方的脚本[生成助手](https://tdlib.github.io/telegram-bot-api/build.html)。

本人并没有测试除了windows和liunx之外的版本，如果又问题请提issue。