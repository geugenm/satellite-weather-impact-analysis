---
meta:
  id: amicalsat
  title: AMICALSAT TLM Frame
  license: LGPL V2
  endian: be
doc-ref: 'https://gitlab.com/librespacefoundation/satnogs-ops/uploads/f6fde8b864f8cdf37d65433bd958e138/AmicalSat_downlinks_v0.3.pdf'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field start: ax25_frame.payload.ax25_info.start
  :field tlm_area: ax25_frame.payload.ax25_info.tlm_area
  :field tlm_type: ax25_frame.payload.ax25_info.tlm_area_switch.tlm_type
  :field m1_cpu_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cpu_voltage_volt
  :field m1_boot_number_int: ax25_frame.payload.ax25_info.tlm_area_switch.m1.boot_number_int
  :field m1_cpu_temperature_degree: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cpu_temperature_degree
  :field m1_up_time_int: ax25_frame.payload.ax25_info.tlm_area_switch.m1.up_time_int
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.m1.timestamp_int
  :field m1_imc_aocs_ok: ax25_frame.payload.ax25_info.tlm_area_switch.m1.imc_aocs_ok
  :field m1_imc_cu_l_ok: ax25_frame.payload.ax25_info.tlm_area_switch.m1.imc_cu_l_ok
  :field m1_imc_cu_r_ok: ax25_frame.payload.ax25_info.tlm_area_switch.m1.imc_cu_r_ok
  :field m1_imc_vhf1_ok: ax25_frame.payload.ax25_info.tlm_area_switch.m1.imc_vhf1_ok
  :field m1_imc_uhf2_ok: ax25_frame.payload.ax25_info.tlm_area_switch.m1.imc_uhf2_ok
  :field m1_vhf1_downlink: ax25_frame.payload.ax25_info.tlm_area_switch.m1.vhf1_downlink
  :field m1_uhf2_downlink: ax25_frame.payload.ax25_info.tlm_area_switch.m1.uhf2_downlink
  :field m1_imc_check: ax25_frame.payload.ax25_info.tlm_area_switch.m1.imc_check
  :field m1_beacon_mode: ax25_frame.payload.ax25_info.tlm_area_switch.m1.beacon_mode
  :field m1_cyclic_reset_on: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cyclic_reset_on
  :field m1_survival_mode: ax25_frame.payload.ax25_info.tlm_area_switch.m1.survival_mode
  :field m1_payload_off: ax25_frame.payload.ax25_info.tlm_area_switch.m1.payload_off
  :field m1_cu_auto_off: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cu_auto_off
  :field m1_tm_log: ax25_frame.payload.ax25_info.tlm_area_switch.m1.tm_log
  :field m1_cul_on: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cul_on
  :field m1_cul_faut: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cul_faut
  :field m1_cur_on: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cur_on
  :field m1_cur_fault: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cur_fault
  :field m1_cu_on: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cu_on
  :field m1_cul_dead: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cul_dead
  :field m1_cur_dead: ax25_frame.payload.ax25_info.tlm_area_switch.m1.cur_dead
  :field m1_fault_3v_r: ax25_frame.payload.ax25_info.tlm_area_switch.m1.fault_3v_r
  :field m1_fault_3v_m: ax25_frame.payload.ax25_info.tlm_area_switch.m1.fault_3v_m
  :field m1_charge_r: ax25_frame.payload.ax25_info.tlm_area_switch.m1.charge_r
  :field m1_charge_m: ax25_frame.payload.ax25_info.tlm_area_switch.m1.charge_m
  :field m1_long_log: ax25_frame.payload.ax25_info.tlm_area_switch.m1.long_log
  :field m1_log_to_flash: ax25_frame.payload.ax25_info.tlm_area_switch.m1.log_to_flash
  :field m1_plan: ax25_frame.payload.ax25_info.tlm_area_switch.m1.plan
  :field m1_stream: ax25_frame.payload.ax25_info.tlm_area_switch.m1.stream
  :field m1_vhf1_packet_ready: ax25_frame.payload.ax25_info.tlm_area_switch.m1.vhf1_packet_ready
  :field m1_uhf2_packet_ready: ax25_frame.payload.ax25_info.tlm_area_switch.m1.uhf2_packet_ready
  :field m1_survival_start: ax25_frame.payload.ax25_info.tlm_area_switch.m1.survival_start
  :field m1_survival_end: ax25_frame.payload.ax25_info.tlm_area_switch.m1.survival_end
  :field a1_adcs_mode: ax25_frame.payload.ax25_info.tlm_area_switch.a1.adcs_mode
  :field a1_faults: ax25_frame.payload.ax25_info.tlm_area_switch.a1.faults
  :field a1_detumbling: ax25_frame.payload.ax25_info.tlm_area_switch.a1.detumbling
  :field a1_adcs_on_off: ax25_frame.payload.ax25_info.tlm_area_switch.a1.adcs_on_off
  :field a1_detumbling_status: ax25_frame.payload.ax25_info.tlm_area_switch.a1.detumbling_status
  :field a1_manual: ax25_frame.payload.ax25_info.tlm_area_switch.a1.manual
  :field a1_act_on_off: ax25_frame.payload.ax25_info.tlm_area_switch.a1.act_on_off
  :field a1_sun_contr: ax25_frame.payload.ax25_info.tlm_area_switch.a1.sun_contr
  :field a1_sens_on_off: ax25_frame.payload.ax25_info.tlm_area_switch.a1.sens_on_off
  :field a1_act_man_contr: ax25_frame.payload.ax25_info.tlm_area_switch.a1.act_man_contr
  :field a1_act_limited_contr: ax25_frame.payload.ax25_info.tlm_area_switch.a1.act_limited_contr
  :field a1_gyro_acc_fault: ax25_frame.payload.ax25_info.tlm_area_switch.a1.gyro_acc_fault
  :field a1_mag_fault: ax25_frame.payload.ax25_info.tlm_area_switch.a1.mag_fault
  :field a1_sun_fault: ax25_frame.payload.ax25_info.tlm_area_switch.a1.sun_fault
  :field a1_l1_fault: ax25_frame.payload.ax25_info.tlm_area_switch.a1.l1_fault
  :field a1_l2_fault: ax25_frame.payload.ax25_info.tlm_area_switch.a1.l2_fault
  :field a1_l3_fault: ax25_frame.payload.ax25_info.tlm_area_switch.a1.l3_fault
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.timestamp_int
  :field a1_mag_x: ax25_frame.payload.ax25_info.tlm_area_switch.a1.mag_x
  :field a1_mag_y: ax25_frame.payload.ax25_info.tlm_area_switch.a1.mag_y
  :field a1_mag_z: ax25_frame.payload.ax25_info.tlm_area_switch.a1.mag_z
  :field a1_mag_x_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.mag_x_int
  :field a1_mag_y_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.mag_y_int
  :field a1_mag_z_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.mag_z_int
  :field a1_gyro_x_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.gyro_x_int
  :field a1_gyro_y_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.gyro_y_int
  :field a1_gyro_z_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.gyro_z_int
  :field a1_latitude_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.latitude_int
  :field a1_longitude_int: ax25_frame.payload.ax25_info.tlm_area_switch.a1.longitude_int
  :field em_boot_number_int: ax25_frame.payload.ax25_info.tlm_area_switch.em.boot_number_int
  :field em_input_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.em.input_voltage_volt
  :field em_input_current_ma: ax25_frame.payload.ax25_info.tlm_area_switch.em.input_current_ma
  :field em_input_power_mw: ax25_frame.payload.ax25_info.tlm_area_switch.em.input_power_mw
  :field em_peak_power_mw: ax25_frame.payload.ax25_info.tlm_area_switch.em.peak_power_mw
  :field em_solar_panel_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.em.solar_panel_voltage_volt
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.em.timestamp_int
  :field em_v_in_volt: ax25_frame.payload.ax25_info.tlm_area_switch.em.v_in_volt
  :field em_v_solar_volt: ax25_frame.payload.ax25_info.tlm_area_switch.em.v_solar_volt
  :field em_i_in_ma: ax25_frame.payload.ax25_info.tlm_area_switch.em.i_in_ma
  :field em_p_in_mw: ax25_frame.payload.ax25_info.tlm_area_switch.em.p_in_mw
  :field em_p_peak_mw: ax25_frame.payload.ax25_info.tlm_area_switch.em.p_peak_mw
  :field em_t_cpu_degree: ax25_frame.payload.ax25_info.tlm_area_switch.em.t_cpu_degree
  :field em_v_cpu_volt: ax25_frame.payload.ax25_info.tlm_area_switch.em.v_cpu_volt
  :field timestamp: ax25_frame.payload.ax25_info.tlm_area_switch.er.timestamp
  :field boot_number: ax25_frame.payload.ax25_info.tlm_area_switch.er.boot_number
  :field er_input_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.er.input_voltage_volt
  :field er_input_current_ma: ax25_frame.payload.ax25_info.tlm_area_switch.er.input_current_ma
  :field er_input_power_mw: ax25_frame.payload.ax25_info.tlm_area_switch.er.input_power_mw
  :field er_peak_power_mw: ax25_frame.payload.ax25_info.tlm_area_switch.er.peak_power_mw
  :field er_solar_panel_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.er.solar_panel_voltage_volt
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.er.timestamp_int
  :field er_v_in_volt: ax25_frame.payload.ax25_info.tlm_area_switch.er.v_in_volt
  :field er_v_solar_volt: ax25_frame.payload.ax25_info.tlm_area_switch.er.v_solar_volt
  :field er_i_in_ma: ax25_frame.payload.ax25_info.tlm_area_switch.er.i_in_ma
  :field er_p_in_mw: ax25_frame.payload.ax25_info.tlm_area_switch.er.p_in_mw
  :field er_p_peak_mw: ax25_frame.payload.ax25_info.tlm_area_switch.er.p_peak_mw
  :field er_t_cpu_degree: ax25_frame.payload.ax25_info.tlm_area_switch.er.t_cpu_degree
  :field er_v_cpu_volt: ax25_frame.payload.ax25_info.tlm_area_switch.er.v_cpu_volt
  :field timestamp: ax25_frame.payload.ax25_info.tlm_area_switch.v1.timestamp
  :field v1_cpu_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.v1.cpu_voltage_volt
  :field v1_battery_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.v1.battery_voltage_volt
  :field v1_cpu_temperature_degree: ax25_frame.payload.ax25_info.tlm_area_switch.v1.cpu_temperature_degree
  :field v1_amplifier_temperature_degree: ax25_frame.payload.ax25_info.tlm_area_switch.v1.amplifier_temperature_degree
  :field v1_fec: ax25_frame.payload.ax25_info.tlm_area_switch.v1.fec
  :field v1_downlink: ax25_frame.payload.ax25_info.tlm_area_switch.v1.downlink
  :field v1_band_lock: ax25_frame.payload.ax25_info.tlm_area_switch.v1.band_lock
  :field v1_xor: ax25_frame.payload.ax25_info.tlm_area_switch.v1.xor
  :field v1_aes_128: ax25_frame.payload.ax25_info.tlm_area_switch.v1.aes_128
  :field v1_amp_ovt: ax25_frame.payload.ax25_info.tlm_area_switch.v1.amp_ovt
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.v1.timestamp_int
  :field v1_current_rssi_int: ax25_frame.payload.ax25_info.tlm_area_switch.v1.current_rssi_int
  :field v1_latch_rssi_int: ax25_frame.payload.ax25_info.tlm_area_switch.v1.latch_rssi_int
  :field v1_a_f_c_offset_int: ax25_frame.payload.ax25_info.tlm_area_switch.v1.a_f_c_offset_int
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.u2.timestamp_int
  :field u2_cpu_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.u2.cpu_voltage_volt
  :field u2_battery_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.u2.battery_voltage_volt
  :field u2_cpu_temperature_degree: ax25_frame.payload.ax25_info.tlm_area_switch.u2.cpu_temperature_degree
  :field u2_amplifier_temperature_degree: ax25_frame.payload.ax25_info.tlm_area_switch.u2.amplifier_temperature_degree
  :field u2_fec: ax25_frame.payload.ax25_info.tlm_area_switch.u2.fec
  :field u2_downlink: ax25_frame.payload.ax25_info.tlm_area_switch.u2.downlink
  :field u2_band_lock: ax25_frame.payload.ax25_info.tlm_area_switch.u2.band_lock
  :field u2_xor: ax25_frame.payload.ax25_info.tlm_area_switch.u2.xor
  :field u2_aes_128: ax25_frame.payload.ax25_info.tlm_area_switch.u2.aes_128
  :field u2_amp_ovt: ax25_frame.payload.ax25_info.tlm_area_switch.u2.amp_ovt
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.u2.timestamp_int
  :field u2_current_rssi_int: ax25_frame.payload.ax25_info.tlm_area_switch.u2.current_rssi_int
  :field u2_latch_rssi_int: ax25_frame.payload.ax25_info.tlm_area_switch.u2.latch_rssi_int
  :field u2_a_f_c_offset_int: ax25_frame.payload.ax25_info.tlm_area_switch.u2.a_f_c_offset_int
  :field cu_r_return_value_int: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.return_value_int
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.timestamp_int
  :field cu_r_cpu_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.cpu_voltage_volt
  :field cu_r_cpu_temperature_degree: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.cpu_temperature_degree
  :field cu_r_onyx_on: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.onyx_on
  :field cu_r_llc_onyx_fault: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.llc_onyx_fault
  :field cu_r_llc_sram_fault: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.llc_sram_fault
  :field cu_r_fault_1v8_r: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.fault_1v8_r
  :field cu_r_fault_1v8_m: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.fault_1v8_m
  :field cu_r_fault_3v3_12v: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.fault_3v3_12v
  :field cu_r_pic_ready_raw: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.pic_ready_raw
  :field cu_r_pic_ready_conv: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.pic_ready_conv
  :field cu_r_pic_ready_compressed: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.pic_ready_compressed
  :field cu_r_pic_ready_compressed_8: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.pic_ready_compressed_8
  :field cu_r_sd_pic_write_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.sd_pic_write_ok
  :field cu_r_sd_pic_read_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.sd_pic_read_ok
  :field cu_r_sd_get_info_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.sd_get_info_ok
  :field cu_r_sd_erase_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.sd_erase_ok
  :field cu_r_sd_full: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.sd_full
  :field cu_r_adc_ready: ax25_frame.payload.ax25_info.tlm_area_switch.cu_r.adc_ready
  :field timestamp_int: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.timestamp_int
  :field cu_l_cpu_voltage_volt: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.cpu_voltage_volt
  :field cu_l_cpu_temperature_degree: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.cpu_temperature_degree
  :field cu_l_onyx_on: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.onyx_on
  :field cu_l_llc_onyx_fault: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.llc_onyx_fault
  :field cu_l_llc_sram_fault: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.llc_sram_fault
  :field cu_l_fault_1v8_r: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.fault_1v8_r
  :field cu_l_fault_1v8_m: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.fault_1v8_m
  :field cu_l_fault_3v3_12v: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.fault_3v3_12v
  :field cu_l_pic_ready_raw: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.pic_ready_raw
  :field cu_l_pic_ready_conv: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.pic_ready_conv
  :field cu_l_pic_ready_compressed: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.pic_ready_compressed
  :field cu_l_pic_ready_compressed_8: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.pic_ready_compressed_8
  :field cu_l_sd_pic_write_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.sd_pic_write_ok
  :field cu_l_sd_pic_read_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.sd_pic_read_ok
  :field cu_l_sd_get_info_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.sd_get_info_ok
  :field cu_l_sd_erase_ok: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.sd_erase_ok
  :field cu_l_sd_full: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.sd_full
  :field cu_l_adc_ready: ax25_frame.payload.ax25_info.tlm_area_switch.cu_l.adc_ready
  :field aprs_message: ax25_frame.payload.ax25_info.aprs_message

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
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
        type: ax25_info_data
        size-eos: true
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type: ax25_info_data
        size-eos: true
  ax25_info_data:
    seq:
      - id: start
        type: u1
      - id: tlm_area
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: tlm_area_switch
        type:
          switch-on: tlm_area
          cases:
            '"M1"': m1_type
            '"A1"': a1_type
            '"EM"': em_type
            '"ER"': er_type
            '"V1"': v1_type
            '"U2"': u2_type
            '"CU_R"': cu_r_type
            '"CU_L"': cu_l_type
    instances:
      aprs_message:
        pos: 0x0
        type: str
        encoding: utf-8
        size-eos: true
  m1_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: m1
        type:
          switch-on: tlm_type
          cases:
            '"LOG"': m1_log_type
            '"FLAGS"': m1_flags_type
  a1_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: a1
        type:
          switch-on: tlm_type
          cases:
            '"FLAGS"': a1_flags_type
            '"MAG"': a1_mag_type
            '"GYRO"': a1_gyro_type
            '"POSITION"': a1_position_type
  em_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: em
        type:
          switch-on: tlm_type
          cases:
            '"LOG"': em_log_type
            '"MN"': em_mn_type
  er_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: er
        type:
          switch-on: tlm_type
          cases:
            '"LOG"': er_log_type
            '"MN"': er_mn_type
  v1_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: v1
        type:
          switch-on: tlm_type
          cases:
            '"RL"': v1_rl_type
            '"MS"': v1_ms_type
  u2_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: u2
        type:
          switch-on: tlm_type
          cases:
            '"RL"': u2_rl_type
            '"MS"': u2_ms_type
  cu_l_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cu_l
        type:
          switch-on: tlm_type
          cases:
            '"ONYX SENSOR T"': cu_l_onyx_type
            '"LOG"': cu_l_log_type
  cu_r_type:
    seq:
      - id: tlm_type
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cu_r
        type:
          switch-on: tlm_type
          cases:
            '"ONYX SENSOR T"': cu_r_onyx_type
            '"LOG"': cu_r_log_type
  m1_log_type:
    doc: |
      M1;LOG;[Timestamp];[Boot number];[Up time];[CPU voltage];[CPU temperature]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: boot_number
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: up_time
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_temperature
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      cpu_voltage_volt:
        value: '(cpu_voltage.to_i) / 1000.0'
      boot_number_int:
        value: '(boot_number.to_i)'
      cpu_temperature_degree:
        value: '(cpu_temperature.to_i)'
      up_time_int:
        value: '(up_time.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
  m1_flags_type:
    doc: |
      M1;FLAGS;[Timestamp];[Hex flags];
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: hex_part
        type: str
        encoding: ASCII
        terminator: 0x78
      - id: flags
        type: str
        encoding: ASCII
        terminator: 0x3B
    instances:
      imc_aocs_ok:
        value: '(flags.to_i(16) & 0x1)'
      imc_cu_l_ok:
        value: '((flags.to_i(16) & 0x2) >> 1)'
      imc_cu_r_ok:
        value: '((flags.to_i(16) & 0x4) >> 2)'
      imc_vhf1_ok:
        value: '((flags.to_i(16) & 0x8) >> 3)'
      imc_uhf2_ok:
        value: '((flags.to_i(16) & 0x10) >> 4)'
      vhf1_downlink:
        value: '((flags.to_i(16) & 0x20) >> 5)'
      uhf2_downlink:
        value: '((flags.to_i(16) & 0x40) >> 6)'
      imc_check:
        value: '((flags.to_i(16) & 0x80) >> 7)'
      beacon_mode:
        value: '((flags.to_i(16) & 0x100) >> 8)'
      cyclic_reset_on:
        value: '((flags.to_i(16) & 0x200) >> 9)'
      survival_mode:
        value: '((flags.to_i(16) & 0x400) >> 10)'
      payload_off:
        value: '((flags.to_i(16) & 0x800) >> 11)'
      cu_auto_off:
        value: '((flags.to_i(16) & 0x1000) >> 12)'
      tm_log:
        value: '((flags.to_i(16) & 0x2000) >> 13)'
      cul_on:
        value: '((flags.to_i(16) & 0x10000) >> 16)'
      cul_faut:
        value: '((flags.to_i(16) & 0x20000) >> 17)'
      cur_on:
        value: '((flags.to_i(16) & 0x40000) >> 18)'
      cur_fault:
        value: '((flags.to_i(16) & 0x80000) >> 19)'
      cu_on:
        value: '((flags.to_i(16) & 0x100000) >> 20)'
      cul_dead:
        value: '((flags.to_i(16) & 0xF000000) >> 24)'
      cur_dead:
        value: '((flags.to_i(16) & 0xF0000000) >> 28)'
      fault_3v_r:
        value: '((flags.to_i(16) & 0x10000000000) >> 40)'
      fault_3v_m:
        value: '((flags.to_i(16) & 0x20000000000) >> 41)'
      charge_r:
        value: '((flags.to_i(16) & 0x40000000000) >> 42)'
      charge_m:
        value: '((flags.to_i(16) & 0x80000000000) >> 43)'
      long_log:
        value: '((flags.to_i(16) & 0x200000000000) >> 45)'
      log_to_flash:
        value: '((flags.to_i(16) & 0x400000000000) >> 46)'
      plan:
        value: '((flags.to_i(16) & 0x800000000000) >> 47)'
      stream:
        value: '((flags.to_i(16) & 0x1000000000000) >> 48)'
      vhf1_packet_ready:
        value: '((flags.to_i(16) & 0x2000000000000) >> 49)'
      uhf2_packet_ready:
        value: '((flags.to_i(16) & 0x4000000000000) >> 50)'
      survival_start:
        value: '((flags.to_i(16) & 0x8000000000000) >> 51)'
      survival_end:
        value: '((flags.to_i(16) & 0x10000000000000) >> 52)'
      timestamp_int:
        value: '(timestamp.to_i)'
  a1_flags_type:
    doc: |
      A1;FLAGS;[timestamp];[mode];[flags];[faults]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: adcs_mode
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: a1_flags
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: faults
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      detumbling:
        value: '(adcs_mode.to_i(16) & 0x1)'
      adcs_on_off:
        value: '((adcs_mode.to_i(16) & 0x2) >> 1)'
      detumbling_status:
        value: '((adcs_mode.to_i(16) & 0xC) >> 2)'
      manual:
        value: '((adcs_mode.to_i(16) & 0xF0) >> 4)'
      act_on_off:
        value: '(a1_flags.to_i(16) & 0x1)'
      sun_contr:
        value: '((a1_flags.to_i(16) & 0x2) >> 1)'
      sens_on_off:
        value: '((a1_flags.to_i(16) & 0x4) >> 2)'
      act_man_contr:
        value: '((a1_flags.to_i(16) & 0x8) >> 3)'
      act_limited_contr:
        value: '((a1_flags.to_i(16) & 0x10) >> 4)'
      gyro_acc_fault:
        value: '(faults.to_i(16) & 0x1)'
      mag_fault:
        value: '((faults.to_i(16) & 0x2) >> 1)'
      sun_fault:
        value: '((faults.to_i(16) & 0x4) >> 2)'
      l1_fault:
        value: '((faults.to_i(16) & 0x8) >> 3)'
      l2_fault:
        value: '((faults.to_i(16) & 0x10) >> 4)'
      l3_fault:
        value: '((faults.to_i(16) & 0x20) >> 5)'
      timestamp_int:
        value: '(timestamp.to_i)'
  a1_mag_type:
    doc: |
      A1;MAG;[Current timestamp];[MagX];[MagY];[MagZ]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: mag_x
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: mag_y
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: mag_z
        type: str
        encoding: ASCII
        terminator: 0x3B
    instances:
      mag_x_int:
        value: '(mag_x.to_i)'
      mag_y_int:
        value: '(mag_y.to_i)'
      mag_z_int:
        value: '(mag_z.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
  a1_gyro_type:
    doc: |
      A1;GYRO;[Current timestamp];[GyroX];[GyroY];[GyroZ]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: giro_x
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: giro_y
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: giro_z
        type: str
        encoding: ASCII
        terminator: 0x3B
    instances:
      gyro_x_int:
        value: '(giro_x.to_i)'
      gyro_y_int:
        value: '(giro_y.to_i)'
      gyro_z_int:
        value: '(giro_z.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
  a1_position_type:
    doc: |
      A1;POSITION;[Current timestamp];[Latitude];[Longitude]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: latitude
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: longitude
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      latitude_int:
        value: '(latitude.to_i)'
      longitude_int:
        value: '(longitude.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
  em_mn_type:
    doc: |
      EM;MN;[Timestamp];[V in];[V solar];[I in];[P in];[P peak];[T cpu];[V cpu]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: v_in
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: v_solar
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: i_in
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: p_in
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: p_peak
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: t_cpu
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: v_cpu
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      v_in_volt:
        value: '(v_in.to_i) / 1000.0'
      v_solar_volt:
        value: '(v_solar.to_i) / 1000.0'
      i_in_ma:
        value: '(i_in.to_i)'
      p_in_mw:
        value: '(p_in.to_i)'
      p_peak_mw:
        value: '(p_peak.to_i)'
      t_cpu_degree:
        value: '(t_cpu.to_i)'
      v_cpu_volt:
        value: '(v_cpu.to_i) / 1000.0'
      timestamp_int:
        value: '(timestamp.to_i)'
  er_mn_type:
    doc: |
      ER;MN;[Timestamp];[V in];[V solar];[I in];[P in];[P peak];[T cpu];[V cpu]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: v_in
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: v_solar
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: i_in
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: p_in
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: p_peak
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: t_cpu
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: v_cpu
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      v_in_volt:
        value: '(v_in.to_i) / 1000.0'
      v_solar_volt:
        value: '(v_solar.to_i) / 1000.0'
      i_in_ma:
        value: '(i_in.to_i)'
      p_in_mw:
        value: '(p_in.to_i)'
      p_peak_mw:
        value: '(p_peak.to_i)'
      t_cpu_degree:
        value: '(t_cpu.to_i)'
      v_cpu_volt:
        value: '(v_cpu.to_i) / 1000.0'
      timestamp_int:
        value: '(timestamp.to_i)'
  em_log_type:
    doc: |
      EM;LOG;[Timestamp];[Boot number];[Input voltage];[Input current];[Input power];[Peak Power];[Solar panel voltage]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: boot_number
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: input_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: input_current
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: input_power
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: peak_power
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: solar_panel_voltage
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      boot_number_int:
        value: '(boot_number.to_i)'
      input_voltage_volt:
        value: '(input_voltage.to_i) / 1000.0'
      input_current_ma:
        value: '(input_current.to_i)'
      input_power_mw:
        value: '(input_power.to_i)'
      peak_power_mw:
        value: '(peak_power.to_i)'
      solar_panel_voltage_volt:
        value: '(solar_panel_voltage.to_i) / 1000.0'
      timestamp_int:
        value: '(timestamp.to_i)'
  er_log_type:
    doc: |
      ER;LOG;[Timestamp];[Boot number];[Input voltage];[Input current];[Input power];[Peak Power];[Solar panel voltage]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: boot_number
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: input_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: input_current
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: input_power
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: peak_power
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: solar_panel_voltage
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      boot_number_int:
        value: '(boot_number.to_i)'
      input_voltage_volt:
        value: '(input_voltage.to_i) / 1000.0'
      input_current_ma:
        value: '(input_current.to_i)'
      input_power_mw:
        value: '(input_power.to_i)'
      peak_power_mw:
        value: '(peak_power.to_i)'
      solar_panel_voltage_volt:
        value: '(solar_panel_voltage.to_i) / 1000.0'
      timestamp_int:
        value: '(timestamp.to_i)'
  v1_rl_type:
    doc: |
      V1;RL;[Timestamp],[CPU voltage];[Battery voltage];[CPU temperature];[Amplifier temperature];[Flags]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x2C
      - id: cpu_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: battery_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_temperature
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: amplifier_temperature
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: flagsmagic
        contents: [0x30, 0x78]
      - id: flags
        type: str
        encoding: ASCII
        size: 1
    instances:
      cpu_voltage_volt:
        value: '(cpu_voltage.to_i) / 1000.0'
      battery_voltage_volt:
        value: '(battery_voltage.to_i) / 1000.0'
      cpu_temperature_degree:
        value: '(cpu_temperature.to_i)'
      amplifier_temperature_degree:
        value: '(amplifier_temperature.to_i)'
      fec:
        value: '(flags.to_i(16) & 0x1)'
      downlink:
        value: '((flags.to_i(16) & 0x2) >> 1)'
      band_lock:
        value: '((flags.to_i(16) & 0x4) >> 2)'
      xor:
        value: '((flags.to_i(16) & 0x8) >> 3)'
      aes_128:
        value: '((flags.to_i(16) & 0x10) >> 4)'
      amp_ovt:
        value: '((flags.to_i(16) & 0x20) >> 5)'
      timestamp_int:
        value: '(timestamp.to_i)'
  u2_rl_type:
    doc: |
      U2;RL;[Timestamp],[CPU voltage];[Battery voltage];[CPU temperature];[Amplifier temperature];[Flags]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: battery_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_temperature
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: amplifier_temperature
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: flagsmagic
        contents: [0x30, 0x78]
      - id: flags
        type: str
        encoding: ASCII
        size: 1
    instances:
      cpu_voltage_volt:
        value: '(cpu_voltage.to_i) / 1000.0'
      battery_voltage_volt:
        value: '(battery_voltage.to_i) / 1000.0'
      cpu_temperature_degree:
        value: '(cpu_temperature.to_i)'
      amplifier_temperature_degree:
        value: '(amplifier_temperature.to_i)'
      fec:
        value: '(flags.to_i(16) & 0x1)'
      downlink:
        value: '((flags.to_i(16) & 0x2) >> 1)'
      band_lock:
        value: '((flags.to_i(16) & 0x4) >> 2)'
      xor:
        value: '((flags.to_i(16) & 0x8) >> 3)'
      aes_128:
        value: '((flags.to_i(16) & 0x10) >> 4)'
      amp_ovt:
        value: '((flags.to_i(16) & 0x20) >> 5)'
      timestamp_int:
        value: '(timestamp.to_i)'
  v1_ms_type:
    doc: |
      V1;MS;[Timestamp];[Current rssi];[Latch rssi];[AFC offset]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: current_rssi
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: latch_rssi
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: a_f_c_offset
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      current_rssi_int:
        value: '(current_rssi.to_i)'
      latch_rssi_int:
        value: '(latch_rssi.to_i)'
      a_f_c_offset_int:
        value: '(a_f_c_offset.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
  u2_ms_type:
    doc: |
      U2;MS;[Timestamp];[Current rssi];[Latch rssi];[AFC offset]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: current_rssi
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: latch_rssi
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: a_f_c_offset
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      current_rssi_int:
        value: '(current_rssi.to_i)'
      latch_rssi_int:
        value: '(latch_rssi.to_i)'
      a_f_c_offset_int:
        value: '(a_f_c_offset.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
  cu_l_log_type:
    doc: |
      CU_L;LOG;[Timestamp];[CPU voltage];[CPU temperature];[flags]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_temperature
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: flagsmagic
        contents: [0x30, 0x78]
      - id: cu_flags
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      cpu_voltage_volt:
        value: '(cpu_voltage.to_i) / 1000.0'
      cpu_temperature_degree:
        value: '(cpu_temperature.to_i)'
      onyx_on:
        value: '(cu_flags.to_i(16) & 0x1)'
      llc_onyx_fault:
        value: '((cu_flags.to_i(16) & 0x2) >> 1)'
      llc_sram_fault:
        value: '((cu_flags.to_i(16) & 0x4) >> 2)'
      fault_1v8_r:
        value: '((cu_flags.to_i(16) & 0x8) >> 3)'
      fault_1v8_m:
        value: '((cu_flags.to_i(16) & 0x10) >> 4)'
      fault_3v3_12v:
        value: '((cu_flags.to_i(16) & 0x20) >> 5)'
      pic_ready_raw:
        value: '((cu_flags.to_i(16) & 0x40) >> 6)'
      pic_ready_conv:
        value: '((cu_flags.to_i(16) & 0x80) >> 7)'
      pic_ready_compressed:
        value: '((cu_flags.to_i(16) & 0x100) >> 8)'
      pic_ready_compressed_8:
        value: '((cu_flags.to_i(16) & 0x200) >> 9)'
      sd_pic_write_ok:
        value: '((cu_flags.to_i(16) & 0x400) >> 10)'
      sd_pic_read_ok:
        value: '((cu_flags.to_i(16) & 0x800) >> 11)'
      sd_get_info_ok:
        value: '((cu_flags.to_i(16) & 0x1000) >> 12)'
      sd_erase_ok:
        value: '((cu_flags.to_i(16) & 0x2000) >> 13)'
      sd_full:
        value: '((cu_flags.to_i(16) & 0x4000) >> 14)'
      adc_ready:
        value: '((cu_flags.to_i(16) & 0x8000) >> 15)'
      timestamp_int:
        value: '(timestamp.to_i)'
  cu_r_log_type:
    doc: |
      CU_R;LOG;[Timestamp];[CPU voltage];[CPU temperature];[flags]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_voltage
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: cpu_temperature
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: flagsmagic
        contents: [0x30, 0x78]
      - id: cu_flags
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      cpu_voltage_volt:
        value: '(cpu_voltage.to_i) / 1000.0'
      cpu_temperature_degree:
        value: '(cpu_temperature.to_i)'
      onyx_on:
        value: '(cu_flags.to_i(16) & 0x1)'
      llc_onyx_fault:
        value: '((cu_flags.to_i(16) & 0x2) >> 1)'
      llc_sram_fault:
        value: '((cu_flags.to_i(16) & 0x4) >> 2)'
      fault_1v8_r:
        value: '((cu_flags.to_i(16) & 0x8) >> 3)'
      fault_1v8_m:
        value: '((cu_flags.to_i(16) & 0x10) >> 4)'
      fault_3v3_12v:
        value: '((cu_flags.to_i(16) & 0x20) >> 5)'
      pic_ready_raw:
        value: '((cu_flags.to_i(16) & 0x40) >> 6)'
      pic_ready_conv:
        value: '((cu_flags.to_i(16) & 0x80) >> 7)'
      pic_ready_compressed:
        value: '((cu_flags.to_i(16) & 0x100) >> 8)'
      pic_ready_compressed_8:
        value: '((cu_flags.to_i(16) & 0x200) >> 9)'
      sd_pic_write_ok:
        value: '((cu_flags.to_i(16) & 0x400) >> 10)'
      sd_pic_read_ok:
        value: '((cu_flags.to_i(16) & 0x800) >> 11)'
      sd_get_info_ok:
        value: '((cu_flags.to_i(16) & 0x1000) >> 12)'
      sd_erase_ok:
        value: '((cu_flags.to_i(16) & 0x2000) >> 13)'
      sd_full:
        value: '((cu_flags.to_i(16) & 0x4000) >> 14)'
      adc_ready:
        value: '((cu_flags.to_i(16) & 0x8000) >> 15)'
      timestamp_int:
        value: '(timestamp.to_i)'
  cu_l_onyx_type:
    doc: |
      CU_L;ONYX SENSOR T;[Timestamp];[Return value]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: return_value
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      return_value_int:
        value: '(return_value.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
  cu_r_onyx_type:
    doc: |
      CU_R;ONYX SENSOR T;[Timestamp];[Return value]
    seq:
      - id: timestamp
        type: str
        encoding: ASCII
        terminator: 0x3B
      - id: return_value
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      return_value_int:
        value: '(return_value.to_i)'
      timestamp_int:
        value: '(timestamp.to_i)'
