#!/bin/bash

set -eu

SCRIPT_DIR=$(dirname $BASH_SOURCE)

CONFIG_LOC=~/.config/nvim
PLUGIN_LOC=~/.local/share/nvim/site/pack/plugins

# Install dependencies.
DEPENDENCIES="git cmake gettext"
sudo apt-get install -y ${DEPENDENCIES}

# TODO: Check if version is correct?
# Install neovim if it does not exist.
NVIM_REPO=/tmp/neovim
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
"https://github.com/nvim-tree/nvim-tree.lua.git --branch 'v1.11.0'" \
"https://github.com/nvim-tree/nvim-web-devicons.git --branch 'v0.100'"
)

# Install plugins
for PLUGIN in "${PLUGINS[@]}"; do
    REPO_NAME=$(basename "$(echo "${PLUGIN}" | awk '{print $1}')" .git)

    # Check if plugin has been installed. If not, install plugin.
    if [ ! -d "${PLUGIN_LOC}/start/${REPO_NAME}" ]; then
        eval git clone "${PLUGIN}" --depth 1 "${PLUGIN_LOC}/start/${REPO_NAME}"
    fi
done

