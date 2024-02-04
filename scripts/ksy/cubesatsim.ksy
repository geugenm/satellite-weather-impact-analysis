---
meta:
  id: cubesatsim
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field data_type: ax25_frame.payload.ax25_info.data_type
  :field channel_1a_val: ax25_frame.payload.ax25_info.payload.channel_1a_val
  :field channel_1b_val: ax25_frame.payload.ax25_info.payload.channel_1b_val
  :field channel_1c_val: ax25_frame.payload.ax25_info.payload.channel_1c_val
  :field channel_1d_val: ax25_frame.payload.ax25_info.payload.channel_1d_val
  :field channel_2a_val: ax25_frame.payload.ax25_info.payload.channel_2a_val
  :field channel_2b_val: ax25_frame.payload.ax25_info.payload.channel_2b_val
  :field channel_2c_val: ax25_frame.payload.ax25_info.payload.channel_2c_val
  :field channel_2d_val: ax25_frame.payload.ax25_info.payload.channel_2d_val
  :field channel_3a_val: ax25_frame.payload.ax25_info.payload.channel_3a_val
  :field channel_3b_val: ax25_frame.payload.ax25_info.payload.channel_3b_val
  :field channel_3c_val: ax25_frame.payload.ax25_info.payload.channel_3c_val
  :field channel_3d_val: ax25_frame.payload.ax25_info.payload.channel_3d_val
  :field channel_4a_val: ax25_frame.payload.ax25_info.payload.channel_4a_val
  :field channel_4b_val: ax25_frame.payload.ax25_info.payload.channel_4b_val
  :field channel_4c_val: ax25_frame.payload.ax25_info.payload.channel_4c_val
  :field channel_4d_val: ax25_frame.payload.ax25_info.payload.channel_4d_val
  :field channel_5a_val: ax25_frame.payload.ax25_info.payload.channel_5a_val
  :field channel_5b_val: ax25_frame.payload.ax25_info.payload.channel_5b_val
  :field channel_5c_val: ax25_frame.payload.ax25_info.payload.channel_5c_val
  :field channel_5d_val: ax25_frame.payload.ax25_info.payload.channel_5d_val
  :field channel_6a_val: ax25_frame.payload.ax25_info.payload.channel_6a_val
  :field channel_6b_val: ax25_frame.payload.ax25_info.payload.channel_6b_val
  :field channel_6c_val: ax25_frame.payload.ax25_info.payload.channel_6c_val
  :field channel_6d_val: ax25_frame.payload.ax25_info.payload.channel_6d_val

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
        size-eos: true
        type: data

  data:
    seq:
      - id: data_type
        type: u2
      - id: payload
        type:
          switch-on: data_type
          cases:
            _: ao_7
            0x6869: ao_7

  ao_7:
    seq:
      - id: ao_7_magic
        contents: ' hi '
      - id: channel_1a_id
        contents: '1'
      - id: channel_1a_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_1a
        size: 1
      - id: channel_1b_id
        contents: '1'
      - id: channel_1b_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_1b
        size: 1
      - id: channel_1c_id
        contents: '1'
      - id: channel_1c_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_1c
        size: 1
      - id: channel_1d_id
        contents: '1'
      - id: channel_1d_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_1d
        size: 1

      - id: channel_2a_id
        contents: '2'
      - id: channel_2a_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_2a
        size: 1
      - id: channel_2b_id
        contents: '2'
      - id: channel_2b_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_2b
        size: 1
      - id: channel_2c_id
        contents: '2'
      - id: channel_2c_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_2c
        size: 1
      - id: channel_2d_id
        contents: '2'
      - id: channel_2d_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_2d
        size: 1

      - id: channel_3a_id
        contents: '3'
      - id: channel_3a_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_3a
        size: 1
      - id: channel_3b_id
        contents: '3'
      - id: channel_3b_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_3b
        size: 1
      - id: channel_3c_id
        contents: '3'
      - id: channel_3c_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_3c
        size: 1
      - id: channel_3d_id
        contents: '3'
      - id: channel_3d_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_3d
        size: 1

      - id: channel_4a_id
        contents: '4'
      - id: channel_4a_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_4a
        size: 1
      - id: channel_4b_id
        contents: '4'
      - id: channel_4b_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_4b
        size: 1
      - id: channel_4c_id
        contents: '4'
      - id: channel_4c_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_4c
        size: 1
      - id: channel_4d_id
        contents: '4'
      - id: channel_4d_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_4d
        size: 1

      - id: channel_5a_id
        contents: '5'
      - id: channel_5a_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_5a
        size: 1
      - id: channel_5b_id
        contents: '5'
      - id: channel_5b_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_5b
        size: 1
      - id: channel_5c_id
        contents: '5'
      - id: channel_5c_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_5c
        size: 1
      - id: channel_5d_id
        contents: '5'
      - id: channel_5d_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_5d
        size: 1

      - id: channel_6a_id
        contents: '6'
      - id: channel_6a_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_6a
        size: 1
      - id: channel_6b_id
        contents: '6'
      - id: channel_6b_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_6b
        size: 1
      - id: channel_6c_id
        contents: '6'
      - id: channel_6c_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_6c
        size: 1
      - id: channel_6d_id
        contents: '6'
      - id: channel_6d_val_raw
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: delim_6d
        size: 1

    instances:
      channel_1a_val:
        value: (channel_1a_val_raw[0] - 0x30) * 10 + (channel_1a_val_raw[1] - 0x30)
        doc: 'value * 29.5 [mA]'
      channel_1b_val:
        value: (channel_1b_val_raw[0] - 0x30) * 10 + (channel_1b_val_raw[1] - 0x30)
        doc: '1970 - (20 * value) [mA]'
      channel_1c_val:
        value: (channel_1c_val_raw[0] - 0x30) * 10 + (channel_1c_val_raw[1] - 0x30)
        doc: '1970 - (20 * value) [mA]'
      channel_1d_val:
        value: (channel_1d_val_raw[0] - 0x30) * 10 + (channel_1d_val_raw[1] - 0x30)
        doc: '1970 - (20 * value) [mA]'

      channel_2a_val:
        value: (channel_2a_val_raw[0] - 0x30) * 10 + (channel_2a_val_raw[1] - 0x30)
        doc: '1970 - (20 * value) [mA]'
      channel_2b_val:
        value: (channel_2b_val_raw[0] - 0x30) * 10 + (channel_2b_val_raw[1] - 0x30)
        doc: '8 * (1 - 0.01 * value)^2 [W]'
      channel_2c_val:
        value: (channel_2c_val_raw[0] - 0x30) * 10 + (channel_2c_val_raw[1] - 0x30)
        doc: '15.16 * value [h]'
      channel_2d_val:
        value: (channel_2d_val_raw[0] - 0x30) * 10 + (channel_2d_val_raw[1] - 0x30)
        doc: '40 * (value - 50) [mA]'

      channel_3a_val:
        value: (channel_3a_val_raw[0] - 0x30) * 10 + (channel_3a_val_raw[1] - 0x30)
        doc: '0.1 * value + 6.4 [V]'
      channel_3b_val:
        value: (channel_3b_val_raw[0] - 0x30) * 10 + (channel_3b_val_raw[1] - 0x30)
        doc: '0.1 * value [V]'
      channel_3c_val:
        value: (channel_3c_val_raw[0] - 0x30) * 10 + (channel_3c_val_raw[1] - 0x30)
        doc: '0.15 * value [V]'
      channel_3d_val:
        value: (channel_3d_val_raw[0] - 0x30) * 10 + (channel_3d_val_raw[1] - 0x30)
        doc: '95.8 - 1.48 * value [C]'

      channel_4a_val:
        value: (channel_4a_val_raw[0] - 0x30) * 10 + (channel_4a_val_raw[1] - 0x30)
        doc: '95.8 - 1.48 * value [C]'
      channel_4b_val:
        value: (channel_4b_val_raw[0] - 0x30) * 10 + (channel_4b_val_raw[1] - 0x30)
        doc: '95.8 - 1.48 * value [C]'
      channel_4c_val:
        value: (channel_4c_val_raw[0] - 0x30) * 10 + (channel_4c_val_raw[1] - 0x30)
        doc: '95.8 - 1.48 * value [C]'
      channel_4d_val:
        value: (channel_4d_val_raw[0] - 0x30) * 10 + (channel_4d_val_raw[1] - 0x30)
        doc: '95.8 - 1.48 * value [C]'

      channel_5a_val:
        value: (channel_5a_val_raw[0] - 0x30) * 10 + (channel_5a_val_raw[1] - 0x30)
        doc: '95.8 - 1.48 * value [C]'
      channel_5b_val:
        value: (channel_5b_val_raw[0] - 0x30) * 10 + (channel_5b_val_raw[1] - 0x30)
        doc: '11.67 * value [mA]'
      channel_5c_val:
        value: (channel_5c_val_raw[0] - 0x30) * 10 + (channel_5c_val_raw[1] - 0x30)
        doc: '95.8 - 1.48 * value [C]'
      channel_5d_val:
        value: (channel_5d_val_raw[0] - 0x30) * 10 + (channel_5d_val_raw[1] - 0x30)
        doc: '11 + 0.82 * value [mA]'

      channel_6a_val:
        value: (channel_6a_val_raw[0] - 0x30) * 10 + (channel_6a_val_raw[1] - 0x30)
        doc: 'value^2 / 1.56 [mA]'
      channel_6b_val:
        value: (channel_6b_val_raw[0] - 0x30) * 10 + (channel_6b_val_raw[1] - 0x30)
        doc: '0.1 * value^2 + 35 [mA]'
      channel_6c_val:
        value: (channel_6c_val_raw[0] - 0x30) * 10 + (channel_6c_val_raw[1] - 0x30)
        doc: '0.041 * value^2 [mA]'
      channel_6d_val:
        value: (channel_6d_val_raw[0] - 0x30) * 10 + (channel_6d_val_raw[1] - 0x30)
        doc: '0.01 * value'
