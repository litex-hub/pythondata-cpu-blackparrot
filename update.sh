#!/bin/bash
cd pythondata_cpu_blackparrot/system_verilog/
rm -rf black-parrot
git clone https://github.com/black-parrot/black-parrot.git
cd black-parrot
git checkout top_dev
git submodule update --init external/basejump_stl
git submodule update --init external/HardFloat

## Set common variables
BP=$PWD
BP_LITEX_DIR=$BP/bp_litex

BP_COMMON_DIR=$BP/bp_common
BP_FE_DIR=$BP/bp_fe
BP_BE_DIR=$BP/bp_be
BP_ME_DIR=$BP/bp_me
BP_TOP_DIR=$BP/bp_top
BP_EXTERNAL_DIR=$BP/external
BASEJUMP_STL_DIR=$BP_EXTERNAL_DIR/basejump_stl
LITEX_FPGA_DIR=$BP_LITEX_DIR/fpga
LITEX_SIMU_DIR=$BP_LITEX_DIR/simulation

##Minor changes in some of the BP files for memory management
sed -i "s/localparam dram_base_addr_gp         = 40'h00_8000_0000;/localparam dram_base_addr_gp         = 40'h00_7000_0000;/" $BP_COMMON_DIR/src/include/bp_common_addr_pkgdef.svh
sed -i "s/localparam bp_pc_entry_point_gp=39'h10_3000/localparam bp_pc_entry_point_gp=39'h00_7000_0000/" $BP_ME_DIR/test/common/bp_cce_mmio_cfg_loader.sv
sed -i "s/wire local_cmd_li        = (proc_cmd_selected_lo.header.addr < dram_base_addr_gp);/wire local_cmd_li        = (proc_cmd_selected_lo.header.addr < 32'h5000_0000);/" $BP_TOP_DIR/src/v/bp_unicore_lite.sv

## Replace $signed with signed' in all files due to Vivado bug for $signed
find . -type f -exec sed -i 's/\$signed/signed'\''/g' {} +

## Add external dependencies to main repo
sed -i '/external\//d' $BP/.gitignore
git rm --cached $BP/external/basejump_stl
git rm --cached $BP/external/HardFloat
git rm $BP/.gitmodules
rm -rf $BP/external/basejump_stl/.git
rm -rf $BP/external/HardFloat/.git
git add $BP/external/basejump_stl
git add $BP/external/HardFloat

## Output new BlackParrot SHA
echo "New BlackParrot SHA: $(git rev-parse --short HEAD)"
