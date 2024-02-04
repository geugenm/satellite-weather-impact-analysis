---
meta:
  id: astrocast
  title: Astrocast beacon decoder
  endian: be
#  doc-ref: http://hb9hslu.ch/wordpress/?page_id=578
#  doc-ref: http://hb9hslu.ch/wordpress/?page_id=305
#  2023-12-02, DL7NDR
doc: |
  :field dest_callsign: ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_header.src_callsign_raw.callsign_ror.callsign
  :field utc_time_of_position_h: gprmc.utc_time_of_position_h
  :field utc_time_of_position_m: gprmc.utc_time_of_position_m
  :field utc_time_of_position_s: gprmc.utc_time_of_position_s
  :field status: gprmc.status
  :field latitude: gprmc.latitude
  :field latitude_n_or_s: gprmc.latitude_n_or_s
  :field longitude: gprmc.longitude
  :field longitude_e_or_w: gprmc.longitude_e_or_w
  :field ground_speed_knots: gprmc.ground_speed_knots
  :field course_over_ground: gprmc.course_over_ground
  :field date_yy: gprmc.date_yy
  :field date_mm: gprmc.date_mm
  :field date_dd: gprmc.date_dd
  :field magnetic_variation: gprmc.magnetic_variation
  :field magnetic_variation_e_or_w: gprmc.magnetic_variation_e_or_w
  :field timestamp_seconds: tlm.timestamp_seconds
  :field voltage_v: tlm.voltage_v
  :field current_ma: tlm.current_ma
  :field temperature_c: tlm.temperature_c
  :field rssi_dbm: tlm.rssi_dbm
  :field afc_hz: tlm.afc_hz
  :field link_settings: tlm.link_settings
  :field transfer_layer_idle_frames: tlm.transfer_layer_idle_frames
  :field downlink_reed_solomon: tlm.downlink_reed_solomon
  :field downlink_randomizer: tlm.downlink_randomizer
  :field downlink_convolutional: tlm.downlink_convolutional
  :field uplink_bch: tlm.uplink_bch
  :field uplink_derandomizer: tlm.uplink_derandomizer

seq:
  - id: ax25_header
    type: ax25_header
  - id: gprmc
    type: gprmc
  - id: tlm
    type: tlm

types:
  ax25_header:
    seq:   
      - id: dest_callsign_raw
        type: callsign_raw
      - id: dest_ssid
        type: u1
      - id: src_callsign_raw
        type: callsign_raw
      - id: src_ssid
        type: u1
      - id: ctl_pid
        type: u2

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

  gprmc:
    seq:
      - id: gprmc_prefix # "$GPRMC"
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: utc_time_of_position_raw # hhmmss.ff
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: status # A = OK, V = warning
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: latitude_str # ddmm.ff
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: latitude_n_or_s
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: longitude_str # dddmm.ff
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: longitude_e_or_w
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: ground_speed_raw # knots
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: course_over_ground_before_dot_raw
        type: str
        encoding: UTF-8
        terminator: 0x2E
      - id: course_over_ground_after_dot_raw
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: date_str # ddmmyy
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: magnetic_variation_before_dot_raw
        type: str
        encoding: UTF-8
        terminator: 0x2E
      - id: magnetic_variation_after_dot_raw
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: magnetic_variation_e_or_w
        type: str
        encoding: UTF-8
        terminator: 0x2A # ="*" note that checksum after "*" is left (not included in telemetry)

    instances:
      utc_time_of_position_h:
        value: utc_time_of_position_raw.substring(0,2).to_i
      utc_time_of_position_m:
        value: utc_time_of_position_raw.substring(2,4).to_i
      utc_time_of_position_ss_before_dot:
        value: utc_time_of_position_raw.substring(4,6).to_i
      utc_time_of_position_ss_after_dot:
        value: utc_time_of_position_raw.substring(7,9).to_i
      utc_time_of_position_s:
        value: utc_time_of_position_ss_after_dot * 0.01 + utc_time_of_position_ss_before_dot
      latitude_deg:
        value: latitude_str.substring(0,2).to_i
      latitude_min_before_dot:
        value: latitude_str.substring(2,4).to_i
      latitude_min_after_dot:
        value: latitude_str.substring(5,7).to_i
      latitude:
        value: ((latitude_min_after_dot * 0.01) + latitude_min_before_dot) / 60 + latitude_deg
      longitude_deg:
        value: longitude_str.substring(0,3).to_i
      longitude_min_before_dot:
        value: longitude_str.substring(3,5).to_i
      longitude_min_after_dot:
        value: longitude_str.substring(6,8).to_i
      longitude:
        value: ((longitude_min_after_dot * 0.01) + longitude_min_before_dot) / 60 + longitude_deg
      ground_speed_knots:
        value: ground_speed_raw.to_i # * 1.852 for kmph
      course_over_ground_before_dot:
        value: course_over_ground_before_dot_raw.to_i
      course_over_ground_after_dot:
        value: course_over_ground_after_dot_raw.to_i
      course_over_ground: # °°°.°
        value: (course_over_ground_after_dot * 0.1) + course_over_ground_before_dot
      date_dd:
        value: date_str.substring(0,2).to_i # extracts from position 0 (left) to 2 (excluding) from string and converts to integer
      date_mm:
        value: date_str.substring(2,4).to_i
      date_yy:
        value: date_str.substring(4,6).to_i + 2000
      magnetic_variation_before_dot:
        value: magnetic_variation_before_dot_raw.to_i
      magnetic_variation_after_dot:
        value: magnetic_variation_after_dot_raw.to_i
      magnetic_variation: # °°°.°
        value: (magnetic_variation_after_dot * 0.1) + magnetic_variation_before_dot

  tlm:
    seq:
      - id: hk_prefix # "$HK"
        type: str
        encoding: UTF-8
        terminator: 0x2C # =","
      - id: skip_0x
        type: u2
      - id: timestamp_raw
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: voltage_before_dot_raw
        type: str
        encoding: UTF-8
        terminator: 0x2E
      - id: voltage_after_dot_raw
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: current_raw
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: temperature_raw
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: rssi_raw
        type: str
        encoding: utf8
        terminator: 0x2C
      - id: afc_raw
        type: str
        encoding: UTF-8
        terminator: 0x2C
      - id: skipping_0x
        type: u2
      - id: link_settings_raw
        size: 2
        type: str
        encoding: UTF-8

    instances:
      timestamp_ticks:
        value: timestamp_raw.to_i(16)
      timestamp_seconds: # starting from 2016-01-01 00:00:00
        value: timestamp_ticks / 65536
      voltage_before_dot:
        value: voltage_before_dot_raw.to_i
      voltage_after_dot:
        value: voltage_after_dot_raw.to_i
      voltage_v:
        value: (voltage_after_dot * 0.001) + voltage_before_dot
      current_ma:
        value: current_raw.to_i
      temperature_c:
        value: temperature_raw.to_i
      rssi_dbm:
        value: rssi_raw.to_i
      afc_hz:
        value: afc_raw.to_i
      link_settings:
        value: link_settings_raw.to_i(16) # (16) converts from string to HEX
      transfer_layer_idle_frames:
        value: '((link_settings & 0b10000000) >> 7) == 1 ? true : false' # checks bit 7 and returns true if value 1
      downlink_reed_solomon:
        value: '((link_settings & 0b01000000) >> 6) == 1 ? true : false'
      downlink_randomizer:
        value: '((link_settings & 0b00100000) >> 5) == 1 ? true : false'
      downlink_convolutional:
        value: '((link_settings & 0b00010000) >> 4) == 1 ? true : false'
      uplink_bch:
        value: '((link_settings & 0b00001000) >> 3) == 1 ? true : false'
      uplink_derandomizer:
        value: '((link_settings & 0b00000100) >> 2) == 1 ? true : false'
# 0b765432xx (xx = no meaning)
