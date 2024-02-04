---
meta:
  id: mysat
  title: MYSAT-1 decoder struct
  endian: le
doc-ref: ''
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field callsign: ax25_frame.payload.ax25_info.beacon_type.callsign
  :field obc_mode: ax25_frame.payload.ax25_info.beacon_type.obc_mode
  :field obc_reset_counter: ax25_frame.payload.ax25_info.beacon_type.obc_reset_counter
  :field obc_uptime: ax25_frame.payload.ax25_info.beacon_type.obc_uptime
  :field gyro_norm: ax25_frame.payload.ax25_info.beacon_type.gyro_norm
  :field eps_reset_counter: ax25_frame.payload.ax25_info.beacon_type.eps_reset_counter
  :field eps_last_boot_cause: ax25_frame.payload.ax25_info.beacon_type.eps_last_boot_cause
  :field eps_battery_mode: ax25_frame.payload.ax25_info.beacon_type.eps_battery_mode
  :field timestamp: ax25_frame.payload.ax25_info.beacon_type.timestamp
  :field obc_temperature: ax25_frame.payload.ax25_info.beacon_type.obc_temperature
  :field obc_daughterboard_temperature: ax25_frame.payload.ax25_info.beacon_type.obc_daughterboard_temperature
  :field eps_battery_temperature: ax25_frame.payload.ax25_info.beacon_type.eps_battery_temperature
  :field eps_board_temperature: ax25_frame.payload.ax25_info.beacon_type.eps_board_temperature
  :field ants_temperature: ax25_frame.payload.ax25_info.beacon_type.ants_temperature
  :field trxvu_temperature: ax25_frame.payload.ax25_info.beacon_type.trxvu_temperature
  :field adcs_temperature: ax25_frame.payload.ax25_info.beacon_type.adcs_temperature
  :field obc_3v3_voltage: ax25_frame.payload.ax25_info.beacon_type.obc_3v3_voltage
  :field camera_voltage: ax25_frame.payload.ax25_info.beacon_type.camera_voltage
  :field trxvu_voltage: ax25_frame.payload.ax25_info.beacon_type.trxvu_voltage
  :field eps_battery_voltage: ax25_frame.payload.ax25_info.beacon_type.eps_battery_voltage
  :field obc_5v_current: ax25_frame.payload.ax25_info.beacon_type.obc_5v_current
  :field eps_total_pv_current: ax25_frame.payload.ax25_info.beacon_type.eps_total_pv_current
  :field eps_total_system_current: ax25_frame.payload.ax25_info.beacon_type.eps_total_system_current
  :field message: ax25_frame.payload.ax25_info.beacon_type.message

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
        type: mysat_payload
        size-eos: true

  mysat_payload:
    seq:
      - id: beacon_type
        type:
          switch-on: _io.size
          cases:
            42: mysat_tlm
            _: mysat_message
  mysat_tlm:
    seq:
      - id: callsign
        -orig-id: Callsign
        type: str
        encoding: utf-8
        size: 5
      - id: obc_mode
        -orig-id: OBC mode
        type: u1
        doc: |
          value = obc_mode [n]
          0: Initial Checkout Mode
          1: Normal Mode
          2: Safe Mode
      - id: obc_reset_counter
        -orig-id: OBC reset counter
        type: u4
        doc: 'value = obc_reset_counter [n]'
      - id: obc_uptime
        -orig-id: OBC uptime
        type: u4
        doc: 'value = obc_uptime [sec]'
      - id: gyro_norm
        -orig-id: Gyro norm
        type: u1
        doc: |
          value = gyro_norm [sec]
          Norm of angular rates for 3 axes
      - id: eps_reset_counter
        -orig-id: EPS Reset Counter
        type: u4
        doc: 'value = eps_reset_counter [n]'
      - id: eps_last_boot_cause
        -orig-id: EPS Last Boot Cause
        type: u1
        doc: |
          value = eps_last_boot_cause [n]
          0: Unknown reset
          1: Dedicated WDT reset
          2: I2C WDT reset
          3: Hard reset
          4: Soft reset
          5: Stack overflow
          6: Timer overflow
          7: Brownout or power-on reset
          8: Internal WDT reset
      - id: eps_battery_mode
        -orig-id: EPS Battery Mode
        type: u1
        doc: |
          value = eps_battery_mode [n]
          0: initial
          1: undervoltage
          2: safemode
          3: nominal
          4: full
      - id: timestamp
        -orig-id: Timestamp
        type: u4
        doc: |
          value = timestamp [sec]
          OBC clock, Unix timestamp
      - id: obc_temperature
        -orig-id: OBC Temperature
        type: u1
        doc: 'value = obc_temperature - 128 [degC]'
      - id: obc_daughterboard_temperature
        -orig-id: OBC Daughterboard Temperature
        type: u1
        doc: 'value = obc_daughterboard_temperature - 128 [degC]'
      - id: eps_battery_temperature
        -orig-id: EPS Battery Temperature
        type: u1
        doc: 'value = eps_battery_temperature - 128 [degC]'
      - id: eps_board_temperature
        -orig-id: EPS Board Temperature
        type: u1
        doc: 'value = eps_board_temperature - 128 [degC]'
      - id: ants_temperature
        -orig-id: ANTS Temperature
        type: u1
        doc: 'value = ants_temperature - 128 [degC]'
      - id: trxvu_temperature
        -orig-id: TRXVU Temperature
        type: u1
        doc: 'value = trxvu_temperature - 128 [degC]'
      - id: adcs_temperature
        -orig-id: ADCS Temperature
        type: u1
        doc: 'value = adcs_temperature - 128 [degC]'
      - id: obc_3v3_voltage
        -orig-id: OBC 3.3 Voltage
        type: u1
        doc: 'value = obc_3v3_voltage / 10 [V]'
      - id: camera_voltage
        -orig-id: Camera Voltage
        type: u1
        doc: 'value = camera_voltage / 10 [V]'
      - id: trxvu_voltage
        -orig-id: TRXVU Voltage
        type: u1
        doc: 'value = trxvu_voltage / 10 [V]'
      - id: eps_battery_voltage
        -orig-id: EPS Battery Voltage
        type: u1
        doc: 'value = eps_battery_voltage / 10 [V]'
      - id: obc_5v_current
        -orig-id: OBC 5.0 Current
        type: u2
        doc: 'value = obc_5v_current [mA]'
      - id: eps_total_pv_current
        -orig-id: EPS total PV current
        type: u2
        doc: 'value = eps_total_pv_current [mA]'
      - id: eps_total_system_current
        -orig-id: EPS Total System current
        type: u2
        doc: 'value = eps_total_system_current [mA]'
  mysat_message:
    seq:
      - id: message
        type: str
        encoding: utf-8
        size-eos: true
instances:
  frame_length:
    value: _io.size
