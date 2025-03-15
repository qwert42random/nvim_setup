#!/bin/bash

NVIM_REPO=/tmp/neovim

set -e

# Install dependencies.
DEP_LIST=( "git" "make" "cmake" "gettext" )
for DEB in "${DEP_LIST[@]}"; do
    apt-get install ${DEB} -y
done

git clone https://github.com/neovim/neovim.git --depth 1 --branch "stable" ${NVIM_REPO}

make -C ${NVIM_REPO} CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr
make -C ${NVIM_REPO} install

mkdir -p ~/.config/nvim

