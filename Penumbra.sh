sudo apt-get install build-essential pkg-config libssl-dev clang git-lfs

sudo dnf install openssl-devel clang git cargo rustfmt git-lfs

git clone https://github.com/penumbra-zone/penumbra

cd penumbra && git fetch && git checkout v0.58.0

cargo build --release --bin pcli
