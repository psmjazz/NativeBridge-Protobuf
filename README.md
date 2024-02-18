# NativeBridge-Protobuf
Protobuf Messages for NativeBridge

## Build
build Protobuf Messages of Android(java/kotlin), iOS(swift) and Unity(C#)
outputs are located in 'out' folder
- out/csharp
- out/kotlin
- out/swift
### Mac (On Apple Silicon)
Open terminal and run
```
cd [location of this project]
sh ./build.sh
```
### Others
1. Find proper version of protoc excutables in [protobuf release](https://github.com/protocolbuffers/protobuf/releases)
2. Open build.sh and change PROTOC_DIR with downloaded protoc excutable location
```
PROTOC_DIR="[Downloaded protoc location]"
```
3. Intel chip Mac may have to rebuild protoc-swift. Follow [this link](https://github.com/apple/swift-protobuf) and change PROTOC_SWIFT_DIR with rebuilded protoc-swift location
```
PROTOC_SWIFT_DIR="[Rebuilded protoc-swift location]"
```
> **_NOTE:_** Build for swift protobuf message only supported in mac. delete below line if you are not building on Mac
```
$PROTOC_DIR --proto_path=$SOURCE_DIR --swift_out=$SWIFT_OUT $SOURCE_DIR/*.proto --swift_opt=Visibility=Public
```