---
meta:
  id: azaadisat2
  title: AzaadiSAT-2 beacon and store-and-forward message decoder
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field call_sign: ax25_frame.payload.ax25_info.header.call_sign
  :field frame_number: ax25_frame.payload.ax25_info.header.frame_number
  :field message_type: ax25_frame.payload.ax25_info.header.message_type
  :field transmitted_on: ax25_frame.payload.ax25_info.header.transmitted_on
  :field boot_counter: ax25_frame.payload.ax25_info.data.boot_counter
  :field deployment_status: ax25_frame.payload.ax25_info.data.deployment_status
  :field arm_deployment_percentage: ax25_frame.payload.ax25_info.data.arm_deployment_percentage
  :field expansion_deployment_percentage: ax25_frame.payload.ax25_info.data.expansion_deployment_percentage
  :field obc_temperature: ax25_frame.payload.ax25_info.data.obc_temperature
  :field bus_voltage: ax25_frame.payload.ax25_info.data.bus_voltage
  :field bus_current: ax25_frame.payload.ax25_info.data.bus_current
  :field battery_temperature: ax25_frame.payload.ax25_info.data.battery_temperature
  :field radiation: ax25_frame.payload.ax25_info.data.radiation
  :field checksum: ax25_frame.payload.ax25_info.data.checksum
  :field message_slot: ax25_frame.payload.ax25_info.data.message_slot
  :field size: ax25_frame.payload.ax25_info.data.size
  :field message: ax25_frame.payload.ax25_info.data.message
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
            - "'SKITRC'"
            - "'AZDSAT'"
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
        type: payload_t
        size-eos: true
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type: payload_t
        size-eos: true
  payload_t:
    seq:
      - id: header
        type: header_t
      - id: data
        type:
          switch-on: header.message_type
          cases:
            1: satellite_info_t
            2: sf_message_t
  header_t:
    seq:
      - id: call_sign
        type: str
        encoding: ASCII
        size: 6
      - id: frame_number
        type: u1
      - id: message_type
        type: u1
      - id: transmitted_on
        type: u1
  satellite_info_t:
    seq:
      - id: boot_counter
        type: u2
      - id: deployment_status
        type: u1
      - id: arm_deployment_percentage
        type: u1
      - id: expansion_deployment_percentage
        type: u1
      - id: obc_temperature
        type: f4
      - id: bus_voltage
        type: f4
      - id: bus_current
        type: f4
      - id: battery_temperature
        type: f4
      - id: radiation
        type: f4
      - id: checksum
        type: u1
  sf_message_t:
    seq:
      - id: message_slot
        type: u1
      - id: size
        type: u1
      - id: message
        type: str
        encoding: ASCII
        size: size
      - id: checksum
        type: u1
