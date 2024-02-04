---
meta:
  id: roseycubesat1
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field payload_size: ax25_frame.payload.ax25_info.payload_size
  :field payload_to: ax25_frame.payload.ax25_info.payload_to
  :field packet_id: ax25_frame.payload.ax25_info.packet_id
  :field text: ax25_frame.payload.ax25_info.payload.text
  :field timeStamp: ax25_frame.payload.ax25_info.payload.time
  :field bat_v: ax25_frame.payload.ax25_info.payload.bat_v
  :field bat_c: ax25_frame.payload.ax25_info.payload.bat_c
  :field temperature: ax25_frame.payload.ax25_info.payload.temperature
  :field mode: ax25_frame.payload.ax25_info.payload.mode
  :field eps_boot_counter: ax25_frame.payload.ax25_info.payload.eps_boot_counter
  :field command_counter: ax25_frame.payload.ax25_info.payload.command_counter

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
        type:
          switch-on: pid
          cases:
            0xF0: frame
        size-eos: true

  frame:
    seq:
      - id: payload_size
        type: u1
      - id: payload_to
        type: u1
      - id: packet_id
        type: u2
      - id: payload
        type:
          switch-on: packet_id
          cases:
            0xFFFF: periodic_msg

  periodic_msg:
    seq:
      - id: text
        doc: Message
        type: str
        terminator: 0
        eos-error: false
        encoding: UTF-8
        size: 30
      - id: time
        doc: onboard time
        type: u4
      - id: bat_v
        doc: battery voltage
        type: u2
      - id: bat_c
        doc: battery current
        type: s2
      - id: temperature
        doc: temperature
        type: s2
      - id: mode
        doc: mode
        type: u1
      - id: eps_boot_counter
        doc: epsBootCounter
        type: u2
      - id: command_counter
        doc: commandCounter
        type: u2
