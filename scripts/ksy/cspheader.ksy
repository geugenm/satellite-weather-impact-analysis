---
meta:
  id: cspheader
  title: Generic CSP Header Struct
doc-ref: 'https://en.wikipedia.org/wiki/Cubesat_Space_Protocol'
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
      - id: csp_payload
        size-eos: true
