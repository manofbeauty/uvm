//
// Template for UVM-compliant sequencer class
//


`ifndef TX_SQR__SV
`define TX_SQR__SV


typedef class tx_xaction;
class tx_sqr extends uvm_sequencer # (tx_xaction);

   `uvm_component_utils(tx_sqr)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:tx_sqr

`endif // TX_SQR__SV
