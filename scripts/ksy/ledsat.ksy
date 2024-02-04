---
meta:
  id: ledsat
  endian: be
doc: |
  :field priority: csp_header.priority
  :field source: csp_header.source
  :field destination: csp_header.destination
  :field destination_port: csp_header.destination_port
  :field source_port: csp_header.source_port
  :field reserved: csp_header.reserved
  :field hmac: csp_header.hmac
  :field xtea: csp_header.xtea
  :field rdp: csp_header.rdp
  :field crc: csp_header.crc
  :field telemetry_identifier: csp_data.payload.telemetry_identifier
  :field unix_ts_ms: csp_data.payload.unix_ts_ms
  :field unix_ts_s: csp_data.payload.unix_ts_s
  :field tlm_process_time: csp_data.payload.tlm_process_time
  :field panel_x_voltage: csp_data.payload.panel_x_voltage
  :field panel_y_voltage: csp_data.payload.panel_y_voltage
  :field panel_z_voltage: csp_data.payload.panel_z_voltage
  :field panel_x_current: csp_data.payload.panel_x_current
  :field panel_y_current: csp_data.payload.panel_y_current
  :field panel_z_current: csp_data.payload.panel_z_current
  :field eps_boot_cause: csp_data.payload.eps_boot_cause
  :field eps_battery_mode: csp_data.payload.eps_battery_mode
  :field mppt_x_temp: csp_data.payload.mppt_x_temp
  :field mppt_y_temp: csp_data.payload.mppt_y_temp
  :field eps_board_temp: csp_data.payload.eps_board_temp
  :field battery_pack1_temp: csp_data.payload.battery_pack1_temp
  :field battery_pack2_temp: csp_data.payload.battery_pack2_temp
  :field battery_pack3_temp: csp_data.payload.battery_pack3_temp
  :field solar_current: csp_data.payload.solar_current
  :field system_current: csp_data.payload.system_current
  :field battery_voltage: csp_data.payload.battery_voltage
  :field gps_current: csp_data.payload.gps_current
  :field eps_boot_count: csp_data.payload.eps_boot_count
  :field trx_pa_temp: csp_data.payload.trx_pa_temp
  :field trx_total_tx_cnt: csp_data.payload.trx_total_tx_cnt
  :field trx_total_rx_cnt: csp_data.payload.trx_total_rx_cnt
  :field last_rssi: csp_data.payload.last_rssi
  :field radio_boot_cnt: csp_data.payload.radio_boot_cnt
  :field obc_temp_1: csp_data.payload.obc_temp_1
  :field obc_temp_2: csp_data.payload.obc_temp_2
  :field gyro_x: csp_data.payload.gyro_x
  :field gyro_y: csp_data.payload.gyro_y
  :field gyro_z: csp_data.payload.gyro_z
  :field mag_x: csp_data.payload.mag_x
  :field mag_y: csp_data.payload.mag_y
  :field mag_z: csp_data.payload.mag_z
  :field px_solar_panel_temp: csp_data.payload.px_solar_panel_temp
  :field py_solar_panel_temp: csp_data.payload.py_solar_panel_temp
  :field nx_solar_panel_temp: csp_data.payload.nx_solar_panel_temp
  :field ny_solar_panel_temp: csp_data.payload.ny_solar_panel_temp
  :field pz_solar_panel_temp: csp_data.payload.pz_solar_panel_temp
  :field nz_solar_panel_temp: csp_data.payload.nz_solar_panel_temp
  :field px_sun_sensor_coarse: csp_data.payload.px_sun_sensor_coarse
  :field py_sun_sensor_coarse: csp_data.payload.py_sun_sensor_coarse
  :field pz_sun_sensor_coarse: csp_data.payload.pz_sun_sensor_coarse
  :field nx_sun_sensor_coarse: csp_data.payload.nx_sun_sensor_coarse
  :field ny_sun_sensor_coarse: csp_data.payload.ny_sun_sensor_coarse
  :field nz_sun_sensor_coarse: csp_data.payload.nz_sun_sensor_coarse
  :field eps_outputs_status: csp_data.payload.eps_outputs_status
  :field obc_boot_counter: csp_data.payload.obc_boot_counter
  :field leds_status: csp_data.payload.leds_status
  :field gps_status: csp_data.payload.gps_status
  :field gps_fix_time: csp_data.payload.gps_fix_time
  :field gps_lat: csp_data.payload.gps_lat
  :field gps_lon: csp_data.payload.gps_lon
  :field gps_alt: csp_data.payload.gps_alt
  :field software_status: csp_data.payload.software_status
  :field ext_gyro_x: csp_data.payload.ext_gyro_x
  :field ext_gyro_y: csp_data.payload.ext_gyro_y
  :field ext_gyro_z: csp_data.payload.ext_gyro_z
  :field ext_mag_x: csp_data.payload.ext_mag_x
  :field ext_mag_y: csp_data.payload.ext_mag_y
  :field ext_mag_z: csp_data.payload.ext_mag_z
  :field framelength: framelength

seq:
  - id: csp_header
    type: csp_header_t
  - id: csp_data
    type: csp_data_t
instances:
  framelength:
    value: _io.size
types:
  csp_header_t:
    seq:
      - id: raw_csp_header
        type: u4be
    instances:
      priority:
        value: '(raw_csp_header >> 30)'
      source:
        value: '((raw_csp_header >> 25) & 0x1F)'
      destination:
        value: '((raw_csp_header >> 20) & 0x1F)'
      destination_port:
        value: '((raw_csp_header >> 14) & 0x3F)'
      source_port:
        value: '((raw_csp_header >> 8) & 0x3F)'
      reserved:
        value: '((raw_csp_header >> 4) & 0x0F)'
      hmac:
        value: '((raw_csp_header & 0x08) >> 3)'
      xtea:
        value: '((raw_csp_header & 0x04) >> 2)'
      rdp:
        value: '((raw_csp_header & 0x02) >> 1)'
      crc:
        value: '(raw_csp_header & 0x01)'
  csp_data_t:
    seq:
      - id: payload
        type:
          switch-on: _parent.csp_header.destination_port
          cases:
            8: ledsat_tlm_t
  ledsat_tlm_t:
    seq:
      - id: telemetry_identifier
        type: u2
        valid:
          any-of:
            - 0x1628  # current telemetry
            - 0x1629  # stored telemetry
            - 0x162a  # beacon
        doc: 'Telemetry Identifier, probably usabel to determine packet type'
      - id: unix_ts_ms
        type: u2
        doc: 'Millisecond part of the unix time, [ms]'
      - id: unix_ts_s
        type: u4
        doc: 'On-board unix time, [s]'
      - id: tlm_process_time
        type: u2
        doc: 'Time taken to process the telemetry, [ms]'
      - id: panel_x_voltage
        type: u2
        doc: 'Voltage of X axis solar panels, [mV]'
      - id: panel_y_voltage
        type: u2
        doc: 'Voltage of Y axis solar panels, [mV]'
      - id: panel_z_voltage
        type: u2
        doc: 'Voltage of Z axis solar panels, [mV]'
      - id: panel_x_current
        type: u2
        doc: 'Current of X axis solar panels, [mA]'
      - id: panel_y_current
        type: u2
        doc: 'Current of Y axis solar panels, [mA]'
      - id: panel_z_current
        type: u2
        doc: 'Current of Z axis solar panels, [mA]'
      - id: eps_boot_cause
        type: u1
        doc: 'EPS bootcause'
      - id: eps_battery_mode
        type: u1
        doc: 'EPS battery mode'
      - id: mppt_x_temp
        type: s2
        doc: 'Temperature of X axis MPPT, [degC]'
      - id: mppt_y_temp
        type: s2
        doc: 'Temperature of Y axis MPPT, [degC]'
      - id: eps_board_temp
        type: s2
        doc: 'Temperature of EPS board, [degC]'
      - id: battery_pack1_temp
        type: s2
        doc: 'Temperature of battery pack #1, [degC]'
      - id: battery_pack2_temp
        type: s2
        doc: 'Temperature of battery pack #2, [degC]'
      - id: battery_pack3_temp
        type: s2
        doc: 'Temperature of battery pack #3, [degC]'
      - id: solar_current
        type: u2
        doc: 'Total current coming from solar panels, [mA]'
      - id: system_current
        type: u2
        doc: 'Total current absorbed by system, [mA]'
      - id: battery_voltage
        type: u2
        doc: 'Battery voltage, [mV]'
      - id: gps_current
        type: u1
        doc: 'GPS current (x0.15), val = gps_current / 0.15 [mV]'
      - id: pad_0
        type: u1
      - id: eps_boot_count
        type: u2
        doc: 'EPS boot count, [#]'
      - id: trx_pa_temp
        type: s2
        doc: 'Temperature of transceiver PA, val = transceiver_pa_temp / 10 [degC]'
      - id: trx_total_tx_cnt
        type: u4
        doc: 'Transceiver total TX count, [#]'
      - id: trx_total_rx_cnt
        type: u4
        doc: 'Transceiver total RX count, [#]'
      - id: last_rssi
        type: s2
        doc: 'Last radio-contact RSSI, [dBm]'
      - id: radio_boot_cnt
        type: u2
        doc: 'Radio bootcounter, [#]'
      - id: obc_temp_1
        type: s2
        doc: 'OBC temperature #1, val = obc_temp_1 / 10 [degC]'
      - id: obc_temp_2
        type: s2
        doc: 'OBC temperature #1, val = obc_temp_2 / 10 [degC]'
      - id: gyro_x
        type: s2
        doc: 'Gyroscope X, val = gyro_x / 100 [deg/s]'
      - id: gyro_y
        type: s2
        doc: 'Gyroscope Y, val = gyro_y / 100 [deg/s]'
      - id: gyro_z
        type: s2
        doc: 'Gyroscope Z, val = gyro_z / 100 [deg/s]'
      - id: mag_x
        type: s2
        doc: 'Magnetometer X, val = mag_x / 10 [mG]'
      - id: mag_y
        type: s2
        doc: 'Magnetometer Y, val = mag_y / 10 [mG]'
      - id: mag_z
        type: s2
        doc: 'Magnetometer Z, val = mag_z / 10 [mG]'
      - id: px_solar_panel_temp
        type: s2
        doc: 'Temperature of +X solar panel, val = px_solar_panel_temp / 100 [degC]'
      - id: py_solar_panel_temp
        type: s2
        doc: 'Temperature of +Y solar panel, val = py_solar_panel_temp / 100 [degC]'
      - id: nx_solar_panel_temp
        type: s2
        doc: 'Temperature of -X solar panel, val = nx_solar_panel_temp / 100 [degC]'
      - id: ny_solar_panel_temp
        type: s2
        doc: 'Temperature of -Y solar panel, val = ny_solar_panel_temp / 100 [degC]'
      - id: pz_solar_panel_temp
        type: s2
        doc: 'Temperature of +Z solar panel, val = pz_solar_panel_temp / 100 [degC]'
      - id: nz_solar_panel_temp
        type: s2
        doc: 'Temperature of -Z solar panel, val = nz_solar_panel_temp / 100 [degC]'
      - id: px_sun_sensor_coarse
        type: u2
        doc: 'Coarse Sun sensor +X, [mV]'
      - id: py_sun_sensor_coarse
        type: u2
        doc: 'Coarse Sun sensor +Y, [mV]'
      - id: pz_sun_sensor_coarse
        type: u2
        doc: 'Coarse Sun sensor +Z, [mV]'
      - id: nx_sun_sensor_coarse
        type: u2
        doc: 'Coarse Sun sensor -X, [mV]'
      - id: ny_sun_sensor_coarse
        type: u2
        doc: 'Coarse Sun sensor -Y, [mV]'
      - id: nz_sun_sensor_coarse
        type: u2
        doc: 'Coarse Sun sensor -Z, [mV]'
      - id: eps_outputs_status
        type: u1
        doc: 'EPS outputs status'
      - id: pad_1
        type: u1
      - id: obc_boot_counter
        type: s2
        doc: 'OBC boot sounter'
      - id: leds_status
        type: u1
        doc: 'Status of the LEDs'
      - id: pad_2
        type: u1
      - id: gps_status
        type: u1
        doc: 'GPS status flag'
      - id: pad_3
        type: u1
      - id: gps_fix_time
        type: u4
        doc: 'GPS fix time'
      - id: gps_lat
        type: s4
        doc: 'GPS Latidude, val = gps_lat / 10E6 [deg]'
      - id: gps_lon
        type: s4
        doc: 'GPS Longitude, val = gps_lon / 10E6 [deg]'
      - id: gps_alt
        type: s4
        doc: 'GPS Altitude, [m]'
      - id: software_status
        type: u1
        doc: 'Software status flag'
      - id: pad_4
        type: u1
      - id: ext_gyro_x
        type: s2
        doc: 'External Gyroscope X, val = ext_gyro_x / -100 [deg/s]'
      - id: ext_gyro_y
        type: s2
        doc: 'External Gyroscope Y, val = ext_gyro_y / -100 [deg/s]'
      - id: ext_gyro_z
        type: s2
        doc: 'External Gyroscope X, val = ext_gyro_z / 100 [deg/s]'
      - id: ext_mag_x
        type: s2
        doc: 'External Magnetometer X, val = ext_mag_x / -10 [mG]'
      - id: ext_mag_y
        type: s2
        doc: 'External Magnetometer Y, val = ext_mag_y / -10 [mG]'
      - id: ext_mag_z
        type: s2
        doc: 'External Magnetometer Z, val = ext_mag_z / 10 [mG]'
      - id: pad_5
        type: u2
