//
// Template for UVM-compliant Monitor to Coverage Connector Callbacks
//

`ifndef TX_MON_2COV_CONNECT
`define TX_MON_2COV_CONNECT
class tx_mon_2cov_connect extends uvm_component;
   ppe_cov cov;
   uvm_analysis_export # (tx_xaction) an_exp;
   `uvm_component_utils(tx_mon_2cov_connect)
   function new(string name="", uvm_component parent=null);
   	super.new(name, parent);
   endfunction: new

   virtual function void write(tx_xaction tr);
      cov.tr = tr;
      -> cov.cov_event;
   endfunction:write 
endclass: tx_mon_2cov_connect

`endif // TX_MON_2COV_CONNECT
