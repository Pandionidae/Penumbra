#!/bin/bash


function source_git {
  if [ ! -d $HOME/penumbra/ ]; then
    git clone https://github.com/penumbra-zone/penumbra
  fi
  mkdir -p $HOME/penumbra/target/release/
  sudo chmod +x $HOME/penumbra/target/release/pcli
  sudo cp $HOME/penumbra/target/release/pcli /usr/bin/pcli
  cd $HOME/penumbra
  git fetch
  git checkout $version && cargo update
}



export version="v0.58.0"
source_git
