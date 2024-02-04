---
meta:
  id: painani
  endian: be
doc-ref: 'https://dep.cicese.mx/csa/painani/telemetry.pdf'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field short_internal_temperature: ax25_frame.payload.info.pld_id.short_internal_temperature
  :field short_pa_temperature: ax25_frame.payload.info.pld_id.short_pa_temperature
  :field short_current_3v3: ax25_frame.payload.info.pld_id.short_current_3v3
  :field short_voltage_3v3: ax25_frame.payload.info.pld_id.short_voltage_3v3
  :field short_current_5v: ax25_frame.payload.info.pld_id.short_current_5v
  :field short_voltage_5v: ax25_frame.payload.info.pld_id.short_voltage_5v
  :field id: ax25_frame.payload.info.pld_id.id
  :field length: ax25_frame.payload.info.pld_id.length
  :field antenna: ax25_frame.payload.info.pld_id.antenna
  :field temp_panel_1: ax25_frame.payload.info.pld_id.temp_panel_1
  :field temp_panel_2: ax25_frame.payload.info.pld_id.temp_panel_2
  :field temp_panel_3: ax25_frame.payload.info.pld_id.temp_panel_3
  :field temp_bank_1: ax25_frame.payload.info.pld_id.temp_bank_1
  :field temp_bank_2: ax25_frame.payload.info.pld_id.temp_bank_2
  :field charge_bank_1: ax25_frame.payload.info.pld_id.charge_bank_1
  :field charge_bank_2: ax25_frame.payload.info.pld_id.charge_bank_2
  :field gyro_x: ax25_frame.payload.info.pld_id.gyro_x
  :field gyro_y: ax25_frame.payload.info.pld_id.gyro_y
  :field gyro_z: ax25_frame.payload.info.pld_id.gyro_z
  :field state: ax25_frame.payload.info.pld_id.state
  :field reboots: ax25_frame.payload.info.pld_id.reboots
  :field rtc: ax25_frame.payload.info.pld_id.rtc
  :field voltage_bank_1: ax25_frame.payload.info.pld_id.voltage_bank_1
  :field voltage_bank_2: ax25_frame.payload.info.pld_id.voltage_bank_2
  :field current_bank_1: ax25_frame.payload.info.pld_id.current_bank_1
  :field current_bank_2: ax25_frame.payload.info.pld_id.current_bank_2
  :field gps: ax25_frame.payload.info.pld_id.gps
  :field voltage_3v3: ax25_frame.payload.info.pld_id.voltage_3v3
  :field battery_voltage: ax25_frame.payload.info.pld_id.byttery_voltage
  :field lna_voltage: ax25_frame.payload.info.pld_id.lna_voltage
  :field voltage_5v: ax25_frame.payload.info.pld_id.voltage_5v
  :field gps_voltage: ax25_frame.payload.info.pld_id.gps_voltage
  :field camera_voltage: ax25_frame.payload.info.pld_id.camera_voltage

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
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: info
        type:
          switch-on: '_parent.ax25_header.src_callsign_raw.callsign_ror.callsign'
          cases:
            '"SPACE "': painani_payload_identify
  painani_payload_identify:
    seq:
      - id: pld_id
        type:
          switch-on: _root.framelength
          cases:
            30: painani_beacon_short
            72: painani_beacon_long
  painani_beacon_short:
    seq:
      - id: reserved
        type: u4
      - id: short_internal_temperature
        doc: 'short_internal_temperature * 1 [degC]'
        type: s1
      - id: short_pa_temperature
        type: s1
        doc: 'short_pa_temperature * 1 [degC]'
      - id: short_current_3v3
        type: s2
        doc: 'short_current_3v3 * 3 * 0.000001 [A]'
      - id: short_voltage_3v3
        type: u2
        doc: 'short_voltage_3v3 * 4 * 0.001 [V]'
      - id: short_current_5v
        type: s2
        doc: 'short_current_5v * 62 * 0.000001 [A]'
      - id: short_voltage_5v
        doc: 'short_voltage_5v * 4 * 0.001 [V]'
        type: u2
    instances:
      cu33:
        value: 'short_current_3v3 * 3 * 0.000001'
      v33:
        value: 'short_voltage_3v3 * 4 * 0.001'
      cu5:
        value: 'short_current_5v * 62 * 0.000001'
      v5:
        value: 'short_voltage_5v * 4 * 0.001'
  painani_beacon_long:
    seq:
      - id: id_magic
        contents: [0x3c, 0xc3]
        doc: 'fixed code: 0x3cc3'
      - id: length
        type: u1
        doc: 'length without ID, fixed, 0x33 (DL4PD: 0x35 in real tlm!)'
      - id: antenna
        type: u1
        doc: 'n.a.'
      - id: temp_panel_1
        type: s2
        doc: 'temp_panel_1 * 1 [degC]'
      - id: temp_panel_2
        type: s2
        doc: 'temp_panel_2 * 1 [degC]'
      - id: temp_panel_3
        type: s2
        doc: 'temp_panel_3 * 1 [degC]'
      - id: temp_bank_1
        type: s2
        doc: 'temp_bank_1 * 1 [degC]'
      - id: temp_bank_2
        type: s2
        doc: 'temp_bank_2 * 1 [degC]'
      - id: charge_bank_1
        type: s2
        doc: 'charge_bank_1 * 1 [mA]'
      - id: charge_bank_2
        type: s2
        doc: 'charge_bank_2 * 1 [mA]'
      - id: gyro_x
        type: s2
        doc: 'n.a.'
      - id: gyro_y
        type: s2
        doc: 'n.a.'
      - id: gyro_z
        type: s2
        doc: 'n.a.'
      - id: state
        type: u1
        doc: 'n.a.'
      - id: reboots
        type: u2
        doc: 'reboots * 1 [n]'
      - id: rtc_raw
        type: u1
        repeat: expr
        repeat-expr: 6
        doc: 'n.a.'
      - id: voltage_bank_1
        type: u2
        doc: 'voltage_bank_1 * 1 [mV]'
      - id: voltage_bank_2
        type: u2
        doc: 'voltage_bank_2 * 1 [mV]'
      - id: current_bank_1
        type: s2
        doc: 'current_bank_1 * 1 [mA]'
      - id: current_bank_2
        type: s2
        doc: 'current_bank_2 * 1 [mA]'
      - id: gps
        type: u1
        doc: 'n.a.'
      - id: voltage_3v3
        type: u2
        doc: 'voltage_3v3 * 1 [mV]'
      - id: battery_voltage
        type: u2
        doc: 'battery_voltage * 1 [mV]'
      - id: lna_voltage
        type: u2
        doc: 'lna_voltage * 1 [mV]'
      - id: voltage_5v
        type: u2
        doc: 'voltage_5v * 1 [mV]'
      - id: gps_voltage
        type: u2
        doc: 'gps_voltage * 1 [mV]'
      - id: camera_voltage
        type: u2
        doc: 'camera_voltage * 1 [mV]'
      - id: unparsed
        size-eos: true
        doc: '2 undocumented bytes leftover, see size == 72 vs 70!'
    instances:
      rtc:
        value: >-
          (rtc_raw[0] << 40) |
          (rtc_raw[1] << 32) |
          (rtc_raw[2] << 24) |
          (rtc_raw[3] << 16) |
          (rtc_raw[4] << 8) |
          rtc_raw[5]
