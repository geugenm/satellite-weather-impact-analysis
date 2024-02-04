---
meta:
  id: aausat4
  title: AAUSAT4 decoder struct
  endian: be
doc-ref: 'https://github.com/aausat/aausat4_beacon_parser/blob/master/beacon.py'

doc: |
  :field data_plus_hmac_length: packet.data_length.data_plus_hmac_length
  :field frame_length: frame_length
  :field csp_hdr_crc: packet.csp_header.crc
  :field csp_hdr_rdp: packet.csp_header.rdp
  :field csp_hdr_xtea: packet.csp_header.xtea
  :field csp_hdr_hmac: packet.csp_header.hmac
  :field csp_hdr_src_port: packet.csp_header.src_port
  :field csp_hdr_dst_port: packet.csp_header.dst_port
  :field csp_hdr_destination: packet.csp_header.destination
  :field csp_hdr_source: packet.csp_header.source
  :field csp_hdr_priority: packet.csp_header.priority
  :field subsystems_valid: packet.data.beacon.valid
  :field eps_boot_count: packet.data.beacon.eps.boot_count
  :field eps_boot_cause: packet.data.beacon.eps.boot_cause
  :field eps_uptime: packet.data.beacon.eps.uptime
  :field eps_rt_clock: packet.data.beacon.eps.rt_clock
  :field eps_ping_status: packet.data.beacon.eps.ping_status
  :field eps_subsystem_selfstatus: packet.data.beacon.eps.subsystem_selfstatus
  :field eps_battery_voltage: packet.data.beacon.eps.battery_voltage
  :field eps_cell_diff: packet.data.beacon.eps.cell_diff
  :field eps_battery_current: packet.data.beacon.eps.battery_current
  :field eps_solar_power: packet.data.beacon.eps.solar_power
  :field eps_temp: packet.data.beacon.eps.temp
  :field eps_pa_temp: packet.data.beacon.eps.pa_temp
  :field eps_main_voltage: packet.data.beacon.eps.main_voltage
  :field com_boot_count: packet.data.beacon.com.boot_count
  :field com_boot_cause: packet.data.beacon.com.boot_cause

seq:
  - id: packet
    type: aausat4_data_t

instances:
  frame_length:
    value: _io.size

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
      - id: beacon
        type: aausat4_beacon_t
        if: _parent.csp_header.dst_port == 10 and _parent.csp_header.destination == 9

  aausat4_data_t:
    seq:
      - id: data_length
        type: aausat4_len_t
        if: _root.frame_length == 92
      - id: csp_header
        type: csp_header_t
      - id: data
        type: csp_data_t
      - id: hmac
        type: aausat4_hmac_t
        if: _root.frame_length == 90 or _root.frame_length == 92

  aausat4_len_t:
    seq:
      - id: data_plus_hmac_length
        type: u2

  aausat4_hmac_t:
    seq:
      - id: hmac
        type: u2

  # The beacon format is as follows:
  #  [ 1 byte | 20 bytes  | 10 bytes | 7 bytes  | 6 bytes  | 20 bytes  | 20 bytes  ]
  #  [ Valid  |    EPS    |    COM   |   ADCS1  |  ADCS2   |   AIS1    |   AIS2    ]
  aausat4_beacon_t:
    seq:
      - id: valid
        type: u1
      - id: eps
        type: eps_t
        size: 20
      - id: com
        type: com_t
        size: 10
      - id: adcs1
        type: adcs1_t
      - id: adcs2
        type: adcs2_t
      - id: ais1
        type: ais1_t
      - id: ais2
        type: ais2_t
  eps_t:
    seq:
      - id: boot_count_raw
        type: u2
      - id: uptime
        type: u4
      - id: rt_clock
        type: u4
      - id: ping_status
        type: u1
      - id: subsystem_selfstatus
        type: u2
      - id: battery_voltage
        type: u1
      - id: cell_diff
        type: s1
      - id: battery_current
        type: s1
      - id: solar_power
        type: u1
      - id: temp
        type: s1
      - id: pa_temp
        type: s1
      - id: main_voltage
        type: s1
    instances:
      boot_count:
        value: 'boot_count_raw & 0x1FFF'
      boot_cause:
        value: '(boot_count_raw & 0xE000) >> 13'
  com_t:
    seq:
      - id: boot_count_raw
        type: u2
    instances:
      boot_count:
        value: 'boot_count_raw & 0x1FFF'
      boot_cause:
        value: '(boot_count_raw & 0xE000) >> 13'
  adcs1_t:
    seq:
      - id: unparsed
        size: 7
  adcs2_t:
    seq:
      - id: unparsed
        size: 6
  ais1_t:
    seq:
      - id: unparsed
        size: 20
  ais2_t:
    seq:
      - id: unparsed
        size: 20
