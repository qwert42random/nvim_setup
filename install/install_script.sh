#!/bin/bash

set -e

# Install dependencies.
DEP_LIST=( "git" "make" "cmake" "gettext" )
for DEB in "${DEP_LIST[@]}"; do
    apt-get install ${DEB} -y
done

git clone https://github.com/neovim/neovim.git --depth 1 --branch "stable"

make -C neovim CMAKE_BUILD_TYPE=RelWithDebInfo
make -C neovim install

