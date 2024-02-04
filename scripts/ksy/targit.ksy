---
meta:
  id: targit
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field timestamp: ax25_frame.payload.data_payload.timestamp
  :field mode: ax25_frame.payload.data_payload.mode
  :field vbatt: ax25_frame.payload.data_payload.vbatt
  :field cursun: ax25_frame.payload.data_payload.cursun
  :field cursys: ax25_frame.payload.data_payload.cursys
  :field bootcause: ax25_frame.payload.data_payload.bootcause

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
            - '"T4RG1T"'
            - '"K4NAQF"'
            - '"W4AQL "'

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
      - id: data_payload
        type: targit_payload

  targit_payload:
    seq:
      - id: junk
        type: u4
      - id: timestamp
        type: u4
        doc: 'Spacecraft time stamp'
      - id: mode
        type: u1
        doc: 'Spacecraft current mode'
      - id: vbatt
        type: u2
        doc: 'The current spacecraft voltage'
      - id: cursun
        type: u2
        doc: 'Spacecraft current in from sun'
      - id: cursys
        type: u2
        doc: 'Spacecraft current out to sys'
      - id: bootcause
        type: u1
        doc: 'Spacecraft Bootcause'
