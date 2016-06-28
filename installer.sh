#!/usr/bin/env bash

lame_repo="https://raw.githubusercontent.com/Kra8/lame/master/lame"
bin_path="/usr/local/bin/lame"

###########
# install #
###########
curl -fsSL -o $bin_path $lame_repo
chmod u+x $bin_path

echo "Lame installed!"
