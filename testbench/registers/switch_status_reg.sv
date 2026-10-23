`include "uvm_macros.svh"
import uvm_pkg::*;

class switch_status_reg extends uvm_reg;
    
    // Factory registration
    `uvm_object_utils(switch_status_reg)

    uvm_reg_field ready;
    uvm_reg_field busy;
    uvm_reg_field switch_enabled;
    uvm_reg_field locked;
    uvm_reg_field port_enabled;
    uvm_reg_field gen_running;
    uvm_reg_field err_pending;
    uvm_reg_field reserved1;
    uvm_reg_field gen_fsm;
    uvm_reg_field reserved2;

    // Class constructor
    function new(string name="switch_status_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction 

    virtual function void build();
        // build fields
        ready = uvm_reg_field::type_id::create("ready");
        busy = uvm_reg_field::type_id::create("busy");
        switch_enabled = uvm_reg_field::type_id::create("switch_enabled");
        locked = uvm_reg_field::type_id::create("locked");
        port_enabled = uvm_reg_field::type_id::create("port_enabled");
        gen_running = uvm_reg_field::type_id::create("gen_running");
        err_pending = uvm_reg_field::type_id::create("err_pending");
        reserved1 = uvm_reg_field::type_id::create("reserved1");
        gen_fsm = uvm_reg_field::type_id::create("gen_fsm");
        reserved2 = uvm_reg_field::type_id::create("reserved2"); 
        // configure fields
        ready.configure(this, 1, 0, "RO", 1, 1'b1, 1, 0, 0);
        busy.configure(this, 1, 1, "RO", 1, 1'b0, 1, 0, 0);
        switch_enabled.configure(this, 1, 2, "RO", 1, 1'b0, 1, 0, 0);
        locked.configure(this, 1, 3, "RO", 1, 1'b1, 1, 0, 0);
        port_enabled.configure(this, 4, 4, "RO", 1, 4'hF, 1, 0, 0);
        gen_running.configure(this, 1, 8, "RO", 1, 1'b0, 1, 0, 0);
        err_pending.configure(this, 1, 9, "RO", 1, 1'b0, 1, 0, 0);
        reserved1.configure(this, 6, 10, "RO", 1, 6'b0, 1, 0, 0);
        gen_fsm.configure(this, 2, 16, "RO", 1, 2'b0, 1, 0, 0);
        reserved2.configure(this, 14, 18, "RO", 1, 14'b0, 1, 0, 0);
    endfunction: build
endclass //switch_status_reg extends uvm_reg