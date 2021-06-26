#!/bin/bash
## Set common variables
BP=$(dirname $(dirname ${BASH_SOURCE[0]}))
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
sed -i "s/localparam dram_base_addr_gp         = 40'h00_8000_0000;/localparam dram_base_addr_gp         = 40'h00_7000_0000;/" $BP_COMMON_DIR/src/include/bp_common_pkg.vh
sed -i "s/localparam bp_pc_entry_point_gp=39'h00_8000_0000/localparam bp_pc_entry_point_gp=39'h00_7000_0000/" $BP_ME_DIR/test/common/bp_cce_mmio_cfg_loader.v
sed -i "s/wire local_cmd_li        = (cmd_fifo_selected_lo.header.addr < dram_base_addr_gp);/wire local_cmd_li        = (cmd_fifo_selected_lo.header.addr < 32'h5000_0000);/" $BP_TOP_DIR/src/v/bp_softcore.v
