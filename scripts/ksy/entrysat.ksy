---
meta:
  id: entrysat
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packet_id: ax25_frame.payload.ax25_info.pus_packet.tm_packet_header.packet_id
  :field packet_seq_ctl: ax25_frame.payload.ax25_info.pus_packet.tm_packet_header.packet_seq_ctl
  :field packet_length: ax25_frame.payload.ax25_info.pus_packet.tm_packet_header.packet_length
  :field service: ax25_frame.payload.ax25_info.pus_packet.tm_packet_header.service
  :field subservice: ax25_frame.payload.ax25_info.pus_packet.tm_packet_header.subservice
  :field clock: ax25_frame.payload.ax25_info.pus_packet.tm_packet_header.clock
  :field sid: ax25_frame.payload.ax25_info.pus_packet.payload.sid
  :field mode: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.mode
  :field eps_vbatt: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.eps_vbatt
  :field eps_batt_vcurrent: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.eps_batt_vcurrent
  :field eps_3v3_current: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.eps_3v3_current
  :field eps_5v_current: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.eps_5v_current
  :field trx_temp: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.trx_temp
  :field eps_temp: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.eps_temp
  :field batt_temp: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.batt_temp
  :field frame_status: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.frame_status
  :field timestamp: ax25_frame.payload.ax25_info.pus_packet.payload.tm_payload.timestamp


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
      - id: pus_packet
        type: pus_packet_t
  pus_packet_t:
    seq:
      - id: timestamp_unused
        type: u4
      - id: tm_packet_header
        type: tm_packet_header_t
      - id: payload
        type: tm_packet_t
  tm_packet_header_t:
    seq:
      - id: packet_id
        type: u2
      - id: packet_seq_ctl
        type: u2
      - id: packet_length
        type: u2
      - id: spare_tm
        type: u1
      - id: service
        type: u1
      - id: subservice
        type: u1
      - id: clock_array
        type: u1
        repeat: expr
        repeat-expr: 5
    instances:
      clock:
        value: >-
          (
          (clock_array[0] * 256 * 256 * 256) +
          (clock_array[1] * 256 * 256) +
          (clock_array[2] * 256) +
          (clock_array[3]) +
          (clock_array[4] / 256.0)
          )
  tm_packet_t:
    seq:
      - id: sid
        type: u1
      - id: tm_payload
        type:
          switch-on: sid
          cases:
            0x06: eps_packet_t
  eps_packet_t:
    seq:
      - id: mode
        type: u1
      - id: eps_vbatt
        type: u1
      - id: eps_batt_vcurrent
        type: u1
      - id: eps_3v3_current
        type: u1
      - id: eps_5v_current
        type: u1
      - id: trx_temp
        type: u1
      - id: eps_temp
        type: u1
      - id: batt_temp
        type: u1
      - id: crc
        type: u2
      - id: frame_status
        type: u1
      - id: timestamp
        type: u4le
