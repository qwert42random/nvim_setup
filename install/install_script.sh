#!/bin/bash

NVIM_REPO=/tmp/neovim
HOME_DIR=$(eval echo ~${SUDO_USER})

set -e

# Install dependencies.
DEPENDENCIES="git cmake gettext"
apt-get install -y ${DEPENDENCIES}

git clone https://github.com/neovim/neovim.git --depth 1 --branch "stable" ${NVIM_REPO}

make -C ${NVIM_REPO} CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr
make -C ${NVIM_REPO} install

mkdir -p $HOME_DIR/.config/nvim

