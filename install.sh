sudo dpkg -i ebmc_6.0_amd64.deb
sudo apt-get install gtkwave
cd rvecc
ebmc --z3 --k-induction --bound 1 --systemverilog --top rvecc_sva rvecc_sva.sv top.sv channel_model.sv ../beh_lib.sv
