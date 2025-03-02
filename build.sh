#!/bin/bash

ROOT_DIR=$(cd "$(dirname "$0")"; pwd)
NAME="unrar_7_1_5"
LIB_NAME="unrar"

export OHOS_SDK="$HOME/ohos/command-line-tools/sdk/default/openharmony"

# clean
rm -rf $ROOT_DIR/tpc_c_cplusplus/lycium/usr

# copy scripts
cp -r $ROOT_DIR/$NAME $ROOT_DIR/tpc_c_cplusplus/thirdparty
cp $ROOT_DIR/envset.sh $ROOT_DIR/tpc_c_cplusplus/lycium/script

# build
cd $ROOT_DIR/tpc_c_cplusplus/lycium
./build.sh $NAME

# copy libs
rm -rf $ROOT_DIR/libs
archs=("armeabi-v7a" "arm64-v8a" "x86_64")
for arch in ${archs[@]}
do
	mkdir -p $ROOT_DIR/libs/$arch
    cp $ROOT_DIR/tpc_c_cplusplus/lycium/usr/$LIB_NAME/$arch/lib/*.a $ROOT_DIR/libs/$arch
done