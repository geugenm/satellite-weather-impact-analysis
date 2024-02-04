---
meta:
  id: mirsat1
  endian: be
  bit-endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packet_type: ax25_frame.payload.payload.beacon.beacon_header.packet_type
  :field apid: ax25_frame.payload.payload.beacon.beacon_header.apid
  :field sequence_count: ax25_frame.payload.payload.beacon.beacon_header.sequence_count
  :field length: ax25_frame.payload.payload.beacon.beacon_header.length
  :field service_type: ax25_frame.payload.payload.beacon.beacon_header.service_type
  :field sub_service_type: ax25_frame.payload.payload.beacon.beacon_header.sub_service_type
  :field obc_boot_image: ax25_frame.payload.payload.beacon.obc_boot_image
  :field on_board_time: ax25_frame.payload.payload.beacon.on_board_time
  :field uptime: ax25_frame.payload.payload.beacon.uptime
  :field spacecraft_mode: ax25_frame.payload.payload.beacon.spacecraft_mode
  :field seperation_sequence_state: ax25_frame.payload.payload.beacon.seperation_sequence_state
  :field solar_array_deployment_state_0: ax25_frame.payload.payload.beacon.solar_array_deployment_state_0
  :field solar_array_deployment_state_1: ax25_frame.payload.payload.beacon.solar_array_deployment_state_1
  :field solar_array_deployment_state_2: ax25_frame.payload.payload.beacon.solar_array_deployment_state_2
  :field solar_array_deployment_state_3: ax25_frame.payload.payload.beacon.solar_array_deployment_state_3
  :field antenna_deployment_state_0: ax25_frame.payload.payload.beacon.antenna_deployment_state_0
  :field antenna_deployment_state_1: ax25_frame.payload.payload.beacon.antenna_deployment_state_1
  :field antenna_deployment_state_2: ax25_frame.payload.payload.beacon.antenna_deployment_state_2
  :field antenna_deployment_state_3: ax25_frame.payload.payload.beacon.antenna_deployment_state_3
  :field antenna_deployment_state_4: ax25_frame.payload.payload.beacon.antenna_deployment_state_4
  :field antenna_deployment_state_5: ax25_frame.payload.payload.beacon.antenna_deployment_state_5
  :field antenna_deployment_state_6: ax25_frame.payload.payload.beacon.antenna_deployment_state_6
  :field antenna_deployment_state_7: ax25_frame.payload.payload.beacon.antenna_deployment_state_7
  :field adm_soft_fire_counter: ax25_frame.payload.payload.beacon.adm_soft_fire_counter
  :field adm_hard_fire_counter: ax25_frame.payload.payload.beacon.adm_hard_fire_counter
  :field sadm_check_counter: ax25_frame.payload.payload.beacon.sadm_check_counter
  :field i2c_nack_addr_count: ax25_frame.payload.payload.beacon.i2c_nack_addr_count
  :field i2c_hw_state_error_count: ax25_frame.payload.payload.beacon.i2c_hw_state_error_count
  :field i2c_isr_error_count: ax25_frame.payload.payload.beacon.i2c_isr_error_count
  :field battery_current_direction: ax25_frame.payload.payload.beacon.battery_current_direction
  :field battery_current_0: ax25_frame.payload.payload.beacon.battery_current_0
  :field battery_current_1_msb: ax25_frame.payload.payload.beacon.battery_current_1_msb
  :field adm_telemetry_0: ax25_frame.payload.payload.beacon.adm_telemetry_0
  :field adm_telemetry_1: ax25_frame.payload.payload.beacon.adm_telemetry_1
  :field adm_telemetry_2: ax25_frame.payload.payload.beacon.adm_telemetry_2
  :field adm_telemetry_3: ax25_frame.payload.payload.beacon.adm_telemetry_3
  :field adm_telemetry_4: ax25_frame.payload.payload.beacon.adm_telemetry_4
  :field adm_telemetry_5: ax25_frame.payload.payload.beacon.adm_telemetry_5
  :field adm_telemetry_6: ax25_frame.payload.payload.beacon.adm_telemetry_6
  :field adm_telemetry_7: ax25_frame.payload.payload.beacon.adm_telemetry_7
  :field adm_telemetry_8: ax25_frame.payload.payload.beacon.adm_telemetry_8
  :field adm_telemetry_9: ax25_frame.payload.payload.beacon.adm_telemetry_9
  :field sadm_telemetry_0: ax25_frame.payload.payload.beacon.sadm_telemetry_0
  :field sadm_telemetry_1: ax25_frame.payload.payload.beacon.sadm_telemetry_1
  :field sadm_telemetry_2: ax25_frame.payload.payload.beacon.sadm_telemetry_2
  :field sadm_telemetry_3: ax25_frame.payload.payload.beacon.sadm_telemetry_3
  :field sadm_telemetry_4: ax25_frame.payload.payload.beacon.sadm_telemetry_4
  :field sadm_telemetry_5: ax25_frame.payload.payload.beacon.sadm_telemetry_5
  :field sadm_telemetry_6: ax25_frame.payload.payload.beacon.sadm_telemetry_6
  :field sadm_telemetry_7: ax25_frame.payload.payload.beacon.sadm_telemetry_7
  :field sadm_telemetry_8: ax25_frame.payload.payload.beacon.sadm_telemetry_8
  :field sadm_telemetry_9: ax25_frame.payload.payload.beacon.sadm_telemetry_9
  :field battery_current_1_lsbs: ax25_frame.payload.payload.beacon.battery_current_1_lsbs
  :field battery_current_2: ax25_frame.payload.payload.beacon.battery_current_2
  :field battery_voltage_0: ax25_frame.payload.payload.beacon.battery_voltage_0
  :field battery_voltage_1: ax25_frame.payload.payload.beacon.battery_voltage_1
  :field battery_voltage_2: ax25_frame.payload.payload.beacon.battery_voltage_2
  :field battery_temperature: ax25_frame.payload.payload.beacon.battery_temperature
  :field solar_array_current_0: ax25_frame.payload.payload.beacon.solar_array_current_0
  :field solar_array_voltage_0: ax25_frame.payload.payload.beacon.solar_array_voltage_0
  :field solar_array_voltage_1: ax25_frame.payload.payload.beacon.solar_array_voltage_1
  :field solar_array_voltage_2: ax25_frame.payload.payload.beacon.solar_array_voltage_2
  :field solar_array_voltage_3: ax25_frame.payload.payload.beacon.solar_array_voltage_3
  :field solar_array_voltage_4: ax25_frame.payload.payload.beacon.solar_array_voltage_4
  :field solar_array_voltage_5: ax25_frame.payload.payload.beacon.solar_array_voltage_5
  :field solar_array_voltage_6: ax25_frame.payload.payload.beacon.solar_array_voltage_6
  :field solar_array_voltage_7: ax25_frame.payload.payload.beacon.solar_array_voltage_7
  :field solar_array_voltage_8: ax25_frame.payload.payload.beacon.solar_array_voltage_8
  :field eps_bus_voltage_0: ax25_frame.payload.payload.beacon.eps_bus_voltage_0
  :field eps_bus_voltage_1: ax25_frame.payload.payload.beacon.eps_bus_voltage_1
  :field eps_bus_voltage_2: ax25_frame.payload.payload.beacon.eps_bus_voltage_2
  :field eps_bus_voltage_3: ax25_frame.payload.payload.beacon.eps_bus_voltage_3
  :field eps_bus_current_0: ax25_frame.payload.payload.beacon.eps_bus_current_0
  :field eps_bus_current_1: ax25_frame.payload.payload.beacon.eps_bus_current_1
  :field eps_bus_current_2: ax25_frame.payload.payload.beacon.eps_bus_current_2
  :field eps_bus_current_3: ax25_frame.payload.payload.beacon.eps_bus_current_3
  :field adcs_raw_gyro_rate_0: ax25_frame.payload.payload.beacon.adcs_raw_gyro_rate_0
  :field adcs_raw_gyro_rate_1: ax25_frame.payload.payload.beacon.adcs_raw_gyro_rate_1
  :field adcs_raw_gyro_rate_2: ax25_frame.payload.payload.beacon.adcs_raw_gyro_rate_2
  :field adcs_mtq_direction_duty_0: ax25_frame.payload.payload.beacon.adcs_mtq_direction_duty_0
  :field adcs_mtq_direction_duty_1: ax25_frame.payload.payload.beacon.adcs_mtq_direction_duty_1
  :field adcs_mtq_direction_duty_2: ax25_frame.payload.payload.beacon.adcs_mtq_direction_duty_2
  :field adcs_mtq_direction_duty_3: ax25_frame.payload.payload.beacon.adcs_mtq_direction_duty_3
  :field adcs_mtq_direction_duty_4: ax25_frame.payload.payload.beacon.adcs_mtq_direction_duty_4
  :field adcs_mtq_direction_duty_5: ax25_frame.payload.payload.beacon.adcs_mtq_direction_duty_5
  :field adcs_status: ax25_frame.payload.payload.beacon.adcs_status
  :field adcs_bus_voltage_0: ax25_frame.payload.payload.beacon.adcs_bus_voltage_0
  :field adcs_bus_voltage_1: ax25_frame.payload.payload.beacon.adcs_bus_voltage_1
  :field adcs_bus_voltage_2: ax25_frame.payload.payload.beacon.adcs_bus_voltage_2
  :field adcs_bus_current_0: ax25_frame.payload.payload.beacon.adcs_bus_current_0
  :field adcs_bus_current_1: ax25_frame.payload.payload.beacon.adcs_bus_current_1
  :field adcs_bus_current_2: ax25_frame.payload.payload.beacon.adcs_bus_current_2
  :field adcs_board_temperature: ax25_frame.payload.payload.beacon.adcs_board_temperature
  :field adcs_adc_reference: ax25_frame.payload.payload.beacon.adcs_adc_reference
  :field adcs_sensor_current: ax25_frame.payload.payload.beacon.adcs_sensor_current
  :field adcs_mtq_current: ax25_frame.payload.payload.beacon.adcs_mtq_current
  :field adcs_array_temperature_0: ax25_frame.payload.payload.beacon.adcs_array_temperature_0
  :field adcs_array_temperature_1: ax25_frame.payload.payload.beacon.adcs_array_temperature_1
  :field adcs_array_temperature_2: ax25_frame.payload.payload.beacon.adcs_array_temperature_2
  :field adcs_array_temperature_3: ax25_frame.payload.payload.beacon.adcs_array_temperature_3
  :field adcs_array_temperature_4: ax25_frame.payload.payload.beacon.adcs_array_temperature_4
  :field adcs_array_temperature_5: ax25_frame.payload.payload.beacon.adcs_array_temperature_5
  :field adcs_css_raw_0: ax25_frame.payload.payload.beacon.adcs_css_raw_0
  :field adcs_css_raw_1: ax25_frame.payload.payload.beacon.adcs_css_raw_1
  :field adcs_css_raw_2: ax25_frame.payload.payload.beacon.adcs_css_raw_2
  :field adcs_css_raw_3: ax25_frame.payload.payload.beacon.adcs_css_raw_3
  :field adcs_css_raw_4: ax25_frame.payload.payload.beacon.adcs_css_raw_4
  :field adcs_css_raw_5: ax25_frame.payload.payload.beacon.adcs_css_raw_5
  :field fss_active_0: ax25_frame.payload.payload.beacon.fss_active_0
  :field fss_active_1: ax25_frame.payload.payload.beacon.fss_active_1
  :field fss_active_2: ax25_frame.payload.payload.beacon.fss_active_2
  :field fss_active_3: ax25_frame.payload.payload.beacon.fss_active_3
  :field fss_active_4: ax25_frame.payload.payload.beacon.fss_active_4
  :field fss_active_5: ax25_frame.payload.payload.beacon.fss_active_5
  :field css_active_selected_0: ax25_frame.payload.payload.beacon.css_active_selected_0
  :field css_active_selected_1: ax25_frame.payload.payload.beacon.css_active_selected_1
  :field css_active_selected_2: ax25_frame.payload.payload.beacon.css_active_selected_2
  :field css_active_selected_3: ax25_frame.payload.payload.beacon.css_active_selected_3
  :field css_active_selected_4: ax25_frame.payload.payload.beacon.css_active_selected_4
  :field css_active_selected_5: ax25_frame.payload.payload.beacon.css_active_selected_5
  :field adcs_sun_processed_0: ax25_frame.payload.payload.beacon.adcs_sun_processed_0
  :field adcs_sun_processed_1: ax25_frame.payload.payload.beacon.adcs_sun_processed_1
  :field adcs_sun_processed_2: ax25_frame.payload.payload.beacon.adcs_sun_processed_2
  :field adcs_detumble_counter: ax25_frame.payload.payload.beacon.adcs_detumble_counter
  :field adcs_mode: ax25_frame.payload.payload.beacon.adcs_mode
  :field adcs_state: ax25_frame.payload.payload.beacon.adcs_state
  :field cmc_rx_lock: ax25_frame.payload.payload.beacon.cmc_rx_lock
  :field cmc_rx_frame_count: ax25_frame.payload.payload.beacon.cmc_rx_frame_count
  :field cmc_rx_packet_count: ax25_frame.payload.payload.beacon.cmc_rx_packet_count
  :field cmc_rx_dropped_error_count: ax25_frame.payload.payload.beacon.cmc_rx_dropped_error_count
  :field cmc_rx_crc_error_count: ax25_frame.payload.payload.beacon.cmc_rx_crc_error_count
  :field cmc_rx_overrun_error_count: ax25_frame.payload.payload.beacon.cmc_rx_overrun_error_count
  :field cmc_rx_protocol_error_count: ax25_frame.payload.payload.beacon.cmc_rx_protocol_error_count
  :field cmc_smps_temperature: ax25_frame.payload.payload.beacon.cmc_smps_temperature
  :field cmc_pa_temperature: ax25_frame.payload.payload.beacon.cmc_pa_temperature
  :field ax25_mux_channel_enabled_0: ax25_frame.payload.payload.beacon.ax25_mux_channel_enabled_0
  :field ax25_mux_channel_enabled_1: ax25_frame.payload.payload.beacon.ax25_mux_channel_enabled_1
  :field ax25_mux_channel_enabled_2: ax25_frame.payload.payload.beacon.ax25_mux_channel_enabled_2
  :field digipeater_enabled: ax25_frame.payload.payload.beacon.digipeater_enabled
  :field pacsat_broadcast_enabled: ax25_frame.payload.payload.beacon.pacsat_broadcast_enabled
  :field pacsat_broadcast_in_progress: ax25_frame.payload.payload.beacon.pacsat_broadcast_in_progress
  :field paramvalid_flags_0: ax25_frame.payload.payload.beacon.paramvalid_flags_0
  :field paramvalid_flags_1: ax25_frame.payload.payload.beacon.paramvalid_flags_1
  :field paramvalid_flags_2: ax25_frame.payload.payload.beacon.paramvalid_flags_2
  :field paramvalid_flags_3: ax25_frame.payload.payload.beacon.paramvalid_flags_3
  :field paramvalid_flags_4: ax25_frame.payload.payload.beacon.paramvalid_flags_4
  :field paramvalid_flags_5: ax25_frame.payload.payload.beacon.paramvalid_flags_5
  :field paramvalid_flags_6: ax25_frame.payload.payload.beacon.paramvalid_flags_6
  :field paramvalid_flags_7: ax25_frame.payload.payload.beacon.paramvalid_flags_7
  :field paramvalid_flags_8: ax25_frame.payload.payload.beacon.paramvalid_flags_8
  :field paramvalid_flags_9: ax25_frame.payload.payload.beacon.paramvalid_flags_9
  :field paramvalid_flags_10: ax25_frame.payload.payload.beacon.paramvalid_flags_10
  :field paramvalid_flags_11: ax25_frame.payload.payload.beacon.paramvalid_flags_11
  :field paramvalid_flags_12: ax25_frame.payload.payload.beacon.paramvalid_flags_12
  :field paramvalid_flags_13: ax25_frame.payload.payload.beacon.paramvalid_flags_13
  :field paramvalid_flags_14: ax25_frame.payload.payload.beacon.paramvalid_flags_14
  :field paramvalid_flags_15: ax25_frame.payload.payload.beacon.paramvalid_flags_15
  :field paramvalid_flags_16: ax25_frame.payload.payload.beacon.paramvalid_flags_16
  :field paramvalid_flags_17: ax25_frame.payload.payload.beacon.paramvalid_flags_17
  :field paramvalid_flags_18: ax25_frame.payload.payload.beacon.paramvalid_flags_18
  :field paramvalid_flags_19: ax25_frame.payload.payload.beacon.paramvalid_flags_19
  :field paramvalid_flags_20: ax25_frame.payload.payload.beacon.paramvalid_flags_20
  :field paramvalid_flags_21: ax25_frame.payload.payload.beacon.paramvalid_flags_21
  :field paramvalid_flags_22: ax25_frame.payload.payload.beacon.paramvalid_flags_22
  :field paramvalid_flags_23: ax25_frame.payload.payload.beacon.paramvalid_flags_23
  :field paramvalid_flags_24: ax25_frame.payload.payload.beacon.paramvalid_flags_24
  :field paramvalid_flags_25: ax25_frame.payload.payload.beacon.paramvalid_flags_25
  :field paramvalid_flags_26: ax25_frame.payload.payload.beacon.paramvalid_flags_26
  :field paramvalid_flags_27: ax25_frame.payload.payload.beacon.paramvalid_flags_27
  :field paramvalid_flags_28: ax25_frame.payload.payload.beacon.paramvalid_flags_28
  :field paramvalid_flags_29: ax25_frame.payload.payload.beacon.paramvalid_flags_29
  :field paramvalid_flags_30: ax25_frame.payload.payload.beacon.paramvalid_flags_30
  :field paramvalid_flags_31: ax25_frame.payload.payload.beacon.paramvalid_flags_31
  :field paramvalid_flags_32: ax25_frame.payload.payload.beacon.paramvalid_flags_32
  :field paramvalid_flags_33: ax25_frame.payload.payload.beacon.paramvalid_flags_33
  :field paramvalid_flags_34: ax25_frame.payload.payload.beacon.paramvalid_flags_34
  :field paramvalid_flags_35: ax25_frame.payload.payload.beacon.paramvalid_flags_35
  :field paramvalid_flags_36: ax25_frame.payload.payload.beacon.paramvalid_flags_36
  :field paramvalid_flags_37: ax25_frame.payload.payload.beacon.paramvalid_flags_37
  :field paramvalid_flags_38: ax25_frame.payload.payload.beacon.paramvalid_flags_38
  :field paramvalid_flags_39: ax25_frame.payload.payload.beacon.paramvalid_flags_39
  :field checksumbytes: ax25_frame.payload.payload.beacon.checksumbytes

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
instances:
  framelength:
    value: _io.size
  frametype:
    pos: 0x1d
    type: u2
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
      - id: ctl
        type: u1
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
        valid:
          any-of:
            - '"3B8MRC"'
            - '"3B8MIR"'
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
      - id: payload
        type: payload_t
  payload_t:
    seq:
      - id: header
        size: 6
      - id: beacon
        type:
          switch-on: _root.frametype
          cases:
            0x0319: beacon_a_t
            _: beacon_b_t
  beacon_header_t:
    seq:
      - id: packet_type
        type: u1
      - id: apid
        type: u1
      - id: sequence_count
        type: u2
      - id: length
        type: u2
      - id: reserved
        type: u1
      - id: service_type
        type: u1
      - id: sub_service_type
        type: u1
  beacon_t:
    seq:
      - id: beacon
        size-eos: true
  beacon_a_t:
    seq:
      - id: beacon_header
        type: beacon_header_t
      - id: start_byte
        contents: [0x00]
      - id: obc_boot_image
        type: b8
      - id: on_board_time
        type: b32
      - id: uptime
        type: b32
      - id: spacecraft_mode
        type: b3
      - id: seperation_sequence_state
        type: b4
      - id: solar_array_deployment_state_0
        type: b4
      - id: solar_array_deployment_state_1
        type: b4
      - id: solar_array_deployment_state_2
        type: b4
      - id: solar_array_deployment_state_3
        type: b4
      - id: antenna_deployment_state_0
        type: b16
      - id: antenna_deployment_state_1
        type: b16
      - id: antenna_deployment_state_2
        type: b16
      - id: antenna_deployment_state_3
        type: b16
      - id: antenna_deployment_state_4
        type: b16
      - id: antenna_deployment_state_5
        type: b16
      - id: antenna_deployment_state_6
        type: b16
      - id: antenna_deployment_state_7
        type: b16
      - id: adm_soft_fire_counter
        type: b8
      - id: adm_hard_fire_counter
        type: b8
      - id: adm_telemetry_0_h
        type: b32
      - id: adm_telemetry_0_m
        type: b32
      - id: adm_telemetry_0_l
        type: b16
      - id: adm_telemetry_1_h
        type: b32
      - id: adm_telemetry_1_m
        type: b32
      - id: adm_telemetry_1_l
        type: b16
      - id: adm_telemetry_2_h
        type: b32
      - id: adm_telemetry_2_m
        type: b32
      - id: adm_telemetry_2_l
        type: b16
      - id: adm_telemetry_3_h
        type: b32
      - id: adm_telemetry_3_m
        type: b32
      - id: adm_telemetry_3_l
        type: b16
      - id: adm_telemetry_4_h
        type: b32
      - id: adm_telemetry_4_m
        type: b32
      - id: adm_telemetry_4_l
        type: b16
      - id: adm_telemetry_5_h
        type: b32
      - id: adm_telemetry_5_m
        type: b32
      - id: adm_telemetry_5_l
        type: b16
      - id: adm_telemetry_6_h
        type: b32
      - id: adm_telemetry_6_m
        type: b32
      - id: adm_telemetry_6_l
        type: b16
      - id: adm_telemetry_7_h
        type: b32
      - id: adm_telemetry_7_m
        type: b32
      - id: adm_telemetry_7_l
        type: b16
      - id: adm_telemetry_8_h
        type: b32
      - id: adm_telemetry_8_m
        type: b32
      - id: adm_telemetry_8_l
        type: b16
      - id: adm_telemetry_9_h
        type: b32
      - id: adm_telemetry_9_m
        type: b32
      - id: adm_telemetry_9_l
        type: b16
      - id: sadm_check_counter
        type: b5
      - id: sadm_telemetry_0_h
        type: b32
      - id: sadm_telemetry_0_l
        type: b32
      - id: sadm_telemetry_1_h
        type: b32
      - id: sadm_telemetry_1_l
        type: b32
      - id: sadm_telemetry_2_h
        type: b32
      - id: sadm_telemetry_2_l
        type: b32
      - id: sadm_telemetry_3_h
        type: b32
      - id: sadm_telemetry_3_l
        type: b32
      - id: sadm_telemetry_4_h
        type: b32
      - id: sadm_telemetry_4_l
        type: b32
      - id: sadm_telemetry_5_h
        type: b32
      - id: sadm_telemetry_5_l
        type: b32
      - id: sadm_telemetry_6_h
        type: b32
      - id: sadm_telemetry_6_l
        type: b32
      - id: sadm_telemetry_7_h
        type: b32
      - id: sadm_telemetry_7_l
        type: b32
      - id: sadm_telemetry_8_h
        type: b32
      - id: sadm_telemetry_8_l
        type: b32
      - id: sadm_telemetry_9_h
        type: b32
      - id: sadm_telemetry_9_l
        type: b32
      - id: i2c_nack_addr_count
        type: b32
      - id: i2c_hw_state_error_count
        type: b32
      - id: i2c_isr_error_count
        type: b32
      - id: battery_current_direction
        type: b1
      - id: battery_current_0
        type: b10
      - id: battery_current_1_msb
        type: b1
    instances:
      adm_telemetry_0:
        value: >-
          (adm_telemetry_0_h << 48) |
          (adm_telemetry_0_m << 16) |
          adm_telemetry_0_l
      adm_telemetry_1:
        value: >-
          (adm_telemetry_1_h << 48) |
          (adm_telemetry_1_m << 16) |
          adm_telemetry_1_l
      adm_telemetry_2:
        value: >-
          (adm_telemetry_2_h << 48) |
          (adm_telemetry_2_m << 16) |
          adm_telemetry_2_l
      adm_telemetry_3:
        value: >-
          (adm_telemetry_3_h << 48) |
          (adm_telemetry_3_m << 16) |
          adm_telemetry_3_l
      adm_telemetry_4:
        value: >-
          (adm_telemetry_4_h << 48) |
          (adm_telemetry_4_m << 32) |
          adm_telemetry_4_l
      adm_telemetry_5:
        value: >-
          (adm_telemetry_5_h << 48) |
          (adm_telemetry_5_m << 32) |
          adm_telemetry_5_l
      adm_telemetry_6:
        value: >-
          (adm_telemetry_6_h << 48) |
          (adm_telemetry_6_m << 32) |
          adm_telemetry_6_l
      adm_telemetry_7:
        value: >-
          (adm_telemetry_7_h << 48) |
          (adm_telemetry_7_m << 32) |
          adm_telemetry_7_l
      adm_telemetry_8:
        value: >-
          (adm_telemetry_8_h << 48) |
          (adm_telemetry_8_m << 32) |
          adm_telemetry_8_l
      adm_telemetry_9:
        value: >-
          (adm_telemetry_9_h << 48) |
          (adm_telemetry_9_m << 32) |
          adm_telemetry_9_l
      sadm_telemetry_0:
        value: >-
          (sadm_telemetry_0_h << 32) |
          sadm_telemetry_0_l
      sadm_telemetry_1:
        value: >-
          (sadm_telemetry_1_h << 32) |
          sadm_telemetry_1_l
      sadm_telemetry_2:
        value: >-
          (sadm_telemetry_2_h << 32) |
          sadm_telemetry_2_l
      sadm_telemetry_3:
        value: >-
          (sadm_telemetry_3_h << 32) |
          sadm_telemetry_3_l
      sadm_telemetry_4:
        value: >-
          (sadm_telemetry_4_h << 32) |
          sadm_telemetry_4_l
      sadm_telemetry_5:
        value: >-
          (sadm_telemetry_5_h << 32) |
          sadm_telemetry_5_l
      sadm_telemetry_6:
        value: >-
          (sadm_telemetry_6_h << 32) |
          sadm_telemetry_6_l
      sadm_telemetry_7:
        value: >-
          (sadm_telemetry_7_h << 32) |
          sadm_telemetry_7_l
      sadm_telemetry_8:
        value: >-
          (sadm_telemetry_8_h << 32) |
          sadm_telemetry_8_l
      sadm_telemetry_9:
        value: >-
          (sadm_telemetry_9_h << 32) |
          sadm_telemetry_9_l
  beacon_b_t:
    seq:
      - id: battery_current_1_lsbs
        type: b9
      - id: battery_current_2
        type: b10
      - id: battery_voltage_0
        type: b10
      - id: battery_voltage_1
        type: b10
      - id: battery_voltage_2
        type: b10
      - id: battery_temperature
        type: b10
      - id: solar_array_current_0
        type: b10
      - id: solar_array_voltage_0
        type: b10
      - id: solar_array_voltage_1
        type: b10
      - id: solar_array_voltage_2
        type: b10
      - id: solar_array_voltage_3
        type: b10
      - id: solar_array_voltage_4
        type: b10
      - id: solar_array_voltage_5
        type: b10
      - id: solar_array_voltage_6
        type: b10
      - id: solar_array_voltage_7
        type: b10
      - id: solar_array_voltage_8
        type: b10
      - id: eps_bus_voltage_0
        type: b10
      - id: eps_bus_voltage_1
        type: b10
      - id: eps_bus_voltage_2
        type: b10
      - id: eps_bus_voltage_3
        type: b10
      - id: eps_bus_current_0
        type: b10
      - id: eps_bus_current_1
        type: b10
      - id: eps_bus_current_2
        type: b10
      - id: eps_bus_current_3
        type: b10
      - id: adcs_raw_gyro_rate_0_bits
        type: b16
      - id: adcs_raw_gyro_rate_1_bits
        type: b16
      - id: adcs_raw_gyro_rate_2_bits
        type: b16
      - id: adcs_mtq_direction_duty_0
        type: b8
      - id: adcs_mtq_direction_duty_1
        type: b8
      - id: adcs_mtq_direction_duty_2
        type: b8
      - id: adcs_mtq_direction_duty_3
        type: b8
      - id: adcs_mtq_direction_duty_4
        type: b8
      - id: adcs_mtq_direction_duty_5
        type: b8
      - id: adcs_status
        type: b16
      - id: adcs_bus_voltage_0
        type: b16
      - id: adcs_bus_voltage_1
        type: b16
      - id: adcs_bus_voltage_2
        type: b16
      - id: adcs_bus_current_0
        type: b16
      - id: adcs_bus_current_1
        type: b16
      - id: adcs_bus_current_2
        type: b16
      - id: adcs_board_temperature
        type: b16
      - id: adcs_adc_reference
        type: b16
      - id: adcs_sensor_current
        type: b16
      - id: adcs_mtq_current
        type: b16
      - id: adcs_array_temperature_0
        type: b16
      - id: adcs_array_temperature_1
        type: b16
      - id: adcs_array_temperature_2
        type: b16
      - id: adcs_array_temperature_3
        type: b16
      - id: adcs_array_temperature_4
        type: b16
      - id: adcs_array_temperature_5
        type: b16
      - id: adcs_css_raw_0
        type: b16
      - id: adcs_css_raw_1
        type: b16
      - id: adcs_css_raw_2
        type: b16
      - id: adcs_css_raw_3
        type: b16
      - id: adcs_css_raw_4
        type: b16
      - id: adcs_css_raw_5
        type: b16
      - id: fss_active_0
        type: b2
      - id: fss_active_1
        type: b2
      - id: fss_active_2
        type: b2
      - id: fss_active_3
        type: b2
      - id: fss_active_4
        type: b2
      - id: fss_active_5
        type: b2
      - id: css_active_selected_0
        type: b2
      - id: css_active_selected_1
        type: b2
      - id: css_active_selected_2
        type: b2
      - id: css_active_selected_3
        type: b2
      - id: css_active_selected_4
        type: b2
      - id: css_active_selected_5
        type: b2
      - id: adcs_sun_processed_0
        type: b16
      - id: adcs_sun_processed_1
        type: b16
      - id: adcs_sun_processed_2
        type: b16
      - id: reserved_0
        type: b16
      - id: reserved_1
        type: b16
      - id: reserved_2
        type: b16
      - id: reserved_3
        type: b16
      - id: adcs_detumble_counter
        type: b16
      - id: adcs_mode
        type: b16
      - id: adcs_state
        type: b16
      - id: reserved_4
        type: b10
      - id: reserved_5
        type: b4
      - id: reserved_6
        type: b16
      - id: reserved_7
        type: b3
      - id: reserved_8
        type: b4
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
      - id: cmc_smps_temperature_bits
        type: b8
      - id: cmc_pa_temperature_bits
        type: b8
      - id: ax25_mux_channel_enabled_0
        type: b1
      - id: ax25_mux_channel_enabled_1
        type: b1
      - id: ax25_mux_channel_enabled_2
        type: b1
      - id: digipeater_enabled
        type: b1
      - id: pacsat_broadcast_enabled
        type: b1
      - id: pacsat_broadcast_in_progress
        type: b1
      - id: paramvalid_flags_0
        type: b1
      - id: paramvalid_flags_1
        type: b1
      - id: paramvalid_flags_2
        type: b1
      - id: paramvalid_flags_3
        type: b1
      - id: paramvalid_flags_4
        type: b1
      - id: paramvalid_flags_5
        type: b1
      - id: paramvalid_flags_6
        type: b1
      - id: paramvalid_flags_7
        type: b1
      - id: paramvalid_flags_8
        type: b1
      - id: paramvalid_flags_9
        type: b1
      - id: paramvalid_flags_10
        type: b1
      - id: paramvalid_flags_11
        type: b1
      - id: paramvalid_flags_12
        type: b1
      - id: paramvalid_flags_13
        type: b1
      - id: paramvalid_flags_14
        type: b1
      - id: paramvalid_flags_15
        type: b1
      - id: paramvalid_flags_16
        type: b1
      - id: paramvalid_flags_17
        type: b1
      - id: paramvalid_flags_18
        type: b1
      - id: paramvalid_flags_19
        type: b1
      - id: paramvalid_flags_20
        type: b1
      - id: paramvalid_flags_21
        type: b1
      - id: paramvalid_flags_22
        type: b1
      - id: paramvalid_flags_23
        type: b1
      - id: paramvalid_flags_24
        type: b1
      - id: paramvalid_flags_25
        type: b1
      - id: paramvalid_flags_26
        type: b1
      - id: paramvalid_flags_27
        type: b1
      - id: paramvalid_flags_28
        type: b1
      - id: paramvalid_flags_29
        type: b1
      - id: paramvalid_flags_30
        type: b1
      - id: paramvalid_flags_31
        type: b1
      - id: paramvalid_flags_32
        type: b1
      - id: paramvalid_flags_33
        type: b1
      - id: paramvalid_flags_34
        type: b1
      - id: paramvalid_flags_35
        type: b1
      - id: paramvalid_flags_36
        type: b1
      - id: paramvalid_flags_37
        type: b1
      - id: paramvalid_flags_38
        type: b1
      - id: paramvalid_flags_39
        type: b1
      - id: padding
        type: b5
      - id: checksumbytes
        type: b16
      - id: tail
        size: 97
    instances:
      adcs_raw_gyro_rate_0:
        value: >-
          (adcs_raw_gyro_rate_0_bits & 0x8000) == 1 ?
          (-1 * (adcs_raw_gyro_rate_0_bits & 0x7fff)) :
          (adcs_raw_gyro_rate_0_bits & 0x7fff)
      adcs_raw_gyro_rate_1:
        value: >-
          (adcs_raw_gyro_rate_1_bits & 0x8000) == 1 ?
          (-1 * (adcs_raw_gyro_rate_1_bits & 0x7fff)) :
          (adcs_raw_gyro_rate_1_bits & 0x7fff)
      adcs_raw_gyro_rate_2:
        value: >-
          (adcs_raw_gyro_rate_1_bits & 0x8000) == 1 ?
          (-1 * (adcs_raw_gyro_rate_1_bits & 0x7fff)) :
          (adcs_raw_gyro_rate_1_bits & 0x7fff)
      cmc_smps_temperature:
        value: >-
          (cmc_smps_temperature_bits & 0x80) == 1 ?
          (-1 * (cmc_smps_temperature_bits & 0x7f)) :
          (cmc_smps_temperature_bits & 0x7f)
      cmc_pa_temperature:
        value: >-
          (cmc_pa_temperature_bits & 0x80) == 1 ?
          (-1 * (cmc_pa_temperature_bits & 0x7f)) :
          (cmc_pa_temperature_bits & 0x7f)
