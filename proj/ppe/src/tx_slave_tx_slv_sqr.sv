//
// Template for UVM-compliant sequencer class
//


`ifndef TX_SLV_SQR__SV
`define TX_SLV_SQR__SV


typedef class tx_xaction;
class tx_slv_sqr extends uvm_sequencer # (tx_xaction);

   `uvm_component_utils(tx_slv_sqr)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:tx_slv_sqr

`endif // TX_SLV_SQR__SV
