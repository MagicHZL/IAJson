#构建的Model名后缀必须为 Model
#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
xcodebuild -target CreatFile -destination "platform=macOS" -configuration Release
cppath=$(cd ..; pwd)
cp $basepath/build/Release/CreatFile  $cppath/FC/CreatFile

