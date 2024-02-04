---
meta:
  id: mxl
  endian: be
doc-ref: |
  https://docs.google.com/spreadsheets/d/1mGekVQyf4Ozlf6UqojZk0ji02DwLLDFp3S1XTffvqGk/edit#gid=1694629037
  https://drive.google.com/file/d/1XduQg8NTiXD0MORRmrdjMPdAokTbSP_1/view
  https://drive.google.com/file/d/1mv0lSleUe6LL0O4OmI-LSaQlulIeozMu/view
  https://docs.google.com/spreadsheets/d/1kTfqIfh5AEzD56a7lo57BiqL4Rb87qpOVoilp4uiptA/edit#gid=547446560
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field primary_id: ax25_frame.payload.ax25_info.rap_header.primary_id
  :field secondary_id: ax25_frame.payload.ax25_info.rap_header.secondary_id
  :field flags: ax25_frame.payload.ax25_info.rap_header.flags
  :field packet_length: ax25_frame.payload.ax25_info.rap_header.packet_length
  :field header_checksum: ax25_frame.payload.ax25_info.rap_header.header_checksum
  :field spacecraft: ax25_frame.payload.ax25_info.rap_header.spacecraft
  :field operation_mode: ax25_frame.payload.ax25_info.payload.tbex_beacon.operation_mode
  :field rtc_unix_time: ax25_frame.payload.ax25_info.payload.tbex_beacon.rtc_unix_time
  :field numresets: ax25_frame.payload.ax25_info.payload.tbex_beacon.numresets
  :field avgnumactivetasks1: ax25_frame.payload.ax25_info.payload.tbex_beacon.avgnumactivetasks1
  :field avgnumactivetasks5: ax25_frame.payload.ax25_info.payload.tbex_beacon.avgnumactivetasks5
  :field avgnumactivetasks15: ax25_frame.payload.ax25_info.payload.tbex_beacon.avgnumactivetasks15
  :field totnumprocesses: ax25_frame.payload.ax25_info.payload.tbex_beacon.totnumprocesses
  :field usedmemminuscache: ax25_frame.payload.ax25_info.payload.tbex_beacon.usedmemminuscache
  :field freemempluscache: ax25_frame.payload.ax25_info.payload.tbex_beacon.freemempluscache
  :field sd_usage: ax25_frame.payload.ax25_info.payload.tbex_beacon.sd_usage
  :field datamnt_usage: ax25_frame.payload.ax25_info.payload.tbex_beacon.datamnt_usage
  :field stamp_gpio_states: ax25_frame.payload.ax25_info.payload.tbex_beacon.stamp_gpio_states
  :field ioe_states: ax25_frame.payload.ax25_info.payload.tbex_beacon.ioe_states
  :field lithium_op_count: ax25_frame.payload.ax25_info.payload.tbex_beacon.lithium_op_count
  :field lithium_msp430_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.lithium_msp430_temp
  :field lithium_rssi: ax25_frame.payload.ax25_info.payload.tbex_beacon.lithium_rssi
  :field lithium_rx: ax25_frame.payload.ax25_info.payload.tbex_beacon.lithium_rx
  :field lithium_tx: ax25_frame.payload.ax25_info.payload.tbex_beacon.lithium_tx
  :field fcpu_processor_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_processor_temp
  :field lithium_pa_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.lithium_pa_temp
  :field li_3v3_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.li_3v3_voltage
  :field fcpu_3v3_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_3v3_current
  :field li_3v3_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.li_3v3_current
  :field fcpu_3v3_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_3v3_voltage
  :field li_vbatt_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.li_vbatt_voltage
  :field li_vbatt_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.li_vbatt_current
  :field sd_imon_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.sd_imon_1
  :field sd_imon_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.sd_imon_2
  :field sd_imon_3: ax25_frame.payload.ax25_info.payload.tbex_beacon.sd_imon_3
  :field sd_imon_4: ax25_frame.payload.ax25_info.payload.tbex_beacon.sd_imon_4
  :field battery_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.battery_voltage
  :field battery_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.battery_current
  :field battery_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.battery_temperature
  :field battery_bus_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.battery_bus_voltage
  :field battery_bus_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.battery_bus_current
  :field bus_voltage_5v: ax25_frame.payload.ax25_info.payload.tbex_beacon.bus_voltage_5v
  :field bus_current_5v: ax25_frame.payload.ax25_info.payload.tbex_beacon.bus_current_5v
  :field input_current_5v: ax25_frame.payload.ax25_info.payload.tbex_beacon.input_current_5v
  :field bus_voltage_3_3v: ax25_frame.payload.ax25_info.payload.tbex_beacon.bus_voltage_3_3v
  :field bus_current_3_3v: ax25_frame.payload.ax25_info.payload.tbex_beacon.bus_current_3_3v
  :field input_current_3_3v: ax25_frame.payload.ax25_info.payload.tbex_beacon.input_current_3_3v
  :field output_regulator_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.output_regulator_temperature
  :field eps_5v_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.eps_5v_voltage
  :field eps_5v_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.eps_5v_current
  :field eps_3_3_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.eps_3_3_voltage
  :field eps_3_3v_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.eps_3_3v_current
  :field channel_1_panel_voltage_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_panel_voltage_a
  :field channel_1_panel_voltage_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_panel_voltage_b
  :field channel_1_panel_current_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_panel_current_a
  :field channel_1_panel_current_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_panel_current_b
  :field channel_1_output_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_output_current
  :field channel_1_output_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_output_voltage
  :field channel_1_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_board_temperature
  :field channel_1_module_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_1_module_temperature
  :field channel_2_panel_voltage_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_panel_voltage_a
  :field channel_2_panel_voltage_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_panel_voltage_b
  :field channel_2_panel_current_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_panel_current_a
  :field channel_2_panel_current_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_panel_current_b
  :field channel_2_output_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_output_current
  :field channel_2_output_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_output_voltage
  :field channel_2_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_board_temperature
  :field channel_2_module_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_2_module_temperature
  :field channel_3_panel_voltage_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_panel_voltage_a
  :field channel_3_panel_voltage_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_panel_voltage_b
  :field channel_3_panel_current_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_panel_current_a
  :field channel_3_panel_current_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_panel_current_b
  :field channel_3_output_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_output_current
  :field channel_3_output_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_output_voltage
  :field channel_3_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_board_temperature
  :field channel_3_module_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_3_module_temperature
  :field channel_4_panel_voltage_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_panel_voltage_a
  :field channel_4_panel_voltage_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_panel_voltage_b
  :field channel_4_panel_current_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_panel_current_a
  :field channel_4_panel_current_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_panel_current_b
  :field channel_4_output_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_output_current
  :field channel_4_output_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_output_voltage
  :field channel_4_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_board_temperature
  :field channel_4_module_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_4_module_temperature
  :field channel_5_module_input_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_5_module_input_voltage
  :field channel_5_panel_current_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_5_panel_current_a
  :field channel_5_panel_current_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_5_panel_current_b
  :field channel_5_output_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_5_output_current
  :field channel_5_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_5_board_temperature
  :field channel_5_module_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_5_module_temperature
  :field channel_6_module_input_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_6_module_input_voltage
  :field channel_6_panel_current_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_6_panel_current_a
  :field channel_6_panel_current_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_6_panel_current_b
  :field channel_6_output_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_6_output_current
  :field channel_6_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_6_board_temperature
  :field channel_6_module_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.channel_6_module_temperature
  :field adcs_5v_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_5v_voltage
  :field adcs_5v_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_5v_current
  :field adcs_3v3_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_3v3_voltage
  :field adcs_3v3_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_3v3_current
  :field adcs_vbatt_curent: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_vbatt_curent
  :field adcs_vbatt_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_vbatt_voltage
  :field adcs_temp_0: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_temp_0
  :field adcs_temp_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.adcs_temp_1
  :field eimu_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.eimu_current
  :field adc_curr: ax25_frame.payload.ax25_info.payload.tbex_beacon.adc_curr
  :field sd_v: ax25_frame.payload.ax25_info.payload.tbex_beacon.sd_v
  :field fcpu_var_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_1
  :field fcpu_var_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_2
  :field fcpu_var_3: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_3
  :field fcpu_var_4: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_4
  :field fcpu_var_5: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_5
  :field fcpu_var_6: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_6
  :field tbex_payload_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.tbex_payload_current
  :field tbex_payload_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.tbex_payload_voltage
  :field pim_3v3_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.pim_3v3_current
  :field pim_3v3_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.pim_3v3_voltage
  :field pim_vbatt_monitor: ax25_frame.payload.ax25_info.payload.tbex_beacon.pim_vbatt_monitor
  :field pim_bus_3v3_voltag: ax25_frame.payload.ax25_info.payload.tbex_beacon.pim_bus_3v3_voltag
  :field rtc_unix_time_beacon_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.rtc_unix_time_beacon_2
  :field numresets_beacon_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.numresets_beacon_2
  :field stamp_gpio_states_abbreviated: ax25_frame.payload.ax25_info.payload.tbex_beacon.stamp_gpio_states_abbreviated
  :field fcpu_var_7: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_7
  :field fcpu_var_8: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_8
  :field fcpu_var_9: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_9
  :field fcpu_var_10: ax25_frame.payload.ax25_info.payload.tbex_beacon.fcpu_var_10
  :field command_received_from_fcpu: ax25_frame.payload.ax25_info.payload.tbex_beacon.command_received_from_fcpu
  :field nx_wing_magnetometer_x: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_wing_magnetometer_x
  :field nx_wing_magnetometer_y: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_wing_magnetometer_y
  :field nx_wing_magnetometer_z: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_wing_magnetometer_z
  :field px_wing_magnetometer_x: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_wing_magnetometer_x
  :field px_wing_magnetometer_y: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_wing_magnetometer_y
  :field px_wing_magnetometer_z: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_wing_magnetometer_z
  :field py_body_magnetometer_x: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_magnetometer_x
  :field py_body_magnetometer_y: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_magnetometer_y
  :field py_body_magnetometer_z: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_magnetometer_z
  :field ny_body_magnetometer_x: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_magnetometer_x
  :field ny_body_magnetometer_y: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_magnetometer_y
  :field ny_body_magnetometer_z: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_magnetometer_z
  :field py_body_cell_voltage_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_cell_voltage_1
  :field py_body_cell_voltage_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_cell_voltage_2
  :field py_body_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_panel_circuitry_current
  :field py_body_internal_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_internal_temp
  :field py_body_external_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_external_temp
  :field ny_body_cell_voltage_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_cell_voltage_1
  :field ny_body_cell_voltage_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_cell_voltage_2
  :field ny_body_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_panel_circuitry_current
  :field ny_body_internal_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_internal_temp
  :field ny_body_external_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_external_temp
  :field nx_body_cell_voltage_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_body_cell_voltage_1
  :field nx_body_cell_voltage_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_body_cell_voltage_2
  :field nx_body_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_body_panel_circuitry_current
  :field nx_body_internal_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_body_internal_temp
  :field nx_body_external_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_body_external_temp
  :field px_body_cell_voltage_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_body_cell_voltage_1
  :field px_body_cell_voltage_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_body_cell_voltage_2
  :field px_body_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_body_panel_circuitry_current
  :field px_body_internal_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_body_internal_temp
  :field px_body_external_temp: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_body_external_temp
  :field nx_deployable_temp_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_deployable_temp_1
  :field nx_deployable_temp_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_deployable_temp_2
  :field nx_deployable_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_deployable_panel_circuitry_current
  :field px_deployable_temp_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_deployable_temp_1
  :field px_deployable_temp_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_deployable_temp_2
  :field px_deployable_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_deployable_panel_circuitry_current
  :field py_deployable_temp_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_deployable_temp_1
  :field py_deployable_temp_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_deployable_temp_2
  :field py_deployable_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_deployable_panel_circuitry_current
  :field ny_deployable_temp_1: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_deployable_temp_1
  :field ny_deployable_temp_2: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_deployable_temp_2
  :field ny_deployable_panel_circuitry_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_deployable_panel_circuitry_current
  :field nx_wing_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_wing_photodiode_a
  :field nx_wing_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_wing_photodiode_b
  :field px_wing_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_wing_photodiode_a
  :field px_wing_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_wing_photodiode_b
  :field py_body_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_photodiode_a
  :field py_body_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_body_photodiode_b
  :field ny_body_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_photodiode_a
  :field ny_body_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_body_photodiode_b
  :field py_wing_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_wing_photodiode_a
  :field py_wing_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.py_wing_photodiode_b
  :field ny_wing_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_wing_photodiode_a
  :field ny_wing_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.ny_wing_photodiode_b
  :field nx_body_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_body_photodiode_a
  :field nx_body_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.nx_body_photodiode_b
  :field px_body_photodiode_a: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_body_photodiode_a
  :field px_body_photodiode_b: ax25_frame.payload.ax25_info.payload.tbex_beacon.px_body_photodiode_b
  :field gyro_4_x: ax25_frame.payload.ax25_info.payload.tbex_beacon.gyro_4_x
  :field gyro_4_y: ax25_frame.payload.ax25_info.payload.tbex_beacon.gyro_4_y
  :field gyro_4_z: ax25_frame.payload.ax25_info.payload.tbex_beacon.gyro_4_z
  :field eimu_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.eimu_temperature
  :field wheel_x_speed: ax25_frame.payload.ax25_info.payload.tbex_beacon.wheel_x_speed
  :field wheel_y_speed: ax25_frame.payload.ax25_info.payload.tbex_beacon.wheel_y_speed
  :field wheel_z_speed: ax25_frame.payload.ax25_info.payload.tbex_beacon.wheel_z_speed
  :field tcb_temp_0: ax25_frame.payload.ax25_info.payload.tbex_beacon.tcb_temp_0
  :field tcb_3v3_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.tcb_3v3_current
  :field tcb_vbatt_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.tcb_vbatt_current
  :field input_current: ax25_frame.payload.ax25_info.payload.tbex_beacon.input_current
  :field input_voltage: ax25_frame.payload.ax25_info.payload.tbex_beacon.input_voltage
  :field voltage_5_5: ax25_frame.payload.ax25_info.payload.tbex_beacon.voltage_5_5
  :field voltage_3_0: ax25_frame.payload.ax25_info.payload.tbex_beacon.voltage_3_0
  :field voltage_3_3: ax25_frame.payload.ax25_info.payload.tbex_beacon.voltage_3_3
  :field rf_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.rf_board_temperature
  :field control_board_temperature: ax25_frame.payload.ax25_info.payload.tbex_beacon.control_board_temperature
  :field vhf_channel_forward_power: ax25_frame.payload.ax25_info.payload.tbex_beacon.vhf_channel_forward_power
  :field uhf_channel_forward_power: ax25_frame.payload.ax25_info.payload.tbex_beacon.uhf_channel_forward_power
  :field l_band_channel_forward_power: ax25_frame.payload.ax25_info.payload.tbex_beacon.l_band_channel_forward_power
  :field vhf_channel_reverse_power: ax25_frame.payload.ax25_info.payload.tbex_beacon.vhf_channel_reverse_power
  :field uhf_channel_reverse_power: ax25_frame.payload.ax25_info.payload.tbex_beacon.uhf_channel_reverse_power
  :field l_band_channel_reverse_power: ax25_frame.payload.ax25_info.payload.tbex_beacon.l_band_channel_reverse_power
  :field pll_config_mask: ax25_frame.payload.ax25_info.payload.tbex_beacon.pll_config_mask
  :field ppu_reset_count: ax25_frame.payload.ax25_info.payload.tbex_beacon.ppu_reset_count
  :field status_mask: ax25_frame.payload.ax25_info.payload.tbex_beacon.status_mask
  :field error_mask: ax25_frame.payload.ax25_info.payload.tbex_beacon.error_mask
  :field rtc_unix_time: ax25_frame.payload.ax25_info.payload.grifex_beacon.rtc_unix_time
  :field numresets: ax25_frame.payload.ax25_info.payload.grifex_beacon.numresets
  :field avgnumactivetasks1: ax25_frame.payload.ax25_info.payload.grifex_beacon.avgnumactivetasks1
  :field avgnumactivetasks5: ax25_frame.payload.ax25_info.payload.grifex_beacon.avgnumactivetasks5
  :field avgnumactivetasks15: ax25_frame.payload.ax25_info.payload.grifex_beacon.avgnumactivetasks15
  :field curnumrunnabletasks: ax25_frame.payload.ax25_info.payload.grifex_beacon.curnumrunnabletasks
  :field totnumprocesses: ax25_frame.payload.ax25_info.payload.grifex_beacon.totnumprocesses
  :field lastprocesspid: ax25_frame.payload.ax25_info.payload.grifex_beacon.lastprocesspid
  :field totmem: ax25_frame.payload.ax25_info.payload.grifex_beacon.totmem
  :field freemem: ax25_frame.payload.ax25_info.payload.grifex_beacon.freemem
  :field adcs_enable_status: ax25_frame.payload.ax25_info.payload.grifex_beacon.adcs_enable_status
  :field sd_usage: ax25_frame.payload.ax25_info.payload.grifex_beacon.sd_usage
  :field datamnt_usage: ax25_frame.payload.ax25_info.payload.grifex_beacon.datamnt_usage
  :field lithium_op_count: ax25_frame.payload.ax25_info.payload.grifex_beacon.lithium_op_count
  :field lithium_msp430_temp: ax25_frame.payload.ax25_info.payload.grifex_beacon.lithium_msp430_temp
  :field lithium_rssi: ax25_frame.payload.ax25_info.payload.grifex_beacon.lithium_rssi
  :field lithium_rx: ax25_frame.payload.ax25_info.payload.grifex_beacon.lithium_rx
  :field lithium_tx: ax25_frame.payload.ax25_info.payload.grifex_beacon.lithium_tx
  :field fcpu_temp_0: ax25_frame.payload.ax25_info.payload.grifex_beacon.fcpu_temp_0
  :field fcpu_temp_1: ax25_frame.payload.ax25_info.payload.grifex_beacon.fcpu_temp_1
  :field li_3v3_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.li_3v3_voltage
  :field fcpu_3v3_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.fcpu_3v3_current
  :field li_3v3_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.li_3v3_current
  :field fcpu_3v3_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.fcpu_3v3_voltage
  :field li_vbatt_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.li_vbatt_voltage
  :field li_vbatt_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.li_vbatt_current
  :field battery_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.battery_voltage
  :field battery_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.battery_current
  :field battery_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.battery_temperature
  :field battery_bus_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.battery_bus_voltage
  :field battery_bus_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.battery_bus_current
  :field bus_voltage_5v: ax25_frame.payload.ax25_info.payload.grifex_beacon.bus_voltage_5v
  :field bus_current_5v: ax25_frame.payload.ax25_info.payload.grifex_beacon.bus_current_5v
  :field input_current_5v: ax25_frame.payload.ax25_info.payload.grifex_beacon.input_current_5v
  :field bus_voltage_3_3v: ax25_frame.payload.ax25_info.payload.grifex_beacon.bus_voltage_3_3v
  :field bus_current_3_3v: ax25_frame.payload.ax25_info.payload.grifex_beacon.bus_current_3_3v
  :field input_current_3_3v: ax25_frame.payload.ax25_info.payload.grifex_beacon.input_current_3_3v
  :field output_regulator_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.output_regulator_temperature
  :field eps_5v_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.eps_5v_voltage
  :field eps_5v_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.eps_5v_current
  :field eps_3_3_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.eps_3_3_voltage
  :field eps_3_3v_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.eps_3_3v_current
  :field channel_1_panel_voltage_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_1_panel_voltage_b
  :field channel_1_panel_current_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_1_panel_current_b
  :field channel_1_output_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_1_output_voltage
  :field channel_1_output_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_1_output_current
  :field channel_1_module_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_1_module_temperature
  :field channel_1_board_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_1_board_temperature
  :field channel_2_panel_voltage_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_2_panel_voltage_b
  :field channel_2_panel_current_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_2_panel_current_b
  :field channel_2_output_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_2_output_voltage
  :field channel_2_output_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_2_output_current
  :field channel_2_module_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_2_module_temperature
  :field channel_2_board_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_2_board_temperature
  :field channel_3_panel_voltage_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_3_panel_voltage_b
  :field channel_3_panel_current_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_3_panel_current_b
  :field channel_3_output_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_3_output_voltage
  :field channel_3_output_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_3_output_current
  :field channel_3_module_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_3_module_temperature
  :field channel_3_board_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_3_board_temperature
  :field channel_4_panel_voltage_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_4_panel_voltage_b
  :field channel_4_panel_current_b: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_4_panel_current_b
  :field channel_4_output_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_4_output_voltage
  :field channel_4_output_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_4_output_current
  :field channel_4_module_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_4_module_temperature
  :field channel_4_board_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.channel_4_board_temperature
  :field eps_ioe_state: ax25_frame.payload.ax25_info.payload.grifex_beacon.eps_ioe_state
  :field eps_ioe_mode: ax25_frame.payload.ax25_info.payload.grifex_beacon.eps_ioe_mode
  :field tcb_temp_0: ax25_frame.payload.ax25_info.payload.grifex_beacon.tcb_temp_0
  :field tcb_temp_1: ax25_frame.payload.ax25_info.payload.grifex_beacon.tcb_temp_1
  :field tcb_temp_2: ax25_frame.payload.ax25_info.payload.grifex_beacon.tcb_temp_2
  :field adcs1_ioe_state: ax25_frame.payload.ax25_info.payload.grifex_beacon.adcs1_ioe_state
  :field adcs1_ioe_mode: ax25_frame.payload.ax25_info.payload.grifex_beacon.adcs1_ioe_mode
  :field posy_mag_x: ax25_frame.payload.ax25_info.payload.grifex_beacon.posy_mag_x
  :field posy_mag_y: ax25_frame.payload.ax25_info.payload.grifex_beacon.posy_mag_y
  :field posy_mag_z: ax25_frame.payload.ax25_info.payload.grifex_beacon.posy_mag_z
  :field posx_mag_x: ax25_frame.payload.ax25_info.payload.grifex_beacon.posx_mag_x
  :field posx_mag_y: ax25_frame.payload.ax25_info.payload.grifex_beacon.posx_mag_y
  :field posx_mag_z: ax25_frame.payload.ax25_info.payload.grifex_beacon.posx_mag_z
  :field negy_mag_x: ax25_frame.payload.ax25_info.payload.grifex_beacon.negy_mag_x
  :field negy_mag_y: ax25_frame.payload.ax25_info.payload.grifex_beacon.negy_mag_y
  :field negy_mag_z: ax25_frame.payload.ax25_info.payload.grifex_beacon.negy_mag_z
  :field negx_mag_x: ax25_frame.payload.ax25_info.payload.grifex_beacon.negx_mag_x
  :field negx_mag_y: ax25_frame.payload.ax25_info.payload.grifex_beacon.negx_mag_y
  :field negx_mag_z: ax25_frame.payload.ax25_info.payload.grifex_beacon.negx_mag_z
  :field posy_internal_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.posy_internal_temperature
  :field posy_external_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.posy_external_temperature
  :field posx_internal_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.posx_internal_temperature
  :field posx_external_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.posx_external_temperature
  :field negy_internal_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.negy_internal_temperature
  :field negy_external_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.negy_external_temperature
  :field negx_internal_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.negx_internal_temperature
  :field negx_external_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.negx_external_temperature
  :field posy_photodiode: ax25_frame.payload.ax25_info.payload.grifex_beacon.posy_photodiode
  :field posx_photodiode: ax25_frame.payload.ax25_info.payload.grifex_beacon.posx_photodiode
  :field negy_photodiode: ax25_frame.payload.ax25_info.payload.grifex_beacon.negy_photodiode
  :field negx_photodiode: ax25_frame.payload.ax25_info.payload.grifex_beacon.negx_photodiode
  :field mzint_ioe1_state: ax25_frame.payload.ax25_info.payload.grifex_beacon.mzint_ioe1_state
  :field mzint_ioe1_mode: ax25_frame.payload.ax25_info.payload.grifex_beacon.mzint_ioe1_mode
  :field mzint_ioe2_state: ax25_frame.payload.ax25_info.payload.grifex_beacon.mzint_ioe2_state
  :field mzint_ioe2_mode: ax25_frame.payload.ax25_info.payload.grifex_beacon.mzint_ioe2_mode
  :field marina_gpio_status_data: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_gpio_status_data
  :field marina_completed_runs: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_completed_runs
  :field marina_aborted_runs: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_aborted_runs
  :field marina_vbatt_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_vbatt_voltage
  :field marina_vbatt_current: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_vbatt_current
  :field marina_temperature: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_temperature
  :field marina_2_5v_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_2_5v_voltage
  :field marina_1_0v_voltage: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_1_0v_voltage
  :field marina_exit_status: ax25_frame.payload.ax25_info.payload.grifex_beacon.marina_exit_status
  :field variable_1: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_1
  :field variable_2: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_2
  :field variable_3: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_3
  :field variable_4: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_4
  :field variable_5: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_5
  :field variable_6: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_6
  :field variable_7: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_7
  :field variable_8: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_8
  :field variable_9: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_9
  :field variable_10: ax25_frame.payload.ax25_info.payload.grifex_beacon.variable_10
  :field rtc_unix_time: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.rtc_unix_time
  :field numresets: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.numresets
  :field avgnumactivetasks1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.avgnumactivetasks1
  :field avgnumactivetasks5: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.avgnumactivetasks5
  :field avgnumactivetasks15: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.avgnumactivetasks15
  :field curnumrunnabletasks: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.curnumrunnabletasks
  :field totnumprocesses: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.totnumprocesses
  :field lastprocesspid: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.lastprocesspid
  :field totmem: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.totmem
  :field freemem: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.freemem
  :field lithium_op_count: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.lithium_op_count
  :field lithium_msp430_temp: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.lithium_msp430_temp
  :field lithium_rssi: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.lithium_rssi
  :field lithium_rx: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.lithium_rx
  :field lithium_tx: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.lithium_tx
  :field ch_1_module_output_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_1_module_output_current
  :field ch_1a_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_1a_current
  :field ch_1_module_temp: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_1_module_temp
  :field ch_1a_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_1a_voltage
  :field ch_2_module_output_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_2_module_output_current
  :field ch_2a_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_2a_current
  :field ch_2_module_temp: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_2_module_temp
  :field ch_2a_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_2a_voltage
  :field ch_3_module_output_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_3_module_output_current
  :field ch_3a_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_3a_current
  :field ch_3_module_temp: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_3_module_temp
  :field ch_3a_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_3a_voltage
  :field ch_4_module_output_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_4_module_output_current
  :field ch_4a_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_4a_current
  :field ch_4_module_temp: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_4_module_temp
  :field ch_4a_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_4a_voltage
  :field ch_5_module_output_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_5_module_output_current
  :field ch_5a_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_5a_current
  :field ch_5_module_temp: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_5_module_temp
  :field ch_5a_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_5a_voltage
  :field ch_6_module_output_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_6_module_output_current
  :field ch_6a_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_6a_current
  :field ch_6_module_temp: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_6_module_temp
  :field ch_6a_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ch_6a_voltage
  :field regulator_input_current_5v: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.regulator_input_current_5v
  :field regulator_input_current_3_3v: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.regulator_input_current_3_3v
  :field bb_t_output: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bb_t_output
  :field bus_vbatt_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bus_vbatt_current
  :field bus_5v_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bus_5v_current
  :field bus_3_3v_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bus_3_3v_voltage
  :field bus_3_3v_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bus_3_3v_current
  :field bus_vbatt_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bus_vbatt_voltage
  :field bus_5v_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bus_5v_voltage
  :field eps_5v_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.eps_5v_current
  :field eps_5v_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.eps_5v_voltage
  :field eps_3_3v_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.eps_3_3v_current
  :field bb_eps_batt_i: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.bb_eps_batt_i
  :field eps_3_3v_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.eps_3_3v_voltage
  :field battery_temperature: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.battery_temperature
  :field ioe1_ioe_state: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ioe1_ioe_state
  :field ioe1_ioe_mode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.ioe1_ioe_mode
  :field fcpu1_ioe_state: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.fcpu1_ioe_state
  :field fcpu1_ioe_mode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.fcpu1_ioe_mode
  :field adcs1_ioe_state: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.adcs1_ioe_state
  :field adcs1_ioe_mode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.adcs1_ioe_mode
  :field eps_ioe_state: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.eps_ioe_state
  :field eps_ioe_mode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.eps_ioe_mode
  :field mzint1_ioe_state: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.mzint1_ioe_state
  :field mzint1_ioe_mode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.mzint1_ioe_mode
  :field acb_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_temp_0
  :field acb_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_temp_1
  :field acb_vbatt_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_vbatt_voltage
  :field acb_vbatt_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_vbatt_current
  :field acb_5v_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_5v_voltage
  :field acb_5v_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_5v_current
  :field acb_3v3_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_3v3_voltage
  :field acb_3v3_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.acb_3v3_current
  :field fcpu_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.fcpu_temp_0
  :field fcpu_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.fcpu_temp_1
  :field li_3v3_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.li_3v3_voltage
  :field fcpu_3v3_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.fcpu_3v3_current
  :field li_3v3_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.li_3v3_current
  :field fcpu_3v3_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.fcpu_3v3_voltage
  :field li_vbatt_voltage: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.li_vbatt_voltage
  :field li_vbatt_current: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.li_vbatt_current
  :field negz_mag_x: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negz_mag_x
  :field negz_mag_y: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negz_mag_y
  :field negz_mag_z: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negz_mag_z
  :field negz_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negz_temp_0
  :field negz_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negz_temp_1
  :field posz_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posz_temp_0
  :field posz_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posz_temp_1
  :field negx_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negx_temp_0
  :field negx_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negx_temp_1
  :field posx_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posx_temp_0
  :field posx_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posx_temp_1
  :field negy_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negy_temp_0
  :field negy_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negy_temp_1
  :field posy_temp_0: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posy_temp_0
  :field posy_temp_1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posy_temp_1
  :field negz_photodiode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negz_photodiode
  :field posz_photodiode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posz_photodiode
  :field negx_photodiode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negx_photodiode
  :field posx_photodiode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posx_photodiode
  :field negy_photodiode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.negy_photodiode
  :field posy_photodiode: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posy_photodiode
  :field posx_mag_x: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posx_mag_x
  :field posx_mag_y: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posx_mag_y
  :field posx_mag_z: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.posx_mag_z
  :field cove_experiment_md5sum_p1: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.cove_experiment_md5sum_p1
  :field cove_experiment_md5sum_p2: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.cove_experiment_md5sum_p2
  :field cove_experiment_md5sum_p3: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.cove_experiment_md5sum_p3
  :field cove_experiment_md5sum_p4: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.cove_experiment_md5sum_p4
  :field cove_status_data: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.cove_status_data
  :field cove_num_successes: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.cove_num_successes
  :field cove_num_failures: ax25_frame.payload.ax25_info.payload.mcubed2_beacon.cove_num_failures
  :field crc: ax25_frame.payload.crc

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
instances:
  framelength:
    value: _io.size
types:
  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
      - id: payload
        type:
          switch-on: ax25_header.ctl & 0x13
          cases:
            0x03: ui_frame
            0x13: ui_frame
            0x00: i_frame
            0x02: i_frame
            0x10: i_frame
            0x12: i_frame
            # 0x11: s_frame
  ax25_header:
    seq:
      - id: dest_callsign_raw
        type: callsign_raw
      - id: dest_ssid_raw
        type: ssid_mask
      - id: src_callsign_raw
        type: callsign_raw
      - id: src_ssid_raw
        type: ssid_mask
      - id: repeater
        type: repeater
        if: (src_ssid_raw.ssid_mask & 0x01) == 0
        doc: 'Repeater flag is set!'
      - id: ctl
        type: u1
  repeater:
    seq:
      - id: rpt_instance
        type: repeaters
        repeat: until
        repeat-until: ((_.rpt_ssid_raw.ssid_mask & 0x1) == 0x1)
        doc: 'Repeat until no repeater flag is set!'
  repeaters:
    seq:
      - id: rpt_callsign_raw
        type: callsign_raw
      - id: rpt_ssid_raw
        type: ssid_mask
  callsign_raw:
    seq:
      - id: callsign_ror
        process: ror(1)
        size: 6
        type: callsign
  callsign:
    seq:
      - id: callsign
        type: str
        encoding: ASCII
        size: 6
  ssid_mask:
    seq:
      - id: ssid_mask
        type: u1
    instances:
      ssid:
        value: (ssid_mask & 0x0f) >> 1
  i_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        size-eos: true
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type:
          switch-on: _parent.ax25_header.src_callsign_raw.callsign_ror.callsign
          cases:
            '"KF6RFX"': rap_t  # TBEX-A/-B
            '"NOCALL"': rap_t  # MCUBED-2
            '"CQ    "': rap_t  # GRIFEX
        size-eos: true
  rap_t:
    seq:
      - id: rap_header
        type: rap_header_t
        size: 11
      - id: payload
        type:
          switch-on: rap_header.secondary_id
          cases:
            0x32: mcubed2_beacon_t
            0x42: grifex_beacon_t
            0x52: tbex_beacon_t
            0x53: tbex_beacon_t
        doc: |
          0x32: Spacecraft Identifier for MCUBED-2
          0x42: Spacecraft Identifier for GRIFEX
          0x52: Spacecraft Identifier for TBEX-A
          0x53: Spacecraft Identifier for TBEX-B
      - id: crc
        type: u4
  rap_header_t:
    seq:
      - id: sync
        contents: [0xab, 0xcd]
        doc: 'Sync characters; always 0xab, 0xcd'
      - id: primary_id
        type: u2
        doc: 'Primary Identifier'
      - id: secondary_id
        type: u2
        doc: 'Secondary Identifier'
      - id: flags
        type: u1
        doc: 'Flags'
      - id: packet_length
        type: u2
        doc: 'Packetlength including header and checksums in footer'
      - id: header_checksum
        type: u2
        doc: 'Header checksum'
    instances:
      spacecraft:
        value: >-
          (secondary_id == 0x32 ? 'MCUBED-2' :
          (secondary_id == 0x42 ? 'GRIFEX' :
          (secondary_id == 0x52 ? 'TBEX-A' :
          (secondary_id == 0x53 ? 'TBEX-B' : 'unknown'))))
  grifex_beacon_t:
    meta:
      endian: le
    seq:
      - id: grifex_beacon
        type:
          switch-on: _root.framelength
          cases:
            261: grifex_t
  grifex_t:
    meta:
      endian: le
    seq:
      - id: rtc_unix_time
        type: u4
      - id: numresets
        type: u2
      - id: avgnumactivetasks1
        type: u2
      - id: avgnumactivetasks5
        type: u2
      - id: avgnumactivetasks15
        type: u2
      - id: curnumrunnabletasks
        type: u2
      - id: totnumprocesses
        type: u2
      - id: lastprocesspid
        type: u2
      - id: totmem
        type: u2
      - id: freemem
        type: u2
      - id: adcs_enable_status
        type: u1
      - id: sd_usage
        type: u4
      - id: datamnt_usage
        type: u4
      - id: lithium_op_count
        type: u2
      - id: lithium_msp430_temp
        type: u2
      - id: lithium_rssi
        type: u1
      - id: lithium_rx
        type: u4
      - id: lithium_tx
        type: u4
      - id: fcpu_temp_0
        type: u2
      - id: fcpu_temp_1
        type: u2
      - id: li_3v3_voltage
        type: u2
      - id: fcpu_3v3_current
        type: u2
      - id: li_3v3_current
        type: u2
      - id: fcpu_3v3_voltage
        type: u2
      - id: li_vbatt_voltage
        type: u2
      - id: li_vbatt_current
        type: u2
      - id: battery_voltage
        type: u2
      - id: battery_current
        type: u2
      - id: battery_temperature
        type: u2
      - id: battery_bus_voltage
        type: u2
      - id: battery_bus_current
        type: u2
      - id: bus_voltage_5v
        type: u2
      - id: bus_current_5v
        type: u2
      - id: input_current_5v
        type: u2
      - id: bus_voltage_3_3v
        type: u2
      - id: bus_current_3_3v
        type: u2
      - id: input_current_3_3v
        type: u2
      - id: output_regulator_temperature
        type: u2
      - id: eps_5v_voltage
        type: u2
      - id: eps_5v_current
        type: u2
      - id: eps_3_3_voltage
        type: u2
      - id: eps_3_3v_current
        type: u2
      - id: channel_1_panel_voltage_b
        type: u2
      - id: channel_1_panel_current_b
        type: u2
      - id: channel_1_output_voltage
        type: u2
      - id: channel_1_output_current
        type: u2
      - id: channel_1_module_temperature
        type: u2
      - id: channel_1_board_temperature
        type: u2
      - id: channel_2_panel_voltage_b
        type: u2
      - id: channel_2_panel_current_b
        type: u2
      - id: channel_2_output_voltage
        type: u2
      - id: channel_2_output_current
        type: u2
      - id: channel_2_module_temperature
        type: u2
      - id: channel_2_board_temperature
        type: u2
      - id: channel_3_panel_voltage_b
        type: u2
      - id: channel_3_panel_current_b
        type: u2
      - id: channel_3_output_voltage
        type: u2
      - id: channel_3_output_current
        type: u2
      - id: channel_3_module_temperature
        type: u2
      - id: channel_3_board_temperature
        type: u2
      - id: channel_4_panel_voltage_b
        type: u2
      - id: channel_4_panel_current_b
        type: u2
      - id: channel_4_output_voltage
        type: u2
      - id: channel_4_output_current
        type: u2
      - id: channel_4_module_temperature
        type: u2
      - id: channel_4_board_temperature
        type: u2
      - id: eps_ioe_state
        type: u1
      - id: eps_ioe_mode
        type: u1
      - id: tcb_temp_0
        type: u2
      - id: tcb_temp_1
        type: u2
      - id: tcb_temp_2
        type: u2
      - id: adcs1_ioe_state
        type: u1
      - id: adcs1_ioe_mode
        type: u1
      - id: posy_mag_x
        type: s2
      - id: posy_mag_y
        type: s2
      - id: posy_mag_z
        type: s2
      - id: posx_mag_x
        type: s2
      - id: posx_mag_y
        type: s2
      - id: posx_mag_z
        type: s2
      - id: negy_mag_x
        type: s2
      - id: negy_mag_y
        type: s2
      - id: negy_mag_z
        type: s2
      - id: negx_mag_x
        type: s2
      - id: negx_mag_y
        type: s2
      - id: negx_mag_z
        type: s2
      - id: posy_internal_temperature
        type: u2
      - id: posy_external_temperature
        type: u2
      - id: posx_internal_temperature
        type: u2
      - id: posx_external_temperature
        type: u2
      - id: negy_internal_temperature
        type: u2
      - id: negy_external_temperature
        type: u2
      - id: negx_internal_temperature
        type: u2
      - id: negx_external_temperature
        type: u2
      - id: posy_photodiode
        type: u2
      - id: posx_photodiode
        type: u2
      - id: negy_photodiode
        type: u2
      - id: negx_photodiode
        type: u2
      - id: mzint_ioe1_state
        type: u1
      - id: mzint_ioe1_mode
        type: u1
      - id: mzint_ioe2_state
        type: u1
      - id: mzint_ioe2_mode
        type: u1
      - id: marina_gpio_status_data
        type: u1
      - id: marina_completed_runs
        type: u2
      - id: marina_aborted_runs
        type: u2
      - id: marina_vbatt_voltage
        type: u2
      - id: marina_vbatt_current
        type: u2
      - id: marina_temperature
        type: u2
      - id: marina_2_5v_voltage
        type: u2
      - id: marina_1_0v_voltage
        type: u2
      - id: marina_exit_status
        type: u1
      - id: variable_1
        type: u1
      - id: variable_2
        type: u1
      - id: variable_3
        type: u1
      - id: variable_4
        type: u1
      - id: variable_5
        type: u1
      - id: variable_6
        type: u1
      - id: variable_7
        type: u1
      - id: variable_8
        type: u1
      - id: variable_9
        type: u1
      - id: variable_10
        type: u1
  mcubed2_beacon_t:
    meta:
      endian: be
    seq:
      - id: mcubed2_beacon
        type:
          switch-on: _root.framelength
          cases:
            257: mcubed2_t
  mcubed2_t:
    meta:
      endian: le
    seq:
      - id: rtc_unix_time
        type: u4
      - id: numresets
        type: u2
      - id: avgnumactivetasks1
        type: u2
      - id: avgnumactivetasks5
        type: u2
      - id: avgnumactivetasks15
        type: u2
      - id: curnumrunnabletasks
        type: u2
      - id: totnumprocesses
        type: u2
      - id: lastprocesspid
        type: u2
      - id: totmem
        type: u2
      - id: freemem
        type: u2
      - id: lithium_op_count
        type: u2
      - id: lithium_msp430_temp
        type: u2
      - id: lithium_rssi
        type: u1
      - id: lithium_rx
        type: u4
      - id: lithium_tx
        type: u4
      - id: ch_1_module_output_current
        type: u2
      - id: ch_1a_current
        type: u2
      - id: ch_1_module_temp
        type: u2
      - id: ch_1a_voltage
        type: u2
      - id: ch_2_module_output_current
        type: u2
      - id: ch_2a_current
        type: u2
      - id: ch_2_module_temp
        type: u2
      - id: ch_2a_voltage
        type: u2
      - id: ch_3_module_output_current
        type: u2
      - id: ch_3a_current
        type: u2
      - id: ch_3_module_temp
        type: u2
      - id: ch_3a_voltage
        type: u2
      - id: ch_4_module_output_current
        type: u2
      - id: ch_4a_current
        type: u2
      - id: ch_4_module_temp
        type: u2
      - id: ch_4a_voltage
        type: u2
      - id: ch_5_module_output_current
        type: u2
      - id: ch_5a_current
        type: u2
      - id: ch_5_module_temp
        type: u2
      - id: ch_5a_voltage
        type: u2
      - id: ch_6_module_output_current
        type: u2
      - id: ch_6a_current
        type: u2
      - id: ch_6_module_temp
        type: u2
      - id: ch_6a_voltage
        type: u2
      - id: regulator_input_current_5v
        type: u2
      - id: regulator_input_current_3_3v
        type: u2
      - id: bb_t_output
        type: u2
      - id: bus_vbatt_current
        type: u2
      - id: bus_5v_current
        type: u2
      - id: bus_3_3v_voltage
        type: u2
      - id: bus_3_3v_current
        type: u2
      - id: bus_vbatt_voltage
        type: u2
      - id: bus_5v_voltage
        type: u2
      - id: eps_5v_current
        type: u2
      - id: eps_5v_voltage
        type: u2
      - id: eps_3_3v_current
        type: u2
      - id: bb_eps_batt_i
        type: s2
      - id: eps_3_3v_voltage
        type: u2
      - id: battery_temperature
        type: u2
      - id: ioe1_ioe_state
        type: u1
      - id: ioe1_ioe_mode
        type: u1
      - id: fcpu1_ioe_state
        type: u1
      - id: fcpu1_ioe_mode
        type: u1
      - id: adcs1_ioe_state
        type: u1
      - id: adcs1_ioe_mode
        type: u1
      - id: eps_ioe_state
        type: u1
      - id: eps_ioe_mode
        type: u1
      - id: mzint1_ioe_state
        type: u1
      - id: mzint1_ioe_mode
        type: u1
      - id: acb_temp_0
        type: u2
      - id: acb_temp_1
        type: u2
      - id: acb_vbatt_voltage
        type: u2
      - id: acb_vbatt_current
        type: u2
      - id: acb_5v_voltage
        type: u2
      - id: acb_5v_current
        type: u2
      - id: acb_3v3_voltage
        type: u2
      - id: acb_3v3_current
        type: u2
      - id: fcpu_temp_0
        type: u2
      - id: fcpu_temp_1
        type: u2
      - id: li_3v3_voltage
        type: u2
      - id: fcpu_3v3_current
        type: u2
      - id: li_3v3_current
        type: u2
      - id: fcpu_3v3_voltage
        type: u2
      - id: li_vbatt_voltage
        type: u2
      - id: li_vbatt_current
        type: u2
      - id: negz_mag_x
        type: s2
      - id: negz_mag_y
        type: s2
      - id: negz_mag_z
        type: s2
      - id: negz_temp_0
        type: u2
      - id: negz_temp_1
        type: u2
      - id: posz_temp_0
        type: u2
      - id: posz_temp_1
        type: u2
      - id: negx_temp_0
        type: u2
      - id: negx_temp_1
        type: u2
      - id: posx_temp_0
        type: u2
      - id: posx_temp_1
        type: u2
      - id: negy_temp_0
        type: u2
      - id: negy_temp_1
        type: u2
      - id: posy_temp_0
        type: u2
      - id: posy_temp_1
        type: u2
      - id: negz_photodiode
        type: u2
      - id: posz_photodiode
        type: u2
      - id: negx_photodiode
        type: u2
      - id: posx_photodiode
        type: u2
      - id: negy_photodiode
        type: u2
      - id: posy_photodiode
        type: u2
      - id: posx_mag_x
        type: s2
      - id: posx_mag_y
        type: s2
      - id: posx_mag_z
        type: s2
      - id: cove_experiment_md5sum_p1
        type: u4
      - id: cove_experiment_md5sum_p2
        type: u4
      - id: cove_experiment_md5sum_p3
        type: u4
      - id: cove_experiment_md5sum_p4
        type: u4
      - id: cove_status_data
        type: u1
      - id: cove_num_successes
        type: u2
      - id: cove_num_failures
        type: u2
  tbex_beacon_t:
    meta:
      endian: le
    seq:
      - id: tbex_beacon
        type:
          switch-on: _root.framelength
          cases:
            219: tbex_beacon_2_t
            255: tbex_beacon_1_t
  tbex_beacon_1_t:
    meta:
      endian: le
    seq:
      - id: operation_mode
        type: u2
      - id: rtc_unix_time
        type: u4
      - id: numresets
        type: u2
      - id: avgnumactivetasks1
        type: u2
      - id: avgnumactivetasks5
        type: u2
      - id: avgnumactivetasks15
        type: u2
      - id: totnumprocesses
        type: u2
      - id: usedmemminuscache
        type: u2
      - id: freemempluscache
        type: u2
      - id: sd_usage
        type: u2
      - id: datamnt_usage
        type: u2
      - id: stamp_gpio_states
        type: u2
      - id: ioe_states
        type: u1
      - id: lithium_op_count
        type: u2
      - id: lithium_msp430_temp
        type: s2
      - id: lithium_rssi
        type: u1
      - id: lithium_rx
        type: u4
      - id: lithium_tx
        type: u4
      - id: fcpu_processor_temp
        type: s2
      - id: lithium_pa_temp
        type: s2
      - id: li_3v3_voltage
        type: u2
      - id: fcpu_3v3_current
        type: u2
      - id: li_3v3_current
        type: u2
      - id: fcpu_3v3_voltage
        type: u2
      - id: li_vbatt_voltage
        type: u2
      - id: li_vbatt_current
        type: u2
      - id: sd_imon_1
        type: u2
      - id: sd_imon_2
        type: u2
      - id: sd_imon_3
        type: u2
      - id: sd_imon_4
        type: u2
      - id: battery_voltage
        type: u2
      - id: battery_current
        type: s2
      - id: battery_temperature
        type: u2
      - id: battery_bus_voltage
        type: u2
      - id: battery_bus_current
        type: u2
      - id: bus_voltage_5v
        type: u2
      - id: bus_current_5v
        type: u2
      - id: input_current_5v
        type: u2
      - id: bus_voltage_3_3v
        type: u2
      - id: bus_current_3_3v
        type: u2
      - id: input_current_3_3v
        type: u2
      - id: output_regulator_temperature
        type: u2
      - id: eps_5v_voltage
        type: u2
      - id: eps_5v_current
        type: u2
      - id: eps_3_3_voltage
        type: s2
      - id: eps_3_3v_current
        type: s2
      - id: channel_1_panel_voltage_a
        type: u2
      - id: channel_1_panel_voltage_b
        type: u2
      - id: channel_1_panel_current_a
        type: u2
      - id: channel_1_panel_current_b
        type: u2
      - id: channel_1_output_current
        type: u2
      - id: channel_1_output_voltage
        type: u2
      - id: channel_1_board_temperature
        type: s2
      - id: channel_1_module_temperature
        type: s2
      - id: channel_2_panel_voltage_a
        type: u2
      - id: channel_2_panel_voltage_b
        type: u2
      - id: channel_2_panel_current_a
        type: u2
      - id: channel_2_panel_current_b
        type: u2
      - id: channel_2_output_current
        type: u2
      - id: channel_2_output_voltage
        type: u2
      - id: channel_2_board_temperature
        type: s2
      - id: channel_2_module_temperature
        type: s2
      - id: channel_3_panel_voltage_a
        type: u2
      - id: channel_3_panel_voltage_b
        type: u2
      - id: channel_3_panel_current_a
        type: u2
      - id: channel_3_panel_current_b
        type: u2
      - id: channel_3_output_current
        type: u2
      - id: channel_3_output_voltage
        type: u2
      - id: channel_3_board_temperature
        type: s2
      - id: channel_3_module_temperature
        type: s2
      - id: channel_4_panel_voltage_a
        type: u2
      - id: channel_4_panel_voltage_b
        type: u2
      - id: channel_4_panel_current_a
        type: u2
      - id: channel_4_panel_current_b
        type: u2
      - id: channel_4_output_current
        type: u2
      - id: channel_4_output_voltage
        type: u2
      - id: channel_4_board_temperature
        type: s2
      - id: channel_4_module_temperature
        type: s2
      - id: channel_5_module_input_voltage
        type: u2
      - id: channel_5_panel_current_a
        type: u2
      - id: channel_5_panel_current_b
        type: u2
      - id: channel_5_output_current
        type: u2
      - id: channel_5_board_temperature
        type: s2
      - id: channel_5_module_temperature
        type: s2
      - id: channel_6_module_input_voltage
        type: u2
      - id: channel_6_panel_current_a
        type: u2
      - id: channel_6_panel_current_b
        type: u2
      - id: channel_6_output_current
        type: u2
      - id: channel_6_board_temperature
        type: s2
      - id: channel_6_module_temperature
        type: s2
      - id: adcs_5v_voltage
        type: u2
      - id: adcs_5v_current
        type: u2
      - id: adcs_3v3_voltage
        type: u2
      - id: adcs_3v3_current
        type: u2
      - id: adcs_vbatt_curent
        type: u2
      - id: adcs_vbatt_voltage
        type: u2
      - id: adcs_temp_0
        type: s2
      - id: adcs_temp_1
        type: s2
      - id: eimu_current
        type: u2
      - id: adc_curr
        type: u2
      - id: sd_v
        type: u2
      - id: fcpu_var_1
        type: u1
      - id: fcpu_var_2
        type: u1
      - id: fcpu_var_3
        type: u1
      - id: fcpu_var_4
        type: u1
      - id: fcpu_var_5
        type: u1
      - id: fcpu_var_6
        type: u1
      - id: tbex_payload_current
        type: u2
      - id: tbex_payload_voltage
        type: u2
      - id: pim_3v3_current
        type: u2
      - id: pim_3v3_voltage
        type: u2
      - id: pim_vbatt_monitor
        type: u2
      - id: pim_bus_3v3_voltag
        type: u2
  tbex_beacon_2_t:
    meta:
      endian: le
    seq:
      - id: rtc_unix_time_beacon_2
        type: u4
      - id: numresets_beacon_2
        type: u2
      - id: stamp_gpio_states_abbreviated
        type: u1
      - id: fcpu_var_7
        type: u1
      - id: fcpu_var_8
        type: u1
      - id: fcpu_var_9
        type: u1
      - id: fcpu_var_10
        type: u1
      - id: command_received_from_fcpu
        type: u2
      - id: nx_wing_magnetometer_x
        type: s2
      - id: nx_wing_magnetometer_y
        type: s2
      - id: nx_wing_magnetometer_z
        type: s2
      - id: px_wing_magnetometer_x
        type: s2
      - id: px_wing_magnetometer_y
        type: s2
      - id: px_wing_magnetometer_z
        type: s2
      - id: py_body_magnetometer_x
        type: s2
      - id: py_body_magnetometer_y
        type: s2
      - id: py_body_magnetometer_z
        type: s2
      - id: ny_body_magnetometer_x
        type: s2
      - id: ny_body_magnetometer_y
        type: s2
      - id: ny_body_magnetometer_z
        type: s2
      - id: py_body_cell_voltage_1
        type: u2
      - id: py_body_cell_voltage_2
        type: u2
      - id: py_body_panel_circuitry_current
        type: u2
      - id: py_body_internal_temp
        type: s2
      - id: py_body_external_temp
        type: s2
      - id: ny_body_cell_voltage_1
        type: u2
      - id: ny_body_cell_voltage_2
        type: u2
      - id: ny_body_panel_circuitry_current
        type: u2
      - id: ny_body_internal_temp
        type: s2
      - id: ny_body_external_temp
        type: s2
      - id: nx_body_cell_voltage_1
        type: u2
      - id: nx_body_cell_voltage_2
        type: u2
      - id: nx_body_panel_circuitry_current
        type: u2
      - id: nx_body_internal_temp
        type: s2
      - id: nx_body_external_temp
        type: s2
      - id: px_body_cell_voltage_1
        type: u2
      - id: px_body_cell_voltage_2
        type: u2
      - id: px_body_panel_circuitry_current
        type: u2
      - id: px_body_internal_temp
        type: s2
      - id: px_body_external_temp
        type: s2
      - id: nx_deployable_temp_1
        type: s2
      - id: nx_deployable_temp_2
        type: s2
      - id: nx_deployable_panel_circuitry_current
        type: u2
      - id: px_deployable_temp_1
        type: s2
      - id: px_deployable_temp_2
        type: s2
      - id: px_deployable_panel_circuitry_current
        type: u2
      - id: py_deployable_temp_1
        type: s2
      - id: py_deployable_temp_2
        type: s2
      - id: py_deployable_panel_circuitry_current
        type: u2
      - id: ny_deployable_temp_1
        type: s2
      - id: ny_deployable_temp_2
        type: s2
      - id: ny_deployable_panel_circuitry_current
        type: u2
      - id: nx_wing_photodiode_a
        type: u2
      - id: nx_wing_photodiode_b
        type: u2
      - id: px_wing_photodiode_a
        type: u2
      - id: px_wing_photodiode_b
        type: u2
      - id: py_body_photodiode_a
        type: u2
      - id: py_body_photodiode_b
        type: u2
      - id: ny_body_photodiode_a
        type: u2
      - id: ny_body_photodiode_b
        type: u2
      - id: py_wing_photodiode_a
        type: u2
      - id: py_wing_photodiode_b
        type: u2
      - id: ny_wing_photodiode_a
        type: u2
      - id: ny_wing_photodiode_b
        type: u2
      - id: nx_body_photodiode_a
        type: u2
      - id: nx_body_photodiode_b
        type: u2
      - id: px_body_photodiode_a
        type: u2
      - id: px_body_photodiode_b
        type: u2
      - id: gyro_4_x
        type: s2
      - id: gyro_4_y
        type: s2
      - id: gyro_4_z
        type: s2
      - id: eimu_temperature
        type: s2
      - id: wheel_x_speed
        type: s2
      - id: wheel_y_speed
        type: s2
      - id: wheel_z_speed
        type: s2
      - id: tcb_temp_0
        type: s2
      - id: tcb_3v3_current
        type: u2
      - id: tcb_vbatt_current
        type: u2
      - id: input_current
        type: u2
      - id: input_voltage
        type: u2
      - id: voltage_5_5
        type: u2
      - id: voltage_3_0
        type: u2
      - id: voltage_3_3
        type: u2
      - id: rf_board_temperature
        type: u2
      - id: control_board_temperature
        type: u2
      - id: vhf_channel_forward_power
        type: u2
      - id: uhf_channel_forward_power
        type: u2
      - id: l_band_channel_forward_power
        type: u2
      - id: vhf_channel_reverse_power
        type: u2
      - id: uhf_channel_reverse_power
        type: u2
      - id: l_band_channel_reverse_power
        type: u2
      - id: pll_config_mask
        type: u1
      - id: ppu_reset_count
        type: u1
      - id: status_mask
        type: u1
      - id: error_mask
        type: u2
      - id: crc
        type: u2
