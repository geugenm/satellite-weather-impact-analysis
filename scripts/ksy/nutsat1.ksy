---
meta:
  id: nutsat1
  title: NUTSat-1 beacon decoder
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field identifier: ax25_frame.payload.ax25_info.tlm.identifier
  :field eps_pv1: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_pv1
  :field eps_pv2: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_pv2
  :field eps_pv3: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_pv3
  :field eps_pv4: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_pv4
  :field eps_battery: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_battery
  :field eps_power33: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_power33
  :field eps_power5: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_power5
  :field eps_vgps: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_vgps
  :field eps_sw: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_sw
  :field eps_t_bat: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_t_bat
  :field eps_day: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_day
  :field eps_vmtq: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_vmtq
  :field eps_vadsb: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_vadsb
  :field eps_vuhf: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_vuhf
  :field eps_t_venv: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_t_venv
  :field eps_hour: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_hour
  :field eps_minute: ax25_frame.payload.ax25_info.tlm.data.eps_str.eps_minute
  :field cdhs_sun1: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_sun1
  :field cdhs_sun2: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_sun2
  :field cdhs_sun3: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_sun3
  :field cdhs_acc_x: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_acc_x
  :field cdhs_acc_y: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_acc_y
  :field cdhs_acc_z: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_acc_z
  :field cdhs_gyro_x: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_gyro_x
  :field cdhs_gyro_y: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_gyro_y
  :field cdhs_gyro_z: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_gyro_z
  :field cdhs_temp: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_temp
  :field cdhs_mx: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_mx
  :field cdhs_my: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_my
  :field cdhs_mz: ax25_frame.payload.ax25_info.tlm.data.obc_str.cdhs_mz
  :field monitor: ax25_frame.payload.ax25_info.tlm.monitor
  :field message: ax25_frame.payload.ax25_info.beacon.message
  :field rx_volt: ax25_frame.payload.ax25_info.beacon.rx_volt
  :field tx_volt: ax25_frame.payload.ax25_info.beacon.tx_volt
  :field ttc_temp: ax25_frame.payload.ax25_info.beacon.ttc_temp
  :field monitor: ax25_frame.payload.ax25_info.beacon.monitor
seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: "https://www.tapr.org/pub_ax25.html"
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
        doc: "Repeater flag is set!"
      - id: ctl
        type: u1
  repeater:
    seq:
      - id: rpt_instance
        type: repeaters
        repeat: until
        repeat-until: ((_.rpt_ssid_raw.ssid_mask & 0x1) == 0x1)
        doc: "Repeat until no repeater flag is set!"
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
            - "'BN0UT '"
            - "'APX1S '"
            - "'WIDE1 '"
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
        type: beacon_t
        size-eos: true
  beacon_t:
    seq:
      - id: tlm
        type: header_t
        if: is_beacon == false
      - id: beacon
        type: ascii_beacon_t
        size-eos: true
        if: is_beacon
    instances:
      is_beacon:
        value: >-
          beacon_id == 0x52
            ? true
            : false
      beacon_id:
        type: u1
        pos: 1
  header_t:
    seq:
      - id: identifier
        type: str
        encoding: ASCII
        terminator: 0x3a
      - id: data
        type:
          switch-on: identifier
          cases:
            "'>EPS'": eps_str_t
            "'>OBC'": obc_str_t
            "'>ADSB'": unknown_t
            "'>GPS1'": unknown_t
            "'>GPS2'": unknown_t
            "'>GPS3'": unknown_t
            "'>MTQSD'": unknown_t
            _: unknown_t
    instances:
      monitor:
        type: str
        encoding: ASCII
        size-eos: true
        pos: 0
  unknown_t:
    seq:
      - id: content
        size-eos: true
  ascii_beacon_t:
    seq:
      - id: identifier
        type: str
        encoding: ASCII
        size: 2
        valid:
          any-of:
            - "'>R'"
      - id: rx_volt_str
        type: str
        encoding: ASCII
        size: 2
      - id: pad0
        size: 1
      - id: rx_volt_frac_str
        type: str
        encoding: ASCII
        size: 1
      - id: pad1
        size: 2
      - id: tx_volt_str
        type: str
        encoding: ASCII
        size: 1
      - id: pad2
        size: 1
      - id: tx_volt_frac_str
        type: str
        encoding: ASCII
        size: 1
      - id: pad3
        size: 1
      - id: ttc_temp_str
        type: str
        encoding: ASCII
        size: 2
      - id: pad4
        size: 1
      - id: ttc_temp_frac_str
        type: str
        encoding: ASCII
        size: 1
      - id: message
        type: str
        encoding: ASCII
        size-eos: true
    instances:
      rx_volt:
        value: (rx_volt_str.to_i + rx_volt_frac_str.to_i / 10.0)
      tx_volt:
        value: (tx_volt_str.to_i + tx_volt_frac_str.to_i / 10.0)
      ttc_temp:
        value: >-
          (ttc_temp_str.to_i +
            (ttc_temp_is_neg
              ? (-1 * ttc_temp_frac_str.to_i / 10.0)
              : (ttc_temp_frac_str.to_i / 10.0)
            )
          )
      ttc_temp_sign:
        type: u1
        pos: 12
      ttc_temp_is_neg:
        value: >-
          ttc_temp_sign == 0x2d
            ? true
            : false
      monitor:
        type: str
        encoding: ASCII
        size-eos: true
        pos: 0
  obc_str_t:
    seq:
      - id: obc_str
        process: satnogsdecoders.process.unhexl
        type: obc_t
        size: 52
        doc: '>OBC:FED6FE1AFFEB020800B8FE48F93AF966025DED500066FCBC0092\r\n'
  obc_t:
    seq:
      - id: cdhs_sun1
        type: s2
        doc: 'x * 0.1 [n]'
      - id: cdhs_sun2
        type: s2
        doc: 'x * 0.1 [n]'
      - id: cdhs_sun3
        type: s2
        doc: 'x * 0.1 [n]'
      - id: cdhs_acc_x
        type: s2
        doc: 'x * 0.000061035156 [n]'
      - id: cdhs_acc_y
        type: s2
        doc: 'x * 0.000061035156 [n]'
      - id: cdhs_acc_z
        type: s2
        doc: 'x * 0.000061035156 [n]'
      - id: cdhs_gyro_x
        type: s2
        doc: 'x * 0.007633587786 + 8 [n]'
      - id: cdhs_gyro_y
        type: s2
        doc: 'x * 0.007633587786 [n]'
      - id: cdhs_gyro_z
        type: s2
        doc: 'x * 0.007633587786 [n]'
      - id: cdhs_temp
        type: s2
        doc: 'x *0.0025 + 18.5 [degC]'
      - id: cdhs_mx
        type: s2
        doc: 'x * 0.00092 [G]'
      - id: cdhs_my
        type: s2
        doc: 'x * 0.00092 [G]'
      - id: cdhs_mz
        type: s2
        doc: 'x * 0.00092 [G]'
  eps_str_t:
    seq:
      - id: eps_str
        process: satnogsdecoders.process.unhexl
        type: eps_t
        size: 68
        doc: '>EPS:003B0063000000670296014F02030042319CFF660C80000201FD0201FF9001F403E8\r\n'
  eps_t:
    seq:
      - id: eps_pv1
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_pv2
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_pv3
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_pv4
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_battery
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_power33
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_power5
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_vgps
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_sw
        type: u2
        doc: 'x * 0.01 [n]'
      - id: eps_t_bat
        type: s2
        doc: 'x * 0.01 [degC]'
      - id: eps_day
        type: u2
        doc: 'x * 0.01 [n]'
      - id: eps_vmtq
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_vadsb
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_vuhf
        type: u2
        doc: 'x * 0.01 [V]'
      - id: eps_t_venv
        type: s2
        doc: 'x * 0.01 [degC]'
      - id: eps_hour
        type: u2
        doc: 'x * 0.01 [n]'
      - id: eps_minute
        type: u2
        doc: 'x * 0.01 [n]'
