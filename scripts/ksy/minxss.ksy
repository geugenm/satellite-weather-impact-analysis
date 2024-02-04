---
meta:
  id: minxss
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field spacecraft_flags: ax25_frame.payload.ax25_info.beacon.spacecraft_flags
  :field pointing_mode: ax25_frame.payload.ax25_info.beacon.pointing_mode
  :field cmd_accept_cnt: ax25_frame.payload.ax25_info.beacon.cmd_accept_cnt
  :field flight_model: ax25_frame.payload.ax25_info.beacon.flight_model
  :field cdh_board_temp: ax25_frame.payload.ax25_info.beacon.cdh_board_temp
  :field enable_flags: ax25_frame.payload.ax25_info.beacon.enable_flags
  :field comm_brd_temp: ax25_frame.payload.ax25_info.beacon.comm_brd_temp
  :field mbrd_temp: ax25_frame.payload.ax25_info.beacon.mbrd_temp
  :field eps_brd_temp: ax25_frame.payload.ax25_info.beacon.eps_brd_temp
  :field battery_voltage: ax25_frame.payload.ax25_info.beacon.battery_voltage
  :field solar_panel_minus_y_curr: ax25_frame.payload.ax25_info.beacon.solar_panel_minus_y_curr
  :field solar_panel_minus_y_volt: ax25_frame.payload.ax25_info.beacon.solar_panel_minus_y_volt
  :field solar_panel_plus_x_curr: ax25_frame.payload.ax25_info.beacon.solar_panel_plus_x_curr
  :field solar_panel_plus_x_volt: ax25_frame.payload.ax25_info.beacon.solar_panel_plus_x_volt
  :field solar_panel_plus_y_curr: ax25_frame.payload.ax25_info.beacon.solar_panel_plus_y_curr
  :field solar_panel_plus_y_volt: ax25_frame.payload.ax25_info.beacon.solar_panel_plus_y_volt
  :field solar_panel_minus_y_temp: ax25_frame.payload.ax25_info.beacon.solar_panel_minus_y_temp
  :field solar_panel_plus_x_temp: ax25_frame.payload.ax25_info.beacon.solar_panel_plus_x_temp
  :field solar_panel_plus_y_temp: ax25_frame.payload.ax25_info.beacon.solar_panel_plus_y_temp
  :field battery_chrg_curr: ax25_frame.payload.ax25_info.beacon.battery_chrg_curr
  :field battery_dchrg_curr: ax25_frame.payload.ax25_info.beacon.battery_dchrg_curr
  :field battery_temp: ax25_frame.payload.ax25_info.beacon.battery_temp
  :field xp: ax25_frame.payload.ax25_info.beacon.xp
  :field sps_x: ax25_frame.payload.ax25_info.beacon.sps_x
  :field sps_y: ax25_frame.payload.ax25_info.beacon.sps_y

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
        type: telemetry
        size-eos: true

  telemetry:
    seq:
      - id: start_sync_flag
        type: u2
      - id: beacon
        size: _io.size - 4
        type:
          switch-on: start_sync_flag
          cases:
            0x0819: hskp_data  # be
            0x081d: rt_data    # be
      - id: stop_sync_flag
        size: u2le
        contents: [0xa5, 0xa5]

  hskp_data:
    seq:
      - id: res_1
        type: u1
        repeat: expr
        repeat-expr: 10

      - id: spacecraft_flags
        type: u1
        doc: |
          spacecraft_mode:
          bit0 to bit2 = (spacecraft_flags & 0x0030) >> 4

          eclipse:
          bit3 = (spacecraft_flags & 0x08) >> 3

      - id: pointing_mode
        type: u1
        doc: |
          pointing_mode:
          bit0 = pointing_mode & 0x01

      - id: res_2
        type: u2

      - id: cmd_accept_cnt
        type: u2le

      - id: res_3
        type: u1
        repeat: expr
        repeat-expr: 33

      - id: flight_model
        type: u1
        doc: |
          flight_model:
          flight_model = (flight_model & 0x0030) >> 4

          Fix mistaken flight model number in final flight software burn

          if flight_model == 3:
            flight_model = 2
          elif flight_model == 4:
            flight_model = 3  # This is the engineering test unit (AKA FlatSat)
          return flight_model

      - id: res_4
        type: u1
        repeat: expr
        repeat-expr: 34

      - id: cdh_board_temp
        type: s2le
        doc: '/ 256.0 # [deg C]'

      - id: enable_flags
        type: u2
        doc: |
          enable_x123:
          bit1 = (enable_flags & 0x0002) >> 1

          enable_sps:
          bit2 = (enable_flags & 0x0004) >> 2

      - id: res_5
        type: u1
        repeat: expr
        repeat-expr: 32

      - id: comm_brd_temp
        type: s2le
        doc: '/ 256.0 # [deg C]'

      - id: mbrd_temp
        type: s2le
        doc: '/ 256.0 # [deg C]'

      - id: res_6
        type: u2

      - id: eps_brd_temp
        type: s2le
        doc: '/ 256.0 # [deg C]'

      - id: res_7
        type: u2

      - id: battery_voltage
        type: u2le
        doc: '/ 6415.0 # [V]'

      - id: res_8
        type: u2

      - id: solar_panel_minus_y_curr
        type: u2le
        doc: '* 163.8 / 327.68 # [mA]'

      - id: solar_panel_minus_y_volt
        type: u2le
        doc: '* 32.76 / 32768.0 # [V]'

      - id: solar_panel_plus_x_curr
        type: u2le
        doc: '* 163.8 / 327.68 # [mA]'

      - id: solar_panel_plus_x_volt
        type: u2le
        doc: '* 32.76 / 32768.0 # [V]'

      - id: solar_panel_plus_y_curr
        type: u2le
        doc: '* 163.8 / 327.68 # [mA]'

      - id: solar_panel_plus_y_volt
        type: u2le
        doc: '* 32.76 / 32768.0 # [V]'

      - id: res_9
        type: u1
        repeat: expr
        repeat-expr: 12

      - id: solar_panel_minus_y_temp
        type: u2le
        doc: '* 0.1744 - 216.0 # [deg C]'

      - id: solar_panel_plus_x_temp
        type: u2le
        doc: '* 0.1744 - 216.0 # [deg C]'

      - id: solar_panel_plus_y_temp
        type: u2le
        doc: '* 0.1744 - 216.0 # [deg C]'

      - id: res_0
        type: u2

      - id: battery_chrg_curr
        type: u2le
        doc: '* 3.5568 - 61.6 # [mA]'

      - id: res_a
        type: u2

      - id: battery_dchrg_curr
        type: u2le
        doc: '* 3.5568 - 61.6 # [mA]'

      - id: battery_temp
        type: u2le
        doc: '* 0.18766 - 250.2 # [deg C]'

      - id: res_b
        type: u1
        repeat: expr
        repeat-expr: 16

      - id: xp
        type: u4le
        doc: '# [DN]'

      - id: res_c
        type: u1
        repeat: expr
        repeat-expr: 10

      - id: sps_x
        type: u2le
        doc: '/ 1e4 * 3.0 # [deg]'

      - id: sps_y
        type: u2le
        doc: '/ 1e4 * 3.0 # [deg]'

  rt_data:
    seq:
      - id: rt_data_raw
        size: _io.size - 4                      # start_sync_flag + stop_sync_flag
