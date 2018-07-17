#!/usr/bin/env bash


# Prelims
apt-get update && apt-get -y upgrade

# Get necessary components
apt-get install -y luajit libluajit-5.1-dev gcc make unzip wget openssl libssl-dev

# Build LuaRocks with luajit
mkdir -p vendor
pushd vendor
wget https://github.com/luarocks/luarocks/archive/v2.4.4.tar.gz -O - | tar -xz
pushd luarocks-2.4.4
./configure --lua-suffix=jit --with-lua=/usr --with-lua-include=/usr/include/luajit-2.0
make build && make install
popd  # luarocks-2.4.4
popd  # vendor


# Need this for lapis, had to do some squirrelly symlinking to make the rockspec work
mkdir -p /symbolic
ln -sf /usr/lib/x86_64-linux-gnu /symbolic/lib
luarocks install luaossl CRYPTO_DIR=/symbolic CRYPTO_INCDIR=/usr/include

# Install lapis and inspect
luarocks install lapis
luarocks install inspect


### Now install OpenResty ####

# import our GPG key:
wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add -

# for installing the add-apt-repository command
# (you can remove this package and its dependencies later):
apt-get update && apt-get install -y software-properties-common

# add the our official APT repository:
add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"

# to update the APT index:
apt-get update && apt-get install -y openresty