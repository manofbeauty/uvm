//
// Template for UVM-compliant Coverage Class
//

`ifndef PPE_COV__SV
`define PPE_COV__SV

class ppe_cov extends uvm_component;
   event cov_event;
   tx_xaction tr;
   uvm_analysis_imp #(tx_xaction, ppe_cov) cov_export;
   `uvm_component_utils(ppe_cov)
 
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      // ToDo: Add required coverpoints, coverbins
   endgroup: cg_trans


   function new(string name, uvm_component parent);
      super.new(name,parent);
      cg_trans = new;
      cov_export = new("Coverage Analysis",this);
   endfunction: new

   virtual function write(tx_xaction tr);
      this.tr = tr;
      -> cov_event;
   endfunction: write

endclass: ppe_cov

`endif // PPE_COV__SV

