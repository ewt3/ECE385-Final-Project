transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/ECELab6/lab62_soc {C:/intelFPGA_lite/18.1/ECELab6/lab62_soc/lab62_soc_bb.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECELab6/SVs {C:/intelFPGA_lite/18.1/ECELab6/SVs/lab62.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECELab6/SVs {C:/intelFPGA_lite/18.1/ECELab6/SVs/HexDriver.sv}
vlib lab62_soc
vmap lab62_soc lab62_soc
vlib lab7_soc
vmap lab7_soc lab7_soc

