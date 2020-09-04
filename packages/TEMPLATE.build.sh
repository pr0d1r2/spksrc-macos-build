#!/bin/bash

set -E

git clone https://github.com/SynoCommunity/spksrc.git spksrc
cd spksrc
test -d "toolchains/SYNO"
make setup
cd spk/PACKAGE && make -j "$(nproc)" arch-ARCHITECTURE
cd ../../
cp -rvdp packages/*.spk /packages/
