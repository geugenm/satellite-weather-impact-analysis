---
meta:
  id: cas9
  title: XW-3 (CAS-9) telemetry decoder struct
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packet_identifier: ax25_frame.payload.ax25_info.packet_identifier
  :field sat_time_year: ax25_frame.payload.ax25_info.cas9_payload.sat_time.year
  :field sat_time_month: ax25_frame.payload.ax25_info.cas9_payload.sat_time.month
  :field sat_time_day: ax25_frame.payload.ax25_info.cas9_payload.sat_time.day
  :field sat_time_hour: ax25_frame.payload.ax25_info.cas9_payload.sat_time.hour
  :field sat_time_minute: ax25_frame.payload.ax25_info.cas9_payload.sat_time.minute
  :field sat_time_second: ax25_frame.payload.ax25_info.cas9_payload.sat_time.second
  :field reset_time_year: ax25_frame.payload.ax25_info.cas9_payload.reset_time.year
  :field reset_time_month: ax25_frame.payload.ax25_info.cas9_payload.reset_time.month
  :field reset_time_day: ax25_frame.payload.ax25_info.cas9_payload.reset_time.day
  :field reset_time_hour: ax25_frame.payload.ax25_info.cas9_payload.reset_time.hour
  :field reset_time_minute: ax25_frame.payload.ax25_info.cas9_payload.reset_time.minute
  :field reset_time_second: ax25_frame.payload.ax25_info.cas9_payload.reset_time.second
  :field total_reset_counter: ax25_frame.payload.ax25_info.cas9_payload.total_reset_counter
  :field tft_counter: ax25_frame.payload.ax25_info.cas9_payload.tft_counter
  :field rcfr_counter: ax25_frame.payload.ax25_info.cas9_payload.rcfr_counter
  :field rcce_counter: ax25_frame.payload.ax25_info.cas9_payload.rcce_counter
  :field rccf_counter: ax25_frame.payload.ax25_info.cas9_payload.rccf_counter
  :field wdg_switch_status: ax25_frame.payload.ax25_info.cas9_payload.wdg_switch_status
  :field cpu_io_aqu_wdg_reset_counter: ax25_frame.payload.ax25_info.cas9_payload.cpu_io_aqu_wdg_reset_counter
  :field adc_sw_wdg_reset_counter: ax25_frame.payload.ax25_info.cas9_payload.adc_sw_wdg_reset_counter
  :field tmp_meas_sw_wdg_reset_counter: ax25_frame.payload.ax25_info.cas9_payload.tmp_meas_sw_wdg_reset_counter
  :field rem_ctrl_sw_wdg_reset_counter: ax25_frame.payload.ax25_info.cas9_payload.rem_ctrl_sw_wdg_reset_counter
  :field working_status_1: ax25_frame.payload.ax25_info.cas9_payload.working_status_1
  :field working_status_2: ax25_frame.payload.ax25_info.cas9_payload.working_status_2
  :field working_status_3: ax25_frame.payload.ax25_info.cas9_payload.working_status_3
  :field pwr_supply_voltage: ax25_frame.payload.ax25_info.cas9_payload.pwr_supply_voltage_12v.w1w2
  :field vu_12v_power_supply_current: ax25_frame.payload.ax25_info.cas9_payload.vu_12v_power_supply_current
  :field vu_5v_power_supply_voltage: ax25_frame.payload.ax25_info.cas9_payload.vu_5v_power_supply_voltage.w1w2
  :field vu_3v8_power_supply_voltage: ax25_frame.payload.ax25_info.cas9_payload.vu_3v8_power_supply_voltage.w1w2
  :field ihu_3v3_voltage_1: ax25_frame.payload.ax25_info.cas9_payload.ihu_3v3_voltage_1.w1w2
  :field ihu_3v3_voltage_2: ax25_frame.payload.ax25_info.cas9_payload.ihu_3v3_voltage_2.w1w2
  :field ihu_3v8_current: ax25_frame.payload.ax25_info.cas9_payload.ihu_3v8_current
  :field uhf_transmitter_3v8_current: ax25_frame.payload.ax25_info.cas9_payload.uhf_transmitter_3v8_current
  :field vhf_receiver_3v8_current: ax25_frame.payload.ax25_info.cas9_payload.vhf_receiver_3v8_current
  :field vhf_agc_voltage: ax25_frame.payload.ax25_info.cas9_payload.vhf_agc_voltage.w1w2
  :field rf_transmit_power: ax25_frame.payload.ax25_info.cas9_payload.rf_transmit_power
  :field rf_reflected_power: ax25_frame.payload.ax25_info.cas9_payload.rf_reflected_power
  :field thermoelectric_generator_voltage_1: ax25_frame.payload.ax25_info.cas9_payload.thermoelectric_generator_voltage_1.w1w2
  :field thermoelectric_generator_voltage_2: ax25_frame.payload.ax25_info.cas9_payload.thermoelectric_generator_voltage_2.w1w2
  :field uhf_transmitter_pa_temperature: ax25_frame.payload.ax25_info.cas9_payload.uhf_transmitter_pa_temperature
  :field vhf_receiver_temperature: ax25_frame.payload.ax25_info.cas9_payload.vhf_receiver_temperature
  :field ihu_temperature: ax25_frame.payload.ax25_info.cas9_payload.ihu_temperature
  :field thermoelectric_generator_temperature_1: ax25_frame.payload.ax25_info.cas9_payload.thermoelectric_generator_temperature_1
  :field thermoelectric_generator_temperature_2: ax25_frame.payload.ax25_info.cas9_payload.thermoelectric_generator_temperature_2
  :field current_delay_telemetry_interval_hour: ax25_frame.payload.ax25_info.cas9_payload.current_delay_telemetry_interval.hour
  :field current_delay_telemetry_interval_minute: ax25_frame.payload.ax25_info.cas9_payload.current_delay_telemetry_interval.minute
  :field current_delay_telemetry_interval_second: ax25_frame.payload.ax25_info.cas9_payload.current_delay_telemetry_interval.second
  :field delay_telemetry_start_time_setting_year: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_start_time_setting.year
  :field delay_telemetry_start_time_setting_month: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_start_time_setting.month
  :field delay_telemetry_start_time_setting_day: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_start_time_setting.day
  :field delay_telemetry_start_time_setting_hour: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_start_time_setting.hour
  :field delay_telemetry_start_time_setting_minute: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_start_time_setting.minute
  :field delay_telemetry_start_time_setting_second: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_start_time_setting.second
  :field delay_telemetry_interval_setting_hour: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_interval_setting.hour
  :field delay_telemetry_interval_setting_minute: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_interval_setting.minute
  :field delay_telemetry_interval_setting_second: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_interval_setting.second
  :field delay_telemetry_times_setting_delay_time: ax25_frame.payload.ax25_info.cas9_payload.delay_telemetry_times_setting.delay_time
  :field attitude_quaternion_q0: ax25_frame.payload.ax25_info.cas9_payload.attitude_quaternion_q0.q
  :field attitude_quaternion_q1: ax25_frame.payload.ax25_info.cas9_payload.attitude_quaternion_q1.q
  :field attitude_quaternion_q2: ax25_frame.payload.ax25_info.cas9_payload.attitude_quaternion_q2.q
  :field attitude_quaternion_q3: ax25_frame.payload.ax25_info.cas9_payload.attitude_quaternion_q3.q
  :field x_axis_angular_speed: ax25_frame.payload.ax25_info.cas9_payload.x_axis_angular_speed.w
  :field y_axis_angular_speed: ax25_frame.payload.ax25_info.cas9_payload.y_axis_angular_speed.w
  :field z_axis_angular_speed: ax25_frame.payload.ax25_info.cas9_payload.z_axis_angular_speed.w
  :field satellite_time_uptime: ax25_frame.payload.ax25_info.cas9_payload.satellite_time_seconds.sat_uptime
  :field satellite_time_milliseconds: ax25_frame.payload.ax25_info.cas9_payload.satellite_time_milliseconds
  :field primary_bus_voltage: ax25_frame.payload.ax25_info.cas9_payload.primary_bus_voltage.w1w2
  :field load_total_current: ax25_frame.payload.ax25_info.cas9_payload.load_total_current.w1w2
  :field solar_array_current: ax25_frame.payload.ax25_info.cas9_payload.solar_array_current.w1w2
  :field battery_charging_current: ax25_frame.payload.ax25_info.cas9_payload.battery_charging_current.w1w2
  :field battery_discharge_current: ax25_frame.payload.ax25_info.cas9_payload.battery_discharge_current.w1w2
  :field pos_5v3_supply_voltage: ax25_frame.payload.ax25_info.cas9_payload.pos_5v3_supply_voltage.w1w2
  :field attitude_control_mode: ax25_frame.payload.ax25_info.cas9_payload.attitude_control_mode
  :field satellite_longitude: ax25_frame.payload.ax25_info.cas9_payload.satellite_longitude
  :field satellite_latitude: ax25_frame.payload.ax25_info.cas9_payload.satellite_latitude
  :field rolling_angle_estimation: ax25_frame.payload.ax25_info.cas9_payload.rolling_angle_estimation
  :field pitch_angle_estimation: ax25_frame.payload.ax25_info.cas9_payload.pitch_angle_estimation
  :field yaw_angle_estimation: ax25_frame.payload.ax25_info.cas9_payload.yaw_angle_estimation
  :field uplink_remote_control_data_block_counter: ax25_frame.payload.ax25_info.cas9_payload.uplink_remote_control_data_block_counter
  :field x_band_transceiver_working_status: ax25_frame.payload.ax25_info.cas9_payload.x_band_transceiver_working_status
  :field x_band_transceiver_agc_voltage: ax25_frame.payload.ax25_info.cas9_payload.x_band_transceiver_agc_voltage.w1w2
  :field x_band_transceiver_transmit_power_level: ax25_frame.payload.ax25_info.cas9_payload.x_band_transceiver_transmit_power_level.w1w2
  :field x_band_transceiver_spi_interface_status: ax25_frame.payload.ax25_info.cas9_payload.x_band_transceiver_spi_interface_status
  :field article_1_year: ax25_frame.payload.ax25_info.cas9_payload.article_1.year
  :field article_1_month: ax25_frame.payload.ax25_info.cas9_payload.article_1.month
  :field article_1_day: ax25_frame.payload.ax25_info.cas9_payload.article_1.day
  :field article_1_hour: ax25_frame.payload.ax25_info.cas9_payload.article_1.hour
  :field article_1_minute: ax25_frame.payload.ax25_info.cas9_payload.article_1.minute
  :field article_1_second: ax25_frame.payload.ax25_info.cas9_payload.article_1.second
  :field article_1_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_1.cam_id
  :field article_1_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_1.photo_counter
  :field article_2_year: ax25_frame.payload.ax25_info.cas9_payload.article_2.year
  :field article_2_month: ax25_frame.payload.ax25_info.cas9_payload.article_2.month
  :field article_2_day: ax25_frame.payload.ax25_info.cas9_payload.article_2.day
  :field article_2_hour: ax25_frame.payload.ax25_info.cas9_payload.article_2.hour
  :field article_2_minute: ax25_frame.payload.ax25_info.cas9_payload.article_2.minute
  :field article_2_second: ax25_frame.payload.ax25_info.cas9_payload.article_2.second
  :field article_2_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_2.cam_id
  :field article_2_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_2.photo_counter
  :field article_3_year: ax25_frame.payload.ax25_info.cas9_payload.article_3.year
  :field article_3_month: ax25_frame.payload.ax25_info.cas9_payload.article_3.month
  :field article_3_day: ax25_frame.payload.ax25_info.cas9_payload.article_3.day
  :field article_3_hour: ax25_frame.payload.ax25_info.cas9_payload.article_3.hour
  :field article_3_minute: ax25_frame.payload.ax25_info.cas9_payload.article_3.minute
  :field article_3_second: ax25_frame.payload.ax25_info.cas9_payload.article_3.second
  :field article_3_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_3.cam_id
  :field article_3_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_3.photo_counter
  :field article_4_year: ax25_frame.payload.ax25_info.cas9_payload.article_4.year
  :field article_4_month: ax25_frame.payload.ax25_info.cas9_payload.article_4.month
  :field article_4_day: ax25_frame.payload.ax25_info.cas9_payload.article_4.day
  :field article_4_hour: ax25_frame.payload.ax25_info.cas9_payload.article_4.hour
  :field article_4_minute: ax25_frame.payload.ax25_info.cas9_payload.article_4.minute
  :field article_4_second: ax25_frame.payload.ax25_info.cas9_payload.article_4.second
  :field article_4_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_4.cam_id
  :field article_4_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_4.photo_counter
  :field article_5_year: ax25_frame.payload.ax25_info.cas9_payload.article_5.year
  :field article_5_month: ax25_frame.payload.ax25_info.cas9_payload.article_5.month
  :field article_5_day: ax25_frame.payload.ax25_info.cas9_payload.article_5.day
  :field article_5_hour: ax25_frame.payload.ax25_info.cas9_payload.article_5.hour
  :field article_5_minute: ax25_frame.payload.ax25_info.cas9_payload.article_5.minute
  :field article_5_second: ax25_frame.payload.ax25_info.cas9_payload.article_5.second
  :field article_5_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_5.cam_id
  :field article_5_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_5.photo_counter
  :field article_6_year: ax25_frame.payload.ax25_info.cas9_payload.article_6.year
  :field article_6_month: ax25_frame.payload.ax25_info.cas9_payload.article_6.month
  :field article_6_day: ax25_frame.payload.ax25_info.cas9_payload.article_6.day
  :field article_6_hour: ax25_frame.payload.ax25_info.cas9_payload.article_6.hour
  :field article_6_minute: ax25_frame.payload.ax25_info.cas9_payload.article_6.minute
  :field article_6_second: ax25_frame.payload.ax25_info.cas9_payload.article_6.second
  :field article_6_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_6.cam_id
  :field article_6_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_6.photo_counter
  :field article_7_year: ax25_frame.payload.ax25_info.cas9_payload.article_7.year
  :field article_7_month: ax25_frame.payload.ax25_info.cas9_payload.article_7.month
  :field article_7_day: ax25_frame.payload.ax25_info.cas9_payload.article_7.day
  :field article_7_hour: ax25_frame.payload.ax25_info.cas9_payload.article_7.hour
  :field article_7_minute: ax25_frame.payload.ax25_info.cas9_payload.article_7.minute
  :field article_7_second: ax25_frame.payload.ax25_info.cas9_payload.article_7.second
  :field article_7_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_7.cam_id
  :field article_7_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_7.photo_counter
  :field article_8_year: ax25_frame.payload.ax25_info.cas9_payload.article_8.year
  :field article_8_month: ax25_frame.payload.ax25_info.cas9_payload.article_8.month
  :field article_8_day: ax25_frame.payload.ax25_info.cas9_payload.article_8.day
  :field article_8_hour: ax25_frame.payload.ax25_info.cas9_payload.article_8.hour
  :field article_8_minute: ax25_frame.payload.ax25_info.cas9_payload.article_8.minute
  :field article_8_second: ax25_frame.payload.ax25_info.cas9_payload.article_8.second
  :field article_8_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_8.cam_id
  :field article_8_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_8.photo_counter
  :field article_9_year: ax25_frame.payload.ax25_info.cas9_payload.article_9.year
  :field article_9_month: ax25_frame.payload.ax25_info.cas9_payload.article_9.month
  :field article_9_day: ax25_frame.payload.ax25_info.cas9_payload.article_9.day
  :field article_9_hour: ax25_frame.payload.ax25_info.cas9_payload.article_9.hour
  :field article_9_minute: ax25_frame.payload.ax25_info.cas9_payload.article_9.minute
  :field article_9_second: ax25_frame.payload.ax25_info.cas9_payload.article_9.second
  :field article_9_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_9.cam_id
  :field article_9_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_9.photo_counter
  :field article_10_year: ax25_frame.payload.ax25_info.cas9_payload.article_10.year
  :field article_10_month: ax25_frame.payload.ax25_info.cas9_payload.article_10.month
  :field article_10_day: ax25_frame.payload.ax25_info.cas9_payload.article_10.day
  :field article_10_hour: ax25_frame.payload.ax25_info.cas9_payload.article_10.hour
  :field article_10_minute: ax25_frame.payload.ax25_info.cas9_payload.article_10.minute
  :field article_10_second: ax25_frame.payload.ax25_info.cas9_payload.article_10.second
  :field article_10_cam_id: ax25_frame.payload.ax25_info.cas9_payload.article_10.cam_id
  :field article_10_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.article_10.photo_counter
  :field photo_information_year: ax25_frame.payload.ax25_info.cas9_payload.photo_information.year
  :field photo_information_month: ax25_frame.payload.ax25_info.cas9_payload.photo_information.month
  :field photo_information_day: ax25_frame.payload.ax25_info.cas9_payload.photo_information.day
  :field photo_information_hour: ax25_frame.payload.ax25_info.cas9_payload.photo_information.hour
  :field photo_information_minute: ax25_frame.payload.ax25_info.cas9_payload.photo_information.minute
  :field photo_information_second: ax25_frame.payload.ax25_info.cas9_payload.photo_information.second
  :field photo_information_cam_id: ax25_frame.payload.ax25_info.cas9_payload.photo_information.cam_id
  :field photo_information_photo_counter: ax25_frame.payload.ax25_info.cas9_payload.photo_information.photo_counter
  :field photo_specs: ax25_frame.payload.ax25_info.cas9_payload.photo_specs

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
instances:
  framelength:
    value: _io.size
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
      - id: ctl
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
        encoding: ASCII
        size: 6
        valid:
          any-of:
            - '"CAS9  "'
            - '"CQ    "'
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
      - id: packet_identifier
        type: u1
      - id: cas9_payload
        size-eos: true
        type:
          switch-on: packet_identifier
          cases:
            0x01: cas9_telemetry_t
            0x02: photo_storage_info_t
            0x03: photo_data_t
    instances:
      payload_size:
        value: _io.size
  cas9_telemetry_t:
    meta:
      endian: be
    seq:
      - id: function_code
        size: 6
        contents: [0x00, 0x01, 0x00, 0x01, 0x00, 0x7E]
      - id: sat_time
        type: sat_time_t
        doc: 'Satellite time'
      - id: reset_time
        type: sat_time_t
        doc: '48 hours reset time'
      - id: total_reset_counter
        type: u1
        doc: |
          Total reset counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: tft_counter
        type: u1
        doc: |
          Telemetry Frame Transmission Counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: rcfr_counter
        type: u1
        doc: |
          Remote control frame reception counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: rcce_counter
        type: u1
        doc: |
          Remote control command execution counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: rccf_counter
        type: u1
        doc: |
          Remote control command forwarding counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: wdg_switch_status
        type: u1
        doc: |
          Watchdog switch status
          b7b6b5b4: reserved
          b3: VU CPU I/O acquisition watchdog (0 off/1 on)
          b2: ADC software watchdog (0 off/1 on)
          b1: Temperature measurement software watchdog (0 off/1 on)
          b0: Remote control software watchdog (0 off/1 on)
      - id: cpu_io_aqu_wdg_reset_counter
        type: u1
        doc: |
          CPU I/O acquisition watchdog reset counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: adc_sw_wdg_reset_counter
        type: u1
        doc: |
          ADC software watchdog reset counter
          W1 is an integer. Restart counting from 0 after counting up
      - id: tmp_meas_sw_wdg_reset_counter
        type: u1
        doc: |
          Temperature measurement software watchdog reset counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: rem_ctrl_sw_wdg_reset_counter
        type: u1
        doc: |
          Remote control software watchdog reset counter
          W1 is an integer. Restart counting from 0 after counting up
          Range: 0~255
      - id: working_status_1
        type: u1
        doc: |
          Working status 1
          b7: Allow to set to track mode (0 disable/1 enable)
          b6: Photo download enable (0 disable/1 enable)
          b5: Delayed telemetry switch status (0 off/1 on)
          b4: Test mode enable (0 disable/1 enable)
          b3: 0: Linear transponder off; 1: Linear transponder on.
          b2: OBDH time calibration enable (0 disable/1 enable)
          b1: Telemetry transmit RF power(0 low power/1 high power)
          b0: Program control mode enable (0-disable/1 enable)
      - id: working_status_2
        type: u1
        doc: |
          Working status 2
          b7: In-orbit mode (0 not In-orbit/1 In-orbit)
          b6: Battery discharge switch is on (0 off/1 on)
          b5: Program control mode switch enable (0 disable/1 enable)
          b4: OBDH B on A off power distribution switch status (0 off/1 on)
          b3: OBDH A on B off power distribution switch status (0 off/1 on)
          b2: VHF antenna deployed state (0 not deployed/1 deployed)
          b1: UHF antenna expanded state (0 not expanded/1 expanded)
          b0: the status of the total antenna deployment switch (0 off/1 on)
      - id: working_status_3
        type: u1
        doc: |
          Working status 3
          b7: Waiting for into orbit mode (0 not/1 waiting)
          b6: On-Track mode (0 non/1 On-track)
          b5: OBDH SPI state (0 normal/1 failure)
          b4: ADC I2C state (0 normal/1 failure)
          b3: Temperature measurement I2C state (0 normal/1 failure)
          b2: Clock I2C state (0 normal/1 failure)
          b1: Inertial navigator serial port state (0 normal/1 failure)
          b0: Flash SPI state (0 normal/1 failure)
      - id: pwr_supply_voltage_12v
        type: int_to_decimals_1_t
        doc: |
          12V power supply voltage
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~15.0(V)
      - id: vu_12v_power_supply_current
        type: u2
        doc: |
          VU 12V power supply current
          W1W2 is an integer Range: 0~1500(mA)
      - id: vu_5v_power_supply_voltage
        type: int_to_decimals_2_t
        doc: |
          VU 5V power supply voltage
          W1 is the integer part, W2 is the decimal part (2 decimal places)
          Range: 0~10.00(V)
      - id: vu_3v8_power_supply_voltage
        type: int_to_decimals_2_t
        doc: |
          VU 3.8V power supply voltage
          W1 is the integer part, W2 is the decimal part (2 decimal places)
          Range: 0~5.00(V)
      - id: ihu_3v3_voltage_1
        type: int_to_decimals_2_t
        doc: |
          IHU 3.3V voltage 1
          W1 is the integer part, W2 is the decimal part (2 decimal places)
          Range: 0V~5.00(V)
      - id: ihu_3v3_voltage_2
        type: int_to_decimals_2_t
        doc: |
          IHU 3.3V voltage 1
          W1 is the integer part, W2 is the decimal part (2 decimal places)
          Range: 0V~5.00(V)
      - id: ihu_3v8_current
        type: u2
        doc: |
          IHU 3.8V current
          W1W2 is an integer Range: 0~500(mA)
      - id: uhf_transmitter_3v8_current
        type: u2
        doc: |
          UHF transmitter 3.8V current
          W1W2 is an integer Range: 0~500(mA)
      - id: vhf_receiver_3v8_current
        type: u2
        doc: |
          VHF receiver 3.8V current
          W1W2 is an integer Range: 0~500(mA)
      - id: vhf_agc_voltage
        type: int_to_decimals_2_t
        doc: |
          VHF AGC voltage
          W1 is the integer part, W2 is the decimal part (2 decimal places)
          Range: 0~5.00(V)
      - id: rf_transmit_power
        type: u2
        doc: |
          RF transmit power
          W1W2 is an integer Range: 0~2000(mW)
      - id: rf_reflected_power
        type: u2
        doc: |
          RF reflected power
          W1W2 is an integer Range: 0~1000(mW)
      - id: thermoelectric_generator_voltage_1
        type: int_to_decimals_1_t
        doc: |
          Thermoelectric generator voltage 1
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~30.0(V)
      - id: thermoelectric_generator_voltage_2
        type: int_to_decimals_1_t
        doc: |
          Thermoelectric generator voltage 2
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~30.0(V)
      - id: uhf_transmitter_pa_temperature
        type: s1
        doc: |
          UHF Transmitter PA temperature
          B7 of W1 is the sign bit, 0 is positive, 1 is negative;
          b6~b0 are numerical bits
          Range: -100~+100(°C)
      - id: vhf_receiver_temperature
        type: s1
        doc: |
          VHF Receiver temperature
          B7 of W1 is the sign bit, 0 is positive, 1 is negative;
          b6~b0 are numerical bits
          Range: -100~+100(°C)
      - id: ihu_temperature
        type: s1
        doc: |
          IHU temperature
          B7 of W1 is the sign bit, 0 is positive, 1 is negative;
          b6~b0 are numerical bits
          Range: -100~+100(°C)
      - id: thermoelectric_generator_temperature_1
        type: s1
        doc: |
          Thermoelectric generator temperature 1
          B7 of W1 is the sign bit, 0 is positive, 1 is negative;
          b6~b0 are numerical bits
          Range: -127~+127(°C)
      - id: thermoelectric_generator_temperature_2
        type: s1
        doc: |
          Thermoelectric generator temperature 2
          B7 of W1 is the sign bit, 0 is positive, 1 is negative;
          b6~b0 are numerical bits
          Range: -127~+127(°C)
      - id: current_delay_telemetry_interval
        type: sat_interval_t
        doc: |
          Current delay telemetry interval
      - id: delay_telemetry_start_time_setting
        type: sat_time_t
        doc: |
          Delay telemetry start time setting
      - id: delay_telemetry_interval_setting
        type: sat_interval_t
        doc: |
          Delay telemetry interval setting
      - id: delay_telemetry_times_setting
        type: delay_times_t
        doc: |
          Delay telemetry times setting
      - id: attitude_quaternion_q0
        type: att_quaternion_t
        doc: |
          Attitude quaternion q0
      - id: attitude_quaternion_q1
        type: att_quaternion_t
        doc: |
          Attitude quaternion q1
      - id: attitude_quaternion_q2
        type: att_quaternion_t
        doc: |
          Attitude quaternion q2
      - id: attitude_quaternion_q3
        type: att_quaternion_t
        doc: |
          Attitude quaternion q3
      - id: x_axis_angular_speed
        type: angular_speed_t
        doc: |
          X-axis angular speed
      - id: y_axis_angular_speed
        type: angular_speed_t
        doc: |
          Y-axis angular speed
      - id: z_axis_angular_speed
        type: angular_speed_t
        doc: |
          Z-axis angular speed
      - id: satellite_time_seconds
        type: sat_time_seconds_t
        doc: |
          Satellite time seconds
      - id: satellite_time_milliseconds
        type: u2
        doc: |
          Satellite time milliseconds
          W1W2 is an integer
      - id: primary_bus_voltage
        type: int_to_decimals_1_t
        doc: |
          Satellite primary bus voltage
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~30.0(V)
      - id: load_total_current
        type: int_to_decimals_1_t
        doc: |
          Satellite load total current
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~10.0(A)
      - id: solar_array_current
        type: int_to_decimals_1_t
        doc: |
          Solar array current
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~10.0(A)
      - id: battery_charging_current
        type: int_to_decimals_1_t
        doc: |
          Battery charging current
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~ -10.0(A)
      - id: battery_discharge_current
        type: int_to_decimals_1_t
        doc: |
          Battery discharge current
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~10.0(A)
      - id: pos_5v3_supply_voltage
        type: int_to_decimals_1_t
        doc: |
          +5.3V supply voltage
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~30.0(V)
      - id: attitude_control_mode
        type: u1
        doc: |
          Satellite attitude control mode
          b7~b0 (the following are hexadecimal representations, where b7~b4 correspond to the main operating mode, and b3~b0 correspond to the sub-mode):
          0x00--Active segment mode
          0x11—Full attitude capture mode: Rate damping
          0x12—Full attitude capture mode: Sun search
          0x13—Full attitude capture mode: Orientation to sun
          0x14—Full attitude capture mode: Orientation to the ground
          0x15—Full attitude capture mode: Maneuvering to the sun
          0x20—Attitude maneuver mode
            0x23—Attitude maneuver mode: Switch to cruise to the sun
            0x24—Attitude maneuver mode: Switch to normal operation
            0x25—Attitude maneuver mode: Switch to offset flight
            0x26—Attitude maneuver mode: Switch to a fixed point to stare
            0x27—Attitude maneuver mode: Switch to inertial space pointing
          0x30—Cruising mode to the sun
          0x40—Normal operating mode
          0x50-Biased flight mode
          0x60—Fixed-point staring mode
          0x70—Inertial space pointing mode
          0xB0—Track control mode
          0xC0—Stop control mode
          0xD0-Reset mode
          Other: Invalid mode
      - id: satellite_longitude
        type: s1
        doc: |
          Satellite longitude
          B7 of W1 is a character bit, 0 is positive, 1 is negative;
          b6~b0 are numeric bits
          Range: N*2, (-180 o ~180 deg)
      - id: satellite_latitude
        type: s1
        doc: |
          Satellite longitude
          B7 of W1 is a character bit, 0 is positive, 1 is negative;
          b6~b0 are numeric bits
          Range: N*2, (-90 o ~90 deg)
      - id: rolling_angle_estimation
        type: s1
        doc: |
          Rolling angle estimation
          B7 of W1 is a character bit, 0 is positive, 1 is negative;
          b6~b0 are numeric bits
          Range: -125~+125 deg
      - id: pitch_angle_estimation
        type: s1
        doc: |
          Pitch angle estimation
          B7 of W1 is a character bit, 0 is positive, 1 is negative;
          b6~b0 are numeric bits
          Range: -125~+125 deg
      - id: yaw_angle_estimation
        type: s1
        doc: |
          Yaw angle estimation
          B7 of W1 is a character bit, 0 is positive, 1 is negative;
          b6~b0 are numeric bits
          Range: -125~+125 deg
      - id: uplink_remote_control_data_block_counter
        type: u2
        doc: |
          Uplink remote control data block counter
          W1 is the high byte, W2 is the low byte
          Range: 0~65535
      - id: x_band_transceiver_working_status
        type: u1
        doc: |
          X-band transceiver working status
          b7: X-band transceiver transmitter switch status 1: On; 0: Off
          b6: X-band transceiver position synchronization lock indication 1: locked; 0: lost lock
          b5: X-band transceiver remote control carrier lock indication 1: locked; 0: lost lock
          b4: X-band transceiver remote control pseudo code lock indication 1: locked; 0: lost lock
          b3: CRC check status of X-band transceiver remote control data 1: CRC is correct; 0: CRC is wrong
          b2: X-band transceiver remote control channel status self-check 1: valid; 0: invalid
          b1b0: X-band transceiver remote control code group status 01: Code group 1; 10: Code group 2
      - id: x_band_transceiver_agc_voltage
        type: int_to_decimals_1_t
        doc: |
          X-band transceiver AGC voltage
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~6.6(V)
      - id: x_band_transceiver_transmit_power_level
        type: int_to_decimals_1_t
        doc: |
          X-band transceiver transmit power level
          W1 is the integer part, W2 is the decimal part (1 decimal place)
          Range: 0~6.6(V)
      - id: x_band_transceiver_spi_interface_status
        type: u1
        doc: |
          X-band transceiver SPI interface status
          b7~b4: X-band transceiver baseband execution counter 0 ~15
          b3b2: X-band transceiver SPI interface empty flag 01: valid; 10: invalid
          b1: X-band transceiver SPI-MISO data with or without monitoring 1: with data; 0: without data
          b0: X-band transceiver SPI-MOSI data with or without monitoring 1: with data; 0: without data
  sat_time_t:
    doc: |
        W1-Year: 00~99, representing 2000~2099
        W2-Month: 01~12, representing January to December
        W3-Day: 01~31, representing 1st~31st
        W4-Hour: 00~23, representing 0:00~23:00
        W5-minute: 00~59, representing 0 minutes~59 minutes
        W6-second: 00~59, representing 0 seconds~59 seconds
    seq:
      - id: year
        type: u1
      - id: month
        type: u1
      - id: day
        type: u1
      - id: hour
        type: u1
      - id: minute
        type: u1
      - id: second
        type: u1
  sat_interval_t:
    doc: |
      W1-Hour: 00~23, representing 0:00~23:00
      W2-Minute: 00~59, representing 0 minute~59 minutes
      W3-second: 00~59, representing 0 second~59 seconds
    seq:
      - id: hour
        type: u1
      - id: minute
        type: u1
      - id: second
        type: u1
  delay_times_t:
    doc: |
      Delay telemetry times setting
      W1W2W3 is an integer Range: 0 ~ 16777215
    seq:
      - id: delay_h
        type: u1
      - id: delay_m
        type: u1
      - id: delay_l
        type: u1
    instances:
      delay_time:
        value: (delay_h << 16) | (delay_m << 8) | delay_l
  att_quaternion_t:
    doc: |
      Attitude quaternion q[0..3]
      q[0..3]=((Q_H<<8)|Q_L)/32768
    seq:
      - id: q_l
        type: u1
      - id: q_h
        type: u1
    instances:
      q:
        value: ((q_h << 8) | q_l) / 32768.0
  angular_speed_t:
    doc: |
      [X..Z]-axis angular speed
      W1W2:W_L W_H W=((W_H<<8)|W_L)/32768*2000(°/s)
    seq:
      - id: w_l
        type: u1
      - id: w_h
        type: u1
    instances:
      w:
        value: ((w_h << 8) | w_l) / 32768.0 * 2000.0
  sat_time_seconds_t:
    doc: |
      Satellite time seconds
      W1 second highest byte
      W2 second high byte
      W3 second low byte
      W4 second lowest byte
      The four bytes are the accumulated value of the whole second of UTC since 0:00:00:00 UTC on January 1, 2009 (0:00 after the jumped second).
    seq:
      - id: sat_uptime
        type: u4
  int_to_decimals_1_t:
    doc: |
      W1 is the integer part, W2 is the decimal part (1 decimal place)
    seq:
      - id: w1
        type: u1
      - id: w2
        type: u1
    instances:
      w1w2:
        value: (w1 * 10 + w2) / 10.0
  int_to_decimals_2_t:
    doc: |
      W1 is the integer part, W2 is the decimal part (2 decimal place)
    seq:
      - id: w1
        type: u1
      - id: w2
        type: u1
    instances:
      w1w2:
        value: (w1 * 100 + w2) / 100.0
  photo_storage_info_t:
    meta:
      endian: be
    seq:
      - id: function_code
        size: 6
        contents: [0x00, 0x01, 0x00, 0x01, 0x00, 0x57]
      - id: article_1
        type: photo_storage_information_t
      - id: article_2
        type: photo_storage_information_t
      - id: article_3
        type: photo_storage_information_t
      - id: article_4
        type: photo_storage_information_t
      - id: article_5
        type: photo_storage_information_t
      - id: article_6
        type: photo_storage_information_t
      - id: article_7
        type: photo_storage_information_t
      - id: article_8
        type: photo_storage_information_t
      - id: article_9
        type: photo_storage_information_t
      - id: article_10
        type: photo_storage_information_t
  photo_storage_information_t:
    seq:
      - id: year
        type: u1
      - id: month
        type: u1
      - id: day
        type: u1
      - id: hour
        type: u1
      - id: minute
        type: u1
      - id: second
        type: u1
      - id: cam_id
        type: b5
      - id: photo_counter
        type: b11
  photo_data_t:
    seq:
      - id: photo_information
        type: photo_storage_information_t
      - id: photo_specs
        type: u1
      - id: photo_data
        size-eos: true
