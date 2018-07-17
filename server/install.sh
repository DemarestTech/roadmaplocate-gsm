#!/usr/bin/env bash


# Prelims
apt-get update && apt-get -y upgrade

# Get necessary components
apt-get install -y luajit libluajit-5.1-dev gcc make unzip wget openssl libssl-dev

# Build LuaRocks with luajit
mkdir -p src
pushd src
wget https://github.com/luarocks/luarocks/archive/v2.4.4.tar.gz -O - | tar -xz
pushd luarocks-2.4.4
./configure --lua-suffix=jit --with-lua=/usr --with-lua-include=/usr/include/luajit-2.0
make build && make install
popd  # luarocks-2.4.4
popd  # src


# Need this for lapis, had to do some squirrelly symlinking to make the rockspec work
mkdir -p /symbolic
ln -sf /usr/lib/x86_64-linux-gnu /symbolic/lib
luarocks install luaossl CRYPTO_DIR=/symbolic CRYPTO_INCDIR=/usr/include

# Install lapis
luarocks install lapis