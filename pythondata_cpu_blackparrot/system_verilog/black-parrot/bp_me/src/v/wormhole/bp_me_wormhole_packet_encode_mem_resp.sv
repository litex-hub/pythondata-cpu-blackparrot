/**
 *  Name:
 *    bp_me_wormhole_packet_encode_mem_resp.v
 *
 *  Description:
 *    It takes bp_mem_resp_s as a payload, parses, and forms it into a wormhole
 *    packet that goes into the adapter.
 *
 *    packet = {payload, length, cord}
 */

`include "bp_me_defines.svh"

`include "bp_common_defines.svh"
`include "bp_me_defines.svh"

module bp_me_wormhole_packet_encode_mem_resp
  import bp_common_pkg::*;
  import bp_me_pkg::*;
  #(parameter bp_params_e bp_params_p = e_bp_default_cfg
    `declare_bp_proc_params(bp_params_p)
    `declare_bp_bedrock_mem_if_widths(paddr_width_p, cce_block_width_p, lce_id_width_p, lce_assoc_p, cce)

    , parameter `BSG_INV_PARAM(flit_width_p )
    , parameter `BSG_INV_PARAM(cord_width_p )
    , parameter `BSG_INV_PARAM(cid_width_p )
    , parameter `BSG_INV_PARAM(len_width_p )

    , localparam mem_resp_wormhole_header_width_lp =
        `bp_mem_wormhole_header_width(flit_width_p, cord_width_p, len_width_p, cid_width_p, cce_mem_msg_header_width_lp)
    )
   (input [cce_mem_msg_header_width_lp-1:0]          mem_resp_header_i
    , input [cord_width_p-1:0]                       src_cord_i
    , input [cid_width_p-1:0]                        src_cid_i
    , input [cord_width_p-1:0]                       dst_cord_i
    , input [cid_width_p-1:0]                        dst_cid_i

    , output [mem_resp_wormhole_header_width_lp-1:0] wh_header_o
    );

  `declare_bp_bedrock_mem_if(paddr_width_p, cce_block_width_p, lce_id_width_p, lce_assoc_p, cce);
  `declare_bp_mem_wormhole_packet_s(flit_width_p, cord_width_p, len_width_p, cid_width_p, bp_bedrock_cce_mem_msg_header_s, cce_block_width_p);

  bp_bedrock_cce_mem_msg_header_s header_cast_i;
  bp_mem_wormhole_header_s header_cast_o;

  assign header_cast_i = mem_resp_header_i;
  assign wh_header_o = header_cast_o;

  localparam mem_resp_ack_len_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp, flit_width_p) - 1;
  localparam mem_resp_data_len_1_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*1, flit_width_p) - 1;
  localparam mem_resp_data_len_2_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*2, flit_width_p) - 1;
  localparam mem_resp_data_len_4_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*4, flit_width_p) - 1;
  localparam mem_resp_data_len_8_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*8, flit_width_p) - 1;
  localparam mem_resp_data_len_16_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*16, flit_width_p) - 1;
  localparam mem_resp_data_len_32_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*32, flit_width_p) - 1;
  localparam mem_resp_data_len_64_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*64, flit_width_p) - 1;
  localparam mem_resp_data_len_128_lp =
    `BSG_CDIV(mem_resp_wormhole_header_width_lp + 8*128, flit_width_p) - 1;

  logic [len_width_p-1:0] data_resp_len_li;

  always_comb begin
    header_cast_o = '0;

    header_cast_o.msg_hdr         = header_cast_i;
    header_cast_o.wh_hdr.src_cord = src_cord_i;
    header_cast_o.wh_hdr.src_cid  = src_cid_i;
    header_cast_o.wh_hdr.cord     = dst_cord_i;
    header_cast_o.wh_hdr.cid      = dst_cid_i;

    case (header_cast_i.size)
      e_bedrock_msg_size_1 : data_resp_len_li = len_width_p'(mem_resp_data_len_1_lp);
      e_bedrock_msg_size_2 : data_resp_len_li = len_width_p'(mem_resp_data_len_2_lp);
      e_bedrock_msg_size_4 : data_resp_len_li = len_width_p'(mem_resp_data_len_4_lp);
      e_bedrock_msg_size_8 : data_resp_len_li = len_width_p'(mem_resp_data_len_8_lp);
      e_bedrock_msg_size_16: data_resp_len_li = len_width_p'(mem_resp_data_len_16_lp);
      e_bedrock_msg_size_32: data_resp_len_li = len_width_p'(mem_resp_data_len_32_lp);
      e_bedrock_msg_size_64: data_resp_len_li = len_width_p'(mem_resp_data_len_64_lp);
      e_bedrock_msg_size_128: data_resp_len_li = len_width_p'(mem_resp_data_len_128_lp);
      default: data_resp_len_li = '0;
    endcase

    case (header_cast_i.msg_type)
      e_bedrock_mem_rd
      ,e_bedrock_mem_uc_rd: header_cast_o.wh_hdr.len = data_resp_len_li;
      e_bedrock_mem_uc_wr
      ,e_bedrock_mem_wr
      ,e_bedrock_mem_pre  : header_cast_o.wh_hdr.len = len_width_p'(mem_resp_ack_len_lp);
      default: header_cast_o.wh_hdr.len = '0;
    endcase
  end

endmodule

`BSG_ABSTRACT_MODULE(bp_me_wormhole_packet_encode_mem_resp)

