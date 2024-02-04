---
meta:
  id: connectat11
  title: Plan-SConnecta T1.1  Beacon
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.ax25_header.pid
  :field beacon_id: ax25_frame.beacon.beacon_header.beacon_id
  :field rx_packet_cnt: ax25_frame.beacon.beacon_data.rx_packet_cnt
  :field tmtc_temperature1: ax25_frame.beacon.beacon_data.tmtc_temperature1
  :field tmtc_temperature2: ax25_frame.beacon.beacon_data.tmtc_temperature2
  :field mppt_converter_voltage_1: ax25_frame.beacon.beacon_data.mppt_converter_voltage_1
  :field mppt_converter_voltage_2: ax25_frame.beacon.beacon_data.mppt_converter_voltage_2
  :field mppt_converter_voltage_3: ax25_frame.beacon.beacon_data.mppt_converter_voltage_3
  :field mppt_converter_voltage_4: ax25_frame.beacon.beacon_data.mppt_converter_voltage_4
  :field panel1_current: ax25_frame.beacon.beacon_data.panel1_current
  :field panel3_current: ax25_frame.beacon.beacon_data.panel3_current
  :field panel2_current: ax25_frame.beacon.beacon_data.panel2_current
  :field panel5_current: ax25_frame.beacon.beacon_data.panel5_current
  :field panel6_current: ax25_frame.beacon.beacon_data.panel6_current
  :field panel4_current: ax25_frame.beacon.beacon_data.panel4_current
  :field vbat: ax25_frame.beacon.beacon_data.vbat
  :field eps_temperature1: ax25_frame.beacon.beacon_header.eps_temperature1
  :field eps_temperature2: ax25_frame.beacon.beacon_header.eps_temperature2
  :field eps_temperature3: ax25_frame.beacon.beacon_header.eps_temperature3
  :field eps_temperature4: ax25_frame.beacon.beacon_header.eps_temperature4
  :field obc_unix_time: ax25_frame.beacon.beacon_header.obc_unix_time
  :field obc_boot_time: ax25_frame.beacon.beacon_header.obc_boot_time
  :field obc_boot_count: ax25_frame.beacon.beacon_header.obc_boot_count
  :field panel1_temperature: ax25_frame.beacon.beacon_header.panel1_temperature
  :field panel2_temperature: ax25_frame.beacon.beacon_header.panel2_temperature
  :field panel3_temperature: ax25_frame.beacon.beacon_header.panel3_temperature
  :field panel4_temperature: ax25_frame.beacon.beacon_header.panel4_temperature
  :field panel5_temperature: ax25_frame.beacon.beacon_header.panel5_temperature
  :field panel6_temperature: ax25_frame.beacon.beacon_header.panel6_temperature

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
types:
  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
      - id: beacon
        type: beacon_t

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
      - id: pid
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
        encoding: utf-8
        size: 6
        valid:
          any-of:
            - '"CONT11"'
            - '"PLANS1"'

  ssid_mask:
    seq:
      - id: ssid_mask
        type: u1
    instances:
      ssid:
        value: (ssid_mask & 0x0f) >> 1

  beacon_t:
    seq:
      - id: beacon_header
        type: beacon_header_t
      - id: beacon_data
        type: beacon_data_t
        if: beacon_header.beacon_id == 3
  beacon_header_t:
    seq:
      - id: beacon_preamble
        type: u4
      - id: beacon_preamble1
        type: u1
      - id: beacon_id
        type: u1
      - id: beacon_padding
        type: u8
      - id: beacon_padding1
        type: u2
  beacon_data_t:
    seq:
      - id: rx_packet_cnt
        type: u2
      - id: data0001
        type: u2
      - id: tmtc_temperature1
        type: s1
      - id: tmtc_temperature2
        type: s1
      - id: data0002
        type: u8
      - id: data0003
        type: u4
      - id: data0004
        type: u4
      - id: data0005
        type: u4
      - id: data0006
        type: u4
      - id: data0007
        type: u4
      - id: mppt_converter_voltage_1
        type: u2
      - id: mppt_converter_voltage_2
        type: u2
      - id: mppt_converter_voltage_3
        type: u2
      - id: mppt_converter_voltage_4
        type: u2
      - id: panel1_current
        type: u2
      - id: panel3_current
        type: u2
      - id: panel2_current
        type: u2
      - id: panel5_current
        type: u2
      - id: panel6_current
        type: u2
      - id: panel4_current
        type: u2
      - id: vbat
        type: u2
      - id: data0008
        type: u8
      - id: data0008a
        type: u8
      - id: data0008b
        type: u8
      - id: data0008c
        type: u8
      - id: data0008d
        type: u8
      - id: eps_temperature1
        type: s1
      - id: eps_temperature2
        type: s1
      - id: eps_temperature3
        type: s1
      - id: eps_temperature4
        type: s1
      - id: data0009
        type: u1
      - id: obc_unix_time
        type: u4
      - id: obc_boot_time
        type: u4
      - id: obc_boot_count
        type: u4
      - id: data0010
        type: u8
      - id: data0010a
        type: u8
      - id: data0010b
        type: u1
      - id: panel1_temperature
        type: s1
      - id: panel2_temperature
        type: s1
      - id: panel3_temperature
        type: s1
      - id: panel4_temperature
        type: s1
      - id: panel5_temperature
        type: s1
      - id: panel6_temperature
        type: s1
      - id: data_0011
        type: u8
      - id: data_0011a
        type: u8
      - id: data_0011b
        type: u8
      - id: data_0011c
        type: u8
      - id: data_0011d
        type: u8
      - id: data_0011e
        type: u8
      - id: data_0011f
        type: u8
      - id: data_0011g
        type: u8
      - id: data_0011h
        type: u8
      - id: data_0011i
        type: u8
      - id: data_0011j
        type: u8
      - id: data_0011k
        type: u4
