---
meta:
  id: randev
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field ssid_mask: ax25_frame.ax25_header.dest_ssid_raw.ssid_mask
  :field ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign_raw_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid_raw_ssid_mask: ax25_frame.ax25_header.src_ssid_raw.ssid_mask
  :field src_ssid_raw_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field system_leading: ax25_frame.payload.system_leading
  :field system_time: ax25_frame.payload.system_time
  :field system_mode: ax25_frame.payload.system_mode
  :field system_wod_mode: ax25_frame.payload.system_wod_mode
  :field system_wod_counter: ax25_frame.payload.system_wod_counter
  :field raw_temp: ax25_frame.payload.obc.raw_temp
  :field raw_gps: ax25_frame.payload.obc.raw_gps
  :field temp1_celcius: ax25_frame.payload.obc.temp1_celcius
  :field temp2_celcius: ax25_frame.payload.obc.temp2_celcius
  :field eps_board_status: ax25_frame.payload.eps.eps_board_status
  :field eps_pdm_status: ax25_frame.payload.eps.eps_pdm_status
  :field raw_measure: ax25_frame.payload.eps.raw_measure
  :field eps_bcr_current_ampere: ax25_frame.payload.eps.eps_bcr_current_ampere
  :field eps_bcr_voltage_volts: ax25_frame.payload.eps.eps_bcr_voltage_volts
  :field eps_3v3_current_ampere: ax25_frame.payload.eps.eps_3v3_current_ampere
  :field eps_5v_current_ampere: ax25_frame.payload.eps.eps_5v_current_ampere
  :field eps_battery_current_ampere: ax25_frame.payload.eps.eps_battery_current_ampere
  :field eps_battery_voltage_volts: ax25_frame.payload.eps.eps_battery_voltage_volts
  :field eps_sw1_current_ampere: ax25_frame.payload.eps.eps_sw1_current_ampere
  :field eps_sw1_voltage_volts: ax25_frame.payload.eps.eps_sw1_voltage_volts
  :field eps_sw2_current_ampere: ax25_frame.payload.eps.eps_sw2_current_ampere
  :field eps_sw2_voltage_volts: ax25_frame.payload.eps.eps_sw2_voltage_volts
  :field eps_sw3_voltage_volts: ax25_frame.payload.eps.eps_sw3_voltage_volts
  :field eps_sw3_current_ampere: ax25_frame.payload.eps.eps_sw3_current_ampere
  :field eps_sw4_voltage_volts: ax25_frame.payload.eps.eps_sw4_voltage_volts
  :field eps_sw4_current_ampere: ax25_frame.payload.eps.eps_sw4_current_ampere
  :field eps_sw5_voltage_volts: ax25_frame.payload.eps.eps_sw5_voltage_volts
  :field eps_sw5_current_ampere: ax25_frame.payload.eps.eps_sw5_current_ampere
  :field eps_sw6_voltage_volts: ax25_frame.payload.eps.eps_sw6_voltage_volts
  :field eps_sw6_current_ampere: ax25_frame.payload.eps.eps_sw6_current_ampere
  :field eps_sw7_voltage_volts: ax25_frame.payload.eps.eps_sw7_voltage_volts
  :field eps_sw7_current_ampere: ax25_frame.payload.eps.eps_sw7_current_ampere
  :field eps_sw8_voltage_volts: ax25_frame.payload.eps.eps_sw8_voltage_volts
  :field eps_sw8_current_ampere: ax25_frame.payload.eps.eps_sw8_current_ampere
  :field eps_sw9_voltage_volts: ax25_frame.payload.eps.eps_sw9_voltage_volts
  :field eps_sw9_current_ampere: ax25_frame.payload.eps.eps_sw9_current_ampere
  :field eps_temp_celcius: ax25_frame.payload.eps.eps_temp_celcius
  :field eps_bcr1_voltage_volts: ax25_frame.payload.eps.eps_bcr1_voltage_volts
  :field eps_bcr2_voltage_volts: ax25_frame.payload.eps.eps_bcr2_voltage_volts
  :field eps_bcr4_voltage_volts: ax25_frame.payload.eps.eps_bcr4_voltage_volts
  :field eps_bcr5_voltage_volts: ax25_frame.payload.eps.eps_bcr5_voltage_volts
  :field bat_voltage_volts: ax25_frame.payload.eps.bat_voltage_volts
  :field bat_current_ampere: ax25_frame.payload.eps.bat_current_ampere
  :field bat_temp_celcius: ax25_frame.payload.eps.bat_temp_celcius
  :field bat_heater_on: ax25_frame.payload.eps.bat_heater_on
  :field bat_heate_ctrl_on: ax25_frame.payload.eps.bat_heate_ctrl_on
  :field raw: ax25_frame.payload.comm_rx.raw
  :field comm_rx_doppler_hz: ax25_frame.payload.comm_rx.comm_rx_doppler_hz
  :field comm_rx_rssi_dbm: ax25_frame.payload.comm_rx.comm_rx_rssi_dbm
  :field comm_rx_voltage_volts: ax25_frame.payload.comm_rx.comm_rx_voltage_volts
  :field comm_rx_total_current_ampere: ax25_frame.payload.comm_rx.comm_rx_total_current_ampere
  :field comm_rx_tr_current_ampere: ax25_frame.payload.comm_rx.comm_rx_tr_current_ampere
  :field comm_rx_rx_current_ampere: ax25_frame.payload.comm_rx.comm_rx_rx_current_ampere
  :field comm_rx_pa_current_ampere: ax25_frame.payload.comm_rx.comm_rx_pa_current_ampere
  :field comm_rx_pa_temp_degree: ax25_frame.payload.comm_rx.comm_rx_pa_temp_degree
  :field comm_rx_osci_temp_degree: ax25_frame.payload.comm_rx.comm_rx_osci_temp_degree
  :field comm_tx_raw: ax25_frame.payload.comm_tx.raw
  :field comm_tx_reflected_db: ax25_frame.payload.comm_tx.comm_tx_reflected_db
  :field comm_tx_forward_db: ax25_frame.payload.comm_tx.comm_tx_forward_db
  :field comm_tx_voltage_volts: ax25_frame.payload.comm_tx.comm_tx_voltage_volts
  :field comm_tx_total_current_ampere: ax25_frame.payload.comm_tx.comm_tx_total_current_ampere
  :field comm_tx_tr_current_ampere: ax25_frame.payload.comm_tx.comm_tx_tr_current_ampere
  :field comm_tx_rx_current_ampere: ax25_frame.payload.comm_tx.comm_tx_rx_current_ampere
  :field comm_tx_pa_current_ampere: ax25_frame.payload.comm_tx.comm_tx_pa_current_ampere
  :field comm_tx_pa_temp_degree: ax25_frame.payload.comm_tx.comm_tx_pa_temp_degree
  :field comm_tx_osci_temp_degree: ax25_frame.payload.comm_tx.comm_tx_osci_temp_degree
  :field comm_antenna_raw_temp: ax25_frame.payload.comm_antenna.raw_temp
  :field notdeployed1: ax25_frame.payload.comm_antenna.notdeployed1
  :field timeout1: ax25_frame.payload.comm_antenna.timeout1
  :field deploying1: ax25_frame.payload.comm_antenna.deploying1
  :field dummy: ax25_frame.payload.comm_antenna.dummy
  :field notdeployed2: ax25_frame.payload.comm_antenna.notdeployed2
  :field timeout2: ax25_frame.payload.comm_antenna.timeout2
  :field deploying2: ax25_frame.payload.comm_antenna.deploying2
  :field ignore: ax25_frame.payload.comm_antenna.ignore
  :field notdeployed3: ax25_frame.payload.comm_antenna.notdeployed3
  :field timeout3: ax25_frame.payload.comm_antenna.timeout3
  :field deploying3: ax25_frame.payload.comm_antenna.deploying3
  :field independant_burn: ax25_frame.payload.comm_antenna.independant_burn
  :field notdeployed4: ax25_frame.payload.comm_antenna.notdeployed4
  :field timeout4: ax25_frame.payload.comm_antenna.timeout4
  :field deploying4: ax25_frame.payload.comm_antenna.deploying4
  :field armed: ax25_frame.payload.comm_antenna.armed
  :field deployment_count: ax25_frame.payload.comm_antenna.deployment_count
  :field raw_deployment_time: ax25_frame.payload.comm_antenna.raw_deployment_time
  :field temperature_celcius: ax25_frame.payload.comm_antenna.temperature_celcius
  :field deployment_time1: ax25_frame.payload.comm_antenna.deployment_time1
  :field deployment_time2: ax25_frame.payload.comm_antenna.deployment_time2
  :field deployment_time3: ax25_frame.payload.comm_antenna.deployment_time3
  :field deployment_time4: ax25_frame.payload.comm_antenna.deployment_time4
  :field estimation_mode: ax25_frame.payload.adcs.cubesense_tm190.estimation_mode
  :field control_mode: ax25_frame.payload.adcs.cubesense_tm190.control_mode
  :field adcs_mode: ax25_frame.payload.adcs.cubesense_tm190.adcs_mode
  :field asgp4_mode: ax25_frame.payload.adcs.cubesense_tm190.asgp4_mode
  :field cubecontrol_signal_enabled: ax25_frame.payload.adcs.cubesense_tm190.cubecontrol_signal_enabled
  :field cubecontrol_motor_enabled: ax25_frame.payload.adcs.cubesense_tm190.cubecontrol_motor_enabled
  :field cubesence1_enabled: ax25_frame.payload.adcs.cubesense_tm190.cubesence1_enabled
  :field cubesence2_enable: ax25_frame.payload.adcs.cubesense_tm190.cubesence2_enable
  :field cubewheel1_enabled: ax25_frame.payload.adcs.cubesense_tm190.cubewheel1_enabled
  :field cubewheel2_enabled: ax25_frame.payload.adcs.cubesense_tm190.cubewheel2_enabled
  :field cubewheel3_enabled: ax25_frame.payload.adcs.cubesense_tm190.cubewheel3_enabled
  :field cubestar_enabled: ax25_frame.payload.adcs.cubesense_tm190.cubestar_enabled
  :field gps_reciver_enabled: ax25_frame.payload.adcs.cubesense_tm190.gps_reciver_enabled
  :field gps_lna_power_enabled: ax25_frame.payload.adcs.cubesense_tm190.gps_lna_power_enabled
  :field motor_driver_enabled: ax25_frame.payload.adcs.cubesense_tm190.motor_driver_enabled
  :field sun_is_above_local_horizon: ax25_frame.payload.adcs.cubesense_tm190.sun_is_above_local_horizon
  :field errors: ax25_frame.payload.adcs.cubesense_tm190.errors
  :field cubesence1_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubesence1_comm_error
  :field cubesence2_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubesence2_comm_error
  :field cubecontrol_signal_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubecontrol_signal_comm_error
  :field cubecontrol_motor_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubecontrol_motor_comm_error
  :field cubewheel1_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubewheel1_comm_error
  :field cubewhee2_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubewhee2_comm_error
  :field cubewheel3_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubewheel3_comm_error
  :field cubestar_comm_error: ax25_frame.payload.adcs.cubesense_tm190.cubestar_comm_error
  :field magnetometer_range_error: ax25_frame.payload.adcs.cubesense_tm190.magnetometer_range_error
  :field sunsensor_sram_overcurrent_detected: ax25_frame.payload.adcs.cubesense_tm190.sunsensor_sram_overcurrent_detected
  :field sunsensor_3v3_overcurrent_detected: ax25_frame.payload.adcs.cubesense_tm190.sunsensor_3v3_overcurrent_detected
  :field sunsensor_busy_error: ax25_frame.payload.adcs.cubesense_tm190.sunsensor_busy_error
  :field sunsensor_detection_error: ax25_frame.payload.adcs.cubesense_tm190.sunsensor_detection_error
  :field sunsensor_range_error: ax25_frame.payload.adcs.cubesense_tm190.sunsensor_range_error
  :field nadir_sensor_sram_overcurrent_detected: ax25_frame.payload.adcs.cubesense_tm190.nadir_sensor_sram_overcurrent_detected
  :field nadir_sensor_3v3_overcurrent_detected: ax25_frame.payload.adcs.cubesense_tm190.nadir_sensor_3v3_overcurrent_detected
  :field nadir_sensor_busy_error: ax25_frame.payload.adcs.cubesense_tm190.nadir_sensor_busy_error
  :field nadir_sensor_detection_error: ax25_frame.payload.adcs.cubesense_tm190.nadir_sensor_detection_error
  :field nadir_sensor_range_error: ax25_frame.payload.adcs.cubesense_tm190.nadir_sensor_range_error
  :field rate_sensor_range_error: ax25_frame.payload.adcs.cubesense_tm190.rate_sensor_range_error
  :field wheel_speed_range_error: ax25_frame.payload.adcs.cubesense_tm190.wheel_speed_range_error
  :field coarse_sunsensor_error: ax25_frame.payload.adcs.cubesense_tm190.coarse_sunsensor_error
  :field startracker_match_error: ax25_frame.payload.adcs.cubesense_tm190.startracker_match_error
  :field startracker_overcurrent_detected: ax25_frame.payload.adcs.cubesense_tm190.startracker_overcurrent_detected
  :field orbit_parameters_invalid: ax25_frame.payload.adcs.cubesense_tm190.orbit_parameters_invalid
  :field configuration_invalid: ax25_frame.payload.adcs.cubesense_tm190.configuration_invalid
  :field control_mode_change_allowed: ax25_frame.payload.adcs.cubesense_tm190.control_mode_change_allowed
  :field estimator_change_not_allowed: ax25_frame.payload.adcs.cubesense_tm190.estimator_change_not_allowed
  :field magnetometer_mode: ax25_frame.payload.adcs.cubesense_tm190.magnetometer_mode
  :field modelled_measured_magnetic_field_missmatch: ax25_frame.payload.adcs.cubesense_tm190.modelled_measured_magnetic_field_missmatch
  :field node_recovery_error: ax25_frame.payload.adcs.cubesense_tm190.node_recovery_error
  :field cubesense1_runtime_error: ax25_frame.payload.adcs.cubesense_tm190.cubesense1_runtime_error
  :field cubesense2_runtime_error: ax25_frame.payload.adcs.cubesense_tm190.cubesense2_runtime_error
  :field cubecontrol_signal_runtime_error: ax25_frame.payload.adcs.cubesense_tm190.cubecontrol_signal_runtime_error
  :field cubecontrol_motor_untime_error: ax25_frame.payload.adcs.cubesense_tm190.cubecontrol_motor_untime_error
  :field cubewheel1_runtime_error: ax25_frame.payload.adcs.cubesense_tm190.cubewheel1_runtime_error
  :field cubewheel2_runtime_error: ax25_frame.payload.adcs.cubesense_tm190.cubewheel2_runtime_error
  :field cubewheel3_runtime_error: ax25_frame.payload.adcs.cubesense_tm190.cubewheel3_runtime_error
  :field cubestar_runtime_error: ax25_frame.payload.adcs.cubesense_tm190.cubestar_runtime_error
  :field magnetometer_error: ax25_frame.payload.adcs.cubesense_tm190.magnetometer_error
  :field rate_sensor_failure: ax25_frame.payload.adcs.cubesense_tm190.rate_sensor_failure
  :field adcs_cubesense_tm146_raw: ax25_frame.payload.adcs.cubesense_tm146.raw
  :field roll_degree: ax25_frame.payload.adcs.cubesense_tm146.roll_degree
  :field pitch_degree: ax25_frame.payload.adcs.cubesense_tm146.pitch_degree
  :field yaw_degree: ax25_frame.payload.adcs.cubesense_tm146.yaw_degree
  :field q1: ax25_frame.payload.adcs.cubesense_tm146.q1
  :field q2: ax25_frame.payload.adcs.cubesense_tm146.q2
  :field q3: ax25_frame.payload.adcs.cubesense_tm146.q3
  :field x_angular_rate_degree_s: ax25_frame.payload.adcs.cubesense_tm146.x_angular_rate_degree_s
  :field y_angular_rate_degree_s: ax25_frame.payload.adcs.cubesense_tm146.y_angular_rate_degree_s
  :field z_angular_rate_degree_s: ax25_frame.payload.adcs.cubesense_tm146.z_angular_rate_degree_s
  :field hstx_raw: ax25_frame.payload.hstx.raw
  :field rf_output_volts: ax25_frame.payload.hstx.rf_output_volts
  :field pa_temp: ax25_frame.payload.hstx.pa_temp
  :field board_temp_top: ax25_frame.payload.hstx.board_temp_top
  :field board_temp_bottom: ax25_frame.payload.hstx.board_temp_bottom
  :field bat_current: ax25_frame.payload.hstx.bat_current
  :field bat_voltasge: ax25_frame.payload.hstx.bat_voltasge
  :field pa_current: ax25_frame.payload.hstx.pa_current
  :field pa_voltage: ax25_frame.payload.hstx.pa_voltage


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
        type: randev_payload

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

    types:
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

  randev_payload:
    seq:
      - id: system_leading
        type: u1
      - id: system_time
        type: u4
      - id: system_mode
        type: u1
      - id: system_wod_mode
        type: u1
      - id: system_wod_counter
        type: u2

      - id: obc
        type: obc_info
      - id: eps
        type: eps_info
      - id: comm_rx
        type: comm_rx_info
      - id: comm_tx
        type: comm_tx_info
      - id: comm_antenna
        type: comm_antenna_info
      - id: adcs
        type: adcs_info
      - id: hstx
        type: hstx_info

    types:
      obc_info:
        seq:
          - id: raw_temp
            type: s2
            repeat: expr
            repeat-expr: 2
          - id: raw_gps
            type: u8
            repeat: expr
            repeat-expr: 6
        instances:
          temp1_celcius:
            value: raw_temp[0]*0.1
          temp2_celcius:
            value: raw_temp[1]*0.1

      eps_info:
        seq:
          - id: eps_board_status
            type: b16
          - id: eps_pdm_status
            type: b16
          - id: raw_measure
            type: u2
            repeat: expr
            repeat-expr: 35
        instances:
          eps_bcr_current_ampere:
            value: raw_measure[0]*14.662757
          eps_bcr_voltage_volts:
            value: raw_measure[1]*0.008993157
          eps_3v3_current_ampere:
            value: raw_measure[2]*0.001327547
          eps_5v_current_ampere:
            value: raw_measure[3]*0.001327547
          eps_battery_current_ampere:
            value: raw_measure[4]*0.005237
          eps_battery_voltage_volts:
            value: raw_measure[5]*0.008978
          eps_sw1_current_ampere:
            value: raw_measure[6]*0.005237
          eps_sw1_voltage_volts:
            value: raw_measure[7]*0.005865
          eps_sw2_current_ampere:
            value: raw_measure[8]*0.005237
          eps_sw2_voltage_volts:
            value: raw_measure[9]*0.004311
          eps_sw3_voltage_volts:
            value: raw_measure[10]*0.008993
          eps_sw3_current_ampere:
            value: raw_measure[11]*0.006239
          eps_sw4_voltage_volts:
            value: raw_measure[12]*0.008993
          eps_sw4_current_ampere:
            value: raw_measure[13]*0.006239
          eps_sw5_voltage_volts:
            value: raw_measure[14]*0.005865
          eps_sw5_current_ampere:
            value: raw_measure[15]*0.001328
          eps_sw6_voltage_volts:
            value: raw_measure[16]*0.005865
          eps_sw6_current_ampere:
            value: raw_measure[17]*0.001328
          eps_sw7_voltage_volts:
            value: raw_measure[18]*0.005865
          eps_sw7_current_ampere:
            value: raw_measure[19]*0.001328
          eps_sw8_voltage_volts:
            value: raw_measure[20]*0.004311
          eps_sw8_current_ampere:
            value: raw_measure[21]*0.001328
          eps_sw9_voltage_volts:
            value: raw_measure[22]*0.004311
          eps_sw9_current_ampere:
            value: raw_measure[23]*0.001328
          eps_temp_celcius:
            value: (0.372434 * raw_measure[24]) -273.15
          eps_bcr1_voltage_volts:
            value: raw_measure[25]*0.0322581
          eps_bcr2_voltage_volts:
            value: raw_measure[26]*0.0322581
          eps_bcr4_voltage_volts:
            value: raw_measure[27]*0.0322581
          eps_bcr5_voltage_volts:
            value: raw_measure[28]*0.0322581
          bat_voltage_volts:
            value: raw_measure[29]*0.008993
          bat_current_ampere:
            value: '(raw_measure[31] < 512) ? -raw_measure[30]*0.014662757 : raw_measure[30]*0.014662757'
          bat_temp_celcius:
            value: (0.3976 * raw_measure[32]) - 238.57
          bat_heater_on:
            value: '(raw_measure[33] < 512) ? false: true'
          bat_heate_ctrl_on:
            value: '(raw_measure[34] < 1) ? false: true'

      comm_rx_info:
        seq:
          - id: raw
            type: u2
            repeat: expr
            repeat-expr: 9
        instances:
          comm_rx_doppler_hz:
            value: raw[0]*13.352-22300
          comm_rx_rssi_dbm:
            value: raw[1]*0.03-152
          comm_rx_voltage_volts:
            value: raw[2]*0.00488
          comm_rx_total_current_ampere:
            value: raw[3]*0.16643964/1000
          comm_rx_tr_current_ampere:
            value: raw[4]*0.16643964/1000
          comm_rx_rx_current_ampere:
            value: raw[5]*0.16643964/1000
          comm_rx_pa_current_ampere:
            value: raw[6]*0.16643964/1000
          comm_rx_pa_temp_degree:
            value: -0.07669*raw[7] + 195.6038
          comm_rx_osci_temp_degree:
            value: -0.07669*raw[8] + 195.6038

      comm_tx_info:
        seq:
          - id: raw
            type: u2
            repeat: expr
            repeat-expr: 9
        instances:
          comm_tx_reflected_db:
            value: raw[0]*raw[0]*5.887*1e-5
          comm_tx_forward_db:
            value: raw[1]*raw[1]*5.887*1e-5
          comm_tx_voltage_volts:
            value: raw[2]*0.00488
          comm_tx_total_current_ampere:
            value: raw[3]*0.16643964/1000
          comm_tx_tr_current_ampere:
            value: raw[4]*0.16643964/1000
          comm_tx_rx_current_ampere:
            value: raw[5]*0.16643964/1000
          comm_tx_pa_current_ampere:
            value: raw[6]*0.16643964/1000
          comm_tx_pa_temp_degree:
            value: -0.07669*raw[7] + 195.6038
          comm_tx_osci_temp_degree:
            value: -0.07669*raw[8] + 195.6038

      comm_antenna_info:
        seq:
          - id: raw_temp
            type: u2
          - id: notdeployed1
            type: b1
          - id: timeout1
            type: b1
          - id: deploying1
            type: b1
          - id: dummy
            type: b1
          - id: notdeployed2
            type: b1
          - id: timeout2
            type: b1
          - id: deploying2
            type: b1
          - id: ignore
            type: b1
          - id: notdeployed3
            type: b1
          - id: timeout3
            type: b1
          - id: deploying3
            type: b1
          - id: independant_burn
            type: b1
          - id: notdeployed4
            type: b1
          - id: timeout4
            type: b1
          - id: deploying4
            type: b1
          - id: armed
            type: b1
          - id: deployment_count
            type: u1
            repeat: expr
            repeat-expr: 4
          - id: raw_deployment_time
            type: u2
            repeat: expr
            repeat-expr: 4
        instances:
          temperature_celcius:
            value: -201/(2.616-0.420)*((raw_temp&0x3FF)*3.3/1024-2.100)
          deployment_time1:
            value: raw_deployment_time[0]*0.05
          deployment_time2:
            value: raw_deployment_time[1]*0.05
          deployment_time3:
            value: raw_deployment_time[2]*0.05
          deployment_time4:
            value: raw_deployment_time[3]*0.05

      adcs_info:
        seq:
          - id: cubesense_tm190
            type: cubesense_tm190_info
          - id: cubesense_tm146
            type: cubesense_tm146_info

        types:
          cubesense_tm190_info:
            seq:
              - id: estimation_mode
                type: b4
                enum: cubesense_estimation_mode_enum
              - id: control_mode
                type: b4
                enum: cubesense_control_mode_enum
              - id: adcs_mode
                type: b2
                enum: cubesense_adcs_mode_enum
              - id: asgp4_mode
                type: b2
                enum: cubesense_asgp4_mode_enum
              - id: cubecontrol_signal_enabled
                type: b1
              - id: cubecontrol_motor_enabled
                type: b1
              - id: cubesence1_enabled
                type: b1
              - id: cubesence2_enable
                type: b1
              - id: cubewheel1_enabled
                type: b1
              - id: cubewheel2_enabled
                type: b1
              - id: cubewheel3_enabled
                type: b1
              - id: cubestar_enabled
                type: b1
              - id: gps_reciver_enabled
                type: b1
              - id: gps_lna_power_enabled
                type: b1
              - id: motor_driver_enabled
                type: b1
              - id: sun_is_above_local_horizon
                type: b1
              - id: errors
                type: b1
              - id: cubesence1_comm_error
                type: b1
              - id: cubesence2_comm_error
                type: b1
              - id: cubecontrol_signal_comm_error
                type: b1
              - id: cubecontrol_motor_comm_error
                type: b1
              - id: cubewheel1_comm_error
                type: b1
              - id: cubewhee2_comm_error
                type: b1
              - id: cubewheel3_comm_error
                type: b1
              - id: cubestar_comm_error
                type: b1
              - id: magnetometer_range_error
                type: b1
              - id: sunsensor_sram_overcurrent_detected
                type: b1
              - id: sunsensor_3v3_overcurrent_detected
                type: b1
              - id: sunsensor_busy_error
                type: b1
              - id: sunsensor_detection_error
                type: b1
              - id: sunsensor_range_error
                type: b1
              - id: nadir_sensor_sram_overcurrent_detected
                type: b1
              - id: nadir_sensor_3v3_overcurrent_detected
                type: b1
              - id: nadir_sensor_busy_error
                type: b1
              - id: nadir_sensor_detection_error
                type: b1
              - id: nadir_sensor_range_error
                type: b1
              - id: rate_sensor_range_error
                type: b1
              - id: wheel_speed_range_error
                type: b1
              - id: coarse_sunsensor_error
                type: b1
              - id: startracker_match_error
                type: b1
              - id: startracker_overcurrent_detected
                type: b1
              - id: orbit_parameters_invalid
                type: b1
              - id: configuration_invalid
                type: b1
              - id: control_mode_change_allowed
                type: b1
              - id: estimator_change_not_allowed
                type: b1
              - id: magnetometer_mode
                type: b2
                enum: magnetometer_mode_enum
              - id: modelled_measured_magnetic_field_missmatch
                type: b1
              - id: node_recovery_error
                type: b1
              - id: cubesense1_runtime_error
                type: b1
              - id: cubesense2_runtime_error
                type: b1
              - id: cubecontrol_signal_runtime_error
                type: b1
              - id: cubecontrol_motor_untime_error
                type: b1
              - id: cubewheel1_runtime_error
                type: b1
              - id: cubewheel2_runtime_error
                type: b1
              - id: cubewheel3_runtime_error
                type: b1
              - id: cubestar_runtime_error
                type: b1
              - id: magnetometer_error
                type: b1
              - id: rate_sensor_failure
                type: b1

          cubesense_tm146_info:
            seq:
              - id: raw
                type: s2
                repeat: expr
                repeat-expr: 3*3
            instances:
              roll_degree:
                value: raw[0]*0.01
              pitch_degree:
                value: raw[1]*0.01
              yaw_degree:
                value: raw[2]*0.01
              q1:
                value: raw[3]*0.0001
              q2:
                value: raw[4]*0.0001
              q3:
                value: raw[5]*0.0001
              x_angular_rate_degree_s:
                value: raw[6]*0.01
              y_angular_rate_degree_s:
                value: raw[7]*0.01
              z_angular_rate_degree_s:
                value: raw[8]*0.01

        enums:
          cubesense_estimation_mode_enum:
            0: disabled
            1: mems_rate
            2: magnetometer_filter
            3: magnetometer_filter_pitch
            4: magnetometer_fine_sun_triad
            5: full_ekf
            6: mems_gyro_ekf

          cubesense_control_mode_enum:
            0: disabled
            1: detumbling
            2: y_thomson
            3: y_wheel_momentum_stabilized_initial
            4: y_wheel_momentum_stabilized_steady_state
            5: xyz_wheel
            6: sun_tracking
            7: target_tracking
            8: very_fast_detumbling
            9: fast_detumbling
            10: user1
            11: user2
            12: rw_off
            13: user3

          cubesense_adcs_mode_enum:
            0: disabled
            1: enabled
            2: triggered

          cubesense_asgp4_mode_enum:
            0: disabled
            1: trigger
            2: background
            3: augment

          magnetometer_mode_enum:
            0: main_signal
            1: redundant_signal
            2: main_motor
            3: none
      hstx_info:
        seq:
          - id: raw
            type: u2
            repeat: expr
            repeat-expr: 8
        instances:
          rf_output_volts:
            value: raw[0]*0.001139
          pa_temp:
            value: raw[1]*0.073242 - 50
          board_temp_top:
            value: raw[2]*0.0625
          board_temp_bottom:
            value: raw[3]*0.0625
          bat_current:
            value: raw[4]*0.000004
          bat_voltage:
            value: raw[5]*0.004
          pa_current:
            value: raw[6]*0.000004
          pa_voltage:
            value: raw[7]*0.004