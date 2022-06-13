# _hw.tcl file for lab61soc
package require -exact qsys 14.0

# module properties
set_module_property NAME {lab61soc_export}
set_module_property DISPLAY_NAME {lab61soc_export_display}

# default module properties
set_module_property VERSION {1.0}
set_module_property GROUP {default group}
set_module_property DESCRIPTION {default description}
set_module_property AUTHOR {author}

set_module_property COMPOSITION_CALLBACK compose
set_module_property opaque_address_map false

proc compose { } {
    # Instances and instance parameters
    # (disabled instances are intentionally culled)
    add_instance SDRAM altera_avalon_new_sdram_controller 18.1
    set_instance_parameter_value SDRAM {TAC} {5.4}
    set_instance_parameter_value SDRAM {TMRD} {3.0}
    set_instance_parameter_value SDRAM {TRCD} {20.0}
    set_instance_parameter_value SDRAM {TRFC} {70.0}
    set_instance_parameter_value SDRAM {TRP} {20.0}
    set_instance_parameter_value SDRAM {TWR} {14.0}
    set_instance_parameter_value SDRAM {casLatency} {3}
    set_instance_parameter_value SDRAM {columnWidth} {9}
    set_instance_parameter_value SDRAM {dataWidth} {32}
    set_instance_parameter_value SDRAM {generateSimulationModel} {0}
    set_instance_parameter_value SDRAM {initNOPDelay} {0.0}
    set_instance_parameter_value SDRAM {initRefreshCommands} {2}
    set_instance_parameter_value SDRAM {masteredTristateBridgeSlave} {0}
    set_instance_parameter_value SDRAM {model} {single_Micron_MT48LC4M32B2_7_chip}
    set_instance_parameter_value SDRAM {numberOfBanks} {4}
    set_instance_parameter_value SDRAM {numberOfChipSelects} {1}
    set_instance_parameter_value SDRAM {pinsSharedViaTriState} {0}
    set_instance_parameter_value SDRAM {powerUpDelay} {200.0}
    set_instance_parameter_value SDRAM {refreshPeriod} {15.625}
    set_instance_parameter_value SDRAM {registerDataIn} {1}
    set_instance_parameter_value SDRAM {rowWidth} {13}

    add_instance clk_0 clock_source 18.1
    set_instance_parameter_value clk_0 {clockFrequency} {50000000.0}
    set_instance_parameter_value clk_0 {clockFrequencyKnown} {1}
    set_instance_parameter_value clk_0 {resetSynchronousEdges} {NONE}

    add_instance led altera_avalon_pio 18.1
    set_instance_parameter_value led {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value led {bitModifyingOutReg} {0}
    set_instance_parameter_value led {captureEdge} {0}
    set_instance_parameter_value led {direction} {Output}
    set_instance_parameter_value led {edgeType} {RISING}
    set_instance_parameter_value led {generateIRQ} {0}
    set_instance_parameter_value led {irqType} {LEVEL}
    set_instance_parameter_value led {resetValue} {0.0}
    set_instance_parameter_value led {simDoTestBenchWiring} {0}
    set_instance_parameter_value led {simDrivenValue} {0.0}
    set_instance_parameter_value led {width} {8}

    add_instance nios2_gen2_0 altera_nios2_gen2 18.1
    set_instance_parameter_value nios2_gen2_0 {bht_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {breakOffset} {32}
    set_instance_parameter_value nios2_gen2_0 {breakSlave} {None}
    set_instance_parameter_value nios2_gen2_0 {cdx_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {cpuArchRev} {1}
    set_instance_parameter_value nios2_gen2_0 {cpuID} {0}
    set_instance_parameter_value nios2_gen2_0 {cpuReset} {0}
    set_instance_parameter_value nios2_gen2_0 {data_master_high_performance_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {data_master_high_performance_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {data_master_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {data_master_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {dcache_bursts} {false}
    set_instance_parameter_value nios2_gen2_0 {dcache_numTCDM} {0}
    set_instance_parameter_value nios2_gen2_0 {dcache_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {dcache_size} {2048}
    set_instance_parameter_value nios2_gen2_0 {dcache_tagramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {dcache_victim_buf_impl} {ram}
    set_instance_parameter_value nios2_gen2_0 {debug_OCIOnchipTrace} {_128}
    set_instance_parameter_value nios2_gen2_0 {debug_assignJtagInstanceID} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_datatrigger} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_debugReqSignals} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_enabled} {1}
    set_instance_parameter_value nios2_gen2_0 {debug_hwbreakpoint} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_jtagInstanceID} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_traceStorage} {onchip_trace}
    set_instance_parameter_value nios2_gen2_0 {debug_traceType} {none}
    set_instance_parameter_value nios2_gen2_0 {debug_triggerArming} {1}
    set_instance_parameter_value nios2_gen2_0 {dividerType} {no_div}
    set_instance_parameter_value nios2_gen2_0 {exceptionOffset} {32}
    set_instance_parameter_value nios2_gen2_0 {exceptionSlave} {SDRAM.s1}
    set_instance_parameter_value nios2_gen2_0 {fa_cache_line} {2}
    set_instance_parameter_value nios2_gen2_0 {fa_cache_linesize} {0}
    set_instance_parameter_value nios2_gen2_0 {flash_instruction_master_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {flash_instruction_master_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {icache_burstType} {None}
    set_instance_parameter_value nios2_gen2_0 {icache_numTCIM} {0}
    set_instance_parameter_value nios2_gen2_0 {icache_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {icache_size} {4096}
    set_instance_parameter_value nios2_gen2_0 {icache_tagramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {impl} {Tiny}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_high_performance_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_high_performance_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {io_regionbase} {0}
    set_instance_parameter_value nios2_gen2_0 {io_regionsize} {0}
    set_instance_parameter_value nios2_gen2_0 {master_addr_map} {0}
    set_instance_parameter_value nios2_gen2_0 {mmu_TLBMissExcOffset} {0}
    set_instance_parameter_value nios2_gen2_0 {mmu_TLBMissExcSlave} {None}
    set_instance_parameter_value nios2_gen2_0 {mmu_autoAssignTlbPtrSz} {1}
    set_instance_parameter_value nios2_gen2_0 {mmu_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {mmu_processIDNumBits} {8}
    set_instance_parameter_value nios2_gen2_0 {mmu_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {mmu_tlbNumWays} {16}
    set_instance_parameter_value nios2_gen2_0 {mmu_tlbPtrSz} {7}
    set_instance_parameter_value nios2_gen2_0 {mmu_udtlbNumEntries} {6}
    set_instance_parameter_value nios2_gen2_0 {mmu_uitlbNumEntries} {4}
    set_instance_parameter_value nios2_gen2_0 {mpu_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {mpu_minDataRegionSize} {12}
    set_instance_parameter_value nios2_gen2_0 {mpu_minInstRegionSize} {12}
    set_instance_parameter_value nios2_gen2_0 {mpu_numOfDataRegion} {8}
    set_instance_parameter_value nios2_gen2_0 {mpu_numOfInstRegion} {8}
    set_instance_parameter_value nios2_gen2_0 {mpu_useLimit} {0}
    set_instance_parameter_value nios2_gen2_0 {mpx_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {mul_32_impl} {2}
    set_instance_parameter_value nios2_gen2_0 {mul_64_impl} {0}
    set_instance_parameter_value nios2_gen2_0 {mul_shift_choice} {0}
    set_instance_parameter_value nios2_gen2_0 {ocimem_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {ocimem_ramInit} {0}
    set_instance_parameter_value nios2_gen2_0 {regfile_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {register_file_por} {0}
    set_instance_parameter_value nios2_gen2_0 {resetOffset} {0}
    set_instance_parameter_value nios2_gen2_0 {resetSlave} {SDRAM.s1}
    set_instance_parameter_value nios2_gen2_0 {resetrequest_enabled} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_HBreakTest} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_HDLSimCachesCleared} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_activateMonitors} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_activateTestEndChecker} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_activateTrace} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_allow_break_inst} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_alwaysEncrypt} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_add_scan_mode_input} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_synopsys_translate_on_off} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_third_party_synthesis} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_avalonDebugPortPresent} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_bhtPtrSz} {8}
    set_instance_parameter_value nios2_gen2_0 {setting_bigEndian} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_branchpredictiontype} {Dynamic}
    set_instance_parameter_value nios2_gen2_0 {setting_breakslaveoveride} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_clearXBitsLDNonBypass} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_dc_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_disable_tmr_inj} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_disableocitrace} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_dtcm_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_ecc_present} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_ecc_sim_test_ports} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportHostDebugPort} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportPCB} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_export_large_RAMs} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportdebuginfo} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportvectors} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_fast_register_read} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_ic_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_interruptControllerType} {Internal}
    set_instance_parameter_value nios2_gen2_0 {setting_itcm_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_mmu_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_oci_export_jtag_signals} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_oci_version} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_preciseIllegalMemAccessException} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_removeRAMinit} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_rf_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_shadowRegisterSets} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_showInternalSettings} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_showUnpublishedSettings} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_support31bitdcachebypass} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_tmr_output_disable} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_usedesignware} {0}
    set_instance_parameter_value nios2_gen2_0 {shift_rot_impl} {1}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_0_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_0_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_1_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_1_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_2_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_2_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_3_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_3_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_0_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_0_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_1_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_1_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_2_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_2_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_3_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_3_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tmr_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {tracefilename} {}
    set_instance_parameter_value nios2_gen2_0 {userDefinedSettings} {}

    add_instance onchip_memory2_0 altera_avalon_onchip_memory2 18.1
    set_instance_parameter_value onchip_memory2_0 {allowInSystemMemoryContentEditor} {0}
    set_instance_parameter_value onchip_memory2_0 {blockType} {AUTO}
    set_instance_parameter_value onchip_memory2_0 {copyInitFile} {0}
    set_instance_parameter_value onchip_memory2_0 {dataWidth} {32}
    set_instance_parameter_value onchip_memory2_0 {dataWidth2} {32}
    set_instance_parameter_value onchip_memory2_0 {dualPort} {0}
    set_instance_parameter_value onchip_memory2_0 {ecc_enabled} {0}
    set_instance_parameter_value onchip_memory2_0 {enPRInitMode} {0}
    set_instance_parameter_value onchip_memory2_0 {enableDiffWidth} {0}
    set_instance_parameter_value onchip_memory2_0 {initMemContent} {1}
    set_instance_parameter_value onchip_memory2_0 {initializationFileName} {onchip_mem.hex}
    set_instance_parameter_value onchip_memory2_0 {instanceID} {NONE}
    set_instance_parameter_value onchip_memory2_0 {memorySize} {16.0}
    set_instance_parameter_value onchip_memory2_0 {readDuringWriteMode} {DONT_CARE}
    set_instance_parameter_value onchip_memory2_0 {resetrequest_enabled} {1}
    set_instance_parameter_value onchip_memory2_0 {simAllowMRAMContentsFile} {0}
    set_instance_parameter_value onchip_memory2_0 {simMemInitOnlyFilename} {0}
    set_instance_parameter_value onchip_memory2_0 {singleClockOperation} {0}
    set_instance_parameter_value onchip_memory2_0 {slave1Latency} {1}
    set_instance_parameter_value onchip_memory2_0 {slave2Latency} {1}
    set_instance_parameter_value onchip_memory2_0 {useNonDefaultInitFile} {0}
    set_instance_parameter_value onchip_memory2_0 {useShallowMemBlocks} {0}
    set_instance_parameter_value onchip_memory2_0 {writable} {1}

    add_instance sdram_pll altpll 18.1
    set_instance_parameter_value sdram_pll {AVALON_USE_SEPARATE_SYSCLK} {NO}
    set_instance_parameter_value sdram_pll {BANDWIDTH} {}
    set_instance_parameter_value sdram_pll {BANDWIDTH_TYPE} {AUTO}
    set_instance_parameter_value sdram_pll {CLK0_DIVIDE_BY} {1}
    set_instance_parameter_value sdram_pll {CLK0_DUTY_CYCLE} {50}
    set_instance_parameter_value sdram_pll {CLK0_MULTIPLY_BY} {1}
    set_instance_parameter_value sdram_pll {CLK0_PHASE_SHIFT} {0}
    set_instance_parameter_value sdram_pll {CLK1_DIVIDE_BY} {1}
    set_instance_parameter_value sdram_pll {CLK1_DUTY_CYCLE} {50}
    set_instance_parameter_value sdram_pll {CLK1_MULTIPLY_BY} {1}
    set_instance_parameter_value sdram_pll {CLK1_PHASE_SHIFT} {-1000}
    set_instance_parameter_value sdram_pll {CLK2_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK2_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK2_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK2_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {CLK3_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK3_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK3_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK3_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {CLK4_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK4_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK4_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK4_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {CLK5_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK5_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK5_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK5_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {CLK6_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK6_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK6_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK6_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {CLK7_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK7_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK7_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK7_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {CLK8_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK8_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK8_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK8_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {CLK9_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {CLK9_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {CLK9_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {CLK9_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {COMPENSATE_CLOCK} {CLK0}
    set_instance_parameter_value sdram_pll {DOWN_SPREAD} {}
    set_instance_parameter_value sdram_pll {DPA_DIVIDER} {}
    set_instance_parameter_value sdram_pll {DPA_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {DPA_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {ENABLE_SWITCH_OVER_COUNTER} {}
    set_instance_parameter_value sdram_pll {EXTCLK0_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK0_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {EXTCLK0_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK0_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {EXTCLK1_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK1_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {EXTCLK1_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK1_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {EXTCLK2_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK2_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {EXTCLK2_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK2_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {EXTCLK3_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK3_DUTY_CYCLE} {}
    set_instance_parameter_value sdram_pll {EXTCLK3_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {EXTCLK3_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {FEEDBACK_SOURCE} {}
    set_instance_parameter_value sdram_pll {GATE_LOCK_COUNTER} {}
    set_instance_parameter_value sdram_pll {GATE_LOCK_SIGNAL} {}
    set_instance_parameter_value sdram_pll {HIDDEN_CONSTANTS} {CT#PORT_clk5 PORT_UNUSED CT#PORT_clk4 PORT_UNUSED CT#PORT_clk3 PORT_UNUSED CT#PORT_clk2 PORT_UNUSED CT#PORT_clk1 PORT_USED CT#PORT_clk0 PORT_USED CT#CLK0_MULTIPLY_BY 1 CT#PORT_SCANWRITE PORT_UNUSED CT#PORT_SCANACLR PORT_UNUSED CT#PORT_PFDENA PORT_UNUSED CT#PORT_PLLENA PORT_UNUSED CT#PORT_SCANDATA PORT_UNUSED CT#PORT_SCANCLKENA PORT_UNUSED CT#WIDTH_CLOCK 5 CT#PORT_SCANDATAOUT PORT_UNUSED CT#LPM_TYPE altpll CT#PLL_TYPE AUTO CT#CLK0_PHASE_SHIFT 0 CT#CLK1_DUTY_CYCLE 50 CT#PORT_PHASEDONE PORT_UNUSED CT#OPERATION_MODE NORMAL CT#PORT_CONFIGUPDATE PORT_UNUSED CT#CLK1_MULTIPLY_BY 1 CT#COMPENSATE_CLOCK CLK0 CT#PORT_CLKSWITCH PORT_UNUSED CT#INCLK0_INPUT_FREQUENCY 20000 CT#PORT_SCANDONE PORT_UNUSED CT#PORT_CLKLOSS PORT_UNUSED CT#PORT_INCLK1 PORT_UNUSED CT#AVALON_USE_SEPARATE_SYSCLK NO CT#PORT_INCLK0 PORT_USED CT#PORT_clkena5 PORT_UNUSED CT#PORT_clkena4 PORT_UNUSED CT#PORT_clkena3 PORT_UNUSED CT#PORT_clkena2 PORT_UNUSED CT#PORT_clkena1 PORT_UNUSED CT#PORT_clkena0 PORT_UNUSED CT#CLK1_PHASE_SHIFT -1000 CT#PORT_ARESET PORT_UNUSED CT#BANDWIDTH_TYPE AUTO CT#INTENDED_DEVICE_FAMILY {MAX 10} CT#PORT_SCANREAD PORT_UNUSED CT#PORT_PHASESTEP PORT_UNUSED CT#PORT_SCANCLK PORT_UNUSED CT#PORT_CLKBAD1 PORT_UNUSED CT#PORT_CLKBAD0 PORT_UNUSED CT#PORT_FBIN PORT_UNUSED CT#PORT_PHASEUPDOWN PORT_UNUSED CT#PORT_extclk3 PORT_UNUSED CT#PORT_extclk2 PORT_UNUSED CT#PORT_extclk1 PORT_UNUSED CT#PORT_PHASECOUNTERSELECT PORT_UNUSED CT#PORT_extclk0 PORT_UNUSED CT#PORT_ACTIVECLOCK PORT_UNUSED CT#CLK0_DUTY_CYCLE 50 CT#CLK0_DIVIDE_BY 1 CT#CLK1_DIVIDE_BY 1 CT#PORT_LOCKED PORT_UNUSED}
    set_instance_parameter_value sdram_pll {HIDDEN_CUSTOM_ELABORATION} {altpll_avalon_elaboration}
    set_instance_parameter_value sdram_pll {HIDDEN_CUSTOM_POST_EDIT} {altpll_avalon_post_edit}
    set_instance_parameter_value sdram_pll {HIDDEN_IF_PORTS} {IF#phasecounterselect {input 3} IF#locked {output 0} IF#reset {input 0} IF#clk {input 0} IF#phaseupdown {input 0} IF#scandone {output 0} IF#readdata {output 32} IF#write {input 0} IF#scanclk {input 0} IF#phasedone {output 0} IF#c4 {output 0} IF#c3 {output 0} IF#c2 {output 0} IF#address {input 2} IF#c1 {output 0} IF#c0 {output 0} IF#writedata {input 32} IF#read {input 0} IF#areset {input 0} IF#scanclkena {input 0} IF#scandataout {output 0} IF#configupdate {input 0} IF#phasestep {input 0} IF#scandata {input 0}}
    set_instance_parameter_value sdram_pll {HIDDEN_IS_FIRST_EDIT} {0}
    set_instance_parameter_value sdram_pll {HIDDEN_IS_NUMERIC} {IN#WIDTH_CLOCK 1 IN#CLK0_DUTY_CYCLE 1 IN#PLL_TARGET_HARCOPY_CHECK 1 IN#CLK1_MULTIPLY_BY 1 IN#SWITCHOVER_COUNT_EDIT 1 IN#INCLK0_INPUT_FREQUENCY 1 IN#PLL_LVDS_PLL_CHECK 1 IN#PLL_AUTOPLL_CHECK 1 IN#PLL_FASTPLL_CHECK 1 IN#CLK1_DUTY_CYCLE 1 IN#PLL_ENHPLL_CHECK 1 IN#DIV_FACTOR1 1 IN#DIV_FACTOR0 1 IN#LVDS_MODE_DATA_RATE_DIRTY 1 IN#GLOCK_COUNTER_EDIT 1 IN#CLK0_DIVIDE_BY 1 IN#MULT_FACTOR1 1 IN#MULT_FACTOR0 1 IN#CLK0_MULTIPLY_BY 1 IN#USE_MIL_SPEED_GRADE 1 IN#CLK1_DIVIDE_BY 1}
    set_instance_parameter_value sdram_pll {HIDDEN_MF_PORTS} {MF#areset 1 MF#clk 1 MF#locked 1 MF#inclk 1}
    set_instance_parameter_value sdram_pll {HIDDEN_PRIVATES} {PT#GLOCKED_FEATURE_ENABLED 0 PT#SPREAD_FEATURE_ENABLED 0 PT#BANDWIDTH_FREQ_UNIT MHz PT#CUR_DEDICATED_CLK c0 PT#INCLK0_FREQ_EDIT 50.000 PT#BANDWIDTH_PRESET Low PT#PLL_LVDS_PLL_CHECK 0 PT#BANDWIDTH_USE_PRESET 0 PT#AVALON_USE_SEPARATE_SYSCLK NO PT#PLL_ENHPLL_CHECK 0 PT#OUTPUT_FREQ_UNIT1 MHz PT#OUTPUT_FREQ_UNIT0 MHz PT#PHASE_RECONFIG_FEATURE_ENABLED 1 PT#CREATE_CLKBAD_CHECK 0 PT#CLKSWITCH_CHECK 0 PT#INCLK1_FREQ_EDIT 100.000 PT#NORMAL_MODE_RADIO 1 PT#SRC_SYNCH_COMP_RADIO 0 PT#PLL_ARESET_CHECK 0 PT#LONG_SCAN_RADIO 1 PT#SCAN_FEATURE_ENABLED 1 PT#PHASE_RECONFIG_INPUTS_CHECK 0 PT#USE_CLK1 1 PT#USE_CLK0 1 PT#PRIMARY_CLK_COMBO inclk0 PT#BANDWIDTH 1.000 PT#GLOCKED_COUNTER_EDIT_CHANGED 1 PT#PLL_FASTPLL_CHECK 0 PT#SPREAD_FREQ_UNIT KHz PT#PLL_AUTOPLL_CHECK 1 PT#LVDS_PHASE_SHIFT_UNIT1 deg PT#LVDS_PHASE_SHIFT_UNIT0 deg PT#OUTPUT_FREQ_MODE1 1 PT#SWITCHOVER_FEATURE_ENABLED 0 PT#MIG_DEVICE_SPEED_GRADE Any PT#OUTPUT_FREQ_MODE0 1 PT#BANDWIDTH_FEATURE_ENABLED 1 PT#INCLK0_FREQ_UNIT_COMBO MHz PT#ZERO_DELAY_RADIO 0 PT#OUTPUT_FREQ1 50.00000000 PT#OUTPUT_FREQ0 50.00000000 PT#SHORT_SCAN_RADIO 0 PT#LVDS_MODE_DATA_RATE_DIRTY 0 PT#CUR_FBIN_CLK c0 PT#PLL_ADVANCED_PARAM_CHECK 0 PT#CLKBAD_SWITCHOVER_CHECK 0 PT#PHASE_SHIFT_STEP_ENABLED_CHECK 0 PT#DEVICE_SPEED_GRADE 7 PT#PLL_FBMIMIC_CHECK 0 PT#LVDS_MODE_DATA_RATE {Not Available} PT#LOCKED_OUTPUT_CHECK 0 PT#SPREAD_PERCENT 0.500 PT#PHASE_SHIFT1 -1.00000000 PT#PHASE_SHIFT0 0.00000000 PT#DIV_FACTOR1 1 PT#DIV_FACTOR0 1 PT#CNX_NO_COMPENSATE_RADIO 0 PT#USE_CLKENA1 0 PT#USE_CLKENA0 0 PT#CREATE_INCLK1_CHECK 0 PT#GLOCK_COUNTER_EDIT 1048575 PT#INCLK1_FREQ_UNIT_COMBO MHz PT#EFF_OUTPUT_FREQ_VALUE1 50.000000 PT#EFF_OUTPUT_FREQ_VALUE0 50.000000 PT#SPREAD_FREQ 50.000 PT#USE_MIL_SPEED_GRADE 0 PT#EXPLICIT_SWITCHOVER_COUNTER 0 PT#STICKY_CLK4 0 PT#STICKY_CLK3 0 PT#STICKY_CLK2 0 PT#STICKY_CLK1 1 PT#STICKY_CLK0 1 PT#EXT_FEEDBACK_RADIO 0 PT#MIRROR_CLK1 0 PT#MIRROR_CLK0 0 PT#SWITCHOVER_COUNT_EDIT 1 PT#SELF_RESET_LOCK_LOSS 0 PT#PLL_PFDENA_CHECK 0 PT#INT_FEEDBACK__MODE_RADIO 1 PT#INCLK1_FREQ_EDIT_CHANGED 1 PT#CLKLOSS_CHECK 0 PT#SYNTH_WRAPPER_GEN_POSTFIX 0 PT#PHASE_SHIFT_UNIT1 ns PT#PHASE_SHIFT_UNIT0 deg PT#BANDWIDTH_USE_AUTO 1 PT#HAS_MANUAL_SWITCHOVER 1 PT#MULT_FACTOR1 1 PT#MULT_FACTOR0 1 PT#SPREAD_USE 0 PT#GLOCKED_MODE_CHECK 0 PT#SACN_INPUTS_CHECK 0 PT#DUTY_CYCLE1 50.00000000 PT#INTENDED_DEVICE_FAMILY {MAX 10} PT#DUTY_CYCLE0 50.00000000 PT#PLL_TARGET_HARCOPY_CHECK 0 PT#INCLK1_FREQ_UNIT_CHANGED 1 PT#RECONFIG_FILE ALTPLL1646793540550309.mif PT#ACTIVECLK_CHECK 0}
    set_instance_parameter_value sdram_pll {HIDDEN_USED_PORTS} {UP#locked used UP#c1 used UP#c0 used UP#areset used UP#inclk0 used}
    set_instance_parameter_value sdram_pll {INCLK0_INPUT_FREQUENCY} {20000}
    set_instance_parameter_value sdram_pll {INCLK1_INPUT_FREQUENCY} {}
    set_instance_parameter_value sdram_pll {INTENDED_DEVICE_FAMILY} {MAX 10}
    set_instance_parameter_value sdram_pll {INVALID_LOCK_MULTIPLIER} {}
    set_instance_parameter_value sdram_pll {LOCK_HIGH} {}
    set_instance_parameter_value sdram_pll {LOCK_LOW} {}
    set_instance_parameter_value sdram_pll {OPERATION_MODE} {NORMAL}
    set_instance_parameter_value sdram_pll {PLL_TYPE} {AUTO}
    set_instance_parameter_value sdram_pll {PORT_ACTIVECLOCK} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_ARESET} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_CLKBAD0} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_CLKBAD1} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_CLKLOSS} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_CLKSWITCH} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_CONFIGUPDATE} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_ENABLE0} {}
    set_instance_parameter_value sdram_pll {PORT_ENABLE1} {}
    set_instance_parameter_value sdram_pll {PORT_FBIN} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_FBOUT} {}
    set_instance_parameter_value sdram_pll {PORT_INCLK0} {PORT_USED}
    set_instance_parameter_value sdram_pll {PORT_INCLK1} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_LOCKED} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_PFDENA} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_PHASECOUNTERSELECT} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_PHASEDONE} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_PHASESTEP} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_PHASEUPDOWN} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_PLLENA} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANACLR} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANCLK} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANCLKENA} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANDATA} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANDATAOUT} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANDONE} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANREAD} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCANWRITE} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_SCLKOUT0} {}
    set_instance_parameter_value sdram_pll {PORT_SCLKOUT1} {}
    set_instance_parameter_value sdram_pll {PORT_VCOOVERRANGE} {}
    set_instance_parameter_value sdram_pll {PORT_VCOUNDERRANGE} {}
    set_instance_parameter_value sdram_pll {PORT_clk0} {PORT_USED}
    set_instance_parameter_value sdram_pll {PORT_clk1} {PORT_USED}
    set_instance_parameter_value sdram_pll {PORT_clk2} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clk3} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clk4} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clk5} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clk6} {}
    set_instance_parameter_value sdram_pll {PORT_clk7} {}
    set_instance_parameter_value sdram_pll {PORT_clk8} {}
    set_instance_parameter_value sdram_pll {PORT_clk9} {}
    set_instance_parameter_value sdram_pll {PORT_clkena0} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clkena1} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clkena2} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clkena3} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clkena4} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_clkena5} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_extclk0} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_extclk1} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_extclk2} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_extclk3} {PORT_UNUSED}
    set_instance_parameter_value sdram_pll {PORT_extclkena0} {}
    set_instance_parameter_value sdram_pll {PORT_extclkena1} {}
    set_instance_parameter_value sdram_pll {PORT_extclkena2} {}
    set_instance_parameter_value sdram_pll {PORT_extclkena3} {}
    set_instance_parameter_value sdram_pll {PRIMARY_CLOCK} {}
    set_instance_parameter_value sdram_pll {QUALIFY_CONF_DONE} {}
    set_instance_parameter_value sdram_pll {SCAN_CHAIN} {}
    set_instance_parameter_value sdram_pll {SCAN_CHAIN_MIF_FILE} {}
    set_instance_parameter_value sdram_pll {SCLKOUT0_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {SCLKOUT1_PHASE_SHIFT} {}
    set_instance_parameter_value sdram_pll {SELF_RESET_ON_GATED_LOSS_LOCK} {}
    set_instance_parameter_value sdram_pll {SELF_RESET_ON_LOSS_LOCK} {}
    set_instance_parameter_value sdram_pll {SKIP_VCO} {}
    set_instance_parameter_value sdram_pll {SPREAD_FREQUENCY} {}
    set_instance_parameter_value sdram_pll {SWITCH_OVER_COUNTER} {}
    set_instance_parameter_value sdram_pll {SWITCH_OVER_ON_GATED_LOCK} {}
    set_instance_parameter_value sdram_pll {SWITCH_OVER_ON_LOSSCLK} {}
    set_instance_parameter_value sdram_pll {SWITCH_OVER_TYPE} {}
    set_instance_parameter_value sdram_pll {USING_FBMIMICBIDIR_PORT} {}
    set_instance_parameter_value sdram_pll {VALID_LOCK_MULTIPLIER} {}
    set_instance_parameter_value sdram_pll {VCO_DIVIDE_BY} {}
    set_instance_parameter_value sdram_pll {VCO_FREQUENCY_CONTROL} {}
    set_instance_parameter_value sdram_pll {VCO_MULTIPLY_BY} {}
    set_instance_parameter_value sdram_pll {VCO_PHASE_SHIFT_STEP} {}
    set_instance_parameter_value sdram_pll {WIDTH_CLOCK} {5}
    set_instance_parameter_value sdram_pll {WIDTH_PHASECOUNTERSELECT} {}

    add_instance sysid_qsys_0 altera_avalon_sysid_qsys 18.1
    set_instance_parameter_value sysid_qsys_0 {id} {0}

    # connections and connection parameters
    add_connection clk_0.clk led.clk clock

    add_connection clk_0.clk nios2_gen2_0.clk clock

    add_connection clk_0.clk onchip_memory2_0.clk1 clock

    add_connection clk_0.clk sdram_pll.inclk_interface clock

    add_connection clk_0.clk sysid_qsys_0.clk clock

    add_connection clk_0.clk_reset SDRAM.reset reset

    add_connection clk_0.clk_reset led.reset reset

    add_connection clk_0.clk_reset nios2_gen2_0.reset reset

    add_connection clk_0.clk_reset onchip_memory2_0.reset1 reset

    add_connection clk_0.clk_reset sdram_pll.inclk_interface_reset reset

    add_connection clk_0.clk_reset sysid_qsys_0.reset reset

    add_connection nios2_gen2_0.data_master SDRAM.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/SDRAM.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/SDRAM.s1 baseAddress {0x08000000}
    set_connection_parameter_value nios2_gen2_0.data_master/SDRAM.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master led.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/led.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/led.s1 baseAddress {0x0040}
    set_connection_parameter_value nios2_gen2_0.data_master/led.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master nios2_gen2_0.debug_mem_slave avalon
    set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave baseAddress {0x1000}
    set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave defaultConnection {0}

    add_connection nios2_gen2_0.data_master onchip_memory2_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 baseAddress {0x0000}
    set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master sdram_pll.pll_slave avalon
    set_connection_parameter_value nios2_gen2_0.data_master/sdram_pll.pll_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/sdram_pll.pll_slave baseAddress {0x0030}
    set_connection_parameter_value nios2_gen2_0.data_master/sdram_pll.pll_slave defaultConnection {0}

    add_connection nios2_gen2_0.data_master sysid_qsys_0.control_slave avalon
    set_connection_parameter_value nios2_gen2_0.data_master/sysid_qsys_0.control_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/sysid_qsys_0.control_slave baseAddress {0x0058}
    set_connection_parameter_value nios2_gen2_0.data_master/sysid_qsys_0.control_slave defaultConnection {0}

    add_connection nios2_gen2_0.debug_reset_request SDRAM.reset reset

    add_connection nios2_gen2_0.debug_reset_request led.reset reset

    add_connection nios2_gen2_0.debug_reset_request nios2_gen2_0.reset reset

    add_connection nios2_gen2_0.debug_reset_request onchip_memory2_0.reset1 reset

    add_connection nios2_gen2_0.debug_reset_request sdram_pll.inclk_interface_reset reset

    add_connection nios2_gen2_0.debug_reset_request sysid_qsys_0.reset reset

    add_connection nios2_gen2_0.instruction_master SDRAM.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/SDRAM.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/SDRAM.s1 baseAddress {0x08000000}
    set_connection_parameter_value nios2_gen2_0.instruction_master/SDRAM.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master led.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/led.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/led.s1 baseAddress {0x0040}
    set_connection_parameter_value nios2_gen2_0.instruction_master/led.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master nios2_gen2_0.debug_mem_slave avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave baseAddress {0x1000}
    set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master onchip_memory2_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 baseAddress {0x0000}
    set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master sdram_pll.pll_slave avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/sdram_pll.pll_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/sdram_pll.pll_slave baseAddress {0x0030}
    set_connection_parameter_value nios2_gen2_0.instruction_master/sdram_pll.pll_slave defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master sysid_qsys_0.control_slave avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/sysid_qsys_0.control_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/sysid_qsys_0.control_slave baseAddress {0x0058}
    set_connection_parameter_value nios2_gen2_0.instruction_master/sysid_qsys_0.control_slave defaultConnection {0}

    add_connection sdram_pll.c0 SDRAM.clk clock

    # exported interfaces
    add_interface clk clock sink
    set_interface_property clk EXPORT_OF clk_0.clk_in
    add_interface led_wire conduit end
    set_interface_property led_wire EXPORT_OF led.external_connection
    add_interface reset reset sink
    set_interface_property reset EXPORT_OF clk_0.clk_in_reset
    add_interface sdram_clk clock source
    set_interface_property sdram_clk EXPORT_OF sdram_pll.c1
    add_interface sdram_wire conduit end
    set_interface_property sdram_wire EXPORT_OF SDRAM.wire

    # interconnect requirements
    set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
    set_interconnect_requirement {$system} {qsys_mm.enableEccProtection} {FALSE}
    set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}
    set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}
}
