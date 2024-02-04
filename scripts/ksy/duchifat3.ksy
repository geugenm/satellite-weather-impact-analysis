---
meta:
  id: duchifat3
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field service_type: ax25_frame.payload.ax25_info.service_type
  :field sub_service_type: ax25_frame.payload.ax25_info.sub_service_type
  :field length: ax25_frame.payload.ax25_info.length
  :field time_unix: ax25_frame.payload.ax25_info.time_unix
  :field vbatt: ax25_frame.payload.ax25_info.service.sub_service.vbatt
  :field batt_current: ax25_frame.payload.ax25_info.service.sub_service.batt_current
  :field current3v3: ax25_frame.payload.ax25_info.service.sub_service.current3v3
  :field current5v: ax25_frame.payload.ax25_info.service.sub_service.current5v
  :field lotrxvu_temp: ax25_frame.payload.ax25_info.service.sub_service.lotrxvu_temp
  :field patrxvu_temp: ax25_frame.payload.ax25_info.service.sub_service.patrxvu_temp
  :field eps_temp_1: ax25_frame.payload.ax25_info.service.sub_service.eps_temp_1
  :field eps_temp_2: ax25_frame.payload.ax25_info.service.sub_service.eps_temp_2
  :field eps_temp_3: ax25_frame.payload.ax25_info.service.sub_service.eps_temp_3
  :field eps_temp_4: ax25_frame.payload.ax25_info.service.sub_service.eps_temp_4
  :field batt_temp_1: ax25_frame.payload.ax25_info.service.sub_service.batt_temp_1
  :field batt_temp_2: ax25_frame.payload.ax25_info.service.sub_service.batt_temp_2
  :field rx_doppler: ax25_frame.payload.ax25_info.service.sub_service.rx_doppler
  :field rxrssi: ax25_frame.payload.ax25_info.service.sub_service.rxrssi
  :field txrefl: ax25_frame.payload.ax25_info.service.sub_service.txrefl
  :field txforw: ax25_frame.payload.ax25_info.service.sub_service.txforw
  :field altitude_angels_roll: ax25_frame.payload.ax25_info.service.sub_service.altitude_angels_roll
  :field altitude_angels_pitch: ax25_frame.payload.ax25_info.service.sub_service.altitude_angels_pitch
  :field altitude_angels_yaw: ax25_frame.payload.ax25_info.service.sub_service.altitude_angels_yaw
  :field file_system_last_error: ax25_frame.payload.ax25_info.service.sub_service.file_system_last_error
  :field eps_battery_state: ax25_frame.payload.ax25_info.service.sub_service.eps_battery_state
  :field delayed_commands_num: ax25_frame.payload.ax25_info.service.sub_service.delayed_commands_num
  :field resets_num: ax25_frame.payload.ax25_info.service.sub_service.resets_num
  :field last_reset: ax25_frame.payload.ax25_info.service.sub_service.last_reset
  :field system_states: ax25_frame.payload.ax25_info.service.sub_service.system_states
  :field event_log_num: ax25_frame.payload.ax25_info.service.sub_service.event_log_num
  :field event_log_info: ax25_frame.payload.ax25_info.service.sub_service.event_log_info
  :field error_log_num: ax25_frame.payload.ax25_info.service.sub_service.error_log_num
  :field error_log_info: ax25_frame.payload.ax25_info.service.sub_service.error_log_info
  :field photo_voltaic_3: ax25_frame.payload.ax25_info.service.sub_service.photo_voltaic_3
  :field photo_voltaic_2: ax25_frame.payload.ax25_info.service.sub_service.photo_voltaic_2
  :field photo_voltaic_1: ax25_frame.payload.ax25_info.service.sub_service.photo_voltaic_1
  :field photo_current_3: ax25_frame.payload.ax25_info.service.sub_service.photo_current_3
  :field photo_current_2: ax25_frame.payload.ax25_info.service.sub_service.photo_current_2
  :field photo_current_1: ax25_frame.payload.ax25_info.service.sub_service.photo_current_1
  :field photo_current_total: ax25_frame.payload.ax25_info.service.sub_service.photo_current_total
  :field batt_current_3: ax25_frame.payload.ax25_info.service.sub_service.batt_current_3
  :field channel_current_1: ax25_frame.payload.ax25_info.service.sub_service.channel_current_1
  :field channel_current_2: ax25_frame.payload.ax25_info.service.sub_service.channel_current_2
  :field channel_current_3: ax25_frame.payload.ax25_info.service.sub_service.channel_current_3
  :field channel_current_4: ax25_frame.payload.ax25_info.service.sub_service.channel_current_4
  :field channel_current_5: ax25_frame.payload.ax25_info.service.sub_service.channel_current_5
  :field channel_current_6: ax25_frame.payload.ax25_info.service.sub_service.channel_current_6
  :field eps_reboots_num: ax25_frame.payload.ax25_info.service.sub_service.eps_reboots_num
  :field eps_reboot_cause: ax25_frame.payload.ax25_info.service.sub_service.eps_reboot_cause
  :field eps_ppt_mode: ax25_frame.payload.ax25_info.service.sub_service.eps_ppt_mode
  :field eps_channel_status: ax25_frame.payload.ax25_info.service.sub_service.eps_channel_status
  :field system_states: ax25_frame.payload.ax25_info.service.sub_service.system_states
  :field trxvu_bus_volt: ax25_frame.payload.ax25_info.service.sub_service.trxvu_bus_volt
  :field trxvu_total_curr: ax25_frame.payload.ax25_info.service.sub_service.trxvu_total_curr
  :field ant_temp_a: ax25_frame.payload.ax25_info.service.sub_service.ant_temp_a
  :field ant_temp_b: ax25_frame.payload.ax25_info.service.sub_service.ant_temp_b
  :field sp_temp_1: ax25_frame.payload.ax25_info.service.sub_service.sp_temp_1
  :field sp_temp_2: ax25_frame.payload.ax25_info.service.sub_service.sp_temp_2
  :field sp_temp_3: ax25_frame.payload.ax25_info.service.sub_service.sp_temp_3
  :field sp_temp_4: ax25_frame.payload.ax25_info.service.sub_service.sp_temp_4
  :field sp_temp_5: ax25_frame.payload.ax25_info.service.sub_service.sp_temp_5
  :field sp_temp_6: ax25_frame.payload.ax25_info.service.sub_service.sp_temp_6
  :field filesystem_a_total: ax25_frame.payload.ax25_info.service.sub_service.filesystem_a_total
  :field filesystem_a_free: ax25_frame.payload.ax25_info.service.sub_service.filesystem_a_free
  :field filesystem_a_used: ax25_frame.payload.ax25_info.service.sub_service.filesystem_a_used
  :field filesystem_a_bad: ax25_frame.payload.ax25_info.service.sub_service.filesystem_a_bad

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
      - id: service_type
        type: u1
      - id: sub_service_type
        type: u1
      - id: length
        type: u2
      - id: time_unix
        type: u4
      - id: service
        type:
          switch-on: service_type
          cases:
            3: global_parameters_t
            13: general_t
            88: telemetry_dumps_t
  global_parameters_t:
    seq:
      - id: sub_service
        type:
          switch-on: _parent.sub_service_type
          cases:
            25: beacon_t
  general_t:
    seq:
      - id: sub_service
        type:
          switch-on: _parent.sub_service_type
          cases:
            49: event_log_t
            50: error_log_t
  telemetry_dumps_t:
    seq:
      - id: sub_service
        type:
          switch-on: _parent.sub_service_type
          cases:
            50: eps_tlm_t
            51: comm_tlm_t
            53: solar_panels_tlm_t
            73: file_system_space_a_t
  beacon_t:
    meta:
      endian: be
    seq:
      - id: vbatt
        type: u2
        doc: '[mV]'
      - id: batt_current
        type: u2
        doc: 'mA'
      - id: current3v3
        type: u2
        doc: '[mA]'
      - id: current5v
        type: u2
        doc: '[mA]'
      - id: lotrxvu_temp
        type: u2
        doc: 'lo_trxvu_temp * -0.07669 + 195.6037 [degC]'
      - id: patrxvu_temp
        type: u2
        doc: 'pa_trxvu_temp * -0.07669 + 195.6037 [degC]'
      - id: eps_temp_1
        type: s2
        doc: '[degC]'
      - id: eps_temp_2
        type: s2
        doc: '[degC]'
      - id: eps_temp_3
        type: s2
        doc: '[degC]'
      - id: eps_temp_4
        type: s2
        doc: '[degC]'
      - id: batt_temp_1
        type: s2
        doc: '[degC]'
      - id: batt_temp_2
        type: s2
        doc: '[degC]'
      - id: rx_doppler
        type: u2
        doc: 'rx_doppler * 13.352 - 22300 [Hz] (to be ignored!)'
      - id: rxrssi
        type: u2
        doc: 'rx_doppler * 0.03 - 152 [dBm] (to be ignored!)'
      - id: txrefl
        type: u2
        doc: '[mW] (to be ignored!)'
      - id: txforw
        type: u2
        doc: '[mW] (to be ignored!)'
      - id: altitude_angels_roll
        type: s2
        doc: '[deg] (to be ignored!)'
      - id: altitude_angels_pitch
        type: s2
        doc: '[deg] (to be ignored!)'
      - id: altitude_angels_yaw
        type: s2
        doc: '[deg] (to be ignored!)'
      - id: file_system_last_error
        type: u1
      - id: eps_battery_state
        type: u1
        doc: '[#]'
      - id: delayed_commands_num
        type: u1
      - id: resets_num
        type: u4
      - id: last_reset
        type: u4
        doc: '[unixtime]'
      - id: system_states
        type: u1
        doc: |
          state_mute
          state_ants
          state_transponder
          state_dump
          state_cam_operational
          state_tx
          state_adcs
          state_cam
  event_log_t:
    meta:
      endian: le
    seq:
      - id: event_log_num
        type: u4
      - id: event_log_info
        type: u4
  error_log_t:
    meta:
      endian: le
    seq:
      - id: error_log_num
        type: u4
      - id: error_log_info
        type: u4
  eps_tlm_t:
    meta:
      endian: le
    seq:
      - id: photo_voltaic_3
        type: u2
        doc: '[mV]'
      - id: photo_voltaic_2
        type: u2
        doc: '[mV]'
      - id: photo_voltaic_1
        type: u2
        doc: '[mV]'
      - id: photo_current_3
        type: u2
        doc: '[mA]'
      - id: photo_current_2
        type: u2
        doc: '[mA]'
      - id: photo_current_1
        type: u2
        doc: '[mA]'
      - id: photo_current_total
        type: u2
        doc: '[mA]'
      - id: vbatt
        type: u2
        doc: '[mV]'
      - id: batt_current_3
        type: u2
        doc: '[mA]'
      - id: channel_current_1
        type: u2
        doc: '[mA]'
      - id: channel_current_2
        type: u2
        doc: '[mA]'
      - id: channel_current_3
        type: u2
        doc: '[mA]'
      - id: channel_current_4
        type: u2
        doc: '[mA]'
      - id: channel_current_5
        type: u2
        doc: '[mA]'
      - id: channel_current_6
        type: u2
        doc: '[mA]'
      - id: eps_temp_1
        type: s2
        doc: '[degC]'
      - id: eps_temp_2
        type: s2
        doc: '[degC]'
      - id: eps_temp_3
        type: s2
        doc: '[degC]'
      - id: eps_temp_4
        type: s2
        doc: '[degC]'
      - id: batt_temp_1
        type: s2
        doc: '[degC]'
      - id: batt_temp_2
        type: s2
        doc: '[degC]'
      - id: eps_reboots_num
        type: u4
        doc: '[#]'
      - id: eps_reboot_cause
        type: u1
        doc: '[#]'
      - id: eps_ppt_mode
        type: u1
        doc: |
          6 bits n/a
          2 bits 0 = Hardware, 1 = MPPT, 2 = Fixed SW PPT
      - id: eps_channel_status
        type: u1
        doc: '[#]'
      - id: system_states
        type: u1
        doc: |
          state_mute
          state_ants
          state_transponder
          state_dump
          state_cam_operational
          state_tx
          state_adcs
          state_cam
      - id: eps_battery_state
        type: u1
        doc: '[#]'
  comm_tlm_t:
    meta:
      endian: le
    seq:
      - id: trxvu_bus_volt
        type: u2
        doc: 'trxvu_bus_volt * 0.00488 [V]'
      - id: trxvu_total_curr
        type: u2
        doc: 'trxvu_total_curr * 0.16643964 [mA]'
      - id: txrefl
        type: u2
        doc: '[mW]'
      - id: txforw
        type: u2
        doc: '[mW]'
      - id: rxrssi
        type: u2
        doc: 'rxrssi * 0.03 - 152 [dBm]'
      - id: patrxvu_temp
        type: u2
        doc: 'patrxvu_temp * -0.07669 + 195.6037 [degC]'
      - id: lotrxvu_temp
        type: u2
        doc: 'lotrxvu_temp * -0.07669 + 195.6037 [degC]'
      - id: ant_temp_a
        type: u2
        doc: 'ant_temp_a * -0.2922 + 190.65 [degC]'
      - id: ant_temp_b
        type: u2
        doc: 'ant_temp_b * -0.2922 + 190.65 [degC]'
  solar_panels_tlm_t:
    meta:
      endian: le
    seq:
      - id: sp_temp_1
        type: s4
        doc: 'sp_temp_1 * 0.0009765625 [degC]'
      - id: sp_temp_2
        type: s4
        doc: 'sp_temp_2 * 0.0009765625 [degC]'
      - id: sp_temp_3
        type: s4
        doc: 'sp_temp_3 * 0.0009765625 [degC]'
      - id: sp_temp_4
        type: s4
        doc: 'sp_temp_4 * 0.0009765625 [degC]'
      - id: sp_temp_5
        type: s4
        doc: 'sp_temp_5 * 0.0009765625 [degC]'
      - id: sp_temp_6
        type: s4
        doc: 'sp_temp_6 * 0.0009765625 [degC]'
  file_system_space_a_t:
    meta:
      endian: le
    seq:
      - id: filesystem_a_total
        type: u4
      - id: filesystem_a_free
        type: u4
      - id: filesystem_a_used
        type: u4
      - id: filesystem_a_bad
        type: u4
