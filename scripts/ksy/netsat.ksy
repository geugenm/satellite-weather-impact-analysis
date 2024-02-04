---
meta:
  id: netsat
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field rf_message: ax25_frame.payload.ax25_info.beacon_payload.message
  :field csp_header: ax25_frame.payload.ax25_info.csp_header
  :field compass_header_flags1: ax25_frame.payload.ax25_info.compass_header.flags1
  :field compass_header_flags2: ax25_frame.payload.ax25_info.compass_header.flags2
  :field compass_header_packet_id: ax25_frame.payload.ax25_info.compass_header.packet_id
  :field compass_header_fm_system_id: ax25_frame.payload.ax25_info.compass_header.fm_system_id
  :field compass_header_fm_subsystem_id: ax25_frame.payload.ax25_info.compass_header.fm_subsystem_id
  :field compass_header_to_system_id: ax25_frame.payload.ax25_info.compass_header.to_system_id
  :field compass_header_to_subsystem_id: ax25_frame.payload.ax25_info.compass_header.to_subsystem_id
  :field compass_header_api: ax25_frame.payload.ax25_info.compass_header.api
  :field compass_header_payload_size: ax25_frame.payload.ax25_info.compass_header.payload_size
  :field beacon_header_model: ax25_frame.payload.ax25_info.payload.beacon_header.model_type
  :field beacon_header_uid: ax25_frame.payload.ax25_info.payload.beacon_header.uid
  :field beacon_header_type: ax25_frame.payload.ax25_info.payload.beacon_header.type
  :field beacon_header_length: ax25_frame.payload.ax25_info.payload.beacon_header.length
  :field beacon_header_timestamp: ax25_frame.payload.ax25_info.payload.beacon_header.timestamp_raw.timestamp
  :field beacon_payload_beacon_rate: ax25_frame.payload.ax25_info.payload.beacon_payload.beacon_rate
  :field beacon_payload_uptime: ax25_frame.payload.ax25_info.payload.beacon_payload.uptime
  :field beacon_payload_status_aocs_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.aocs_active
  :field beacon_payload_status_radio2_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.radio2_active
  :field beacon_payload_status_powerpath_b_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.powerpath_b_active
  :field beacon_payload_status_powerpath_a_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.powerpath_a_active
  :field beacon_payload_status_mcub_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.is_mcu_b_active
  :field beacon_payload_status_panel_neg_x_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.panel_x_neg_active
  :field beacon_payload_status_panel_pos_x_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.panel_x_pos_active
  :field beacon_payload_status_panel_neg_y_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.panel_y_neg_active
  :field beacon_payload_status_panel_pos_y_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.panel_y_pos_active
  :field beacon_payload_status_panel_neg_z_active: ax25_frame.payload.ax25_info.payload.beacon_payload.status_flags.panel_z_neg_active
  :field beacon_payload_powerpath_a_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_a_temp_soc.temp
  :field beacon_payload_powerpath_a_state_of_charge: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_a_temp_soc.soc
  :field beacon_payload_powerpath_b_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_b_temp_soc.temp
  :field beacon_payload_powerpath_b_state_of_charge: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_b_temp_soc.soc
  :field beacon_payload_powerpath_a_voltage: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_a_iup.u
  :field beacon_payload_powerpath_a_current: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_a_iup.i
  :field beacon_payload_powerpath_a_power: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_a_iup.p
  :field beacon_payload_powerpath_b_voltage: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_b_iup.u
  :field beacon_payload_powerpath_b_current: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_b_iup.i
  :field beacon_payload_powerpath_b_power: ax25_frame.payload.ax25_info.payload.beacon_payload.powerpath_b_iup.p
  :field beacon_payload_power_consumption: ax25_frame.payload.ax25_info.payload.beacon_payload.power_total
  :field beacon_payload_obc_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.temperature_obc
  :field beacon_payload_panel_neg_x_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.temperature_panel.xneg
  :field beacon_payload_panel_pos_x_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.temperature_panel.xpos
  :field beacon_payload_panel_neg_y_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.temperature_panel.yneg
  :field beacon_payload_panel_pos_y_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.temperature_panel.ypos
  :field beacon_payload_panel_neg_z_temp: ax25_frame.payload.ax25_info.payload.beacon_payload.temperature_panel.zneg
  :field beacon_payload_seu_ram: ax25_frame.payload.ax25_info.payload.beacon_payload.seu_ram
  :field beacon_payload_seu_rom: ax25_frame.payload.ax25_info.payload.beacon_payload.seu_rom
  :field beacon_payload_freq: ax25_frame.payload.ax25_info.payload.beacon_payload.frequency_radio
  :field beacon_payload_misc: ax25_frame.payload.ax25_info.payload.compass_misc
  :field beacon_payload_crc: ax25_frame.payload.ax25_info.payload.frame_crc32c

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
        encoding: utf-8
        size: 6
    instances:
      is_netsat:
        value: >-
          (callsign == 'DP2NSA') or
          (callsign == 'DP2NSB') or
          (callsign == 'DP2NSC') or
          (callsign == 'DP2NSD')

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
          switch-on: _parent.ax25_header.src_callsign_raw.callsign_ror.is_netsat
          cases:
            true: netsat_frame
        size-eos: true

  netsat_frame:
    seq:
      - id: csp_header
        type: u4
      - id: compass_header
        size: 10
        type: compass_header
      - id: payload
        size: compass_header.payload_size
        type:
          switch-on: compass_header.api
          cases:
            14: netsat_beacon
            103: netsat_rf_message
      - id: compass_misc
        type: u2
      - id: frame_crc32c
        type: u4


  compass_header:
    seq:
      - id: flags1
        type: u1
      - id: flags2
        type: u1
      - id: packet_id
        type: u2le
      - id: fm_system_id
        type: u1
      - id: fm_subsystem_id
        type: u1
      - id: to_system_id
        type: u1
      - id: to_subsystem_id
        type: u1
      - id: api
        type: u1
      - id: payload_size
        type: u1

  netsat_beacon:
    seq:
      - id: beacon_header
        type: beacon_header
      - id: beacon_payload
        type:
          switch-on: beacon_header.length
          cases:
            42: telemetry_payload

  beacon_header:
    seq:
      - id: model_type
        type: u1
      - id: uid
        type: u2
      - id: type
        type: u1
      - id: length
        type: u1
      - id: timestamp_raw
        type: beacon_header_timestamp
        size: 6
        doc: '48 bit unix timestamp'

  beacon_header_timestamp:
    seq:
      - id: beacon_header_ts
        repeat: expr
        repeat-expr: 6
        doc: '48 bit unix timestamp, padding'
        type: u1
    instances:
      timestamp_lsb:
        value: >-
          ((beacon_header_ts[0])
          + (beacon_header_ts[1]<<8)
          + (beacon_header_ts[2]<<16)
          + (beacon_header_ts[3]<<24))
      timestamp_msb:
        value: >-
          ((beacon_header_ts[4])
          + (beacon_header_ts[5]<<8)+1)
      timestamp:
        value: >-
          (timestamp_msb*0x100000000) + timestamp_lsb - 0x100000000
        doc: 'padded unix timestamp (64bit) in ms'
        # All of this just to zero-pad and parse a uint of 48/64 bits? It's even le..

  telemetry_payload:
    seq:
      - id: beacon_rate
        type: u4
        doc: '[ms]'
      - id: uptime
        type: u4
        doc: '[s]'
      - id: status_flags
        type: beacon_status_flags
        size: 2
        # TODO: figure out if this is needed
      - id: powerpath_a_temp_soc
        type: pp_tempsoc
      - id: powerpath_b_temp_soc
        type: pp_tempsoc
      - id: powerpath_a_iup
        type: pp_i_u_p
      - id: powerpath_b_iup
        type: pp_i_u_p
      - id: power_total
        type: s4
        doc: '[mW]'
      - id: temperature_obc
        type: s1
        doc: '[degC]'
      - id: temperature_panel
        type: temperature_panel
      - id: frequency_radio    # Hz
        type: u4
        doc: '[Hz]'
      - id: seu_rom
        type: u1
        doc: '[detected SEUs]'
      - id: seu_ram
        type: u1
        doc: '[detected SEUs]'

  beacon_status_flags:
    seq:
      - id: blank_012
        type: b3
      - id: aocs_active
        type: b1
      - id: radio_2_active
        type: b1
      - id: powerpath_b_active
        type: b1
      - id: powerpath_a_active
        type: b1
      - id: is_mcu_b_active
        type: b1
      - id: blank_mode
        type: b2
        # TODO: do something less hacky in the future
      - id: panel_xneg_active
        type: b1
      - id: panel_xpos_active
        type: b1
      - id: panel_yneg_active
        type: b1
      - id: panel_ypos_active
        type: b1
      - id: panel_zneg_active
        type: b1
      - id: blank_15
        type: b1

  pp_tempsoc:
    seq:
      - id: temp
        type: s1
        doc: '[degC]'
      - id: soc
        type: s1
        doc: '[%]'

  pp_i_u_p:
    seq:
      - id: u
        type: s2
        doc: '[mV]'
      - id: i
        type: s2
        doc: '[mA]'
      - id: p
        type: s2
        doc: '[mW]'

  temperature_panel:
    seq:
      - id: xpos
        type: s1
        doc: '[degC]'
      - id: xneg
        type: s1
        doc: '[degC]'
      - id: ypos
        type: s1
        doc: '[degC]'
      - id: yneg
        type: s1
        doc: '[degC]'
      - id: zneg
        type: s1
        doc: '[degC]'

  # This is Stolen from UWE4 based on the assumption that netsat has a similar
  # mechanism. Telemetry beacon detection should be robust enough for this to
  # not cause any issues.
  netsat_rf_message:
    seq:
      - id: offset_0
        type: u1
        repeat: expr
        repeat-expr: 6
      - id: message
        type: str
        encoding: utf-8
        size: _parent.compass_header.payload_size - 6
      - id: rf_message_crc
        type: u2le
