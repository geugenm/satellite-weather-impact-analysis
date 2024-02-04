---
meta:
  id: spoc
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field obc_curr_boot_image: ax25_frame.payload.ax25_info.obc_curr_boot_image
  :field mmm_mode: ax25_frame.payload.ax25_info.mmm_mode
  :field obt_uptime: ax25_frame.payload.ax25_info.obt_uptime
  :field bat_battery_current_dir: ax25_frame.payload.ax25_info.bat_battery_current_dir
  :field bat_battery_current_0: ax25_frame.payload.ax25_info.bat_battery_current_0
  :field bat_battery_current_1: ax25_frame.payload.ax25_info.bat_battery_current_1
  :field bat_battery_current_2: ax25_frame.payload.ax25_info.bat_battery_current_2
  :field bat_battery_voltage_0: ax25_frame.payload.ax25_info.bat_battery_voltage_0
  :field bat_battery_voltage_1: ax25_frame.payload.ax25_info.bat_battery_voltage_1
  :field bat_battery_voltage_2: ax25_frame.payload.ax25_info.bat_battery_voltage_2
  :field bat_battery_temperature_0: ax25_frame.payload.ax25_info.bat_battery_temperature_0
  :field bat_battery_temperature_1: ax25_frame.payload.ax25_info.bat_battery_temperature_1
  :field bat_battery_temperature_2: ax25_frame.payload.ax25_info.bat_battery_temperature_2
  :field bat_battery_temperature_3: ax25_frame.payload.ax25_info.bat_battery_temperature_3
  :field bat_battery_heater_status_0: ax25_frame.payload.ax25_info.bat_battery_heater_status_0
  :field bat_battery_heater_status_1: ax25_frame.payload.ax25_info.bat_battery_heater_status_1
  :field bat_battery_heater_status_2: ax25_frame.payload.ax25_info.bat_battery_heater_status_2
  :field bat_battery_heater_status_3: ax25_frame.payload.ax25_info.bat_battery_heater_status_3
  :field bat_status: ax25_frame.payload.ax25_info.bat_status
  :field bat_last_error: ax25_frame.payload.ax25_info.bat_last_error
  :field eps_status_0: ax25_frame.payload.ax25_info.eps_status_0
  :field eps_status_1: ax25_frame.payload.ax25_info.eps_status_1
  :field eps_last_error_0: ax25_frame.payload.ax25_info.eps_last_error_0
  :field eps_last_error_1: ax25_frame.payload.ax25_info.eps_last_error_1
  :field eps_switch_voltages_0: ax25_frame.payload.ax25_info.eps_switch_voltages_0
  :field eps_switch_voltages_1: ax25_frame.payload.ax25_info.eps_switch_voltages_1
  :field eps_switch_voltages_2: ax25_frame.payload.ax25_info.eps_switch_voltages_2
  :field eps_switch_voltages_3: ax25_frame.payload.ax25_info.eps_switch_voltages_3
  :field eps_switch_voltages_4: ax25_frame.payload.ax25_info.eps_switch_voltages_4
  :field eps_switch_voltages_5: ax25_frame.payload.ax25_info.eps_switch_voltages_5
  :field eps_switch_voltages_6: ax25_frame.payload.ax25_info.eps_switch_voltages_6
  :field eps_switch_voltages_7: ax25_frame.payload.ax25_info.eps_switch_voltages_7
  :field eps_switch_voltages_8: ax25_frame.payload.ax25_info.eps_switch_voltages_8
  :field eps_switch_voltages_9: ax25_frame.payload.ax25_info.eps_switch_voltages_9
  :field eps_switch_currents_0: ax25_frame.payload.ax25_info.eps_switch_currents_0
  :field eps_switch_currents_1: ax25_frame.payload.ax25_info.eps_switch_currents_1
  :field eps_switch_currents_2: ax25_frame.payload.ax25_info.eps_switch_currents_2
  :field eps_switch_currents_3: ax25_frame.payload.ax25_info.eps_switch_currents_3
  :field eps_switch_currents_4: ax25_frame.payload.ax25_info.eps_switch_currents_4
  :field eps_switch_currents_5: ax25_frame.payload.ax25_info.eps_switch_currents_5
  :field eps_switch_currents_6: ax25_frame.payload.ax25_info.eps_switch_currents_6
  :field eps_switch_currents_7: ax25_frame.payload.ax25_info.eps_switch_currents_7
  :field eps_switch_currents_8: ax25_frame.payload.ax25_info.eps_switch_currents_8
  :field eps_switch_currents_9: ax25_frame.payload.ax25_info.eps_switch_currents_9
  :field eps_expected_switch_states_bitmap: ax25_frame.payload.ax25_info.eps_expected_switch_states_bitmap
  :field eps_board_temperatures_0: ax25_frame.payload.ax25_info.eps_board_temperatures_0
  :field eps_board_temperatures_1: ax25_frame.payload.ax25_info.eps_board_temperatures_1
  :field eps_bus_voltages_0: ax25_frame.payload.ax25_info.eps_bus_voltages_0
  :field eps_bus_voltages_1: ax25_frame.payload.ax25_info.eps_bus_voltages_1
  :field eps_bus_voltages_2: ax25_frame.payload.ax25_info.eps_bus_voltages_2
  :field eps_bus_voltages_3: ax25_frame.payload.ax25_info.eps_bus_voltages_3
  :field eps_bus_currents_0: ax25_frame.payload.ax25_info.eps_bus_currents_0
  :field eps_bus_currents_1: ax25_frame.payload.ax25_info.eps_bus_currents_1
  :field eps_bus_currents_2: ax25_frame.payload.ax25_info.eps_bus_currents_2
  :field eps_bus_currents_3: ax25_frame.payload.ax25_info.eps_bus_currents_3
  :field cmc_rx_lock: ax25_frame.payload.ax25_info.cmc_rx_lock
  :field cmc_rx_frame_count: ax25_frame.payload.ax25_info.cmc_rx_frame_count
  :field cmc_rx_packet_count: ax25_frame.payload.ax25_info.cmc_rx_packet_count
  :field cmc_rx_dropped_error_count: ax25_frame.payload.ax25_info.cmc_rx_dropped_error_count
  :field cmc_rx_crc_error_count: ax25_frame.payload.ax25_info.cmc_rx_crc_error_count
  :field cmc_rx_overrun_error_count: ax25_frame.payload.ax25_info.cmc_rx_overrun_error_count
  :field cmc_rx_protocol_error_count: ax25_frame.payload.ax25_info.cmc_rx_protocol_error_count
  :field cmc_temperature_smps: ax25_frame.payload.ax25_info.cmc_temperature_smps
  :field cmc_temperature_pa: ax25_frame.payload.ax25_info.cmc_temperature_pa

  Attention: `rpt_callsign` cannot be accessed because `rpt_instance` is an
  array of unknown size at the beginning of the parsing process! Left an
  example in here.

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
        size-eos: true
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type:
          switch-on: '_parent.ax25_header.src_callsign_raw.callsign_ror.callsign'
          cases:
            '"SPOC  "': spoc_tlm
            '"MOCI  "': spoc_tlm
  spoc_tlm:
    meta:
      endian: be
    seq:
      - id: offset
        size: 23
      - id: obc_curr_boot_image
        type: b8
      - id: mmm_mode
        type: b3
      - id: obt_uptime
        type: b32
      - id: bat_battery_current_dir
        type: b1
      - id: bat_battery_current_0
        type: b10
      - id: bat_battery_current_1
        type: b10
      - id: bat_battery_current_2
        type: b10
      - id: bat_battery_voltage_0
        type: b10
      - id: bat_battery_voltage_1
        type: b10
      - id: bat_battery_voltage_2
        type: b10
      - id: bat_battery_temperature_0
        type: b10
      - id: bat_battery_temperature_1
        type: b10
      - id: bat_battery_temperature_2
        type: b10
      - id: bat_battery_temperature_3
        type: b10
      - id: bat_battery_heater_status_0
        type: b10
      - id: bat_battery_heater_status_1
        type: b10
      - id: bat_battery_heater_status_2
        type: b10
      - id: bat_battery_heater_status_3
        type: b10
      - id: bat_status
        type: b16
      - id: bat_last_error
        type: b8
      - id: eps_status_0
        type: b16
      - id: eps_status_1
        type: b16
      - id: eps_last_error_0
        type: b16
      - id: eps_last_error_1
        type: b16
      - id: eps_switch_voltages_0
        type: b10
      - id: eps_switch_voltages_1
        type: b10
      - id: eps_switch_voltages_2
        type: b10
      - id: eps_switch_voltages_3
        type: b10
      - id: eps_switch_voltages_4
        type: b10
      - id: eps_switch_voltages_5
        type: b10
      - id: eps_switch_voltages_6
        type: b10
      - id: eps_switch_voltages_7
        type: b10
      - id: eps_switch_voltages_8
        type: b10
      - id: eps_switch_voltages_9
        type: b10
      - id: eps_switch_currents_0
        type: b10
      - id: eps_switch_currents_1
        type: b10
      - id: eps_switch_currents_2
        type: b10
      - id: eps_switch_currents_3
        type: b10
      - id: eps_switch_currents_4
        type: b10
      - id: eps_switch_currents_5
        type: b10
      - id: eps_switch_currents_6
        type: b10
      - id: eps_switch_currents_7
        type: b10
      - id: eps_switch_currents_8
        type: b10
      - id: eps_switch_currents_9
        type: b10
      - id: eps_expected_switch_states_bitmap
        type: b10
      - id: eps_board_temperatures_0
        type: b10
      - id: eps_board_temperatures_1
        type: b10
      - id: eps_bus_voltages_0
        type: b10
      - id: eps_bus_voltages_1
        type: b10
      - id: eps_bus_voltages_2
        type: b10
      - id: eps_bus_voltages_3
        type: b10
      - id: eps_bus_currents_0
        type: b10
      - id: eps_bus_currents_1
        type: b10
      - id: eps_bus_currents_2
        type: b10
      - id: eps_bus_currents_3
        type: b10
      - id: cmc_rx_lock
        type: b1
      - id: cmc_rx_frame_count
        type: b16
      - id: cmc_rx_packet_count
        type: b16
      - id: cmc_rx_dropped_error_count
        type: b16
      - id: cmc_rx_crc_error_count
        type: b16
      - id: cmc_rx_overrun_error_count
        type: b8
      - id: cmc_rx_protocol_error_count
        type: b16
      - id: cmc_temperature_smps
        type: s1
      - id: cmc_temperature_pa
        type: s1
