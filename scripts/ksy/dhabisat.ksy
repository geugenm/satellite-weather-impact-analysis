---
meta:
  id: dhabisat
  title: DhabiSat decoder struct
  endian: le
  bit-endian: le
doc-ref: 'https://gitlab.com/librespacefoundation/satnogs/satnogs-decoders/-/issues/57'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field data_type: ax25_frame.payload.ax25_info.dhabisat_header.data_type
  :field time_stamp: ax25_frame.payload.ax25_info.dhabisat_header.time_stamp
  :field file_index: ax25_frame.payload.ax25_info.dhabisat_header.file_index
  :field interval: ax25_frame.payload.ax25_info.dhabisat_header.interval
  :field total_packets: ax25_frame.payload.ax25_info.dhabisat_header.total_packets
  :field current_packet: ax25_frame.payload.ax25_info.dhabisat_header.current_packet
  :field payload_ax25_info_beacon_type_callsign: ax25_frame.payload.ax25_info.beacon_type.callsign
  :field obc_mode: ax25_frame.payload.ax25_info.beacon_type.obc_mode
  :field obc_reset_count: ax25_frame.payload.ax25_info.beacon_type.obc_reset_count
  :field obc_timestamp: ax25_frame.payload.ax25_info.beacon_type.obc_timestamp
  :field obc_uptime: ax25_frame.payload.ax25_info.beacon_type.obc_uptime
  :field subsystem_safety_criteria: ax25_frame.payload.ax25_info.beacon_type.subsystem_safety_criteria
  :field telemetry_distribution_counter: ax25_frame.payload.ax25_info.beacon_type.telemetry_distribution_counter
  :field obc_temperature: ax25_frame.payload.ax25_info.beacon_type.obc_temperature
  :field camera_voltage: ax25_frame.payload.ax25_info.beacon_type.camera_voltage
  :field camera_current: ax25_frame.payload.ax25_info.beacon_type.camera_current
  :field battery_temperature: ax25_frame.payload.ax25_info.beacon_type.battery_temperature
  :field battery_voltage: ax25_frame.payload.ax25_info.beacon_type.battery_voltage
  :field adcs_5v_voltage: ax25_frame.payload.ax25_info.beacon_type.adcs_5v_voltage
  :field adcs_5v_current: ax25_frame.payload.ax25_info.beacon_type.adcs_5v_current
  :field adcs_5v_power: ax25_frame.payload.ax25_info.beacon_type.adcs_5v_power
  :field adcs_3v3_voltage: ax25_frame.payload.ax25_info.beacon_type.adcs_3v3_voltage
  :field adcs_3v3_current: ax25_frame.payload.ax25_info.beacon_type.adcs_3v3_current
  :field adcs_3v3_power: ax25_frame.payload.ax25_info.beacon_type.adcs_3v3_power
  :field eps_mode: ax25_frame.payload.ax25_info.beacon_type.eps_mode
  :field eps_reset_cause: ax25_frame.payload.ax25_info.beacon_type.eps_reset_cause
  :field eps_uptime: ax25_frame.payload.ax25_info.beacon_type.eps_uptime
  :field eps_error: ax25_frame.payload.ax25_info.beacon_type.eps_error
  :field eps_system_reset_counter_power_on: ax25_frame.payload.ax25_info.beacon_type.eps_system_reset_counter_power_on
  :field eps_system_reset_counter_watchdog: ax25_frame.payload.ax25_info.beacon_type.eps_system_reset_counter_watchdog
  :field eps_system_reset_counter_commanded: ax25_frame.payload.ax25_info.beacon_type.eps_system_reset_counter_commanded
  :field eps_system_reset_counter_controller: ax25_frame.payload.ax25_info.beacon_type.eps_system_reset_counter_controller
  :field eps_system_reset_counter_low_power: ax25_frame.payload.ax25_info.beacon_type.eps_system_reset_counter_low_power
  :field panel_xp_temperature: ax25_frame.payload.ax25_info.beacon_type.panel_xp_temperature
  :field panel_xn_temperature: ax25_frame.payload.ax25_info.beacon_type.panel_xn_temperature
  :field panel_yp_temperature: ax25_frame.payload.ax25_info.beacon_type.panel_yp_temperature
  :field panel_yn_temperature: ax25_frame.payload.ax25_info.beacon_type.panel_yn_temperature
  :field panel_zp_temperature: ax25_frame.payload.ax25_info.beacon_type.panel_zp_temperature
  :field panel_zn_temperature: ax25_frame.payload.ax25_info.beacon_type.panel_zn_temperature
  :field tx_pa_temp: ax25_frame.payload.ax25_info.beacon_type.tx_pa_temp
  :field attitude_estimation_mode: ax25_frame.payload.ax25_info.beacon_type.attitude_estimation_mode
  :field attitude_control_mode: ax25_frame.payload.ax25_info.beacon_type.attitude_control_mode
  :field adcs_run_mode: ax25_frame.payload.ax25_info.beacon_type.adcs_run_mode
  :field asgp4_mode: ax25_frame.payload.ax25_info.beacon_type.asgp4_mode
  :field cubecontrol_signal_enabled: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_signal_enabled
  :field cubecontrol_motor_enabled: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_motor_enabled
  :field cubesense1_enabled: ax25_frame.payload.ax25_info.beacon_type.cubesense1_enabled
  :field cubesense2_enabled: ax25_frame.payload.ax25_info.beacon_type.cubesense2_enabled
  :field cubewheel1_enabled: ax25_frame.payload.ax25_info.beacon_type.cubewheel1_enabled
  :field cubewheel2_enabled: ax25_frame.payload.ax25_info.beacon_type.cubewheel2_enabled
  :field cubewheel3_enabled: ax25_frame.payload.ax25_info.beacon_type.cubewheel3_enabled
  :field cubestar_enabled: ax25_frame.payload.ax25_info.beacon_type.cubestar_enabled
  :field gps_receiver_enabled: ax25_frame.payload.ax25_info.beacon_type.gps_receiver_enabled
  :field gps_lna_power_enabled: ax25_frame.payload.ax25_info.beacon_type.gps_lna_power_enabled
  :field motor_driver_enabled: ax25_frame.payload.ax25_info.beacon_type.motor_driver_enabled
  :field sun_is_above_local_horizon: ax25_frame.payload.ax25_info.beacon_type.sun_is_above_local_horizon
  :field cubesense1_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubesense1_communications_error
  :field cubesense2_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubesense2_communications_error
  :field cubecontrol_signal_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_signal_communications_error
  :field cubecontrol_motor_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_motor_communications_error
  :field cubewheel1_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubewheel1_communications_error
  :field cubewheel2_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubewheel2_communications_error
  :field cubewheel3_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubewheel3_communications_error
  :field cubestar_communications_error: ax25_frame.payload.ax25_info.beacon_type.cubestar_communications_error
  :field magnetometer_range_error: ax25_frame.payload.ax25_info.beacon_type.magnetometer_range_error
  :field cam1_sram_overcurrent_detected: ax25_frame.payload.ax25_info.beacon_type.cam1_sram_overcurrent_detected
  :field cam1_3v3_overcurrent_detected: ax25_frame.payload.ax25_info.beacon_type.cam1_3v3_overcurrent_detected
  :field cam1_sensor_busy_error: ax25_frame.payload.ax25_info.beacon_type.cam1_sensor_busy_error
  :field cam1_sensor_detection_error: ax25_frame.payload.ax25_info.beacon_type.cam1_sensor_detection_error
  :field sun_sensor_range_error: ax25_frame.payload.ax25_info.beacon_type.sun_sensor_range_error
  :field cam2_sram_overcurrent_detected: ax25_frame.payload.ax25_info.beacon_type.cam2_sram_overcurrent_detected
  :field cam2_3v3_overcurrent_detected: ax25_frame.payload.ax25_info.beacon_type.cam2_3v3_overcurrent_detected
  :field cam2_sensor_busy_error: ax25_frame.payload.ax25_info.beacon_type.cam2_sensor_busy_error
  :field cam2_sensor_detection_error: ax25_frame.payload.ax25_info.beacon_type.cam2_sensor_detection_error
  :field nadir_sensor_range_error: ax25_frame.payload.ax25_info.beacon_type.nadir_sensor_range_error
  :field rate_sensor_range_error: ax25_frame.payload.ax25_info.beacon_type.rate_sensor_range_error
  :field wheel_speed_range_error: ax25_frame.payload.ax25_info.beacon_type.wheel_speed_range_error
  :field coarse_sun_sensor_error: ax25_frame.payload.ax25_info.beacon_type.coarse_sun_sensor_error
  :field startracker_match_error: ax25_frame.payload.ax25_info.beacon_type.startracker_match_error
  :field startracker_overcurrent_detected: ax25_frame.payload.ax25_info.beacon_type.startracker_overcurrent_detected
  :field orbit_parameters_are_invalid: ax25_frame.payload.ax25_info.beacon_type.orbit_parameters_are_invalid
  :field configuration_is_invalid: ax25_frame.payload.ax25_info.beacon_type.configuration_is_invalid
  :field control_mode_change_is_not_allowed: ax25_frame.payload.ax25_info.beacon_type.control_mode_change_is_not_allowed
  :field estimator_change_is_not_allowed: ax25_frame.payload.ax25_info.beacon_type.estimator_change_is_not_allowed
  :field current_magnetometer_sampling_mode: ax25_frame.payload.ax25_info.beacon_type.current_magnetometer_sampling_mode
  :field modelled_and_measured_magnetic_field_differs_in_size: ax25_frame.payload.ax25_info.beacon_type.modelled_and_measured_magnetic_field_differs_in_size
  :field node_recovery_error: ax25_frame.payload.ax25_info.beacon_type.node_recovery_error
  :field cubesense1_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubesense1_runtime_error
  :field cubesense2_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubesense2_runtime_error
  :field cubecontrol_signal_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_signal_runtime_error
  :field cubecontrol_motor_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_motor_runtime_error
  :field cubewheel1_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubewheel1_runtime_error
  :field cubewheel2_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubewheel2_runtime_error
  :field cubewheel3_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubewheel3_runtime_error
  :field cubestar_runtime_error: ax25_frame.payload.ax25_info.beacon_type.cubestar_runtime_error
  :field magnetometer_error: ax25_frame.payload.ax25_info.beacon_type.magnetometer_error
  :field rate_sensor_failure: ax25_frame.payload.ax25_info.beacon_type.rate_sensor_failure
  :field padding_1: ax25_frame.payload.ax25_info.beacon_type.padding_1
  :field padding_2: ax25_frame.payload.ax25_info.beacon_type.padding_2
  :field padding_3: ax25_frame.payload.ax25_info.beacon_type.padding_3
  :field estimated_roll_angle: ax25_frame.payload.ax25_info.beacon_type.estimated_roll_angle
  :field estimated_pitch_angle: ax25_frame.payload.ax25_info.beacon_type.estimated_pitch_angle
  :field estimated_yaw_angle: ax25_frame.payload.ax25_info.beacon_type.estimated_yaw_angle
  :field estimated_q1: ax25_frame.payload.ax25_info.beacon_type.estimated_q1
  :field estimated_q2: ax25_frame.payload.ax25_info.beacon_type.estimated_q2
  :field estimated_q3: ax25_frame.payload.ax25_info.beacon_type.estimated_q3
  :field estimated_x_angular_rate: ax25_frame.payload.ax25_info.beacon_type.estimated_x_angular_rate
  :field estimated_y_angular_rate: ax25_frame.payload.ax25_info.beacon_type.estimated_y_angular_rate
  :field estimated_z_angular_rate: ax25_frame.payload.ax25_info.beacon_type.estimated_z_angular_rate
  :field x_position: ax25_frame.payload.ax25_info.beacon_type.x_position
  :field y_position: ax25_frame.payload.ax25_info.beacon_type.y_position
  :field z_position: ax25_frame.payload.ax25_info.beacon_type.z_position
  :field x_velocity: ax25_frame.payload.ax25_info.beacon_type.x_velocity
  :field y_velocity: ax25_frame.payload.ax25_info.beacon_type.y_velocity
  :field z_velocity: ax25_frame.payload.ax25_info.beacon_type.z_velocity
  :field latitude: ax25_frame.payload.ax25_info.beacon_type.latitude
  :field longitude: ax25_frame.payload.ax25_info.beacon_type.longitude
  :field altitude: ax25_frame.payload.ax25_info.beacon_type.altitude
  :field ecef_position_x: ax25_frame.payload.ax25_info.beacon_type.ecef_position_x
  :field ecef_position_y: ax25_frame.payload.ax25_info.beacon_type.ecef_position_y
  :field ecef_position_z: ax25_frame.payload.ax25_info.beacon_type.ecef_position_z
  :field cubesense1_3v3_current: ax25_frame.payload.ax25_info.beacon_type.cubesense1_3v3_current
  :field cubesense1_cam_sram_current: ax25_frame.payload.ax25_info.beacon_type.cubesense1_cam_sram_current
  :field cubesense2_3v3_current: ax25_frame.payload.ax25_info.beacon_type.cubesense2_3v3_current
  :field cubesense2_cam_sram_current: ax25_frame.payload.ax25_info.beacon_type.cubesense2_cam_sram_current
  :field cubecontrol_3v3_current: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_3v3_current
  :field cubecontrol_5v_current: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_5v_current
  :field cubecontrol_vbat_current: ax25_frame.payload.ax25_info.beacon_type.cubecontrol_vbat_current
  :field wheel1current: ax25_frame.payload.ax25_info.beacon_type.wheel1current
  :field wheel2current: ax25_frame.payload.ax25_info.beacon_type.wheel2current
  :field wheel3current: ax25_frame.payload.ax25_info.beacon_type.wheel3current
  :field cubestarcurrent: ax25_frame.payload.ax25_info.beacon_type.cubestarcurrent
  :field magnetorquercurrent: ax25_frame.payload.ax25_info.beacon_type.magnetorquercurrent
  :field cubestar_mcu_temperature: ax25_frame.payload.ax25_info.beacon_type.cubestar_mcu_temperature
  :field adcs_mcu_temperature: ax25_frame.payload.ax25_info.beacon_type.adcs_mcu_temperature
  :field magnetometer_temperature: ax25_frame.payload.ax25_info.beacon_type.magnetometer_temperature
  :field redundant_magnetometer_temperature: ax25_frame.payload.ax25_info.beacon_type.redundant_magnetometer_temperature
  :field xrate_sensor_temperature: ax25_frame.payload.ax25_info.beacon_type.xrate_sensor_temperature
  :field yrate_sensor_temperature: ax25_frame.payload.ax25_info.beacon_type.yrate_sensor_temperature
  :field zrate_sensor_temperature: ax25_frame.payload.ax25_info.beacon_type.zrate_sensor_temperature
  :field x_angular_rate: ax25_frame.payload.ax25_info.beacon_type.x_angular_rate
  :field y_angular_rate: ax25_frame.payload.ax25_info.beacon_type.y_angular_rate
  :field z_angular_rate: ax25_frame.payload.ax25_info.beacon_type.z_angular_rate
  :field x_wheelspeed: ax25_frame.payload.ax25_info.beacon_type.x_wheelspeed
  :field y_wheelspeed: ax25_frame.payload.ax25_info.beacon_type.y_wheelspeed
  :field z_wheelspeed: ax25_frame.payload.ax25_info.beacon_type.z_wheelspeed
  :field message: ax25_frame.payload.ax25_info.beacon_type.message

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
            - '"A68MY "'
            - '"A68MX "'
            - '"A68KU "'
            - '"NOCALL"'
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
        size-eos: true
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type: dhabisat_payload
        size-eos: true
  dhabisat_payload:
    seq:
      - id: dhabisat_header
        type: dhabisat_header_t
      - id: beacon_type
        type:
          switch-on: _io.size
          cases:
            187: dhabisat_beacon
            _: dhabisat_generic_packet
  dhabisat_header_t:
    seq:
      - id: data_type
        -orig-id: data_type
        type: u1
        doc: 'value = data_type'
      - id: time_stamp
        -orig-id: time_stamp
        type: u4
        doc: 'value = time_stamp'
      - id: file_index
        -orig-id: file_index
        type: u2
        doc: 'value = file_index'
      - id: interval
        -orig-id: interval
        type: u2
        doc: 'value = interval'
      - id: total_packets
        -orig-id: total_packets
        type: u2
        doc: 'value = total_packets'
      - id: current_packet
        -orig-id: current_packet
        type: u2
        doc: 'value = current_packet'
  dhabisat_beacon:
    seq:
      - id: callsign
        -orig-id: Callsign
        type: str
        encoding: utf-8
        size: 5
      - id: obc_mode
        -orig-id: OBC mode
        type: u1
        doc: |
          value = obc_mode [n]
          0: Initial Checkout Mode
          1: Normal Mode
          2: Safe Mode
      - id: obc_reset_count
        -orig-id: OBC reset count
        type: u4
        doc: 'value = obc_reset_count [n]'
      - id: obc_timestamp
        -orig-id: OBC timestamp
        type: u4
        doc: 'value = obc_timestamp [s]'
      - id: obc_uptime
        -orig-id: OBC up time
        type: u4
        doc: 'value = obc_uptime [s]'
      - id: subsystem_safety_criteria
        -orig-id: Subsystem Safety Criteria
        type: u1
        doc: 'value = subsystem_safety_criteria'
      - id: telemetry_distribution_counter
        -orig-id: Telemetry Distribution Counter
        type: u4
        doc: 'value = telemetry_distribution_counter [n]'
      - id: obc_temperature
        -orig-id: OBC Temperature
        type: u1
        doc: 'value = obc_temperature - 128 [oC]'
      - id: camera_voltage
        -orig-id: Camera Voltage
        type: u1
        doc: 'value = camera_voltage / 10 [V]'
      - id: camera_current
        -orig-id: Camera Current
        type: u2
        doc: 'value = camera_current [mA]'
      - id: battery_temperature
        -orig-id: Battery Temperature
        type: s2
        doc: 'value = battery_temperature /100 [oC]'
      - id: battery_voltage
        -orig-id: Battery Voltage
        type: s2
        doc: 'value = battery_voltage /1000 [V]'
      - id: adcs_5v_voltage
        -orig-id: ADCS 5V voltage
        type: u2
        doc: 'value = adcs_5v_voltage /1000 [V]'
      - id: adcs_5v_current
        -orig-id: adcs_5V_current
        type: u2
        doc: 'value = adcs_5v_current /1000 [A]'
      - id: adcs_5v_power
        -orig-id: adcs_5V_power
        type: u2
        doc: 'value = adcs_5v_power /100 [W]'
      - id: adcs_3v3_voltage
        -orig-id: ADCS 3.3V voltage
        type: u2
        doc: 'value = adcs_3v3_voltage /1000 [V]'
      - id: adcs_3v3_current
        -orig-id: adcs_3V3_current
        type: u2
        doc: 'value = adcs_3v3_current /1000 [A]'
      - id: adcs_3v3_power
        -orig-id: adcs_3V3_power
        type: u2
        doc: 'value = adcs_3v3_power /100 [W]'
      - id: eps_mode
        -orig-id: eps_mode
        type: u1
        doc: 'value = eps_mode'
      - id: eps_reset_cause
        -orig-id: eps_reset_cause
        type: u1
        doc: 'value = eps_reset_cause'
      - id: eps_uptime
        -orig-id: eps_uptime
        type: u4
        doc: 'value = eps_uptime (s)'
      - id: eps_error
        -orig-id: eps_error
        type: u2
        doc: 'value = eps_error'
      - id: eps_system_reset_counter_power_on
        -orig-id: System Reset Counter Power On
        type: u2
        doc: 'value = eps_system_reset_counter_power_on'
      - id: eps_system_reset_counter_watchdog
        -orig-id: System Reset Counter Watchdog
        type: u2
        doc: 'value = eps_system_reset_counter_watchdog'
      - id: eps_system_reset_counter_commanded
        -orig-id: System Reset Counter Commanded
        type: u2
        doc: 'value = eps_system_reset_counter_commanded'
      - id: eps_system_reset_counter_controller
        -orig-id: System Reset Counter Controller
        type: u2
        doc: 'value = eps_system_reset_counter_controller'
      - id: eps_system_reset_counter_low_power
        -orig-id: System Reset Counter Low Power
        type: u2
        doc: 'value = eps_system_reset_counter_low_power'
      - id: panel_xp_temperature
        -orig-id: Panel X+ Temperature
        type: u1
        doc: 'value = panel_xp_temperature - 128 [oC]'
      - id: panel_xn_temperature
        -orig-id: Panel X- Temperature
        type: u1
        doc: 'value = panel_xn_temperature - 128 [oC]'
      - id: panel_yp_temperature
        -orig-id: Panel Y+ Temperature
        type: u1
        doc: 'value = panel_yp_temperature - 128 [oC]'
      - id: panel_yn_temperature
        -orig-id: Panel Y- Temperature
        type: u1
        doc: 'value = panel_yn_temperature - 128 [oC]'
      - id: panel_zp_temperature
        -orig-id: Panel Z+ Temperature
        type: u1
        doc: 'value = panel_zp_temperature - 128 [oC]'
      - id: panel_zn_temperature
        -orig-id: Panel Z- Temperature
        type: u1
        doc: 'value = panel_zn_temperature - 128 [oC]'
      - id: tx_pa_temp
        -orig-id: TX Power Amplifier temperature
        type: s2
        doc: 'value = (tx_pa_temp * -0.07669) + 195.6037 [oC]'
      - id: attitude_estimation_mode
        type: b4
      - id: attitude_control_mode
        type: b4
      - id: adcs_run_mode
        type: b2
      - id: asgp4_mode
        type: b2
      - id: cubecontrol_signal_enabled
        type: b1
      - id: cubecontrol_motor_enabled
        type: b1
      - id: cubesense1_enabled
        type: b1
      - id: cubesense2_enabled
        type: b1
      - id: cubewheel1_enabled
        type: b1
      - id: cubewheel2_enabled
        type: b1
      - id: cubewheel3_enabled
        type: b1
      - id: cubestar_enabled
        type: b1
      - id: gps_receiver_enabled
        type: b1
      - id: gps_lna_power_enabled
        type: b1
      - id: motor_driver_enabled
        type: b1
      - id: sun_is_above_local_horizon
        type: b1
      - id: cubesense1_communications_error
        type: b1
      - id: cubesense2_communications_error
        type: b1
      - id: cubecontrol_signal_communications_error
        type: b1
      - id: cubecontrol_motor_communications_error
        type: b1
      - id: cubewheel1_communications_error
        type: b1
      - id: cubewheel2_communications_error
        type: b1
      - id: cubewheel3_communications_error
        type: b1
      - id: cubestar_communications_error
        type: b1
      - id: magnetometer_range_error
        type: b1
      - id: cam1_sram_overcurrent_detected
        type: b1
      - id: cam1_3v3_overcurrent_detected
        type: b1
      - id: cam1_sensor_busy_error
        type: b1
      - id: cam1_sensor_detection_error
        type: b1
      - id: sun_sensor_range_error
        type: b1
      - id: cam2_sram_overcurrent_detected
        type: b1
      - id: cam2_3v3_overcurrent_detected
        type: b1
      - id: cam2_sensor_busy_error
        type: b1
      - id: cam2_sensor_detection_error
        type: b1
      - id: nadir_sensor_range_error
        type: b1
      - id: rate_sensor_range_error
        type: b1
      - id: wheel_speed_range_error
        type: b1
      - id: coarse_sun_sensor_error
        type: b1
      - id: startracker_match_error
        type: b1
      - id: startracker_overcurrent_detected
        type: b1
      - id: orbit_parameters_are_invalid
        type: b1
      - id: configuration_is_invalid
        type: b1
      - id: control_mode_change_is_not_allowed
        type: b1
      - id: estimator_change_is_not_allowed
        type: b1
      - id: current_magnetometer_sampling_mode
        type: b2
      - id: modelled_and_measured_magnetic_field_differs_in_size
        type: b1
      - id: node_recovery_error
        type: b1
      - id: cubesense1_runtime_error
        type: b1
      - id: cubesense2_runtime_error
        type: b1
      - id: cubecontrol_signal_runtime_error
        type: b1
      - id: cubecontrol_motor_runtime_error
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
      - id: padding_1
        type: b6
      - id: padding_2
        type: u2
      - id: padding_3
        type: u1
      - id: estimated_roll_angle
        -orig-id: Estimated Roll Angle
        type: s2
        doc: 'value = estimated_roll_angle / 100 [deg]'
      - id: estimated_pitch_angle
        -orig-id: Estimated Pitch Angle
        type: s2
        doc: 'value = estimated_pitch_angle / 100 [deg]'
      - id: estimated_yaw_angle
        -orig-id: Estimated Yaw Angle
        type: s2
        doc: 'value = estimated_yaw_angle / 100 [deg]'
      - id: estimated_q1
        -orig-id: Estimated q1
        type: s2
        doc: 'value = estimated_q1 / 100000'
      - id: estimated_q2
        -orig-id: Estimated q2
        type: s2
        doc: 'value = estimated_q2 / 100000'
      - id: estimated_q3
        -orig-id: Estimated q3
        type: s2
        doc: 'value = estimated_q3 / 100000'
      - id: estimated_x_angular_rate
        -orig-id: Estimated X Angular Rate
        type: s2
        doc: 'value = estimated_x_angular_rate / 100 [deg/s]'
      - id: estimated_y_angular_rate
        -orig-id: Estimated Y Angular Rate
        type: s2
        doc: 'value = estimated_y_angular_rate / 100 [deg/s]'
      - id: estimated_z_angular_rate
        -orig-id: Estimated Z Angular Rate
        type: s2
        doc: 'value = estimated_z_angular_rate / 100 [deg/s]'
      - id: x_position
        -orig-id: x_position
        type: s2
        doc: 'value = x_position / 100 [km]'
      - id: y_position
        -orig-id: y_position
        type: s2
        doc: 'value = y_position / 100 [km]'
      - id: z_position
        -orig-id: z_position
        type: s2
        doc: 'value = z_position / 100 [km]'
      - id: x_velocity
        -orig-id: x_velocity
        type: s2
        doc: 'value = x_velocity / 100 [m/s]'
      - id: y_velocity
        -orig-id: y_velocity
        type: s2
        doc: 'value = y_velocity / 100 [m/s]'
      - id: z_velocity
        -orig-id: z_velocity
        type: s2
        doc: 'value = z_velocity / 100 [m/s]'
      - id: latitude
        -orig-id: latitude
        type: s2
        doc: 'value = latitude / 100 [deg]'
      - id: longitude
        -orig-id: longitude
        type: s2
        doc: 'value = longitude / 100 [deg]'
      - id: altitude
        -orig-id: altitude
        type: s2
        doc: 'value = altitude / 100  [km]'
      - id: ecef_position_x
        -orig-id: ECEF Position X
        type: s2
        doc: 'value = ecef_position_x / 100 [m]'
      - id: ecef_position_y
        -orig-id: ECEF Position Y
        type: s2
        doc: 'value = ecef_position_y / 100 [m]'
      - id: ecef_position_z
        -orig-id: ECEF Position Z
        type: s2
        doc: 'value = ecef_position_z / 100 [m]'
      - id: cubesense1_3v3_current
        -orig-id: CubeSense1 3V3 Current
        type: u2
        doc: 'value = cubesense1_3v3_current * 0.1 [mA]'
      - id: cubesense1_cam_sram_current
        -orig-id: CubeSense1 Cam SRAM Current
        type: u2
        doc: 'value = cubesense1_cam_sram_current * 0.1 [mA]'
      - id: cubesense2_3v3_current
        -orig-id: CubeSense2 3V3 Current
        type: u2
        doc: 'value = cubesense2_3v3_current * 0.1 [mA]'
      - id: cubesense2_cam_sram_current
        -orig-id: CubeSense2 Cam SRAM Current
        type: u2
        doc: 'value = cubesense2_cam_sram_current * 0.1 [mA]'
      - id: cubecontrol_3v3_current
        -orig-id: CubeControl 3V3 Current
        type: u2
        doc: 'value = cubecontrol_3v3_current * 0.48828125 [mA]'
      - id: cubecontrol_5v_current
        -orig-id: CubeControl 5V Current
        type: u2
        doc: 'value = cubecontrol_5v_current * 0.48828125 [mA]'
      - id: cubecontrol_vbat_current
        -orig-id: CubeControl VBatt Current
        type: u2
        doc: 'value = cubecontrol_vbat_current * 0.48828125 [mA]'
      - id: wheel1current
        -orig-id: Wheel1Current
        type: u2
        doc: 'value = wheel1current * 0.01 [mA]'
      - id: wheel2current
        -orig-id: Wheel2Current
        type: u2
        doc: 'value = wheel2current * 0.01 [mA]'
      - id: wheel3current
        -orig-id: Wheel3Current
        type: u2
        doc: 'value = wheel3current * 0.01 [mA]'
      - id: cubestarcurrent
        -orig-id: CubeStarCurrent
        type: u2
        doc: 'value = cubestarcurrent * 0.01 [mA]'
      - id: magnetorquercurrent
        -orig-id: MagnetorquerCurrent
        type: u2
        doc: 'value = magnetorquercurrent * 0.1 [mA]'
      - id: cubestar_mcu_temperature
        -orig-id: CubeStar MCU temperature
        type: s2
        doc: 'value = cubestar_mcu_temperature / 100 [oC]'
      - id: adcs_mcu_temperature
        -orig-id: ADCS MCU Temperature
        type: s2
        doc: 'value = adcs_mcu_temperature [oC]'
      - id: magnetometer_temperature
        -orig-id: Magnetometer Temperature
        type: s2
        doc: 'value = magnetometer_temperature / 10 [oC]'
      - id: redundant_magnetometer_temperature
        -orig-id: Redundant Magnetometer Temperature
        type: s2
        doc: 'value = redundant_magnetometer_temperature / 10 [oC]'
      - id: xrate_sensor_temperature
        -orig-id: XRate Sensor Temperature
        type: s2
        doc: 'value = xrate_sensor_temperature [oC]'
      - id: yrate_sensor_temperature
        -orig-id: YRate Sensor Temperature
        type: s2
        doc: 'value = yrate_sensor_temperature [oC]'
      - id: zrate_sensor_temperature
        -orig-id: ZRate Sensor Temperature
        type: s2
        doc: 'value = zrate_sensor_temperature [oC]'
      - id: x_angular_rate
        -orig-id: X_AngularRate
        type: s2
        doc: 'value = x_angular_rate / 100 [deg/s]'
      - id: y_angular_rate
        -orig-id: Y_AngularRate
        type: s2
        doc: 'value = y_angular_rate / 100 [deg/s]'
      - id: z_angular_rate
        -orig-id: Z_AngularRate
        type: s2
        doc: 'value = z_angular_rate / 100 [deg/s]'
      - id: x_wheelspeed
        -orig-id: X_WheelSpeed
        type: s2
        doc: 'value = x_wheelspeed [rpm]'
      - id: y_wheelspeed
        -orig-id: Y_WheelSpeed
        type: s2
        doc: 'value = y_wheelspeed [rpm]'
      - id: z_wheelspeed
        -orig-id: Z_WheelSpeed
        type: s2
        doc: 'value = z_wheelspeed [rpm]'
  dhabisat_generic_packet:
    seq:
      - id: message
        type: str
        encoding: utf-8
        size-eos: true
instances:
  frame_length:
    value: _io.size
