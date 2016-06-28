#!/usr/bin/env bash

script_path=`dirname $0`
bin_path="/usr/local/bin/"
lame_path="${bin_path}/lame"

cp "${script_path}/lame" $bin_path
chmod u+x "${lame_path}"

echo "Lame installed!!"
