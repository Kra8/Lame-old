#!/usr/bin/env bash

current=`pwd`
rootPath="$HOME/.lame"
binPath="${rootPath}/bin"


if [ ! -e $rootPath ]; then
    mkdir $rootPath
fi

if [ ! -e $binPath ]; then
    mkdir $binPath
fi

cp "${current}/lame" $binPath
chmod u+x "${binPath}/lame"

echo "Lame installed!!"
