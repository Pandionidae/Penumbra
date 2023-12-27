#!/bin/bash


function install_tools {
sudo apt update
sudo apt install mc wget curl git htop netcat net-tools unzip jq build-essential ncdu tmux make cmake clang pkg-config libssl-dev protobuf-compiler -y
  sleep 1
}

function source_git {
  if [ ! -d $HOME/penumbra/ ]; then
    git clone https://github.com/penumbra-zone/penumbra
  fi
  cd $HOME/penumbra
  git fetch
  git checkout $version && cargo update
}


function wget_bin_pcli {
  mkdir -p $HOME/penumbra/target/release/
  wget -O  $HOME/penumbra/target/release/pcli https://doubletop-bin.ams3.digitaloceanspaces.com/penumbra/$version/pcli
  sudo chmod +x $HOME/penumbra/target/release/pcli
  sudo cp $HOME/penumbra/target/release/pcli /usr/bin/pcli
}

function generate_wallet {
  cd $HOME/penumbra/
  mkdir -p $HOME/.local/share/penumbra-testnet-archive/
  pcli keys generate
}

export version="v0.64.0"
install_tools
wget_bin_pcli
