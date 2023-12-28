#!/bin/bash

function install_tools {
apt update
apt install mc wget curl git htop netcat net-tools unzip jq build-essential ncdu tmux make cmake clang pkg-config libssl-dev protobuf-compiler -y
  sleep 1
}

function wget_bin_pcli {
mkdir -p $HOME/penumbra/target/release/
wget -O  $HOME/penumbra/target/release/pcli https://doubletop-bin.ams3.digitaloceanspaces.com/penumbra/$version/pcli
chmod +x $HOME/penumbra/target/release/pcli
cp $HOME/penumbra/target/release/pcli /usr/bin/pcli
}

export version="v0.64.0"
install_tools
wget_bin_pcli
