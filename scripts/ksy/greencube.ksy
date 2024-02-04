---
meta:
  id: greencube
  title: S5Lab GreenCube Telemetry Decoder
  endian: be

doc: |
  :field header: greencube_raw_frame.csp_header.header
  :field priority: greencube_raw_frame.csp_header.priority
  :field src: greencube_raw_frame.csp_header.src
  :field dest: greencube_raw_frame.csp_header.dest
  :field dest_port: greencube_raw_frame.csp_header.dest_port
  :field src_port: greencube_raw_frame.csp_header.src_port
  :field hmac: greencube_raw_frame.csp_header.hmac
  :field xtea: greencube_raw_frame.csp_header.xtea
  :field rdp: greencube_raw_frame.csp_header.rdp
  :field crc: greencube_raw_frame.csp_header.crc
  :field tlm_id: greencube_raw_frame.tlm_id
  :field unix_time_ms: greencube_raw_frame.tlm_data.unix_time_ms
  :field unix_time: greencube_raw_frame.tlm_data.unix_time
  :field process_time: greencube_raw_frame.tlm_data.process_time
  :field solar_x_voltage: greencube_raw_frame.tlm_data.solar_x_voltage
  :field solar_y_voltage: greencube_raw_frame.tlm_data.solar_y_voltage
  :field solar_x_current: greencube_raw_frame.tlm_data.solar_x_current
  :field solar_y_current: greencube_raw_frame.tlm_data.solar_y_current
  :field eps_bootcause: greencube_raw_frame.tlm_data.eps_bootcause
  :field mppt_x_temperature: greencube_raw_frame.tlm_data.mppt_x_temperature
  :field mppt_y_temperature: greencube_raw_frame.tlm_data.mppt_y_temperature
  :field eps_temperature: greencube_raw_frame.tlm_data.eps_temperature
  :field battery_1_temperature: greencube_raw_frame.tlm_data.battery_1_temperature
  :field battery_2_temperature: greencube_raw_frame.tlm_data.battery_2_temperature
  :field battery_3_temperature: greencube_raw_frame.tlm_data.battery_3_temperature
  :field solar_total_current: greencube_raw_frame.tlm_data.solar_total_current
  :field system_total_current: greencube_raw_frame.tlm_data.system_total_current
  :field battery_voltage: greencube_raw_frame.tlm_data.battery_voltage
  :field eps_outputs: greencube_raw_frame.tlm_data.eps_outputs
  :field radio_pa_temperature: greencube_raw_frame.tlm_data.radio_pa_temperature
  :field radio_tx_count: greencube_raw_frame.tlm_data.radio_tx_count
  :field radio_rx_count: greencube_raw_frame.tlm_data.radio_rx_count
  :field radio_last_rssi: greencube_raw_frame.tlm_data.radio_last_rssi
  :field obc_boot_count: greencube_raw_frame.tlm_data.obc_boot_count
  :field radio_boot_count: greencube_raw_frame.tlm_data.radio_boot_count
  :field eps_boot_count: greencube_raw_frame.tlm_data.eps_boot_count
  :field payload_rx_count: greencube_raw_frame.tlm_data.payload_rx_count
  :field payload_tx_count: greencube_raw_frame.tlm_data.payload_tx_count
  :field software_status: greencube_raw_frame.tlm_data.software_status
  :field heater_status: greencube_raw_frame.tlm_data.heater_status
  :field obc_temperature: greencube_raw_frame.tlm_data.obc_temperature
  :field gyroscope_x: greencube_raw_frame.tlm_data.gyroscope_x
  :field gyroscope_y: greencube_raw_frame.tlm_data.gyroscope_y
  :field gyroscope_z: greencube_raw_frame.tlm_data.gyroscope_z
  :field magnetometer_x: greencube_raw_frame.tlm_data.magnetometer_x
  :field magnetometer_y: greencube_raw_frame.tlm_data.magnetometer_y
  :field magnetometer_z: greencube_raw_frame.tlm_data.magnetometer_z
  :field solarpanel_plus_x_temperature: greencube_raw_frame.tlm_data.solarpanel_plus_x_temperature
  :field solarpanel_plus_y_temperature: greencube_raw_frame.tlm_data.solarpanel_plus_y_temperature
  :field solarpanel_minus_x_temperature: greencube_raw_frame.tlm_data.solarpanel_minus_x_temperature
  :field solarpanel_minus_y_temperature: greencube_raw_frame.tlm_data.solarpanel_minus_y_temperature
  :field coarse_sun_sensor_plus_x: greencube_raw_frame.tlm_data.coarse_sun_sensor_plus_x
  :field coarse_sun_sensor_plus_y: greencube_raw_frame.tlm_data.coarse_sun_sensor_plus_y
  :field coarse_sun_sensor_minus_x: greencube_raw_frame.tlm_data.coarse_sun_sensor_minus_x
  :field coarse_sun_sensor_minus_y: greencube_raw_frame.tlm_data.coarse_sun_sensor_minus_y
  :field gps_status_flag: greencube_raw_frame.tlm_data.gps_status_flag
  :field gps_fix_time: greencube_raw_frame.tlm_data.gps_fix_time
  :field gps_latitude: greencube_raw_frame.tlm_data.gps_latitude
  :field gps_longitude: greencube_raw_frame.tlm_data.gps_longitude
  :field gps_altitude: greencube_raw_frame.tlm_data.gps_altitude
  :field sband_tx_count: greencube_raw_frame.tlm_data.sband_tx_count
  :field antenna_status_flag: greencube_raw_frame.tlm_data.antenna_status_flag
  :field acs_state_flag: greencube_raw_frame.tlm_data.acs_state_flag
  :field acs_parameters_flag: greencube_raw_frame.tlm_data.acs_parameters_flag

seq:
  - id: greencube_raw_frame
    type:
      switch-on: _io.size
      cases:
        101: greencube_tlm_frame
    doc-ref: 'https://www.s5lab.space/index.php/decoding-ledsat-2/'

types:
  greencube_tlm_frame:
    seq:
      - id: csp_header
        type: csp_header
      - id: tlm_id
        type: u2
        valid:
          any-of:
            - 0x3610  # current telemetry
            - 0x3611  # stored telemetry
            - 0x3612  # beacon
            - 0x761A
      - id: tlm_data
        type: tlm_data

  csp_header:
    seq:
      - id: header
        type: u4
    instances:
      priority:
        value: ((header >> 30) & 0x03)
      src:
        value: ((header >> 25) & 0x1f)
      dest:
        value: ((header >> 20) & 0x1f)
      dest_port:
        value: ((header >> 14) & 0x3f)
      src_port:
        value: ((header >> 8) & 0x3f)
      hmac:
        value: ((header >> 3) & 0x01)
      xtea:
        value: ((header >> 2) & 0x01)
      rdp:
        value: ((header >> 1) & 0x01)
      crc:
        value: ((header) & 0x01)
  tlm_data:
    seq:
      - id: unix_time_ms
        type: u2
      - id: unix_time
        type: u4
      - id: process_time
        type: u2
      - id: solar_x_voltage
        type: u2
      - id: solar_y_voltage
        type: u2
      - id: solar_x_current
        type: u2
      - id: solar_y_current
        type: u2
      - id: eps_bootcause
        type: u1
      - id: mppt_x_temperature
        type: s1
      - id: mppt_y_temperature
        type: s1
      - id: eps_temperature
        type: s1
      - id: battery_1_temperature
        type: s1
      - id: battery_2_temperature
        type: s1
      - id: battery_3_temperature
        type: s1
      - id: solar_total_current
        type: u2
      - id: system_total_current
        type: u2
      - id: battery_voltage
        type: u2
      - id: eps_outputs
        type: u1
      - id: radio_pa_temperature
        type: s1
      - id: radio_tx_count
        type: u2
      - id: radio_rx_count
        type: u2
      - id: radio_last_rssi
        type: s2
      - id: obc_boot_count
        type: u2
      - id: radio_boot_count
        type: u2
      - id: eps_boot_count
        type: u2
      - id: payload_rx_count
        type: u1
      - id: payload_tx_count
        type: u1
      - id: software_status
        type: u1
      - id: heater_status
        type: u1
      - id: obc_temperature
        type: u1
      - id: gyroscope_x
        type: s2
      - id: gyroscope_y
        type: s2
      - id: gyroscope_z
        type: s2
      - id: magnetometer_x
        type: s2
      - id: magnetometer_y
        type: s2
      - id: magnetometer_z
        type: s2
      - id: solarpanel_plus_x_temperature
        type: s1
      - id: solarpanel_plus_y_temperature
        type: s1
      - id: solarpanel_minus_x_temperature
        type: s1
      - id: solarpanel_minus_y_temperature
        type: s1
      - id: coarse_sun_sensor_plus_x
        type: u2
      - id: coarse_sun_sensor_plus_y
        type: u2
      - id: coarse_sun_sensor_minus_x
        type: u2
      - id: coarse_sun_sensor_minus_y
        type: u2
      - id: gps_status_flag
        type: u1
      - id: gps_fix_time
        type: u4
      - id: gps_latitude
        type: u4
      - id: gps_longitude
        type: u4
      - id: gps_altitude
        type: u4
      - id: sband_tx_count
        type: u2
      - id: antenna_status_flag
        type: u2
      - id: acs_state_flag
        type: u1
      - id: acs_parameters_flag
        type: u1
