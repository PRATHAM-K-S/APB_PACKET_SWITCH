class apb_packet_switch_reg_adapter extends uvm_reg_adapter;
    
    // Factory registration
    `uvm_object_utils(apb_packet_switch_reg_adapter)

    // Class constructor
    function new(string name="apb_packet_switch_reg_adapter");
        super.new(name);
        supports_byte_enable = 0;
        provides_responses = 1;
    endfunction

    // reg2bus method definition
    virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
        apb_packet_switch_seq_item item = apb_packet_switch_seq_item::type_id::create("item");
        item.m_pwrite = (rw.kind == UVM_WRITE);
        item.m_paddr = rw.addr;
        item.m_pwdata = rw.data;
        return item;
    endfunction: reg2bus

    // bus2reg method definition
    virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
        apb_packet_switch_seq_item item;

        if(!$cast(item, bus_item)) begin
            `uvm_fatal("NOT APB TYPE", "provided bus item is not correct type")
            return;
        end

        rw.kind = item.m_pwrite? UVM_WRITE: UVM_READ;
        rw.addr = item.m_paddr;
        rw.data = item.m_pwrite? item.m_pwdata: item.m_prdata;
        rw.status = item.m_pslverr? UVM_NOT_OK: UVM_IS_OK; 
    endfunction: bus2reg

endclass //apb_packet_switch_reg_adapter extends uvm_reg_adapter