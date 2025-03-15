#!/bin/bash

NVIM_REPO=/tmp/neovim
HOME_DIR=$(eval echo ~${SUDO_USER})

CONFIG_LOC=$HOME_DIR/.config/nvim
PLUGIN_LOC=$HOME_DIR/.local/share/nvim/site/pack/plugins

set -e

# Install dependencies.
DEPENDENCIES="git cmake gettext"
sudo apt-get install -y ${DEPENDENCIES}

git clone https://github.com/neovim/neovim.git --depth 1 --branch "stable" ${NVIM_REPO}

make -C ${NVIM_REPO} CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr
sudo make -C ${NVIM_REPO} install

mkdir -p $CONFIG_LOC
mkdir -p $PLUGIN_LOC/start

cp init.lua $CONFIG_LOC

# Install plugins

