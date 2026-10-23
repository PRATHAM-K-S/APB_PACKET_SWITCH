class device_id_reg extends uvm_reg;
    
    // Factory registration
    `uvm_object_utils(device_id_reg)

    uvm_reg_field product_id;
    uvm_reg_field vendor_id;
    uvm_reg_field revision;

    // Class constructor
    function new(string name = "device_id_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        // build fields
        product_id = uvm_reg_field::type_id::create("product_id");
        vendor_id = uvm_reg_field::type_id::create("vendor_id");
        revision = uvm_reg_field::type_id::create("revision");
        // configure fields
        product_id.configure(this, 8, 0, "RO", 1, 8'h02, 1, 0, 1);
        vendor_id.configure(this, 8, 16, "RO", 1, 8'hA5, 1, 0, 1);
        revision.configure(this, 16, 24, "RO", 1, 16'h5357, 1, 0, 1);
    endfunction: build
    
endclass: device_id_reg