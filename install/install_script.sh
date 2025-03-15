#!/bin/bash

set -eu

SCRIPT_DIR=$(dirname $BASH_SOURCE)

NVIM_REPO=/tmp/neovim

CONFIG_LOC=~/.config/nvim
PLUGIN_LOC=~/.local/share/nvim/site/pack/plugins

# Install dependencies.
DEPENDENCIES="git cmake gettext"
sudo apt-get install -y ${DEPENDENCIES}

# TODO: Check if version is correct?
# Install neovim if it does not exist.
if [ ! -x "$(command -v nvim)" ]; then
    git clone https://github.com/neovim/neovim.git --depth 1 --branch "stable" ${NVIM_REPO}
    make -C ${NVIM_REPO} CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr
    sudo make -C ${NVIM_REPO} install
fi

mkdir -p $CONFIG_LOC
mkdir -p $PLUGIN_LOC/start

cp $SCRIPT_DIR/init.lua $CONFIG_LOC

PLUGINS=(
"https://github.com/nvim-lualine/lualine.nvim.git --branch 'compat-nvim-0.6'" \
"https://github.com/nvim-tree/nvim-tree.lua.git --branch 'v1.11.0'"
)

# Install plugins
for PLUGIN in "${PLUGINS[@]}"; do
    REPO_NAME=$(basename "$PLUGIN" .git)
    eval git clone "${PLUGIN}" --depth 1 "${PLUGIN_LOC}/start/${REPO_NAME}"
done

