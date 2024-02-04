---
meta:
  id: chomptt
  endian: le
doc-ref: 'https://pssl.mae.ufl.edu/#chomptt/page/beacondecode'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field identifier: ax25_frame.payload.ax25_info.identifier
  :field msg_num: ax25_frame.payload.ax25_info.chomptb85.msg_num
  :field time: ax25_frame.payload.ax25_info.chomptb85.time
  :field mode: ax25_frame.payload.ax25_info.chomptb85.mode
  :field idle_timer: ax25_frame.payload.ax25_info.chomptb85.idle_timer
  :field vbat: ax25_frame.payload.ax25_info.chomptb85.vbat
  :field spc_xp: ax25_frame.payload.ax25_info.chomptb85.spc_xp
  :field spc_xn: ax25_frame.payload.ax25_info.chomptb85.spc_xn
  :field spc_yp: ax25_frame.payload.ax25_info.chomptb85.spc_yp
  :field spc_zp: ax25_frame.payload.ax25_info.chomptb85.spc_zp
  :field spc_zn: ax25_frame.payload.ax25_info.chomptb85.spc_zn
  :field temp_b1: ax25_frame.payload.ax25_info.chomptb85.temp_b1
  :field temp_b3: ax25_frame.payload.ax25_info.chomptb85.temp_b3
  :field temp_b4: ax25_frame.payload.ax25_info.chomptb85.temp_b4
  :field temp_b5: ax25_frame.payload.ax25_info.chomptb85.temp_b5
  :field temp_b6: ax25_frame.payload.ax25_info.chomptb85.temp_b6
  :field temp_b9: ax25_frame.payload.ax25_info.chomptb85.temp_b9
  :field temp_xn: ax25_frame.payload.ax25_info.chomptb85.temp_xn
  :field temp_xp: ax25_frame.payload.ax25_info.chomptb85.temp_xp
  :field temp_yp: ax25_frame.payload.ax25_info.chomptb85.temp_yp
  :field temp_zn: ax25_frame.payload.ax25_info.chomptb85.temp_zn
  :field temp_zp: ax25_frame.payload.ax25_info.chomptb85.temp_zp
  :field v_bat: ax25_frame.payload.ax25_info.chomptb85.v_bat
  :field i_dog: ax25_frame.payload.ax25_info.chomptb85.i_dog
  :field i_sat: ax25_frame.payload.ax25_info.chomptb85.i_sat
  :field i_temp: ax25_frame.payload.ax25_info.chomptb85.i_temp
  :field i_gps_arduino: ax25_frame.payload.ax25_info.chomptb85.i_gps_arduino
  :field i_gps_novatel: ax25_frame.payload.ax25_info.chomptb85.i_gps_novatel
  :field i_sten: ax25_frame.payload.ax25_info.chomptb85.i_sten
  :field i_acs: ax25_frame.payload.ax25_info.chomptb85.i_acs
  :field i_rout: ax25_frame.payload.ax25_info.chomptb85.i_rout
  :field i_lit: ax25_frame.payload.ax25_info.chomptb85.i_lit
  :field mag_x: ax25_frame.payload.ax25_info.chomptb85.mag_x
  :field mag_y: ax25_frame.payload.ax25_info.chomptb85.mag_y
  :field mag_z: ax25_frame.payload.ax25_info.chomptb85.mag_z
  :field identifier: ax25_frame.payload.ax25_info.identifier
  :field flags: ax25_frame.payload.ax25_info.optib85.flags
  :field sup_t1: ax25_frame.payload.ax25_info.optib85.sup_t1
  :field sup_t2: ax25_frame.payload.ax25_info.optib85.sup_t2
  :field sup_vbat: ax25_frame.payload.ax25_info.optib85.sup_vbat
  :field ch1_flags: ax25_frame.payload.ax25_info.optib85.ch1_flags
  :field ch1_temp: ax25_frame.payload.ax25_info.optib85.ch1_temp
  :field csac1_temp: ax25_frame.payload.ax25_info.optib85.csac1_temp
  :field ch1_current: ax25_frame.payload.ax25_info.optib85.ch1_current
  :field ch2_flags: ax25_frame.payload.ax25_info.optib85.ch2_flags
  :field ch2_temp: ax25_frame.payload.ax25_info.optib85.ch2_temp
  :field csac2_temp: ax25_frame.payload.ax25_info.optib85.csac2_temp
  :field ch2_current: ax25_frame.payload.ax25_info.optib85.ch2_current
  :field count: ax25_frame.payload.ax25_info.optib85.count
  :field overflow: ax25_frame.payload.ax25_info.optib85.overflow

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
          switch-on: _root.framelength
          cases:
            69: optib85_t
            128: chomptb85_t
        size-eos: true
  optib85_t:
    seq:
      - id: identifier
        type: str
        encoding: ASCII
        size: 4
      - id: sod
        size: 2
      - id: optib85
        # process: b85decode
        process: satnogsdecoders.process.b85decode
        size: 38
        type: opti_t
      - id: eod
        size: 2
  chomptb85_t:
    seq:
      - id: identifier
        type: str
        encoding: ASCII
        terminator: 0x5c
      - id: sod
        size: 2
      - id: chomptb85
        # process: b85decode
        process: satnogsdecoders.process.b85decode
        size: 94
        type: chompt_t
      - id: eod
        size: 2
  chompt_t:
    seq:
      - id: msg_num
        type: u2
      - id: time
        type: u4
      - id: mode
        type: u1
      - id: idle_timer
        type: u2
      - id: vbat
        type: u2
      - id: spc_xp
        type: s2
      - id: spc_xn
        type: s2
      - id: spc_yp
        type: s2
      - id: spc_zp
        type: s2
      - id: spc_zn
        type: s2
      - id: temp_b1
        type: u2
      - id: temp_b3
        type: u2
      - id: temp_b4
        type: u2
      - id: temp_b5
        type: u2
      - id: temp_b6
        type: u2
      - id: temp_b9
        type: u2
      - id: temp_xn
        type: s2
      - id: temp_xp
        type: s2
      - id: temp_yp
        type: s2
      - id: temp_zn
        type: s2
      - id: temp_zp
        type: s2
      - id: v_bat
        type: s2
      - id: i_dog
        type: s2
      - id: i_sat
        type: s2
      - id: i_temp
        type: s2
      - id: i_gps_arduino
        type: s2
      - id: i_gps_novatel
        type: s2
      - id: i_sten
        type: s2
      - id: i_acs
        type: s2
      - id: i_rout
        type: s2
      - id: i_lit
        type: s2
      - id: mag_x
        type: f4
      - id: mag_y
        type: f4
      - id: mag_z
        type: f4
  opti_t:
    seq:
      - id: flags
        type: u2
      - id: sup_t1
        type: s2
      - id: sup_t2
        type: s2
      - id: sup_vbat
        type: s2
      - id: ch1_flags
        type: u2
      - id: ch1_temp
        type: s2
      - id: csac1_temp
        type: s2
      - id: ch1_current
        type: s2
      - id: ch2_flags
        type: u2
      - id: ch2_temp
        type: s2
      - id: csac2_temp
        type: s2
      - id: ch2_current
        type: s2
      - id: count
        type: u2
      - id: overflow
        type: u4
instances:
  rpt1_callsign:
    value: 'ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign'
  framelength:
    value: _io.size
