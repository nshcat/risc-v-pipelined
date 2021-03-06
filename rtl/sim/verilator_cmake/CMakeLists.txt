cmake_minimum_required(VERSION 3.20)
project(socsim)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})


add_executable(socsim src/sim_main.cpp)
verilate(socsim 
	SOURCES "./../top_verilator.sv"
	TRACE
	INCLUDE_DIRS "./../../soc;./../../soc/core;./../../soc/peripherals;./..")
	
set_property(TARGET socsim PROPERTY CXX_STANDARD 17)
set_property(TARGET socsim PROPERTY CXX_STANDARD_REQUIRED ON)

set(GTKWAVEPATH "Y:/riscv-toolchain/gtkwave64/bin/gtkwave.exe")
	
add_custom_target(sim
	COMMAND $<TARGET_FILE:socsim> --sim)
add_dependencies(sim socsim)

add_custom_target(interactive
	COMMAND $<TARGET_FILE:socsim> --interactive)
add_dependencies(interactive socsim)

add_custom_target(gtkwave
	COMMAND ${GTKWAVEPATH} waveforms.vcd)
add_dependencies(gtkwave socsim)