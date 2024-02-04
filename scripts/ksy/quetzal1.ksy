---
meta:
  id: quetzal1
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field priority: ax25_frame.payload.ax25_info.csp_header.priority
  :field source: ax25_frame.payload.ax25_info.csp_header.source
  :field destination: ax25_frame.payload.ax25_info.csp_header.destination
  :field destination_port: ax25_frame.payload.ax25_info.csp_header.destination_port
  :field source_port: ax25_frame.payload.ax25_info.csp_header.source_port
  :field reserved: ax25_frame.payload.ax25_info.csp_header.reserved
  :field hmac: ax25_frame.payload.ax25_info.csp_header.hmac
  :field xtea: ax25_frame.payload.ax25_info.csp_header.xtea
  :field rdp: ax25_frame.payload.ax25_info.csp_header.rdp
  :field crc: ax25_frame.payload.ax25_info.csp_header.crc
  :field cubesat_identifier: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cubesat_identifier
  :field rtc_hh: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.rtc_hh
  :field rtc_mm: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.rtc_mm
  :field rtc_ss: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.rtc_ss
  :field rtc_dd: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.rtc_dd
  :field rtc_mo: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.rtc_mo
  :field rtc_yy: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.rtc_yy
  :field adm_status: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.adm_status
  :field eps_status: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.eps_status
  :field heater_status: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.heater_status
  :field adcs_status: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.adcs_status
  :field payload_status: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.payload_status
  :field adm_software_reset_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.adm_software_reset_counter
  :field eps_software_reset_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.eps_software_reset_counter
  :field adcs_software_reset_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.adcs_software_reset_counter
  :field adcs_hardware_reset_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.adcs_hardware_reset_counter
  :field comms_hardware_reset_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.comms_hardware_reset_counter
  :field cdhs_reset_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.cdhs.cdhs_reset_counter
  :field tmp100_temp1: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.tmp100_temp1
  :field bq1_soc: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.bq1_soc
  :field bq1_bat_volt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.bq1_bat_volt
  :field bq1_avg_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.bq1_avg_cur
  :field bq1_remaining_capacity: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.bq1_remaining_capacity
  :field bq1_avg_power: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.bq1_avg_power
  :field bq1_state_of_health: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.bq1_state_of_health
  :field ina1_ch1_volt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.ina1_ch1_volt
  :field ina1_ch1_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.ina1_ch1_cur
  :field ina2_ch2_volt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.ina2_ch2_volt
  :field ina2_ch2_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.ina2_ch2_cur
  :field ina3_ch3_volt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.ina3_ch3_volt
  :field ina3_ch3_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.ina3_ch3_cur
  :field fpb_adcs_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.fpb_adcs_cur
  :field fpb_comms_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.fpb_comms_cur
  :field fpb_payload_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.fpb_payload_cur
  :field fpb_heater_cur: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.fpb_heater_cur
  :field fault_flags: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.fault_flags
  :field general_comm_flag: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.general_comm_flag
  :field general_trans_flag: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps.general_trans_flag
  :field bno055_temp: ax25_frame.payload.ax25_info.csp_node.csp_node_port.adcs.bno055_temp
  :field cs_adcs_temp_tmp100: ax25_frame.payload.ax25_info.csp_node.csp_node_port.adcs.cs_adcs_temp_tmp100
  :field general_trans_flags: ax25_frame.payload.ax25_info.csp_node.csp_node_port.adcs.general_trans_flags
  :field cs_orientation_gyro: ax25_frame.payload.ax25_info.csp_node.csp_node_port.adcs.cs_orientation_gyro
  :field cs_orientation_magneto: ax25_frame.payload.ax25_info.csp_node.csp_node_port.adcs.cs_orientation_magneto
  :field cs_orientation_adc1: ax25_frame.payload.ax25_info.csp_node.csp_node_port.adcs.cs_orientation_adc1
  :field cs_orientation_adc2: ax25_frame.payload.ax25_info.csp_node.csp_node_port.adcs.cs_orientation_adc2
  :field package_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.comm.package_counter
  :field operation_mode: ax25_frame.payload.ax25_info.csp_node.csp_node_port.payload.operation_mode
  :field camera_picture_counter: ax25_frame.payload.ax25_info.csp_node.csp_node_port.payload.camera_picture_counter
  :field cdhs_cycle_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.cdhs_cycle_time
  :field cdhs_wdt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.cdhs_wdt
  :field adm_soc_limit: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adm_soc_limit
  :field adcs_soc_limit: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adcs_soc_limit
  :field comms_soc_limit: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.comms_soc_limit
  :field payload_soc_limit: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.payload_soc_limit
  :field heater_cycle_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.heater_cycle_time
  :field heater_emergency_on_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.heater_emergency_on_time
  :field heater_emergency_off_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.heater_emergency_off_time
  :field adm_cycle_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adm_cycle_time
  :field adm_burn_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adm_burn_time
  :field adm_max_cycles: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adm_max_cycles
  :field adm_wait_time_1: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adm_wait_time_1
  :field adm_wait_time_2: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adm_wait_time_2
  :field adm_enable: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.adm_enable
  :field comms_cycle_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.comms_cycle_time
  :field payload_cycle_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.payload_cycle_time
  :field payload_operation_mode: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.payload_operation_mode
  :field camera_resolution: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.camera_resolution
  :field camera_exposition: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.camera_exposition
  :field camera_picture_save_time: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.camera_picture_save_time
  :field payload_enable: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ram_params.payload_enable
  :field uvg_msg: ax25_frame.payload.ax25_info.csp_node.csp_node_port.uvg_msg.uvg_msg
  :field temp_brd: ax25_frame.payload.ax25_info.csp_node.csp_node_port.temp_brd
  :field temp_pa: ax25_frame.payload.ax25_info.csp_node.csp_node_port.temp_pa
  :field last_rssi: ax25_frame.payload.ax25_info.csp_node.csp_node_port.last_rssi
  :field last_rferr: ax25_frame.payload.ax25_info.csp_node.csp_node_port.last_rferr
  :field tx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tx_count
  :field rx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.rx_count
  :field tx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tx_bytes
  :field rx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.rx_bytes
  :field active_conf: ax25_frame.payload.ax25_info.csp_node.csp_node_port.active_conf
  :field boot_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.boot_count
  :field boot_cause: ax25_frame.payload.ax25_info.csp_node.csp_node_port.boot_cause
  :field last_contact: ax25_frame.payload.ax25_info.csp_node.csp_node_port.last_contact
  :field bgnd_rssi: ax25_frame.payload.ax25_info.csp_node.csp_node_port.bgnd_rssi
  :field tx_duty: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tx_duty
  :field tot_tx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_tx_count
  :field tot_rx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_rx_count
  :field tot_tx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_tx_bytes
  :field tot_rx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_rx_bytes

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
      - id: csp_header
        type: csp_header_t
      - id: csp_node
        type:
          switch-on: csp_header.source
          cases:
            1: obc_t
            5: ax100_t
  csp_header_t:
    seq:
      - id: raw_csp_header
        type: u4be
    instances:
      priority:
        value: '(raw_csp_header >> 30)'
      source:
        value: '((raw_csp_header >> 25) & 0x1F)'
      destination:
        value: '((raw_csp_header >> 20) & 0x1F)'
      destination_port:
        value: '((raw_csp_header >> 14) & 0x3F)'
      source_port:
        value: '((raw_csp_header >> 8) & 0x3F)'
      reserved:
        value: '((raw_csp_header >> 4) & 0x0F)'
      hmac:
        value: '((raw_csp_header & 0x08) >> 3)'
      xtea:
        value: '((raw_csp_header & 0x04) >> 2)'
      rdp:
        value: '((raw_csp_header & 0x02) >> 1)'
      crc:
        value: '(raw_csp_header & 0x01)'
  ax100_t:
    seq:
      - id: csp_node_port
        type:
          switch-on: _parent.csp_header.source_port
          cases:
            0: ax100_control_port_t
  obc_t:
    seq:
      - id: csp_node_port
        type: beacon_t
  ax100_control_port_t:
    seq:
      - id: temp_brd
        type: s2
      - id: temp_pa
        type: s2
      - id: last_rssi
        type: s2
      - id: last_rferr
        type: s2
      - id: tx_count
        type: u4
      - id: rx_count
        type: u4
      - id: tx_bytes
        type: u4
      - id: rx_bytes
        type: u4
      - id: active_conf
        type: u1
      - id: boot_count
        type: u2
      - id: boot_cause
        type: u4
      - id: last_contact
        type: u4
      - id: bgnd_rssi
        type: s2
      - id: tx_duty
        type: u1
      - id: tot_tx_count
        type: u4
      - id: tot_rx_count
        type: u4
      - id: tot_tx_bytes
        type: u4
      - id: tot_rx_bytes
        type: u4
  beacon_t:
    seq:
      - id: cubesat_identifier_magic
        contents: ["QUETZAL1"]
      - id: cdhs
        type: cdhs_t
      - id: eps
        type: eps_t
      - id: adcs
        type: adcs_t
      - id: comm
        type: comm_t
      - id: payload
        type: payload_t
      - id: ram_params
        type: ram_params_t
      - id: uvg_msg
        type: uvg_msg_t
    instances:
      cubesat_identifier:
        pos: 0x4
        type: str
        size: 8
        encoding: ASCII
  cdhs_t:
    seq:
      - id: rtc_hh
        type: u1
        doc: 'Hour'
      - id: rtc_mm
        type: u1
        doc: 'Minute'
      - id: rtc_ss
        type: u1
        doc: 'Seconds'
      - id: rtc_dd
        type: u1
        doc: 'Date (Day?)'
      - id: rtc_mo
        type: u1
        doc: 'Month'
      - id: rtc_yy
        type: u1
        doc: 'Year'
      - id: adm_status
        type: u1
        doc: 'One bit for each antenna status'
      - id: eps_status
        type: u1
        doc: 'Communication success (S: 0x53) Error (E: 0x45 )'
      - id: heater_status
        type: u1
        doc: |
          bits 7-4: Autonomous (1001) or Manual (0110)
          bits 3-0: On (1001) or Off (0110)
      - id: adcs_status
        type: u1
        doc: 'Communication success (S: 0x53) Error (E: 0x45 )'
      - id: payload_status
        type: u1
        doc: |
          Always sends (S: 0x53) unless payload had operation error, it
          sends Error (E: 0x45 )
      - id: adm_software_reset_counter
        type: u1
        doc: 'Maximum of 255 resets (0-255)'
      - id: eps_software_reset_counter
        type: u1
        doc: 'Maximum of 255 resets (0-255)'
      - id: adcs_software_reset_counter
        type: u1
        doc: 'Maximum of 255 resets (0-255)'
      - id: adcs_hardware_reset_counter
        type: u1
        doc: 'Maximum of 255 resets (0-255)'
      - id: comms_hardware_reset_counter
        type: u1
        doc: 'Maximum of 255 resets (0-255)'
      - id: cdhs_reset_counter
        type: u2
        doc: 'Maximum of 65,535 resets (0-2^16)'
  eps_t:
    seq:
      - id: tmp100_temp1
        type: u1
        doc: |
          TMP100 function is to enable battery heaters when temperature < 0°C
          (67 bits)
          expected: -15 to +60°C
          programmed: -25 to +70°C
          digit range: 0-252
          resolution: 0.38 degC/bit
          error values: 253, 255
          equation: 0.3770 * tmp100_temp1 -25 [degC]
      - id: bq1_soc
        type: u1
        doc: |
          Does not need mapping because magnitude of value is directly
          transmitted
          expected: 0 to 100%
          programmed: 0 to 100 %
          digit range: 0-100
          resolution: 1 unit/bit
          error values: 253
          equation: 1 * bq1_soc [%]
      - id: bq1_bat_volt
        type: u1
        doc: |
          If voltage value is 0V, 0x00 is transmitted instead of Out-of-range
          ERROR (0xFF). No need to decode with equation
          expected: 2.75 to 4.3 V
          programmed: 2.5 to 4.5 V
          digit range: 1-252
          resolution: 7.96mV/bit
          error values: 253-255
          equation: 7.9681 * bq1_bat_volt + 2492.0319 [mV]
      - id: bq1_avg_cur
        type: u2
        doc: |
          Two bytes are used because current can be positive or negative
          (charge/discharge)
          expected: -2.0 to 2.0 A
          programmed: -2.5 to 2.5 A
          digit range: 0-4092
          resolution: 1.22mA/bit
          error values: 4093, 4095
          equation: 1.2219 * bq1_avg_cur - 2500 [mA]
      - id: bq1_remaining_capacity
        type: u2
        doc: |
          expected: 0 to 4.0 Ah
          programmed: 0 to 4.0 Ah
          digit range: 0-4092
          resolution: 0.98mAh/bit
          error values: 4093-4095
          equation: 0.97752 * bq1_remaining_capacity [mAh]
      - id: bq1_avg_power
        type: u2
        doc: |
          Two bytes are used because power can be positive or negative
          (charge/discharge)
          expected: -8.4 to 8.4 W
          programmed: -8.5 to 8.5 W
          digit range: 0-4092
          resolution: 4.15mW/bit
          error values: 4093, 4095
          equation: 4.1544 * bq1_avg_power - 8500 [mW]
      - id: bq1_state_of_health
        type: u1
        doc: |
          Does not need mapping because magnitude of value is directly
          transmitted
          expected: 0 to 100%
          programmed: 0 to 100%
          digit range: 0-100
          resolution: 1 unit/bit
          error values: 253
          equation: 1.0000 * bq1_state_of_health [%]
      - id: ina1_ch1_volt
        type: u1
        doc: |
          expected: 0 to 4.3 V
          programmed: 0 to 4.5V
          digit range: 0-252
          resolution: 17.85mV/bit
          error values: 253, 255
          equation: 0.01785 * ina1_ch1_volt [V]
      - id: ina1_ch1_cur
        type: u2
        doc: |
          expected: 0 to 0.8 A
          programmed: 0 to 2.5 A
          digit range: 0-4092
          resolution: 0.61mA/bit
          error values: 4093-4095
          equation: 0.6109 * ina1_ch1_cur [mA]
      - id: ina2_ch2_volt
        type: u1
        doc: |
          expected: 2.75 to 4.3 V
          programmed: 0 to 4.5V
          digit range: 0-252
          resolution: 17.85mV/bit
          error values: 253, 255
          equation: 0.01785 * ina1_ch1_volt [V]
      - id: ina2_ch2_cur
        type: u2
        doc: |
          expected: 0 to 2.0 A
          programmed: 0 to 2.5 A
          digit range: 0-4092
          resolution: 0.61mA/bit
          error values: 4093-4095
          equation: 0.6109 * ina1_ch1_cur [mA]
      - id: ina3_ch3_volt
        type: u1
        doc: |
          expected: 2.75 to 4.3 V
          programmed: 0 to 4.5V
          digit range: 0-252
          resolution: 17.85mV/bit
          error values: 253, 255
          equation: 0.01785 * ina1_ch1_volt [V]
      - id: ina3_ch3_cur
        type: u2
        doc: |
          expected: 0 to 2.0 A
          programmed: 0 to 2.5 A
          digit range: 0-4092
          resolution: 0.61mA/bit
          error values: 4093-4095
          equation: 0.6109 * ina1_ch1_cur [mA]
      - id: fpb_adcs_cur
        type: u2
        doc: |
          Current data is first read by analog pin as voltage and mapped
          (0-3.3V) to (0-2000mA). Value transmitted directly
          expected: 0 to 500 mA
          programmed: 0 to 2000 mA
          digit range: 0 - 4095
          resolution: 0.49 mA/bit
          error values: -
          equation: fpb_adcs_cur [mA]
      - id: fpb_comms_cur
        type: u2
        doc: |
          Current data is first read by analog pin as voltage and mapped
          (0-3.3V) to (0-2000mA). Value transmitted directly
          expected: 0 to 1150 mA
          programmed: 0 to 2000 mA
          digit range: 0 - 4095
          resolution: 0.49 mA/bit
          error values: -
          equation: fpb_comms_cur [mA]
      - id: fpb_payload_cur
        type: u2
        doc: |
          Current data is first read by analog pin as voltage and mapped
          (0-3.3V) to (0-2000mA). Value transmitted directly
          expected: 0 to 500 mA
          programmed: 0 to 2000 mA
          digit range: 0 - 4095
          resolution: 0.49 mA/bit
          error values: -
          equation: fpb_comms_cur [mA]
      - id: fpb_heater_cur
        type: u2
        doc: |
          Current data is first read by analog pin as voltage and mapped
          (0-3.3V) to (0-2000mA). Value transmitted directly
          expected: 0 to 500 mA
          programmed: 0 to 2000 mA
          digit range: 0 - 4095
          resolution: 0.49 mA/bit
          error values: -
          equation: fpb_heater_cur [mA]
      - id: fault_flags
        type: u1
        doc: |
          4 short-circuit flags and 4 overcurrent flags (one for each module).
          Set value means fault
          expected:
          programmed:
          digit range: 0-1 per bit
          resolution:
          error values: 1
          equation:
      - id: general_comm_flag
        type: u1
        doc: |
          Bit 0 (lsb): INA260_1;
          Bit 1: INA260_2;
          Bit 2: INA260_3;
          Bit 3: BQ27441;
          Bit 4: TMP100 No.1
          --------------------------
          (If Bit_x == 1, device has transmitted correctly, else it didn´t
          transmit correctly)
          expected:
          programmed:
          digit range: 0x00 to 0x1F
          resolution:
          error values: Any value different from 0x1F
          equation:
      - id: general_trans_flag
        type: u1
        doc: |
          Bit 0 (lsb): INA260_1;
          Bit 1: INA260_2;
          Bit 2: INA260_3;
          Bit 3: BQ27441;
          Bit 4: TMP100 No.1
          --------------------------
          (If Bit_x == 1, device has transmitted correctly, else it didn´t
          transmit correctly)
          expected:
          programmed:
          digit range: 0x00 to 0x1F
          resolution:
          error values: Any value different from 0x1F
          equation:
  adcs_t:
    seq:
      - id: cs_orientation_gyro_arr
        type: u1
        repeat: expr
        repeat-expr: 3
        doc: |
          Gyroscope is set to return values in deg/sec.
          expected: -100 to 100 deg/s
          programmed: -100 to 100 deg/s
          digit range: 0-255
          resolution: 0.78 deg/bit
          error values:
          equation:
      - id: cs_orientation_magneto_arr
        type: u1
        repeat: expr
        repeat-expr: 6
        doc: |
          16 bits will be used for each axis reading
          expected: -1300 to 1300 uT (x,y axes); -2500 to 2500 uT (z axis)
          programmed: -1300 to 1300 uT (x,y axes); -2500 to 2500 uT (z axis)
          digit range: 0-65536
          resolution: 0.03967 uT/bit
          error values:
          equation:
      - id: cs_orientation_adc1_arr
        type: u1
        repeat: expr
        repeat-expr: 6
        doc: |
          Maximum value 3.3V with an increase of 3.3V/255 (0.0129V) per bit
          expected: 0 to 3.3 V
          programmed: 0 to 3.3 V
          digit range: 0-255
          resolution: 12.9 mV/bit
          error values:
          equation:
      - id: cs_orientation_adc2_arr
        type: u1
        repeat: expr
        repeat-expr: 6
        doc: |
          Maximum value 3.3V with an increase of 3.3V/255 (0.0129V) per bit
          expected: 0 to 3.3 V
          programmed: 0 to 3.3 V
          digit range: 0-255
          resolution: 12.9 mV/bit
          error values:
          equation:
      - id: bno055_temp
        type: s1
        doc: |
          Signed char (1 byte) transmitted directly, no encoding
          expected: -15 to 60 °C
          programmed: -40 to 85 °C
          digit range: 0-255 ((-127)-128?)
          resolution: 0.5°C/bit
          error values:
          equation: bno055_temp [degC]
      - id: cs_adcs_temp_tmp100
        type: s2
        doc: |
          Signed short (2 bytes) transmitted directly, no encoding
          expected: -15 to 60 °C
          programmed: -25 to 70 °C
          digit range: 0-65535 ((-32767)-32768?)
          resolution: 0.001°C/bit
          error values:
          equation: cs_adcs_temp_tmp100 [degC]
      - id: general_trans_flags
        type: u1
        doc: |
          bit0 = bno055_trans_flag
          bit1 = adc1_trans_flag
          bit2 = adc2_trans_flag
          bit3 = adc3_trans_flag
          Bit 0, 1 = Transmission successful; 0 = Transmission failed
          Bit 1, 1 = Transmission successful; 0 = Transmission failed
          Bit 2, 1 = Transmission successful; 0 = Transmission failed
          Bit 3, 1 = Transmission successful; 0 = Transmission failed
    instances:
      cs_orientation_gyro:
        value: >-
          (cs_orientation_gyro_arr[0] << 16) |
          (cs_orientation_gyro_arr[1] << 8) |
          (cs_orientation_gyro_arr[2])
      cs_orientation_magneto:
        value: >-
          (cs_orientation_magneto_arr[0] << 40) |
          (cs_orientation_magneto_arr[1] << 32) |
          (cs_orientation_magneto_arr[2] << 24) |
          (cs_orientation_magneto_arr[3] << 16) |
          (cs_orientation_magneto_arr[4] << 8) |
          (cs_orientation_magneto_arr[5])
      cs_orientation_adc1:
        value: >-
          (cs_orientation_adc1_arr[0] << 40) |
          (cs_orientation_adc1_arr[1] << 32) |
          (cs_orientation_adc1_arr[2] << 24) |
          (cs_orientation_adc1_arr[3] << 16) |
          (cs_orientation_adc1_arr[4] << 8) |
          (cs_orientation_adc1_arr[5])
      cs_orientation_adc2:
        value: >-
          (cs_orientation_adc2_arr[0] << 40) |
          (cs_orientation_adc2_arr[1] << 32) |
          (cs_orientation_adc2_arr[2] << 24) |
          (cs_orientation_adc2_arr[3] << 16) |
          (cs_orientation_adc2_arr[4] << 8) |
          (cs_orientation_adc2_arr[5])
  comm_t:
    seq:
      - id: package_counter
        type: u4
        doc: |
          Transmitted directly, no encoding
  payload_t:
    seq:
      - id: operation_mode
        type: u1
        doc: |
          Basic (B: 0x42) or Full (F: 0x46)
      - id: camera_picture_counter
        type: u2
        doc: |
          Transmitted directly, no encoding
  ram_params_t:
    seq:
      - id: cdhs_cycle_time
        type: u1
      - id: cdhs_wdt
        type: u1
      - id: adm_soc_limit
        type: u1
      - id: adcs_soc_limit
        type: u1
      - id: comms_soc_limit
        type: u1
      - id: payload_soc_limit
        type: u1
      - id: heater_cycle_time
        type: u1
      - id: heater_emergency_on_time
        type: u1
      - id: heater_emergency_off_time
        type: u1
      - id: adm_cycle_time
        type: u1
      - id: adm_burn_time
        type: u1
      - id: adm_max_cycles
        type: u1
      - id: adm_wait_time_1
        type: u1
      - id: adm_wait_time_2
        type: u1
      - id: adm_enable
        type: u1
      - id: comms_cycle_time
        type: u1
      - id: payload_cycle_time
        type: u1
      - id: payload_operation_mode
        type: u1
      - id: camera_resolution
        type: u1
      - id: camera_exposition
        type: u1
      - id: camera_picture_save_time
        type: u1
      - id: payload_enable
        type: u1
  uvg_msg_t:
    seq:
      - id: uvg_msg
        type: str
        size: 27
        encoding: ASCII
        doc: 'ASCII message spanning 27 bytes'
