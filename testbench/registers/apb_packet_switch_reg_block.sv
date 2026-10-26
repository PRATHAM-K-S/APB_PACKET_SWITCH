class apb_packet_switch_reg_block extends uvm_reg_block;

    `uvm_object_utils(apb_packet_switch_reg_block)

    rand device_id_reg device_id;
    rand version_reg version;
    rand switch_status_reg switch_status;
    rand port_status_reg port_status;
    rand gen_status_reg gen_status;
    rand stat_rx_reg stat_rx;
    rand stat_tx_reg stat_tx;
    rand stat_drop_reg stat_drop;
    rand switch_ctrl_reg switch_ctrl;
    rand port_enable_reg port_enable;
    rand fwd_enable_reg fwd_enable;
    rand gen_ctrl_reg gen_ctrl;
    rand gen_pkt_cfg_reg gen_pkt_cfg;
    rand gen_interval_reg gen_interval;
    rand gen_count_reg gen_count;
    rand irq_status_reg irq_status;
    rand irq_enable_reg irq_enable;
    rand irq_force_reg irq_force;
    rand err_status_reg err_status;
    rand err_enable_reg err_enable;
    rand err_inject_reg err_inject;
    rand err_count_reg err_count;
    rand err_info_reg err_info;
    rand lock_reg lock;
    rand soft_reset_reg soft_reset;

    uvm_reg_map apb_map;

    function new(string name = "apb_packet_switch_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        // 1. Create and configure each register
        device_id = device_id_reg::type_id::create("device_id");
        device_id.configure(this, null, "");
        device_id.build();

        version = version_reg::type_id::create("version");
        version.configure(this, null, "");
        version.build();

        switch_status = switch_status_reg::type_id::create("switch_status");
        switch_status.configure(this, null, "");
        switch_status.build();

        port_status = port_status_reg::type_id::create("port_status");
        port_status.configure(this, null, "");
        port_status.build();

        gen_status = gen_status_reg::type_id::create("gen_status");
        gen_status.configure(this, null, "");
        gen_status.build();

        stat_rx = stat_rx_reg::type_id::create("stat_rx");
        stat_rx.configure(this, null, "");
        stat_rx.build();

        stat_tx = stat_tx_reg::type_id::create("stat_tx");
        stat_tx.configure(this, null, "");
        stat_tx.build();

        stat_drop = stat_drop_reg::type_id::create("stat_drop");
        stat_drop.configure(this, null, "");
        stat_drop.build();

        switch_ctrl = switch_ctrl_reg::type_id::create("switch_ctrl");
        switch_ctrl.configure(this, null, "");
        switch_ctrl.build();

        port_enable = port_enable_reg::type_id::create("port_enable");
        port_enable.configure(this, null, "");
        port_enable.build();

        fwd_enable = fwd_enable_reg::type_id::create("fwd_enable");
        fwd_enable.configure(this, null, "");
        fwd_enable.build();

        gen_ctrl = gen_ctrl_reg::type_id::create("gen_ctrl");
        gen_ctrl.configure(this, null, "");
        gen_ctrl.build();

        gen_pkt_cfg = gen_pkt_cfg_reg::type_id::create("gen_pkt_cfg");
        gen_pkt_cfg.configure(this, null, "");
        gen_pkt_cfg.build();

        gen_interval = gen_interval_reg::type_id::create("gen_interval");
        gen_interval.configure(this, null, "");
        gen_interval.build();

        gen_count = gen_count_reg::type_id::create("gen_count");
        gen_count.configure(this, null, "");
        gen_count.build();

        irq_status = irq_status_reg::type_id::create("irq_status");
        irq_status.configure(this, null, "");
        irq_status.build();

        irq_enable = irq_enable_reg::type_id::create("irq_enable");
        irq_enable.configure(this, null, "");
        irq_enable.build();

        irq_force = irq_force_reg::type_id::create("irq_force");
        irq_force.configure(this, null, "");
        irq_force.build();

        err_status = err_status_reg::type_id::create("err_status");
        err_status.configure(this, null, "");
        err_status.build();

        err_enable = err_enable_reg::type_id::create("err_enable");
        err_enable.configure(this, null, "");
        err_enable.build();

        err_inject = err_inject_reg::type_id::create("err_inject");
        err_inject.configure(this, null, "");
        err_inject.build();

        err_count = err_count_reg::type_id::create("err_count");
        err_count.configure(this, null, "");
        err_count.build();

        err_info = err_info_reg::type_id::create("err_info");
        err_info.configure(this, null, "");
        err_info.build();

        lock = lock_reg::type_id::create("lock");
        lock.configure(this, null, "");
        lock.build();

        soft_reset = soft_reset_reg::type_id::create("soft_reset");
        soft_reset.configure(this, null, "");
        soft_reset.build();

        apb_map = create_map("apb_map", 'h0, 4, UVM_LITTLE_ENDIAN);[cite: 14]
        default_map = apb_map;

        apb_map.add_reg(device_id, 'h00, "RO");  
        apb_map.add_reg(version, 'h04, "RO");  
        apb_map.add_reg(switch_status 'h08, "RO");
        apb_map.add_reg(port_status, 'h0C, "RO");  
        apb_map.add_reg(gen_status, 'h10, "RO");  
        apb_map.add_reg(stat_rx, 'h14, "RO");  
        apb_map.add_reg(stat_tx, 'h18, "RO");  
        apb_map.add_reg(stat_drop, 'h1C, "RO");  
        apb_map.add_reg(switch_ctrl, 'h20, "RW");  
        apb_map.add_reg(port_enable, 'h24, "RW");  
        apb_map.add_reg(fwd_enable, 'h28, "RW");  
        apb_map.add_reg(gen_ctrl, 'h2C, "RW");  
        apb_map.add_reg(gen_pkt_cfg, 'h30, "RW");  
        apb_map.add_reg(gen_interval, 'h34, "RW");
        apb_map.add_reg(gen_count, 'h38, "RW");  
        apb_map.add_reg(irq_status, 'h3C, "W1C"); 
        apb_map.add_reg(irq_enable, 'h40, "RW");  
        apb_map.add_reg(irq_force, 'h44, "WO");  
        apb_map.add_reg(err_status, 'h48, "W1C"); 
        apb_map.add_reg(err_enable, 'h4C, "RW");  
        apb_map.add_reg(err_inject, 'h50, "WO");  
        apb_map.add_reg(err_count, 'h54, "RO");  
        apb_map.add_reg(err_info, 'h58, "RO");  
        apb_map.add_reg(lock, 'h5C, "RW");
        apb_map.add_reg(soft_reset, 'h60, "WO");  
    endfunction
    
endclass : apb_packet_switch_reg_block