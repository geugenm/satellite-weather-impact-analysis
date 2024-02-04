---
meta:
  id: selfiesat
  endian: be
doc: |
  :field crc: csp_header.crc
  :field rdp: csp_header.rdp
  :field xtea: csp_header.xtea
  :field hmac: csp_header.hmac
  :field reserved: csp_header.reserved
  :field src_port: csp_header.src_port
  :field dst_port: csp_header.dst_port
  :field destination: csp_header.destination
  :field source: csp_header.source
  :field priority: csp_header.priority
  :field packet_length: csp_data.packet_length
  :field alarm_mask: csp_data.csp_payload.alarm_mask
  :field eps_counter_boot: csp_data.csp_payload.eps_counter_boot
  :field eps_vbatt: csp_data.csp_payload.eps_vbatt
  :field eps_outputmask: csp_data.csp_payload.eps_outputmask
  :field id: csp_data.csp_payload.id
  :field fsm_states: csp_data.csp_payload.fsm_states
  :field callsign: csp_data.csp_payload.callsign

seq:
  - id: csp_header
    type: csp_header_t
  - id: csp_data
    type: csp_data_t
types:
  csp_header_t:
    seq:
      - id: csp_flags
        type: u1
        repeat: expr
        repeat-expr: 4
    instances:
      crc:
        value: >-
          (
          (csp_flags[0])
          ) & 0x1
      rdp:
        value: >-
          (
          (
          (csp_flags[0])
          ) >> 1
          ) & 0x1
      xtea:
        value: >-
          (
          (
          (csp_flags[0])
          ) >> 2
          ) & 0x1
      hmac:
        value: >-
          (
          (
          (csp_flags[0])
          ) >> 3
          ) & 0x1
      reserved:
        value: >-
          (
          (csp_flags[0])
          ) >> 4
      src_port:
        value: >-
          (
          (csp_flags[1])
          ) & 0x3F
      dst_port:
        value: >-
          (
          (
          (csp_flags[1]) |
          (csp_flags[2] << 8)
          ) >> 6
          ) & 0x3F
      destination:
        value: >-
          (
          (
          (csp_flags[2]) |
          (csp_flags[3] << 8)
          ) >> 4
          ) & 0x1F
      source:
        value: >-
          (
          (
          (csp_flags[3])
          ) >> 1
          ) & 0x1F
      priority:
        value: >-
          (
          (csp_flags[3])
          ) >> 6
  csp_data_t:
    seq:
      - id: packet_length
        type: u2
        valid:
          any-of:
            - 224
      - id: pad_0
        size: 8
      - id: csp_payload
        type: selfiesat_telemetry_t
        size-eos: true
  selfiesat_telemetry_t:
    doc: |
      struct bcn_normal {
        unsigned int alarm_mask;            // Alarms from housekeeping
        unsigned short eps_counter_boot;    // EPS boot count
        unsigned short eps_vbatt;           // Voltage of EPS battery
        unsigned char eps_outputmask;       // Whether channels are on or off
        unsigned char id;                   // Identifier for beacons
        unsigned char fsm_states;           // obc_main's internal fsm states
      };
    seq:
      - id: alarm_mask
        type: u4
      - id: eps_counter_boot
        type: u2
      - id: eps_vbatt
        type: u2
      - id: eps_outputmask
        type: u1
      - id: id
        type: u1
      - id: fsm_states
        type: u1
      - id: pad_1
        size: 1
      - id: callsign
        type: strz
        size: 9
        encoding: ASCII
        valid:
          any-of:
            - '"SelfieSat"'
