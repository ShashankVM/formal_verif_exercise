#!/bin/bash
# Copy package to /tmp to avoid '_apt' sandboxing permission issues
cp ./ebmc_6.0_amd64.deb /tmp/

sudo DEBIAN_FRONTEND=noninteractive apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y /tmp/ebmc_6.0_amd64.deb gtkwave z3
cd rvecc
ebmc --z3 --k-induction --bound 1 --systemverilog --top rvecc_sva rvecc_sva.sv top.sv channel_model.sv ../beh_lib.sv
