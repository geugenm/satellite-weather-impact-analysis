---
meta:
  id: picsat
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field ccsds_version: ax25_frame.ax25_payload.ax25_info.ccsds_header.ccsds_version
  :field packet_type: ax25_frame.ax25_payload.ax25_info.ccsds_header.packet_type
  :field secondary_header_flag: ax25_frame.ax25_payload.ax25_info.ccsds_header.secondary_header_flag
  :field process_id: ax25_frame.ax25_payload.ax25_info.ccsds_header.process_id
  :field level_flag: ax25_frame.ax25_payload.ax25_info.ccsds_header.level_flag
  :field payload_flag: ax25_frame.ax25_payload.ax25_info.ccsds_header.payload_flag
  :field packet_category: ax25_frame.ax25_payload.ax25_info.ccsds_header.packet_category
  :field sequence_flag: ax25_frame.ax25_payload.ax25_info.ccsds_header.sequence_flag
  :field packet_id: ax25_frame.ax25_payload.ax25_info.ccsds_header.packet_id
  :field data_length: ax25_frame.ax25_payload.ax25_info.ccsds_header.data_length
  :field days_since_ref: ax25_frame.ax25_payload.ax25_info.ccsds_secondary_header.days_since_ref
  :field ms_since_today: ax25_frame.ax25_payload.ax25_info.ccsds_secondary_header.ms_since_today
  :field solar_panel5_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel5_error_flag
  :field solar_panel4_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel4_error_flag
  :field solar_panel3_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel3_error_flag
  :field solar_panel2_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel2_error_flag
  :field solar_panel1_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel1_error_flag
  :field i_adcs_get_attitude_error: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.i_adcs_get_attitude_error
  :field i_adcs_get_status_register_error: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.i_adcs_get_status_register_error
  :field fram_enable_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.fram_enable_error_flag
  :field ants_b_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ants_b_error_flag
  :field ants_a_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ants_a_error_flag
  :field trxvu_tx_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.trxvu_tx_error_flag
  :field trxvu_rx_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.trxvu_rx_error_flag
  :field obc_supervisor_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.obc_supervisor_error_flag
  :field gom_eps_error_flag: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.gom_eps_error_flag
  :field ant1_undeployed_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant1_undeployed_ants_b_status
  :field ant1_timeout_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant1_timeout_ants_b_status
  :field ant1_deploying_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant1_deploying_ants_b_status
  :field ant2_undeployed_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant2_undeployed_ants_b_status
  :field ant2_timeout_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant2_timeout_ants_b_status
  :field ant2_deploying_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant2_deploying_ants_b_status
  :field ignore_flag_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ignore_flag_ants_b_status
  :field ant3_undeployed_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant3_undeployed_ants_b_status
  :field ant3_timeout_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant3_timeout_ants_b_status
  :field ant3_deploying_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant3_deploying_ants_b_status
  :field ant4_undeployed_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant4_undeployed_ants_b_status
  :field ant4_timeout_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant4_timeout_ants_b_status
  :field ant4_deploying_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant4_deploying_ants_b_status
  :field armed_ants_b_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.armed_ants_b_status
  :field ant1_undeployed_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant1_undeployed_ants_a_status
  :field ant1_timeout_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant1_timeout_ants_a_status
  :field ant1_deploying_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant1_deploying_ants_a_status
  :field ant2_undeployed_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant2_undeployed_ants_a_status
  :field ant2_timeout_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant2_timeout_ants_a_status
  :field ant2_deploying_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant2_deploying_ants_a_status
  :field ignore_flag_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ignore_flag_ants_a_status
  :field ant3_undeployed_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant3_undeployed_ants_a_status
  :field ant3_timeout_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant3_timeout_ants_a_status
  :field ant3_deploying_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant3_deploying_ants_a_status
  :field ant4_undeployed_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant4_undeployed_ants_a_status
  :field ant4_timeout_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant4_timeout_ants_a_status
  :field ant4_deploying_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ant4_deploying_ants_a_status
  :field armed_ants_a_status: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.armed_ants_a_status
  :field solar_panel_temp5_zp: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel_temp5_zp
  :field solar_panel_temp4_ym: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel_temp4_ym
  :field solar_panel_temp3_yp: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel_temp3_yp
  :field solar_panel_temp2_xm: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel_temp2_xm
  :field solar_panel_temp1_xp: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.solar_panel_temp1_xp
  :field ants_temperature_side_b: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ants_temperature_side_b
  :field ants_temperature_side_a: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.ants_temperature_side_a
  :field tx_trxvu_hk_current: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.tx_trxvu_hk_current
  :field tx_trxvu_hk_forwardpower: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.tx_trxvu_hk_forwardpower
  :field tx_trxvu_hk_tx_reflectedpower: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.tx_trxvu_hk_tx_reflectedpower
  :field tx_trxvu_hk_pa_temp: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.tx_trxvu_hk_pa_temp
  :field rx_trxvu_hk_pa_temp: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.rx_trxvu_hk_pa_temp
  :field rx_trxvu_hk_board_temp: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.rx_trxvu_hk_board_temp
  :field eps_hk_temp_batt1: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.eps_hk_temp_batt1
  :field eps_hk_temp_batt0: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.eps_hk_temp_batt0
  :field eps_hk_batt_mode: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.eps_hk_batt_mode
  :field eps_h_kv_batt: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.eps_h_kv_batt
  :field eps_hk_boot_cause: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.eps_hk_boot_cause
  :field n_reboots_eps: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.n_reboots_eps
  :field n_reboots_obc: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.n_reboots_obc
  :field quaternion1: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.quaternion1
  :field quaternion2: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.quaternion2
  :field quaternion3: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.quaternion3
  :field quaternion4: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.quaternion4
  :field angular_rate_x: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.angular_rate_x
  :field angular_rate_y: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.angular_rate_y
  :field angular_rate_z: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.angular_rate_z
  :field adcs_stat_flag_hl_op_tgt_cap: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_tgt_cap
  :field adcs_stat_flag_hl_op_tgt_track_fix_wgs84: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_tgt_track_fix_wgs84
  :field adcs_stat_flag_hl_op_tgt_track_nadir: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_tgt_track_nadir
  :field adcs_stat_flag_hl_op_tgt_track: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_tgt_track
  :field adcs_stat_flag_hl_op_tgt_track_const_v: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_tgt_track_const_v
  :field adcs_stat_flag_hl_op_spin: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_spin
  :field adcs_stat_flag_hl_op_sunp: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_sunp
  :field adcs_stat_flag_hl_op_detumbling: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_detumbling
  :field adcs_stat_flag_hl_op_measure: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_measure
  :field adcs_stat_flag_datetime_valid: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_datetime_valid
  :field adcs_stat_flag_hl_op_safe: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_safe
  :field adcs_stat_flag_hl_op_idle: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.adcs_stat_flag_hl_op_idle
  :field up_time: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.up_time
  :field last_fram_log_fun_err_code: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.last_fram_log_fun_err_code
  :field last_fram_log_line_code: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.last_fram_log_line_code
  :field last_fram_log_file_crc_code: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.last_fram_log_file_crc_code
  :field last_fram_log_counter: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.last_fram_log_counter
  :field average_photon_count: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.average_photon_count
  :field sat_mode: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.sat_mode
  :field tc_sequence_count: ax25_frame.ax25_payload.ax25_info.ccsds_data_section.obc_packet.tc_sequence_count

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
types:
  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
      - id: ax25_payload
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
        valid:
          any-of:
            - '"PICSAT"'
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
        type: picsat_ccsds_frame_t
        size-eos: true
  picsat_ccsds_frame_t:
    seq:
      - id: ccsds_header
        type: ccsds_header_t
      - id: ccsds_secondary_header
        type: ccsds_secondary_header_t
        if: true == (ccsds_header.secondary_header_flag)
      - id: ccsds_data_section
        type: obc_packet_t
        if: false == (ccsds_header.payload_flag)
  ccsds_header_t:
    seq:
      - id: ccsds_version
        type: b3
      - id: packet_type
        type: b1
      - id: secondary_header_flag
        type: b1
      - id: process_id
        type: b4
      - id: level_flag
        type: b1
      - id: payload_flag
        type: b1
      - id: packet_category
        type: b5
      - id: sequence_flag
        type: b2
      - id: packet_id
        type: b14
      - id: data_length
        type: b16
  ccsds_secondary_header_t:
    seq:
      - id: days_since_ref
        type: u2
      - id: ms_since_today
        type: u4
  obc_packet_t:
    seq:
      - id: obc_packet
        type:
          switch-on: _parent.ccsds_header.packet_category
          cases:
            1: obc_beacon_t
            _: dump_t
  obc_beacon_t:
    seq:
      - id: solar_panel5_error_flag
        type: b1
      - id: solar_panel4_error_flag
        type: b1
      - id: solar_panel3_error_flag
        type: b1
      - id: solar_panel2_error_flag
        type: b1
      - id: solar_panel1_error_flag
        type: b1
      - id: i_adcs_get_attitude_error
        type: b1
      - id: i_adcs_get_status_register_error
        type: b1
      - id: fram_enable_error_flag
        type: b1
      - id: ants_b_error_flag
        type: b1
      - id: ants_a_error_flag
        type: b1
      - id: trxvu_tx_error_flag
        type: b1
      - id: trxvu_rx_error_flag
        type: b1
      - id: obc_supervisor_error_flag
        type: b1
      - id: gom_eps_error_flag
        type: b1
      - id: ant1_undeployed_ants_b_status
        type: b1
      - id: ant1_timeout_ants_b_status
        type: b1
      - id: ant1_deploying_ants_b_status
        type: b1
      - id: ant2_undeployed_ants_b_status
        type: b1
      - id: ant2_timeout_ants_b_status
        type: b1
      - id: ant2_deploying_ants_b_status
        type: b1
      - id: ignore_flag_ants_b_status
        type: b1
      - id: ant3_undeployed_ants_b_status
        type: b1
      - id: ant3_timeout_ants_b_status
        type: b1
      - id: ant3_deploying_ants_b_status
        type: b1
      - id: ant4_undeployed_ants_b_status
        type: b1
      - id: ant4_timeout_ants_b_status
        type: b1
      - id: ant4_deploying_ants_b_status
        type: b1
      - id: armed_ants_b_status
        type: b1
      - id: ant1_undeployed_ants_a_status
        type: b1
      - id: ant1_timeout_ants_a_status
        type: b1
      - id: ant1_deploying_ants_a_status
        type: b1
      - id: ant2_undeployed_ants_a_status
        type: b1
      - id: ant2_timeout_ants_a_status
        type: b1
      - id: ant2_deploying_ants_a_status
        type: b1
      - id: ignore_flag_ants_a_status
        type: b1
      - id: ant3_undeployed_ants_a_status
        type: b1
      - id: ant3_timeout_ants_a_status
        type: b1
      - id: ant3_deploying_ants_a_status
        type: b1
      - id: ant4_undeployed_ants_a_status
        type: b1
      - id: ant4_timeout_ants_a_status
        type: b1
      - id: ant4_deploying_ants_a_status
        type: b1
      - id: armed_ants_a_status
        type: b1
      - id: solar_panel_temp5_zp
        type: u2
        doc: |
          Temperature of solar panel 5 (Z)
          solar_panel_temp5_zp/64.0
      - id: solar_panel_temp4_ym
        type: u2
        doc: |
          Temperature of solar panel 4 (Y-)
          solar_panel_temp4_ym/64.0
      - id: solar_panel_temp3_yp
        type: u2
        doc: |
          Temperature of solar panel 3 (Y+)
          solar_panel_temp3_yp/64.0
      - id: solar_panel_temp2_xm
        type: u2
        doc: |
          Temperature of solar panel 2 (X-)
          solar_panel_temp2_xm/64.0
      - id: solar_panel_temp1_xp
        type: u2
        doc: |
          Temperature of solar panel 1 (X+)
          solar_panel_temp1_xp/64.0
      - id: ants_temperature_side_b
        type: u2
        doc: |
          Temperature of antenna system (side B)
          -0.2922*ants_temperature_side_b+190.65
      - id: ants_temperature_side_a
        type: u2
        doc: |
          Temperature of antenna system (side A)
          -0.2922*ants_temperature_side_a+190.65
      - id: tx_trxvu_hk_current
        type: u2
        doc: |
          Trxvu Tx board transmitter current
          0.16643964*tx_trxvu_hk_current
      - id: tx_trxvu_hk_forwardpower
        type: u2
        doc: |
          Trxvu Tx board forward power
          0.00005887*tx_trxvu_hk_forwardpower*tx_trxvu_hk_forwardpower
      - id: tx_trxvu_hk_tx_reflectedpower
        type: u2
        doc: |
          Trxvu Tx board reflected power
          0.00005887*tx_trxvu_hk_tx_reflectedpower*tx_trxvu_hk_tx_reflectedpower
      - id: tx_trxvu_hk_pa_temp
        type: u2
        doc: |
          Trxvu Tx board power amplifier temperature
          -0.07669*tx_trxvu_hk_pa_temp+195.6037
      - id: rx_trxvu_hk_pa_temp
        type: u2
        doc: |
          Trxvu Rx power amplifier temperature
          -0.07669*rx_trxvu_hk_pa_temp+195.6037
      - id: rx_trxvu_hk_board_temp
        type: u2
        doc: |
          Trxvu Rx board temperature
          -0.07669*rx_trxvu_hk_board_temp+195.6037
      - id: eps_hk_temp_batt1
        type: s2
      - id: eps_hk_temp_batt0
        type: s2
      - id: eps_hk_batt_mode
        type: u1
      - id: eps_h_kv_batt
        type: u2
        doc: |
          Voltage of battery
          eps_h_kv_batt/1000.0
      - id: eps_hk_boot_cause
        type: u4
      - id: n_reboots_eps
        type: u4
      - id: n_reboots_obc
        type: u4
      - id: quaternion1
        type: f4
      - id: quaternion2
        type: f4
      - id: quaternion3
        type: f4
      - id: quaternion4
        type: f4
      - id: angular_rate_x
        type: f4
      - id: angular_rate_y
        type: f4
      - id: angular_rate_z
        type: f4
      - id: gap_0
        type: b12
      - id: adcs_stat_flag_hl_op_tgt_cap
        type: b1
      - id: adcs_stat_flag_hl_op_tgt_track_fix_wgs84
        type: b1
      - id: adcs_stat_flag_hl_op_tgt_track_nadir
        type: b1
      - id: adcs_stat_flag_hl_op_tgt_track
        type: b1
      - id: adcs_stat_flag_hl_op_tgt_track_const_v
        type: b1
      - id: adcs_stat_flag_hl_op_spin
        type: b1
      - id: gap_1
        type: b1
      - id: adcs_stat_flag_hl_op_sunp
        type: b1
      - id: adcs_stat_flag_hl_op_detumbling
        type: b1
      - id: adcs_stat_flag_hl_op_measure
        type: b1
      - id: gap_2
        type: b5
      - id: adcs_stat_flag_datetime_valid
        type: b1
      - id: gap_3
        type: b1
      - id: adcs_stat_flag_hl_op_safe
        type: b1
      - id: adcs_stat_flag_hl_op_idle
        type: b1
      - id: gap_4
        type: b1
      - id: up_time
        type: u4
      - id: last_fram_log_fun_err_code
        type: s2
      - id: last_fram_log_line_code
        type: u2
      - id: last_fram_log_file_crc_code
        type: u4
      - id: last_fram_log_counter
        type: u2
      - id: average_photon_count
        type: u2
      - id: sat_mode
        type: u1
      - id: tc_sequence_count
        type: u2
  dump_t:
    seq:
      - id: payload
        size-eos: true
