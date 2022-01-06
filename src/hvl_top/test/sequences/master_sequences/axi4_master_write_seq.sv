`ifndef AXI4_MASTER_WRITE_SEQ_INCLUDED_
`define AXI4_MASTER_WRITE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: axi4_master_write_seq
// Extends the axi4_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class axi4_master_write_seq extends axi4_master_base_seq;
  `uvm_object_utils(axi4_master_write_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "axi4_master_write_seq");
  extern task body();
endclass : axi4_master_write_seq

//--------------------------------------------------------------------------------------------
// Construct: new
// Initializes new memory for the object
//
// Parameters:
//  name - axi4_master_write_seq
//--------------------------------------------------------------------------------------------
function axi4_master_write_seq::new(string name = "axi4_master_write_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// Creates the req of type master transaction and randomises the req
//--------------------------------------------------------------------------------------------
task axi4_master_write_seq::body();
  super.body();
  req = axi4_master_tx::type_id::create("req");
  //req.axi4_master_agent_cfg_h = p_sequencer.axi4_master_agent_cfg_h;
  
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("axi4","Rand failed");
  end
  req.print();
  finish_item(req);
endtask : body

`endif

