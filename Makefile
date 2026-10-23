# Compiler and Flags
VCS          = vcs
VCS_FLAGS    = -sverilog -full64 -ntb_opts uvm -timescale=1ns/1ps
COMPILE_ONLY = -compile_only

# Directories and Output
BUILD_DIR    = build
OUTPUT_BIN   = $(BUILD_DIR)/simv
MDIR         = $(BUILD_DIR)/csrc
LOG_FILE     = $(BUILD_DIR)/compile.log

# Default file if none is specified via CLI
# Allows passing either FILE=... or SRC=...
FILE        ?= testbench/registers/device_id_reg.sv
SRC         ?= $(FILE)

.PHONY: all compile clean

all: compile

compile:
	@mkdir -p $(BUILD_DIR)
	$(VCS) $(VCS_FLAGS) $(COMPILE_ONLY) \
		-Mdir=$(MDIR) \
		-o $(OUTPUT_BIN) \
		-l $(LOG_FILE) \
		$(SRC)

clean:
	rm -rf $(BUILD_DIR) ucli.key vc_hdrs.h