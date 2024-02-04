---
meta:
  id: oresat0
  title: ORESAT0 Decoder Struct
  endian: le

doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field aprs_packet_data_type_identifier: ax25_frame.payload.ax25_info.aprs_packet_data_type_identifier
  :field aprs_packet_revision: ax25_frame.payload.ax25_info.aprs_packet_revision
  :field aprs_packet_satellite_id: ax25_frame.payload.ax25_info.aprs_packet_satellite_id
  :field c3_m4_oresat0_state: ax25_frame.payload.ax25_info.c3_m4_oresat0_state
  :field c3_m4_uptime: ax25_frame.payload.ax25_info.c3_m4_uptime
  :field c3_rtc_time: ax25_frame.payload.ax25_info.c3_rtc_time
  :field c3_wdt_num_power_cycles: ax25_frame.payload.ax25_info.c3_wdt_num_power_cycles
  :field c3_emmc_percent_full: ax25_frame.payload.ax25_info.c3_emmc_percent_full
  :field c3_l_rx_bytes_received: ax25_frame.payload.ax25_info.c3_l_rx_bytes_received
  :field c3_l_rx_valid_packets: ax25_frame.payload.ax25_info.c3_l_rx_valid_packets
  :field c3_l_rx_rssi: ax25_frame.payload.ax25_info.c3_l_rx_rssi
  :field c3_uhf_rx_bytes_received: ax25_frame.payload.ax25_info.c3_uhf_rx_bytes_received
  :field c3_uhf_rx_valid_packets: ax25_frame.payload.ax25_info.c3_uhf_rx_valid_packets
  :field c3_uhf_rx_rssi: ax25_frame.payload.ax25_info.c3_uhf_rx_rssi
  :field c3_fw_bank_current_and_next_bank: ax25_frame.payload.ax25_info.c3_fw_bank_current_and_next_bank
  :field c3_l_rx_sequence_number: ax25_frame.payload.ax25_info.c3_l_rx_sequence_number
  :field c3_l_rx_rejected_packets: ax25_frame.payload.ax25_info.c3_l_rx_rejected_packets
  :field battery_pack_1_vbatt: ax25_frame.payload.ax25_info.battery_pack_1_vbatt
  :field battery_pack_1_vcell: ax25_frame.payload.ax25_info.battery_pack_1_vcell
  :field battery_pack_1_vcell_max: ax25_frame.payload.ax25_info.battery_pack_1_vcell_max
  :field battery_pack_1_vcell_min: ax25_frame.payload.ax25_info.battery_pack_1_vcell_min
  :field battery_pack_1_vcell_1: ax25_frame.payload.ax25_info.battery_pack_1_vcell_1
  :field battery_pack_1_vcell_2: ax25_frame.payload.ax25_info.battery_pack_1_vcell_2
  :field battery_pack_1_vcell_avg: ax25_frame.payload.ax25_info.battery_pack_1_vcell_avg
  :field battery_pack_1_temperature: ax25_frame.payload.ax25_info.battery_pack_1_temperature
  :field battery_pack_1_temperature_avg: ax25_frame.payload.ax25_info.battery_pack_1_temperature_avg
  :field battery_pack_1_temperature_max: ax25_frame.payload.ax25_info.battery_pack_1_temperature_max
  :field battery_pack_1_temperature_min: ax25_frame.payload.ax25_info.battery_pack_1_temperature_min
  :field battery_pack_1_current: ax25_frame.payload.ax25_info.battery_pack_1_current
  :field battery_pack_1_current_avg: ax25_frame.payload.ax25_info.battery_pack_1_current_avg
  :field battery_pack_1_current_max: ax25_frame.payload.ax25_info.battery_pack_1_current_max
  :field battery_pack_1_current_min: ax25_frame.payload.ax25_info.battery_pack_1_current_min
  :field battery_pack_1_state: ax25_frame.payload.ax25_info.battery_pack_1_state
  :field battery_pack_1_reported_state_of_charge: ax25_frame.payload.ax25_info.battery_pack_1_reported_state_of_charge
  :field battery_pack_1_full_capacity: ax25_frame.payload.ax25_info.battery_pack_1_full_capacity
  :field battery_pack_1_reported_capacity: ax25_frame.payload.ax25_info.battery_pack_1_reported_capacity
  :field battery_pack_2_vbatt: ax25_frame.payload.ax25_info.battery_pack_2_vbatt
  :field battery_pack_2_vcell: ax25_frame.payload.ax25_info.battery_pack_2_vcell
  :field battery_pack_2_vcell_max: ax25_frame.payload.ax25_info.battery_pack_2_vcell_max
  :field battery_pack_2_vcell_min: ax25_frame.payload.ax25_info.battery_pack_2_vcell_min
  :field battery_pack_2_vcell_1: ax25_frame.payload.ax25_info.battery_pack_2_vcell_1
  :field battery_pack_2_vcell_2: ax25_frame.payload.ax25_info.battery_pack_2_vcell_2
  :field battery_pack_2_vcell_avg: ax25_frame.payload.ax25_info.battery_pack_2_vcell_avg
  :field battery_pack_2_temperature: ax25_frame.payload.ax25_info.battery_pack_2_temperature
  :field battery_pack_2_temperature_avg: ax25_frame.payload.ax25_info.battery_pack_2_temperature_avg
  :field battery_pack_2_temperature_max: ax25_frame.payload.ax25_info.battery_pack_2_temperature_max
  :field battery_pack_2_temperature_min: ax25_frame.payload.ax25_info.battery_pack_2_temperature_min
  :field battery_pack_2_current: ax25_frame.payload.ax25_info.battery_pack_2_current
  :field battery_pack_2_current_avg: ax25_frame.payload.ax25_info.battery_pack_2_current_avg
  :field battery_pack_2_current_max: ax25_frame.payload.ax25_info.battery_pack_2_current_max
  :field battery_pack_2_current_min: ax25_frame.payload.ax25_info.battery_pack_2_current_min
  :field battery_pack_2_state: ax25_frame.payload.ax25_info.battery_pack_2_state
  :field battery_pack_2_reported_state_of_charge: ax25_frame.payload.ax25_info.battery_pack_2_reported_state_of_charge
  :field battery_pack_2_full_capacity: ax25_frame.payload.ax25_info.battery_pack_2_full_capacity
  :field battery_pack_2_reported_capacity: ax25_frame.payload.ax25_info.battery_pack_2_reported_capacity
  :field solar_minus_x_voltage_avg: ax25_frame.payload.ax25_info.solar_minus_x_voltage_avg
  :field solar_minus_x_current_avg: ax25_frame.payload.ax25_info.solar_minus_x_current_avg
  :field solar_minus_x_power_avg: ax25_frame.payload.ax25_info.solar_minus_x_power_avg
  :field solar_minus_x_voltage_max: ax25_frame.payload.ax25_info.solar_minus_x_voltage_max
  :field solar_minus_x_current_max: ax25_frame.payload.ax25_info.solar_minus_x_current_max
  :field solar_minus_x_power_max: ax25_frame.payload.ax25_info.solar_minus_x_power_max
  :field solar_minus_x_energy: ax25_frame.payload.ax25_info.solar_minus_x_energy
  :field solar_minus_y_voltage_avg: ax25_frame.payload.ax25_info.solar_minus_y_voltage_avg
  :field solar_minus_y_current_avg: ax25_frame.payload.ax25_info.solar_minus_y_current_avg
  :field solar_minus_y_power_avg: ax25_frame.payload.ax25_info.solar_minus_y_power_avg
  :field solar_minus_y_voltage_max: ax25_frame.payload.ax25_info.solar_minus_y_voltage_max
  :field solar_minus_y_current_max: ax25_frame.payload.ax25_info.solar_minus_y_current_max
  :field solar_minus_y_power_max: ax25_frame.payload.ax25_info.solar_minus_y_power_max
  :field solar_minus_y_energy: ax25_frame.payload.ax25_info.solar_minus_y_energy
  :field solar_plus_x_voltage_avg: ax25_frame.payload.ax25_info.solar_plus_x_voltage_avg
  :field solar_plus_x_current_avg: ax25_frame.payload.ax25_info.solar_plus_x_current_avg
  :field solar_plus_x_power_avg: ax25_frame.payload.ax25_info.solar_plus_x_power_avg
  :field solar_plus_x_voltage_max: ax25_frame.payload.ax25_info.solar_plus_x_voltage_max
  :field solar_plus_x_current_max: ax25_frame.payload.ax25_info.solar_plus_x_current_max
  :field solar_plus_x_power_max: ax25_frame.payload.ax25_info.solar_plus_x_power_max
  :field solar_plus_x_energy: ax25_frame.payload.ax25_info.solar_plus_x_energy
  :field solar_plus_y_voltage_avg: ax25_frame.payload.ax25_info.solar_plus_y_voltage_avg
  :field solar_plus_y_current_avg: ax25_frame.payload.ax25_info.solar_plus_y_current_avg
  :field solar_plus_y_power_avg: ax25_frame.payload.ax25_info.solar_plus_y_power_avg
  :field solar_plus_y_voltage_max: ax25_frame.payload.ax25_info.solar_plus_y_voltage_max
  :field solar_plus_y_current_max: ax25_frame.payload.ax25_info.solar_plus_y_current_max
  :field solar_plus_y_power_max: ax25_frame.payload.ax25_info.solar_plus_y_power_max
  :field solar_plus_y_energy: ax25_frame.payload.ax25_info.solar_plus_y_energy
  :field star_tracker_emmc_capacity: ax25_frame.payload.ax25_info.star_tracker_emmc_capacity
  :field star_tracker_readable_files: ax25_frame.payload.ax25_info.star_tracker_readable_files
  :field star_tracker_updater_status: ax25_frame.payload.ax25_info.star_tracker_updater_status
  :field star_tracker_updates_cached: ax25_frame.payload.ax25_info.star_tracker_updates_cached
  :field star_tracker_right_ascension: ax25_frame.payload.ax25_info.star_tracker_right_ascension
  :field star_tracker_declination: ax25_frame.payload.ax25_info.star_tracker_declination
  :field star_tracker_roll: ax25_frame.payload.ax25_info.star_tracker_roll
  :field star_tracker_timestamp_of_last_measurement: ax25_frame.payload.ax25_info.star_tracker_timestamp_of_last_measurement
  :field gps_emmc_capacity: ax25_frame.payload.ax25_info.gps_emmc_capacity
  :field gps_readable_files: ax25_frame.payload.ax25_info.gps_readable_files
  :field gps_updater_status: ax25_frame.payload.ax25_info.gps_updater_status
  :field gps_updates_cached: ax25_frame.payload.ax25_info.gps_updates_cached
  :field gps_gps_status: ax25_frame.payload.ax25_info.gps_gps_status
  :field gps_num_of_sats_locked: ax25_frame.payload.ax25_info.gps_num_of_sats_locked
  :field gps_x_position: ax25_frame.payload.ax25_info.gps_x_position
  :field gps_y_postition: ax25_frame.payload.ax25_info.gps_y_postition
  :field gps_z_position: ax25_frame.payload.ax25_info.gps_z_position
  :field gps_x_velocity: ax25_frame.payload.ax25_info.gps_x_velocity
  :field gps_y_velocity: ax25_frame.payload.ax25_info.gps_y_velocity
  :field gps_z_velocity: ax25_frame.payload.ax25_info.gps_z_velocity
  :field gps_timestamp_of_last_packet: ax25_frame.payload.ax25_info.gps_timestamp_of_last_packet
  :field ads_gyro_roll_dot: ax25_frame.payload.ax25_info.ads_gyro_roll_dot
  :field ads_gyro_pitch_dot: ax25_frame.payload.ax25_info.ads_gyro_pitch_dot
  :field ads_gyro_yaw_dot: ax25_frame.payload.ax25_info.ads_gyro_yaw_dot
  :field ads_gyro_imu_temp: ax25_frame.payload.ax25_info.ads_gyro_imu_temp
  :field dxwifi_emmc_capacity: ax25_frame.payload.ax25_info.dxwifi_emmc_capacity
  :field dxwifi_readable_files: ax25_frame.payload.ax25_info.dxwifi_readable_files
  :field dxwifi_updater_status: ax25_frame.payload.ax25_info.dxwifi_updater_status
  :field dxwifi_updates_cached: ax25_frame.payload.ax25_info.dxwifi_updates_cached
  :field dxwifi_transmitting: ax25_frame.payload.ax25_info.dxwifi_transmitting
  :field aprs_packet_crc_minus_32: ax25_frame.payload.ax25_info.aprs_packet_crc_minus_32

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
        valid:
          any-of:
            - '"KJ7SAT"'
            - '"SPACE "'
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
      - id: aprs_packet_format
        type: str
        size: 3
        encoding: ASCII
        doc: '"{{z" User-Defined APRS packet format'
      - id: aprs_packet_satellite_id
        type: u1
      - id: aprs_packet_revision
        type: u1
        doc: CURRENT = 0
      - id: c3_m4_oresat0_state
        type: str
        size: 1
        encoding: ASCII
        doc: 'Character representing C3 critical state. B=predploy, C=Deploy, D=standby, E=beacon, F=EDL'
      - id: c3_m4_uptime
        type: u4
      - id: c3_rtc_time
        type: u4
      - id: c3_wdt_num_power_cycles
        type: u2
      - id: c3_emmc_percent_full
        type: u1
      - id: c3_l_rx_bytes_received
        type: u4
      - id: c3_l_rx_valid_packets
        type: u4
      - id: c3_l_rx_rssi
        type: s1
      - id: c3_uhf_rx_bytes_received
        type: u4
      - id: c3_uhf_rx_valid_packets
        type: u4
      - id: c3_uhf_rx_rssi
        type: s1
      - id: c3_fw_bank_current_and_next_bank
        type: u1
      - id: c3_l_rx_sequence_number
        type: u4
      - id: c3_l_rx_rejected_packets
        type: u4
      - id: battery_pack_1_vbatt
        type: u2
      - id: battery_pack_1_vcell
        type: u2
      - id: battery_pack_1_vcell_max
        type: u2
      - id: battery_pack_1_vcell_min
        type: u2
      - id: battery_pack_1_vcell_1
        type: u2
      - id: battery_pack_1_vcell_2
        type: u2
      - id: battery_pack_1_vcell_avg
        type: u2
      - id: battery_pack_1_temperature
        type: s2
      - id: battery_pack_1_temperature_avg
        type: s2
      - id: battery_pack_1_temperature_max
        type: s2
      - id: battery_pack_1_temperature_min
        type: s2
      - id: battery_pack_1_current
        type: s2
      - id: battery_pack_1_current_avg
        type: s2
      - id: battery_pack_1_current_max
        type: s2
      - id: battery_pack_1_current_min
        type: s2
      - id: battery_pack_1_state
        type: u1
      - id: battery_pack_1_reported_state_of_charge
        type: u1
      - id: battery_pack_1_full_capacity
        type: u2
      - id: battery_pack_1_reported_capacity
        type: u2
      - id: battery_pack_2_vbatt
        type: u2
      - id: battery_pack_2_vcell
        type: u2
      - id: battery_pack_2_vcell_max
        type: u2
      - id: battery_pack_2_vcell_min
        type: u2
      - id: battery_pack_2_vcell_1
        type: u2
      - id: battery_pack_2_vcell_2
        type: u2
      - id: battery_pack_2_vcell_avg
        type: u2
      - id: battery_pack_2_temperature
        type: s2
      - id: battery_pack_2_temperature_avg
        type: s2
      - id: battery_pack_2_temperature_max
        type: s2
      - id: battery_pack_2_temperature_min
        type: s2
      - id: battery_pack_2_current
        type: s2
      - id: battery_pack_2_current_avg
        type: s2
      - id: battery_pack_2_current_max
        type: s2
      - id: battery_pack_2_current_min
        type: s2
      - id: battery_pack_2_state
        type: u1
      - id: battery_pack_2_reported_state_of_charge
        type: u1
      - id: battery_pack_2_full_capacity
        type: u2
      - id: battery_pack_2_reported_capacity
        type: u2
      - id: solar_minus_x_voltage_avg
        type: u2
      - id: solar_minus_x_current_avg
        type: s2
      - id: solar_minus_x_power_avg
        type: u2
      - id: solar_minus_x_voltage_max
        type: u2
      - id: solar_minus_x_current_max
        type: s2
      - id: solar_minus_x_power_max
        type: u2
      - id: solar_minus_x_energy
        type: u2
      - id: solar_minus_y_voltage_avg
        type: u2
      - id: solar_minus_y_current_avg
        type: s2
      - id: solar_minus_y_power_avg
        type: u2
      - id: solar_minus_y_voltage_max
        type: u2
      - id: solar_minus_y_current_max
        type: s2
      - id: solar_minus_y_power_max
        type: u2
      - id: solar_minus_y_energy
        type: u2
      - id: solar_plus_x_voltage_avg
        type: u2
      - id: solar_plus_x_current_avg
        type: s2
      - id: solar_plus_x_power_avg
        type: u2
      - id: solar_plus_x_voltage_max
        type: u2
      - id: solar_plus_x_current_max
        type: s2
      - id: solar_plus_x_power_max
        type: u2
      - id: solar_plus_x_energy
        type: u2
      - id: solar_plus_y_voltage_avg
        type: u2
      - id: solar_plus_y_current_avg
        type: s2
      - id: solar_plus_y_power_avg
        type: u2
      - id: solar_plus_y_voltage_max
        type: u2
      - id: solar_plus_y_current_max
        type: s2
      - id: solar_plus_y_power_max
        type: u2
      - id: solar_plus_y_energy
        type: u2
      - id: star_tracker_emmc_capacity
        type: u1
      - id: star_tracker_readable_files
        type: u1
      - id: star_tracker_updater_status
        type: u1
      - id: star_tracker_updates_cached
        type: u1
      - id: star_tracker_right_ascension
        type: s2
      - id: star_tracker_declination
        type: s2
      - id: star_tracker_roll
        type: s2
      - id: star_tracker_timestamp_of_last_measurement
        type: u4
      - id: gps_emmc_capacity
        type: u1
      - id: gps_readable_files
        type: u1
      - id: gps_updater_status
        type: u1
      - id: gps_updates_cached
        type: u1
      - id: gps_gps_status
        type: u1
      - id: gps_num_of_sats_locked
        type: u1
      - id: gps_x_position
        type: s4
      - id: gps_y_postition
        type: s4
      - id: gps_z_position
        type: s4
      - id: gps_x_velocity
        type: s4
      - id: gps_y_velocity
        type: s4
      - id: gps_z_velocity
        type: s4
      - id: gps_timestamp_of_last_packet
        type: u4
      - id: ads_gyro_roll_dot
        type: s2
      - id: ads_gyro_pitch_dot
        type: s2
      - id: ads_gyro_yaw_dot
        type: s2
      - id: ads_gyro_imu_temp
        type: s1
      - id: dxwifi_emmc_capacity
        type: u1
      - id: dxwifi_readable_files
        type: u1
      - id: dxwifi_updater_status
        type: u1
      - id: dxwifi_updates_cached
        type: u1
      - id: dxwifi_transmitting
        type: b1
      - id: aprs_packet_crc_minus_32
        type: u4
        doc: Polynomial 0x04C11DB7; computed over all bytes allocated
