#!/bin/bash

# Set variables
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR="$PROJECT_DIR/out"
SOURCE_DIR="$PROJECT_DIR/src"
PROTOC_DIR="$PROJECT_DIR/protoc-25.2-osx-aarch_64/bin/protoc"
PROTOC_SWIFT_DIR="$PROJECT_DIR/protoc-swift-1.9.0"

CSHARP_OUT="$BUILD_DIR/csharp"
KOTLIN_OUT="$BUILD_DIR/kotlin"
SWIFT_OUT="$BUILD_DIR/swift"

export PATH="$PATH:$PROTOC_SWIFT_DIR"

# Clean up
rm -rf "$BUILD_DIR"

mkdir -p "$BUILD_DIR"
mkdir -p "$CSHARP_OUT"
mkdir -p "$KOTLIN_OUT"
mkdir -p "$SWIFT_OUT"

# Build protobuf files
$PROTOC_DIR --proto_path=$SOURCE_DIR --csharp_out=$CSHARP_OUT --csharp_opt=file_extension=.g.cs $SOURCE_DIR/*.proto
$PROTOC_DIR --proto_path=$SOURCE_DIR --java_out=$KOTLIN_OUT --kotlin_out=$KOTLIN_OUT $SOURCE_DIR/*.proto
$PROTOC_DIR --proto_path=$SOURCE_DIR --swift_out=$SWIFT_OUT $SOURCE_DIR/*.proto --swift_opt=Visibility=Public

# Check if build was successful
if [ $? -eq 0 ]; then
  echo "Build successful"
else
  echo "Build failed"
fi
