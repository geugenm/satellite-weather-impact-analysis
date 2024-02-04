---
meta:
  id: cas5a
  title: CAS-5A beacon and image data decoder
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field function_code_main: ax25_frame.payload.function_code_main
  :field function_code_spare1: ax25_frame.payload.function_code_spare1
  :field function_code_sub: ax25_frame.payload.function_code_sub
  :field function_code_sub_spare1: ax25_frame.payload.function_code_sub_spare1
  :field sub_function_code_main: ax25_frame.payload.sub_function_code_main
  :field function_rev: ax25_frame.payload.function_rev
  :field sat_time_year: ax25_frame.payload.payload.sat_time_year
  :field sat_time_month: ax25_frame.payload.payload.sat_time_month
  :field sat_time_day: ax25_frame.payload.payload.sat_time_day
  :field sat_time_hour: ax25_frame.payload.payload.sat_time_hour
  :field sat_time_minute: ax25_frame.payload.payload.sat_time_minute
  :field sat_time_second: ax25_frame.payload.payload.sat_time_second
  :field ihu_total_reset_counter: ax25_frame.payload.payload.ihu_total_reset_counter
  :field battery_status: ax25_frame.payload.payload.battery_status
  :field remote_control_frame_reception_counter: ax25_frame.payload.payload.remote_control_frame_reception_counter
  :field remote_control_command_execution_counter: ax25_frame.payload.payload.remote_control_command_execution_counter
  :field telemetry_frame_transmission_counter: ax25_frame.payload.payload.telemetry_frame_transmission_counter
  :field ihu_status_1: ax25_frame.payload.payload.ihu_status_1
  :field reserved_00: ax25_frame.payload.payload.reserved_00
  :field i2c_bus_status: ax25_frame.payload.payload.i2c_bus_status
  :field reserved_01: ax25_frame.payload.payload.reserved_01
  :field reserved_02: ax25_frame.payload.payload.reserved_02
  :field reserved_03: ax25_frame.payload.payload.reserved_03
  :field ihu_status_2: ax25_frame.payload.payload.ihu_status_2
  :field ihu_status_3: ax25_frame.payload.payload.ihu_status_3
  :field px_cabin_inner_plate_temp: ax25_frame.payload.payload.px_cabin_inner_plate_temp
  :field nx_cabin_inner_plate_temp: ax25_frame.payload.payload.nx_cabin_inner_plate_temp
  :field pdcu_temp: ax25_frame.payload.payload.pdcu_temp
  :field dcdc_temp: ax25_frame.payload.payload.dcdc_temp
  :field pz_cabin_inner_plate_temp: ax25_frame.payload.payload.pz_cabin_inner_plate_temp
  :field nz_cabin_inner_plate_temp: ax25_frame.payload.payload.nz_cabin_inner_plate_temp
  :field px_solar_array_temp: ax25_frame.payload.payload.px_solar_array_temp
  :field nx_solar_array_temp: ax25_frame.payload.payload.nx_solar_array_temp
  :field py_solar_array_temp: ax25_frame.payload.payload.py_solar_array_temp
  :field ny_solar_array_temp: ax25_frame.payload.payload.ny_solar_array_temp
  :field pz_solar_array_temp: ax25_frame.payload.payload.pz_solar_array_temp
  :field nz_solar_array_temp: ax25_frame.payload.payload.nz_solar_array_temp
  :field bat_pack_1_temp_1: ax25_frame.payload.payload.bat_pack_1_temp_1
  :field bat_pack_1_temp_2: ax25_frame.payload.payload.bat_pack_1_temp_2
  :field bat_pack_2_temp_3: ax25_frame.payload.payload.bat_pack_2_temp_3
  :field bat_pack_2_temp_4: ax25_frame.payload.payload.bat_pack_2_temp_4
  :field ihu_temp: ax25_frame.payload.payload.ihu_temp
  :field uhf1_pa_temp: ax25_frame.payload.payload.uhf1_pa_temp
  :field cam3_temp: ax25_frame.payload.payload.cam3_temp
  :field cam1_temp: ax25_frame.payload.payload.cam1_temp
  :field cam2_temp: ax25_frame.payload.payload.cam2_temp
  :field uhf2_pa_temp: ax25_frame.payload.payload.uhf2_pa_temp
  :field battery_voltage_integer: ax25_frame.payload.payload.battery_voltage_integer
  :field battery_voltage_decimal: ax25_frame.payload.payload.battery_voltage_decimal
  :field primary_power_supply_integer: ax25_frame.payload.payload.primary_power_supply_integer
  :field primary_power_supply_decimal: ax25_frame.payload.payload.primary_power_supply_decimal
  :field bus_voltage_5v_integer: ax25_frame.payload.payload.bus_voltage_5v_integer
  :field bus_voltage_5v_decimal: ax25_frame.payload.payload.bus_voltage_5v_decimal
  :field bus_voltage_3v8_integer: ax25_frame.payload.payload.bus_voltage_3v8_integer
  :field bus_voltage_3v8_decimal: ax25_frame.payload.payload.bus_voltage_3v8_decimal
  :field ihu_voltage_3v3_integer: ax25_frame.payload.payload.ihu_voltage_3v3_integer
  :field ihu_voltage_3v3_decimal: ax25_frame.payload.payload.ihu_voltage_3v3_decimal
  :field total_solar_array_current: ax25_frame.payload.payload.total_solar_array_current
  :field primary_bus_current: ax25_frame.payload.payload.primary_bus_current
  :field total_load_current: ax25_frame.payload.payload.total_load_current
  :field ihu_current: ax25_frame.payload.payload.ihu_current
  :field reserved_04: ax25_frame.payload.payload.reserved_04
  :field hf_receiver_current: ax25_frame.payload.payload.hf_receiver_current
  :field reserved_05: ax25_frame.payload.payload.reserved_05
  :field uhf_transmitter_2_current: ax25_frame.payload.payload.uhf_transmitter_2_current
  :field ht_agc_voltage_integer: ax25_frame.payload.payload.ht_agc_voltage_integer
  :field ht_agc_voltage_decimal: ax25_frame.payload.payload.ht_agc_voltage_decimal
  :field uhf_transmitter_1_current: ax25_frame.payload.payload.uhf_transmitter_1_current
  :field uhf1_rf_power: ax25_frame.payload.payload.uhf1_rf_power
  :field uhf2_rf_power: ax25_frame.payload.payload.uhf2_rf_power
  :field vhf_receiver_current: ax25_frame.payload.payload.vhf_receiver_current
  :field vhf_agc_voltage_integer: ax25_frame.payload.payload.vhf_agc_voltage_integer
  :field vhf_agc_voltage_decimal: ax25_frame.payload.payload.vhf_agc_voltage_decimal
  :field delayed_telemetry_start_time_year: ax25_frame.payload.payload.delayed_telemetry_start_time_year
  :field delayed_telemetry_start_time_month: ax25_frame.payload.payload.delayed_telemetry_start_time_month
  :field delayed_telemetry_start_time_day: ax25_frame.payload.payload.delayed_telemetry_start_time_day
  :field delayed_telemetry_start_time_hour: ax25_frame.payload.payload.delayed_telemetry_start_time_hour
  :field delayed_telemetry_start_time_minute: ax25_frame.payload.payload.delayed_telemetry_start_time_minute
  :field delayed_telemetry_start_time_second: ax25_frame.payload.payload.delayed_telemetry_start_time_second
  :field delayed_telemetry_interval_time_hour: ax25_frame.payload.payload.delayed_telemetry_interval_time_hour
  :field delayed_telemetry_interval_time_minute: ax25_frame.payload.payload.delayed_telemetry_interval_time_minute
  :field delayed_telemetry_interval_time_second: ax25_frame.payload.payload.delayed_telemetry_interval_time_second
  :field delayed_telemetry_frequency_h: ax25_frame.payload.payload.delayed_telemetry_frequency_h
  :field delayed_telemetry_frequency_m: ax25_frame.payload.payload.delayed_telemetry_frequency_m
  :field delayed_telemetry_frequency_l: ax25_frame.payload.payload.delayed_telemetry_frequency_l
  :field cam_controller_operating_current: ax25_frame.payload.payload.cam_controller_operating_current
  :field cam_controller_operating_voltage_integer: ax25_frame.payload.payload.cam_controller_operating_voltage_integer
  :field cam_controller_operating_voltage_decimal: ax25_frame.payload.payload.cam_controller_operating_voltage_decimal
  :field total_cam_current: ax25_frame.payload.payload.total_cam_current
  :field cam_working_status: ax25_frame.payload.payload.cam_working_status
  :field cam1_photo_counter: ax25_frame.payload.payload.cam1_photo_counter
  :field cam2_photo_counter: ax25_frame.payload.payload.cam2_photo_counter
  :field cam3_photo_counter: ax25_frame.payload.payload.cam3_photo_counter
  :field cam1_delayed_photography_start_time_year: ax25_frame.payload.payload.cam1_delayed_photography_start_time_year
  :field cam1_delayed_photography_start_time_month: ax25_frame.payload.payload.cam1_delayed_photography_start_time_month
  :field cam1_delayed_photography_start_time_day: ax25_frame.payload.payload.cam1_delayed_photography_start_time_day
  :field cam1_delayed_photography_start_time_hour: ax25_frame.payload.payload.cam1_delayed_photography_start_time_hour
  :field cam1_delayed_photography_start_time_minute: ax25_frame.payload.payload.cam1_delayed_photography_start_time_minute
  :field cam1_delayed_photography_start_time_second: ax25_frame.payload.payload.cam1_delayed_photography_start_time_second
  :field cam1_delayed_photography_interval_time_hour: ax25_frame.payload.payload.cam1_delayed_photography_interval_time_hour
  :field cam1_delayed_photography_interval_time_minute: ax25_frame.payload.payload.cam1_delayed_photography_interval_time_minute
  :field cam1_delayed_photography_interval_time_second: ax25_frame.payload.payload.cam1_delayed_photography_interval_time_second
  :field cam1_delayed_photography_frequency: ax25_frame.payload.payload.cam1_delayed_photography_frequency
  :field cam2_delayed_photography_start_time_year: ax25_frame.payload.payload.cam2_delayed_photography_start_time_year
  :field cam2_delayed_photography_start_time_month: ax25_frame.payload.payload.cam2_delayed_photography_start_time_month
  :field cam2_delayed_photography_start_time_day: ax25_frame.payload.payload.cam2_delayed_photography_start_time_day
  :field cam2_delayed_photography_start_time_hour: ax25_frame.payload.payload.cam2_delayed_photography_start_time_hour
  :field cam2_delayed_photography_start_time_minute: ax25_frame.payload.payload.cam2_delayed_photography_start_time_minute
  :field cam2_delayed_photography_start_time_second: ax25_frame.payload.payload.cam2_delayed_photography_start_time_second
  :field cam2_delayed_photography_interval_time_hour: ax25_frame.payload.payload.cam2_delayed_photography_interval_time_hour
  :field cam2_delayed_photography_interval_time_minute: ax25_frame.payload.payload.cam2_delayed_photography_interval_time_minute
  :field cam2_delayed_photography_interval_time_second: ax25_frame.payload.payload.cam2_delayed_photography_interval_time_second
  :field cam2_delayed_photography_frequency: ax25_frame.payload.payload.cam2_delayed_photography_frequency
  :field cam3_delayed_photography_start_time_year: ax25_frame.payload.payload.cam3_delayed_photography_start_time_year
  :field cam3_delayed_photography_start_time_month: ax25_frame.payload.payload.cam3_delayed_photography_start_time_month
  :field cam3_delayed_photography_start_time_day: ax25_frame.payload.payload.cam3_delayed_photography_start_time_day
  :field cam3_delayed_photography_start_time_hour: ax25_frame.payload.payload.cam3_delayed_photography_start_time_hour
  :field cam3_delayed_photography_start_time_minute: ax25_frame.payload.payload.cam3_delayed_photography_start_time_minute
  :field cam3_delayed_photography_start_time_second: ax25_frame.payload.payload.cam3_delayed_photography_start_time_second
  :field cam3_delayed_photography_interval_time_hour: ax25_frame.payload.payload.cam3_delayed_photography_interval_time_hour
  :field cam3_delayed_photography_interval_time_minute: ax25_frame.payload.payload.cam3_delayed_photography_interval_time_minute
  :field cam3_delayed_photography_interval_time_second: ax25_frame.payload.payload.cam3_delayed_photography_interval_time_second
  :field cam3_delayed_photography_frequency: ax25_frame.payload.payload.cam3_delayed_photography_frequency
  :field satellite_current_operating_mode: ax25_frame.payload.payload.satellite_current_operating_mode
  :field satellite_device_switch_status: ax25_frame.payload.payload.satellite_device_switch_status
  :field time_48hrs_reset_year: ax25_frame.payload.payload.time_48hrs_reset_year
  :field time_48hrs_reset_month: ax25_frame.payload.payload.time_48hrs_reset_month
  :field time_48hrs_reset_day: ax25_frame.payload.payload.time_48hrs_reset_day
  :field time_48hrs_reset_hour: ax25_frame.payload.payload.time_48hrs_reset_hour
  :field time_48hrs_reset_minute: ax25_frame.payload.payload.time_48hrs_reset_minute
  :field time_48hrs_reset_second: ax25_frame.payload.payload.time_48hrs_reset_second
  :field att_q0_l: ax25_frame.payload.payload.att_q0_l
  :field att_q0_h: ax25_frame.payload.payload.att_q0_h
  :field att_q1_l: ax25_frame.payload.payload.att_q1_l
  :field att_q1_h: ax25_frame.payload.payload.att_q1_h
  :field att_q2_l: ax25_frame.payload.payload.att_q2_l
  :field att_q2_h: ax25_frame.payload.payload.att_q2_h
  :field att_q3_l: ax25_frame.payload.payload.att_q3_l
  :field att_q3_h: ax25_frame.payload.payload.att_q3_h
  :field cam1_resolution: ax25_frame.payload.payload.cam1_resolution
  :field cam1_image_quality: ax25_frame.payload.payload.cam1_image_quality
  :field cam2_resolution: ax25_frame.payload.payload.cam2_resolution
  :field cam2_image_quality: ax25_frame.payload.payload.cam2_image_quality
  :field cam3_resolution: ax25_frame.payload.payload.cam3_resolution
  :field cam3_image_quality: ax25_frame.payload.payload.cam3_image_quality
  :field current_delayed_telemetry_interval_time_hour: ax25_frame.payload.payload.current_delayed_telemetry_interval_time_hour
  :field current_delayed_telemetry_interval_time_minute: ax25_frame.payload.payload.current_delayed_telemetry_interval_time_minute
  :field current_delayed_telemetry_interval_time_second: ax25_frame.payload.payload.current_delayed_telemetry_interval_time_second
  :field photo_cat_info_content_0_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_0.year
  :field photo_cat_info_content_0_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_0.month
  :field photo_cat_info_content_0_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_0.day
  :field photo_cat_info_content_0_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_0.hour
  :field photo_cat_info_content_0_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_0.minute
  :field photo_cat_info_content_0_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_0.second
  :field photo_cat_info_content_0_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_0.meta
  :field photo_cat_info_content_1_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_1.year
  :field photo_cat_info_content_1_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_1.month
  :field photo_cat_info_content_1_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_1.day
  :field photo_cat_info_content_1_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_1.hour
  :field photo_cat_info_content_1_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_1.minute
  :field photo_cat_info_content_1_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_1.second
  :field photo_cat_info_content_1_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_1.meta
  :field photo_cat_info_content_2_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_2.year
  :field photo_cat_info_content_2_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_2.month
  :field photo_cat_info_content_2_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_2.day
  :field photo_cat_info_content_2_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_2.hour
  :field photo_cat_info_content_2_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_2.minute
  :field photo_cat_info_content_2_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_2.second
  :field photo_cat_info_content_2_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_2.meta
  :field photo_cat_info_content_3_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_3.year
  :field photo_cat_info_content_3_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_3.month
  :field photo_cat_info_content_3_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_3.day
  :field photo_cat_info_content_3_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_3.hour
  :field photo_cat_info_content_3_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_3.minute
  :field photo_cat_info_content_3_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_3.second
  :field photo_cat_info_content_3_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_3.meta
  :field photo_cat_info_content_4_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_4.year
  :field photo_cat_info_content_4_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_4.month
  :field photo_cat_info_content_4_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_4.day
  :field photo_cat_info_content_4_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_4.hour
  :field photo_cat_info_content_4_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_4.minute
  :field photo_cat_info_content_4_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_4.second
  :field photo_cat_info_content_4_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_4.meta
  :field photo_cat_info_content_5_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_5.year
  :field photo_cat_info_content_5_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_5.month
  :field photo_cat_info_content_5_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_5.day
  :field photo_cat_info_content_5_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_5.hour
  :field photo_cat_info_content_5_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_5.minute
  :field photo_cat_info_content_5_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_5.second
  :field photo_cat_info_content_5_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_5.meta
  :field photo_cat_info_content_6_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_6.year
  :field photo_cat_info_content_6_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_6.month
  :field photo_cat_info_content_6_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_6.day
  :field photo_cat_info_content_6_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_6.hour
  :field photo_cat_info_content_6_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_6.minute
  :field photo_cat_info_content_6_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_6.second
  :field photo_cat_info_content_6_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_6.meta
  :field photo_cat_info_content_7_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_7.year
  :field photo_cat_info_content_7_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_7.month
  :field photo_cat_info_content_7_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_7.day
  :field photo_cat_info_content_7_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_7.hour
  :field photo_cat_info_content_7_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_7.minute
  :field photo_cat_info_content_7_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_7.second
  :field photo_cat_info_content_7_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_7.meta
  :field photo_cat_info_content_8_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_8.year
  :field photo_cat_info_content_8_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_8.month
  :field photo_cat_info_content_8_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_8.day
  :field photo_cat_info_content_8_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_8.hour
  :field photo_cat_info_content_8_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_8.minute
  :field photo_cat_info_content_8_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_8.second
  :field photo_cat_info_content_8_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_8.meta
  :field photo_cat_info_content_9_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_9.year
  :field photo_cat_info_content_9_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_9.month
  :field photo_cat_info_content_9_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_9.day
  :field photo_cat_info_content_9_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_9.hour
  :field photo_cat_info_content_9_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_9.minute
  :field photo_cat_info_content_9_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_9.second
  :field photo_cat_info_content_9_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_9.meta
  :field photo_cat_info_content_10_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_10.year
  :field photo_cat_info_content_10_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_10.month
  :field photo_cat_info_content_10_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_10.day
  :field photo_cat_info_content_10_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_10.hour
  :field photo_cat_info_content_10_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_10.minute
  :field photo_cat_info_content_10_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_10.second
  :field photo_cat_info_content_10_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_10.meta
  :field photo_cat_info_content_11_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_11.year
  :field photo_cat_info_content_11_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_11.month
  :field photo_cat_info_content_11_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_11.day
  :field photo_cat_info_content_11_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_11.hour
  :field photo_cat_info_content_11_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_11.minute
  :field photo_cat_info_content_11_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_11.second
  :field photo_cat_info_content_11_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_11.meta
  :field photo_cat_info_content_12_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_12.year
  :field photo_cat_info_content_12_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_12.month
  :field photo_cat_info_content_12_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_12.day
  :field photo_cat_info_content_12_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_12.hour
  :field photo_cat_info_content_12_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_12.minute
  :field photo_cat_info_content_12_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_12.second
  :field photo_cat_info_content_12_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_12.meta
  :field photo_cat_info_content_13_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_13.year
  :field photo_cat_info_content_13_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_13.month
  :field photo_cat_info_content_13_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_13.day
  :field photo_cat_info_content_13_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_13.hour
  :field photo_cat_info_content_13_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_13.minute
  :field photo_cat_info_content_13_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_13.second
  :field photo_cat_info_content_13_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_13.meta
  :field photo_cat_info_content_14_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_14.year
  :field photo_cat_info_content_14_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_14.month
  :field photo_cat_info_content_14_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_14.day
  :field photo_cat_info_content_14_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_14.hour
  :field photo_cat_info_content_14_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_14.minute
  :field photo_cat_info_content_14_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_14.second
  :field photo_cat_info_content_14_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_14.meta
  :field photo_cat_info_content_15_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_15.year
  :field photo_cat_info_content_15_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_15.month
  :field photo_cat_info_content_15_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_15.day
  :field photo_cat_info_content_15_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_15.hour
  :field photo_cat_info_content_15_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_15.minute
  :field photo_cat_info_content_15_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_15.second
  :field photo_cat_info_content_15_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_15.meta
  :field photo_cat_info_content_16_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_16.year
  :field photo_cat_info_content_16_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_16.month
  :field photo_cat_info_content_16_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_16.day
  :field photo_cat_info_content_16_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_16.hour
  :field photo_cat_info_content_16_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_16.minute
  :field photo_cat_info_content_16_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_16.second
  :field photo_cat_info_content_16_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_16.meta
  :field photo_cat_info_content_17_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_17.year
  :field photo_cat_info_content_17_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_17.month
  :field photo_cat_info_content_17_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_17.day
  :field photo_cat_info_content_17_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_17.hour
  :field photo_cat_info_content_17_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_17.minute
  :field photo_cat_info_content_17_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_17.second
  :field photo_cat_info_content_17_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_17.meta
  :field photo_cat_info_content_18_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_18.year
  :field photo_cat_info_content_18_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_18.month
  :field photo_cat_info_content_18_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_18.day
  :field photo_cat_info_content_18_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_18.hour
  :field photo_cat_info_content_18_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_18.minute
  :field photo_cat_info_content_18_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_18.second
  :field photo_cat_info_content_18_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_18.meta
  :field photo_cat_info_content_19_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_19.year
  :field photo_cat_info_content_19_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_19.month
  :field photo_cat_info_content_19_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_19.day
  :field photo_cat_info_content_19_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_19.hour
  :field photo_cat_info_content_19_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_19.minute
  :field photo_cat_info_content_19_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_19.second
  :field photo_cat_info_content_19_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_19.meta
  :field photo_cat_info_content_20_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_20.year
  :field photo_cat_info_content_20_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_20.month
  :field photo_cat_info_content_20_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_20.day
  :field photo_cat_info_content_20_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_20.hour
  :field photo_cat_info_content_20_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_20.minute
  :field photo_cat_info_content_20_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_20.second
  :field photo_cat_info_content_20_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_20.meta
  :field photo_cat_info_content_21_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_21.year
  :field photo_cat_info_content_21_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_21.month
  :field photo_cat_info_content_21_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_21.day
  :field photo_cat_info_content_21_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_21.hour
  :field photo_cat_info_content_21_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_21.minute
  :field photo_cat_info_content_21_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_21.second
  :field photo_cat_info_content_21_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_21.meta
  :field photo_cat_info_content_22_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_22.year
  :field photo_cat_info_content_22_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_22.month
  :field photo_cat_info_content_22_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_22.day
  :field photo_cat_info_content_22_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_22.hour
  :field photo_cat_info_content_22_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_22.minute
  :field photo_cat_info_content_22_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_22.second
  :field photo_cat_info_content_22_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_22.meta
  :field photo_cat_info_content_23_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_23.year
  :field photo_cat_info_content_23_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_23.month
  :field photo_cat_info_content_23_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_23.day
  :field photo_cat_info_content_23_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_23.hour
  :field photo_cat_info_content_23_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_23.minute
  :field photo_cat_info_content_23_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_23.second
  :field photo_cat_info_content_23_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_23.meta
  :field photo_cat_info_content_24_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_24.year
  :field photo_cat_info_content_24_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_24.month
  :field photo_cat_info_content_24_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_24.day
  :field photo_cat_info_content_24_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_24.hour
  :field photo_cat_info_content_24_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_24.minute
  :field photo_cat_info_content_24_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_24.second
  :field photo_cat_info_content_24_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_24.meta
  :field photo_cat_info_content_25_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_25.year
  :field photo_cat_info_content_25_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_25.month
  :field photo_cat_info_content_25_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_25.day
  :field photo_cat_info_content_25_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_25.hour
  :field photo_cat_info_content_25_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_25.minute
  :field photo_cat_info_content_25_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_25.second
  :field photo_cat_info_content_25_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_25.meta
  :field photo_cat_info_content_26_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_26.year
  :field photo_cat_info_content_26_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_26.month
  :field photo_cat_info_content_26_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_26.day
  :field photo_cat_info_content_26_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_26.hour
  :field photo_cat_info_content_26_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_26.minute
  :field photo_cat_info_content_26_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_26.second
  :field photo_cat_info_content_26_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_26.meta
  :field photo_cat_info_content_27_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_27.year
  :field photo_cat_info_content_27_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_27.month
  :field photo_cat_info_content_27_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_27.day
  :field photo_cat_info_content_27_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_27.hour
  :field photo_cat_info_content_27_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_27.minute
  :field photo_cat_info_content_27_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_27.second
  :field photo_cat_info_content_27_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_27.meta
  :field photo_cat_info_content_28_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_28.year
  :field photo_cat_info_content_28_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_28.month
  :field photo_cat_info_content_28_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_28.day
  :field photo_cat_info_content_28_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_28.hour
  :field photo_cat_info_content_28_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_28.minute
  :field photo_cat_info_content_28_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_28.second
  :field photo_cat_info_content_28_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_28.meta
  :field photo_cat_info_content_29_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_29.year
  :field photo_cat_info_content_29_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_29.month
  :field photo_cat_info_content_29_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_29.day
  :field photo_cat_info_content_29_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_29.hour
  :field photo_cat_info_content_29_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_29.minute
  :field photo_cat_info_content_29_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_29.second
  :field photo_cat_info_content_29_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_29.meta
  :field photo_cat_info_content_30_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_30.year
  :field photo_cat_info_content_30_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_30.month
  :field photo_cat_info_content_30_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_30.day
  :field photo_cat_info_content_30_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_30.hour
  :field photo_cat_info_content_30_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_30.minute
  :field photo_cat_info_content_30_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_30.second
  :field photo_cat_info_content_30_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_30.meta
  :field photo_cat_info_content_31_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_31.year
  :field photo_cat_info_content_31_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_31.month
  :field photo_cat_info_content_31_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_31.day
  :field photo_cat_info_content_31_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_31.hour
  :field photo_cat_info_content_31_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_31.minute
  :field photo_cat_info_content_31_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_31.second
  :field photo_cat_info_content_31_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_31.meta
  :field photo_cat_info_content_32_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_32.year
  :field photo_cat_info_content_32_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_32.month
  :field photo_cat_info_content_32_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_32.day
  :field photo_cat_info_content_32_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_32.hour
  :field photo_cat_info_content_32_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_32.minute
  :field photo_cat_info_content_32_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_32.second
  :field photo_cat_info_content_32_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_32.meta
  :field photo_cat_info_content_33_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_33.year
  :field photo_cat_info_content_33_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_33.month
  :field photo_cat_info_content_33_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_33.day
  :field photo_cat_info_content_33_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_33.hour
  :field photo_cat_info_content_33_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_33.minute
  :field photo_cat_info_content_33_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_33.second
  :field photo_cat_info_content_33_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_33.meta
  :field photo_cat_info_content_34_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_34.year
  :field photo_cat_info_content_34_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_34.month
  :field photo_cat_info_content_34_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_34.day
  :field photo_cat_info_content_34_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_34.hour
  :field photo_cat_info_content_34_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_34.minute
  :field photo_cat_info_content_34_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_34.second
  :field photo_cat_info_content_34_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_34.meta
  :field photo_cat_info_content_35_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_35.year
  :field photo_cat_info_content_35_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_35.month
  :field photo_cat_info_content_35_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_35.day
  :field photo_cat_info_content_35_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_35.hour
  :field photo_cat_info_content_35_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_35.minute
  :field photo_cat_info_content_35_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_35.second
  :field photo_cat_info_content_35_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_35.meta
  :field photo_cat_info_content_36_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_36.year
  :field photo_cat_info_content_36_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_36.month
  :field photo_cat_info_content_36_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_36.day
  :field photo_cat_info_content_36_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_36.hour
  :field photo_cat_info_content_36_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_36.minute
  :field photo_cat_info_content_36_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_36.second
  :field photo_cat_info_content_36_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_36.meta
  :field photo_cat_info_content_37_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_37.year
  :field photo_cat_info_content_37_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_37.month
  :field photo_cat_info_content_37_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_37.day
  :field photo_cat_info_content_37_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_37.hour
  :field photo_cat_info_content_37_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_37.minute
  :field photo_cat_info_content_37_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_37.second
  :field photo_cat_info_content_37_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_37.meta
  :field photo_cat_info_content_38_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_38.year
  :field photo_cat_info_content_38_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_38.month
  :field photo_cat_info_content_38_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_38.day
  :field photo_cat_info_content_38_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_38.hour
  :field photo_cat_info_content_38_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_38.minute
  :field photo_cat_info_content_38_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_38.second
  :field photo_cat_info_content_38_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_38.meta
  :field photo_cat_info_content_39_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_39.year
  :field photo_cat_info_content_39_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_39.month
  :field photo_cat_info_content_39_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_39.day
  :field photo_cat_info_content_39_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_39.hour
  :field photo_cat_info_content_39_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_39.minute
  :field photo_cat_info_content_39_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_39.second
  :field photo_cat_info_content_39_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_39.meta
  :field photo_cat_info_content_40_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_40.year
  :field photo_cat_info_content_40_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_40.month
  :field photo_cat_info_content_40_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_40.day
  :field photo_cat_info_content_40_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_40.hour
  :field photo_cat_info_content_40_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_40.minute
  :field photo_cat_info_content_40_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_40.second
  :field photo_cat_info_content_40_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_40.meta
  :field photo_cat_info_content_41_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_41.year
  :field photo_cat_info_content_41_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_41.month
  :field photo_cat_info_content_41_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_41.day
  :field photo_cat_info_content_41_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_41.hour
  :field photo_cat_info_content_41_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_41.minute
  :field photo_cat_info_content_41_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_41.second
  :field photo_cat_info_content_41_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_41.meta
  :field photo_cat_info_content_42_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_42.year
  :field photo_cat_info_content_42_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_42.month
  :field photo_cat_info_content_42_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_42.day
  :field photo_cat_info_content_42_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_42.hour
  :field photo_cat_info_content_42_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_42.minute
  :field photo_cat_info_content_42_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_42.second
  :field photo_cat_info_content_42_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_42.meta
  :field photo_cat_info_content_43_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_43.year
  :field photo_cat_info_content_43_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_43.month
  :field photo_cat_info_content_43_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_43.day
  :field photo_cat_info_content_43_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_43.hour
  :field photo_cat_info_content_43_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_43.minute
  :field photo_cat_info_content_43_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_43.second
  :field photo_cat_info_content_43_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_43.meta
  :field photo_cat_info_content_44_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_44.year
  :field photo_cat_info_content_44_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_44.month
  :field photo_cat_info_content_44_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_44.day
  :field photo_cat_info_content_44_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_44.hour
  :field photo_cat_info_content_44_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_44.minute
  :field photo_cat_info_content_44_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_44.second
  :field photo_cat_info_content_44_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_44.meta
  :field photo_cat_info_content_45_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_45.year
  :field photo_cat_info_content_45_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_45.month
  :field photo_cat_info_content_45_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_45.day
  :field photo_cat_info_content_45_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_45.hour
  :field photo_cat_info_content_45_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_45.minute
  :field photo_cat_info_content_45_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_45.second
  :field photo_cat_info_content_45_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_45.meta
  :field photo_cat_info_content_46_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_46.year
  :field photo_cat_info_content_46_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_46.month
  :field photo_cat_info_content_46_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_46.day
  :field photo_cat_info_content_46_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_46.hour
  :field photo_cat_info_content_46_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_46.minute
  :field photo_cat_info_content_46_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_46.second
  :field photo_cat_info_content_46_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_46.meta
  :field photo_cat_info_content_47_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_47.year
  :field photo_cat_info_content_47_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_47.month
  :field photo_cat_info_content_47_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_47.day
  :field photo_cat_info_content_47_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_47.hour
  :field photo_cat_info_content_47_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_47.minute
  :field photo_cat_info_content_47_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_47.second
  :field photo_cat_info_content_47_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_47.meta
  :field photo_cat_info_content_48_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_48.year
  :field photo_cat_info_content_48_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_48.month
  :field photo_cat_info_content_48_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_48.day
  :field photo_cat_info_content_48_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_48.hour
  :field photo_cat_info_content_48_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_48.minute
  :field photo_cat_info_content_48_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_48.second
  :field photo_cat_info_content_48_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_48.meta
  :field photo_cat_info_content_49_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_49.year
  :field photo_cat_info_content_49_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_49.month
  :field photo_cat_info_content_49_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_49.day
  :field photo_cat_info_content_49_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_49.hour
  :field photo_cat_info_content_49_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_49.minute
  :field photo_cat_info_content_49_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_49.second
  :field photo_cat_info_content_49_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_49.meta
  :field photo_cat_info_content_50_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_50.year
  :field photo_cat_info_content_50_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_50.month
  :field photo_cat_info_content_50_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_50.day
  :field photo_cat_info_content_50_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_50.hour
  :field photo_cat_info_content_50_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_50.minute
  :field photo_cat_info_content_50_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_50.second
  :field photo_cat_info_content_50_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_50.meta
  :field photo_cat_info_content_51_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_51.year
  :field photo_cat_info_content_51_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_51.month
  :field photo_cat_info_content_51_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_51.day
  :field photo_cat_info_content_51_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_51.hour
  :field photo_cat_info_content_51_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_51.minute
  :field photo_cat_info_content_51_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_51.second
  :field photo_cat_info_content_51_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_51.meta
  :field photo_cat_info_content_52_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_52.year
  :field photo_cat_info_content_52_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_52.month
  :field photo_cat_info_content_52_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_52.day
  :field photo_cat_info_content_52_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_52.hour
  :field photo_cat_info_content_52_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_52.minute
  :field photo_cat_info_content_52_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_52.second
  :field photo_cat_info_content_52_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_52.meta
  :field photo_cat_info_content_53_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_53.year
  :field photo_cat_info_content_53_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_53.month
  :field photo_cat_info_content_53_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_53.day
  :field photo_cat_info_content_53_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_53.hour
  :field photo_cat_info_content_53_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_53.minute
  :field photo_cat_info_content_53_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_53.second
  :field photo_cat_info_content_53_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_53.meta
  :field photo_cat_info_content_54_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_54.year
  :field photo_cat_info_content_54_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_54.month
  :field photo_cat_info_content_54_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_54.day
  :field photo_cat_info_content_54_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_54.hour
  :field photo_cat_info_content_54_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_54.minute
  :field photo_cat_info_content_54_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_54.second
  :field photo_cat_info_content_54_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_54.meta
  :field photo_cat_info_content_55_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_55.year
  :field photo_cat_info_content_55_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_55.month
  :field photo_cat_info_content_55_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_55.day
  :field photo_cat_info_content_55_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_55.hour
  :field photo_cat_info_content_55_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_55.minute
  :field photo_cat_info_content_55_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_55.second
  :field photo_cat_info_content_55_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_55.meta
  :field photo_cat_info_content_56_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_56.year
  :field photo_cat_info_content_56_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_56.month
  :field photo_cat_info_content_56_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_56.day
  :field photo_cat_info_content_56_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_56.hour
  :field photo_cat_info_content_56_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_56.minute
  :field photo_cat_info_content_56_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_56.second
  :field photo_cat_info_content_56_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_56.meta
  :field photo_cat_info_content_57_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_57.year
  :field photo_cat_info_content_57_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_57.month
  :field photo_cat_info_content_57_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_57.day
  :field photo_cat_info_content_57_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_57.hour
  :field photo_cat_info_content_57_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_57.minute
  :field photo_cat_info_content_57_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_57.second
  :field photo_cat_info_content_57_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_57.meta
  :field photo_cat_info_content_58_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_58.year
  :field photo_cat_info_content_58_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_58.month
  :field photo_cat_info_content_58_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_58.day
  :field photo_cat_info_content_58_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_58.hour
  :field photo_cat_info_content_58_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_58.minute
  :field photo_cat_info_content_58_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_58.second
  :field photo_cat_info_content_58_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_58.meta
  :field photo_cat_info_content_59_year: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_59.year
  :field photo_cat_info_content_59_month: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_59.month
  :field photo_cat_info_content_59_day: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_59.day
  :field photo_cat_info_content_59_hour: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_59.hour
  :field photo_cat_info_content_59_minute: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_59.minute
  :field photo_cat_info_content_59_second: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_59.second
  :field photo_cat_info_content_59_meta: ax25_frame.payload.payload.photo_cat_data.photo_cat_info_content_59.meta
  :field total_nr_of_frames: ax25_frame.payload.payload.photo_header.total_nr_of_frames
  :field frame_seq_nr: ax25_frame.payload.payload.photo_header.frame_seq_nr
  :field frame_length: ax25_frame.payload.payload.photo_header.frame_length
  :field photo_meta_year: ax25_frame.payload.payload.photo_meta.year
  :field photo_meta_month: ax25_frame.payload.payload.photo_meta.month
  :field photo_meta_day: ax25_frame.payload.payload.photo_meta.day
  :field photo_meta_hour: ax25_frame.payload.payload.photo_meta.hour
  :field photo_meta_minute: ax25_frame.payload.payload.photo_meta.minute
  :field photo_meta_second: ax25_frame.payload.payload.photo_meta.second
  :field cam_meta: ax25_frame.payload.payload.photo_meta.cam_meta
  :field photo_specs: ax25_frame.payload.payload.photo_meta.photo_specs
  :field data_str: ax25_frame.payload.payload.photo_data.data.data_str
seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: "https://www.tapr.org/pub_ax25.html"
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
        doc: "Repeater flag is set!"
      - id: ctl
        type: u1
  repeater:
    seq:
      - id: rpt_instance
        type: repeaters
        repeat: until
        repeat-until: ((_.rpt_ssid_raw.ssid_mask & 0x1) == 0x1)
        doc: "Repeat until no repeater flag is set!"
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
            - "'CAS5A '"
            - "'CQ    '"
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
      - id: function_code_main
        type: u1
      - id: function_code_spare1
        type: u1
        if: 'function_code_main != 0x03'
      - id: function_code_sub
        type: u1
        if: 'function_code_main != 0x03'
      - id: function_code_sub_spare1
        type: u1
        if: 'function_code_main != 0x03'
      - id: sub_function_code_main
        type: u2
        valid:
          any-of:
            - 0x0100
            - 0x0200
        if: 'function_code_main != 0x03'
      - id: function_rev
        type: u1
        doc: 'should contain: 0x7e, actually contains: 0xa7'
        if: 'function_code_main != 0x03'
      - id: payload
        type:
          switch-on: function_code_main
          cases:
            0x01: telemetry_t
            0x02: photo_cat_t
            0x03: photo_data_t
        size-eos: true
  photo_header_t:
    seq:
      - id: total_nr_of_frames
        type: u2
      - id: frame_seq_nr
        type: u2
      - id: frame_length
        type: u2
  photo_meta_t:
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
      - id: cam_meta
        type: u2
      - id: photo_specs
        type: u1
  photo_data_t:
    seq:
      - id: photo_header
        type: photo_header_t
      - id: photo_meta
        type: photo_meta_t
      - id: photo_data
        type: data_b64_t
  photo_cat_t:
    seq:
      - id: photo_cat_data
        type:
          switch-on: _parent.sub_function_code_main
          cases:
            0x01: photo_cat_first_frame_t
            0x02: photo_cat_second_frame_t
  photo_cat_first_frame_t:
    seq:
      - id: photo_cat_info_content_0
        type: photo_cat_info_t
      - id: photo_cat_info_content_1
        type: photo_cat_info_t
      - id: photo_cat_info_content_2
        type: photo_cat_info_t
      - id: photo_cat_info_content_3
        type: photo_cat_info_t
      - id: photo_cat_info_content_4
        type: photo_cat_info_t
      - id: photo_cat_info_content_5
        type: photo_cat_info_t
      - id: photo_cat_info_content_6
        type: photo_cat_info_t
      - id: photo_cat_info_content_7
        type: photo_cat_info_t
      - id: photo_cat_info_content_8
        type: photo_cat_info_t
      - id: photo_cat_info_content_9
        type: photo_cat_info_t
      - id: photo_cat_info_content_10
        type: photo_cat_info_t
      - id: photo_cat_info_content_11
        type: photo_cat_info_t
      - id: photo_cat_info_content_12
        type: photo_cat_info_t
      - id: photo_cat_info_content_13
        type: photo_cat_info_t
      - id: photo_cat_info_content_14
        type: photo_cat_info_t
      - id: photo_cat_info_content_15
        type: photo_cat_info_t
      - id: photo_cat_info_content_16
        type: photo_cat_info_t
      - id: photo_cat_info_content_17
        type: photo_cat_info_t
      - id: photo_cat_info_content_18
        type: photo_cat_info_t
      - id: photo_cat_info_content_19
        type: photo_cat_info_t
      - id: photo_cat_info_content_20
        type: photo_cat_info_t
      - id: photo_cat_info_content_21
        type: photo_cat_info_t
      - id: photo_cat_info_content_22
        type: photo_cat_info_t
      - id: photo_cat_info_content_23
        type: photo_cat_info_t
      - id: photo_cat_info_content_24
        type: photo_cat_info_t
      - id: photo_cat_info_content_25
        type: photo_cat_info_t
      - id: photo_cat_info_content_26
        type: photo_cat_info_t
      - id: photo_cat_info_content_27
        type: photo_cat_info_t
      - id: photo_cat_info_content_28
        type: photo_cat_info_t
      - id: photo_cat_info_content_29
        type: photo_cat_info_t
  photo_cat_second_frame_t:
    seq:
      - id: photo_cat_info_content_30
        type: photo_cat_info_t
      - id: photo_cat_info_content_31
        type: photo_cat_info_t
      - id: photo_cat_info_content_32
        type: photo_cat_info_t
      - id: photo_cat_info_content_33
        type: photo_cat_info_t
      - id: photo_cat_info_content_34
        type: photo_cat_info_t
      - id: photo_cat_info_content_35
        type: photo_cat_info_t
      - id: photo_cat_info_content_36
        type: photo_cat_info_t
      - id: photo_cat_info_content_37
        type: photo_cat_info_t
      - id: photo_cat_info_content_38
        type: photo_cat_info_t
      - id: photo_cat_info_content_39
        type: photo_cat_info_t
      - id: photo_cat_info_content_40
        type: photo_cat_info_t
      - id: photo_cat_info_content_41
        type: photo_cat_info_t
      - id: photo_cat_info_content_42
        type: photo_cat_info_t
      - id: photo_cat_info_content_43
        type: photo_cat_info_t
      - id: photo_cat_info_content_44
        type: photo_cat_info_t
      - id: photo_cat_info_content_45
        type: photo_cat_info_t
      - id: photo_cat_info_content_46
        type: photo_cat_info_t
      - id: photo_cat_info_content_47
        type: photo_cat_info_t
      - id: photo_cat_info_content_48
        type: photo_cat_info_t
      - id: photo_cat_info_content_49
        type: photo_cat_info_t
      - id: photo_cat_info_content_50
        type: photo_cat_info_t
      - id: photo_cat_info_content_51
        type: photo_cat_info_t
      - id: photo_cat_info_content_52
        type: photo_cat_info_t
      - id: photo_cat_info_content_53
        type: photo_cat_info_t
      - id: photo_cat_info_content_54
        type: photo_cat_info_t
      - id: photo_cat_info_content_55
        type: photo_cat_info_t
      - id: photo_cat_info_content_56
        type: photo_cat_info_t
      - id: photo_cat_info_content_57
        type: photo_cat_info_t
      - id: photo_cat_info_content_58
        type: photo_cat_info_t
      - id: photo_cat_info_content_59
        type: photo_cat_info_t
  photo_cat_info_t:
    seq:
      - id: year
        type: u1
        doc: 'Photograph time'
      - id: month
        type: u1
        doc: 'Photograph time'
      - id: day
        type: u1
        doc: 'Photograph time'
      - id: hour
        type: u1
        doc: 'Photograph time'
      - id: minute
        type: u1
        doc: 'Photograph time'
      - id: second
        type: u1
        doc: 'Photograph time'
      - id: meta
        type: u2
        doc: |
          Split into two bytes:
          b15~b11: Camera number
          b10~b0: Photo counter
  telemetry_t:
    seq:
      - id: sat_time_year
        type: u1
        doc: 'W1-Year: 00~99, representing 2000~2099'
      - id: sat_time_month
        type: u1
        doc: 'W2-Month: 01~12, representing January to December'
      - id: sat_time_day
        type: u1
        doc: 'W3-Day: 01~31, representing 1st~31st'
      - id: sat_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: sat_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: sat_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: ihu_total_reset_counter
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up. Range: 0~255'
      - id: battery_status
        type: u1
        doc: |
          b7~b1: reserved, all values are 0
          b3: Battery heater 2 switch state (0 off/1 on)
          b2: Battery heater 1 switch state (0 off/1 on)
          b1: Battery discharge switch state (0 off/1 on)
          b0: Battery discharge switch off allowable state (0 energy disabled/1 enabled)
      - id: remote_control_frame_reception_counter
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up Range: 0~255'
      - id: remote_control_command_execution_counter
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up Range: 0~255'
      - id: telemetry_frame_transmission_counter
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up Range: 0~255'
      - id: ihu_status_1
        type: u1
        doc: |
          b7: IHU flash2 read and write failure (0 normal/1 fault)
          b6: Remote control command CRC correctly identified (0 error/1 correct)
          b5: IHU flash1 read and write failure (0 normal/1 failure)
          b4: CPU I/O acquisition watchdog switch flag (0 off/1 on)
          b3: reserved, value 0
          b2: ADC Software Watchdog Switch Flag (0 Off/1 On)
          b1: Temperature measurement software watchdog switch sign (0 off/1 on)
          b0: Remote control software watchdog switch sign (0 off/1 on
      - id: reserved_00
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up Range: 0~255'
      - id: i2c_bus_status
        type: u1
        doc: |
          b7~b5: reserved, all values are 0
          b4: Temperature1-I2C fault (0 normal/1 fault)
          b3: Temperature2-I2C fault (0 normal/1 fault)
          b2: Temperature3-I2C fault (0 normal/1 fault)
          b1: ADC-I2C fault (0 normal/1 fault)
          b0: Clock-I2C fault (0 normal/1 fault)
      - id: reserved_01
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up Range: 0~255'
      - id: reserved_02
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up Range: 0~255'
      - id: reserved_03
        type: u1
        doc: 'W1 is an integer. Restart counting from 0 after counting up Range: 0~255'
      - id: ihu_status_2
        type: u1
        doc: |
          b7: Board-to-board communication failure (0 normal/1 fault)
          b6: Flash2 read and write failure of the camera board (0 normal/1 failure)
          b5: Flash1 read and write failure of the camera board (0 normal/1 failure)
          B4: Antenna deployment master switch state (0 off/1 on)
          b3: UHF antenna 1 deployment state (0 undeployed/1 deployed)
          b2: UHF antenna 2 deployment state (0 undeployed/1 deployed)
          b1: VHF antenna deployment status (0 undeployed/1 deployed)
          b0: HF antenna deployment state (0 undeployed/1 deployed)
      - id: ihu_status_3
        type: u1
        doc: |
          b7~b3: Reserved, all values are 0
          b2: Satellite Separation Status (0 Not Separated /1 Separated)
          b1: Reserved, value 0
          b0: Delay telemetry switch state (0 off/1 on)
      - id: px_cabin_inner_plate_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: nx_cabin_inner_plate_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: pdcu_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: dcdc_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: pz_cabin_inner_plate_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: nz_cabin_inner_plate_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: px_solar_array_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: nx_solar_array_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: py_solar_array_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: ny_solar_array_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: pz_solar_array_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: nz_solar_array_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: bat_pack_1_temp_1
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: bat_pack_1_temp_2
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: bat_pack_2_temp_3
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: bat_pack_2_temp_4
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: ihu_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: uhf1_pa_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: cam3_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: cam1_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: cam2_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: uhf2_pa_temp
        type: u1
        doc: 'b7 of W1 is the sign bit, 0 is positive, 1 is negative; b6~b0 are numerical bits Range: -100~+100(°C)'
      - id: battery_voltage_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (1 decimal place) Range: 0~15.0(V)'
      - id: battery_voltage_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (1 decimal place) Range: 0~15.0(V)'
      - id: primary_power_supply_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (1 decimal place) Range: 0~15.0(V)'
      - id: primary_power_supply_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (1 decimal place) Range: 0~15.0(V)'
      - id: bus_voltage_5v_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~10.00(V)'
      - id: bus_voltage_5v_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~10.00(V)'
      - id: bus_voltage_3v8_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: bus_voltage_3v8_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: ihu_voltage_3v3_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: ihu_voltage_3v3_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: total_solar_array_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~3000(mA)'
      - id: primary_bus_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~2000(mA)'
      - id: total_load_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~1000(mA)'
      - id: ihu_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~500(mA)'
      - id: reserved_04
        type: u2
        doc: 'W1W2 is an integer Range: 0~1000(mA)'
      - id: hf_receiver_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~1000(mA)'
      - id: reserved_05
        type: u2
        doc: 'W1W2 is an integer Range: 0~1000(mA)'
      - id: uhf_transmitter_2_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~1000(mA)'
      - id: ht_agc_voltage_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: ht_agc_voltage_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: uhf_transmitter_1_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~1000(mA)'
      - id: uhf1_rf_power
        type: u2
        doc: 'W1W2 is an integer Range: 0~3000(mW)'
      - id: uhf2_rf_power
        type: u2
        doc: 'W1W2 is an integer Range: 0~3000(mW)'
      - id: vhf_receiver_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~1000(mA)'
      - id: vhf_agc_voltage_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: vhf_agc_voltage_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: delayed_telemetry_start_time_year
        type: u1
        doc: 'W1-Year: 00~99, representing 2000~2099'
      - id: delayed_telemetry_start_time_month
        type: u1
        doc: 'W2-Month: 01~12, representing January to December'
      - id: delayed_telemetry_start_time_day
        type: u1
        doc: 'W3-Day: 01~31, representing 1st~31st'
      - id: delayed_telemetry_start_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: delayed_telemetry_start_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: delayed_telemetry_start_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: delayed_telemetry_interval_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: delayed_telemetry_interval_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: delayed_telemetry_interval_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: delayed_telemetry_frequency_h
        type: u1
        doc: 'W1W2W3 is an integer Range: 0 ~ 16777215'
      - id: delayed_telemetry_frequency_m
        type: u1
        doc: 'W1W2W3 is an integer Range: 0 ~ 16777215'
      - id: delayed_telemetry_frequency_l
        type: u1
        doc: 'W1W2W3 is an integer Range: 0 ~ 16777215'
      - id: cam_controller_operating_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~500(mA)'
      - id: cam_controller_operating_voltage_integer
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: cam_controller_operating_voltage_decimal
        type: u1
        doc: 'W1 is the integer part, W2 is the decimal part (2 decimal place) Range: 0~5.00(V)'
      - id: total_cam_current
        type: u2
        doc: 'W1W2 is an integer Range: 0~2000(mA)'
      - id: cam_working_status
        type: u1
        doc: |
          b7: Camera controller power switch status (0 off/1 on)
          b6: reserved, value 0
          b5: Camera 1 power switch status (0 off/1 on)
          b4: Camera 1 delayed photography switch status (0 off/1 on)
          b3: Camera 2 power switch status (0 off/1 on)
          b2: Camera 2 delayed photography switch status (0 off/1 on)
          b1: Camera 3 power switch status (0 off/1 on)
          b0: Camera 3 delayed photography switch status (0 off/1 on)
      - id: cam1_photo_counter
        type: u2
        doc: 'W1W2 is an integer Range: 0 ~ 2047'
      - id: cam2_photo_counter
        type: u2
        doc: 'W1W2 is an integer Range: 0 ~ 2047'
      - id: cam3_photo_counter
        type: u2
        doc: 'W1W2 is an integer Range: 0 ~ 2047'
      - id: cam1_delayed_photography_start_time_year
        type: u1
        doc: 'W1-Year: 00~99, representing 2000~2099'
      - id: cam1_delayed_photography_start_time_month
        type: u1
        doc: 'W2-Month: 01~12, representing January to December'
      - id: cam1_delayed_photography_start_time_day
        type: u1
        doc: 'W3-Day: 01~31, representing 1st~31st'
      - id: cam1_delayed_photography_start_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: cam1_delayed_photography_start_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: cam1_delayed_photography_start_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: cam1_delayed_photography_interval_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: cam1_delayed_photography_interval_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: cam1_delayed_photography_interval_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: cam1_delayed_photography_frequency
        type: u1
        doc: 'W1 is an integer Range: 0 ~ 60'
      - id: cam2_delayed_photography_start_time_year
        type: u1
        doc: 'W1-Year: 00~99, representing 2000~2099'
      - id: cam2_delayed_photography_start_time_month
        type: u1
        doc: 'W2-Month: 01~12, representing January to December'
      - id: cam2_delayed_photography_start_time_day
        type: u1
        doc: 'W3-Day: 01~31, representing 1st~31st'
      - id: cam2_delayed_photography_start_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: cam2_delayed_photography_start_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: cam2_delayed_photography_start_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: cam2_delayed_photography_interval_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: cam2_delayed_photography_interval_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: cam2_delayed_photography_interval_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: cam2_delayed_photography_frequency
        type: u1
        doc: 'W1 is an integer Range: 0 ~ 60'
      - id: cam3_delayed_photography_start_time_year
        type: u1
        doc: 'W1-Year: 00~99, representing 2000~2099'
      - id: cam3_delayed_photography_start_time_month
        type: u1
        doc: 'W2-Month: 01~12, representing January to December'
      - id: cam3_delayed_photography_start_time_day
        type: u1
        doc: 'W3-Day: 01~31, representing 1st~31st'
      - id: cam3_delayed_photography_start_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: cam3_delayed_photography_start_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: cam3_delayed_photography_start_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: cam3_delayed_photography_interval_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: cam3_delayed_photography_interval_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: cam3_delayed_photography_interval_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: cam3_delayed_photography_frequency
        type: u1
        doc: 'W1 is an integer Range: 0 ~ 60'
      - id: satellite_current_operating_mode
        type: u1
        doc: |
          W1 is an integer
          Range: 0 ~ 10
          01 = All asleep
          02 = Beacon on (send every 5 minutes)
          03 = Beacon on (send every 5 seconds from mode 3 to mode 10)
          04 = Beacon on + AX.25 telemetry
          05 = Beacon on + AX.25 telemetry + V/U linear transponder
          06 = Beacon on + AX.25 telemetry + V/U linear transponder + H/U linear transponder
          07 = Beacon on + AX.25 telemetry + V/U linear transponder + FM transponder + H/U linear transponder
          08 = Beacon on + AX.25 telemetry + V/U linear transponder + FM transponder + H/U linear transponder + H/T linear transponder
          09 = Beacon on + AX.25 telemetry + V/U linear transponder + FM transponder + H/U linear transponder + H/T linear transponder + heater 1
          10 = Beacon on + AX.25 telemetry + V/U linear transponder + FM transponder + H/U
          linear transponder + H/T linear transponder + heater 1 + heater 2
          (H/T linear transponder is not valid in CAS-5A)
      - id: satellite_device_switch_status
        type: u2
        doc: |
          b15~b10: Reserved, all values are 0
          b9: GMSK telemetry data rate (0-9.6kbps/1-4.8kbps)
          b8: RF power status (0 low power / 1 high power)
          b7: V/U FM transponder switch state (0 off/1 on)
          b6: V/U linear transponder switching state (0 off/1 on)
          b5: UHF beacon switch status (0 off/1 on)
          b4: UHF GMSK telemetry switch state (0 off/1 on)
          b3: H/U linear transponder switching state (0 off/1 on)
          b2: H/T linear transponder switching state (0 off/1 on)
          b1: HF beacon switch status (0 off/1 on)
          b0: Working mode status (0 auto/1 manual)
      - id: time_48hrs_reset_year
        type: u1
        doc: 'W1-Year: 00~99, representing 2000~2099'
      - id: time_48hrs_reset_month
        type: u1
        doc: 'W2-Month: 01~12, representing January to December'
      - id: time_48hrs_reset_day
        type: u1
        doc: 'W3-Day: 01~31, representing 1st~31st'
      - id: time_48hrs_reset_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: time_48hrs_reset_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: time_48hrs_reset_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
      - id: att_q0_l
        type: u1
        doc: 'W1W2:Q0L Q0H q0=((Q0H<<8)|Q0L)/32768'
      - id: att_q0_h
        type: u1
        doc: 'W1W2:Q0L Q0H q0=((Q0H<<8)|Q0L)/32768'
      - id: att_q1_l
        type: u1
        doc: 'W1W2:Q1L Q1H q0=((Q0H<<8)|Q0L)/32768'
      - id: att_q1_h
        type: u1
        doc: 'W1W2:Q1L Q1H q0=((Q0H<<8)|Q0L)/32768'
      - id: att_q2_l
        type: u1
        doc: 'W1W2:Q2L Q2H q0=((Q0H<<8)|Q0L)/32768'
      - id: att_q2_h
        type: u1
        doc: 'W1W2:Q2L Q2H q0=((Q0H<<8)|Q0L)/32768'
      - id: att_q3_l
        type: u1
        doc: 'W1W2:Q3L Q3H q0=((Q0H<<8)|Q0L)/32768'
      - id: att_q3_h
        type: u1
        doc: 'W1W2:Q3L Q3H q0=((Q0H<<8)|Q0L)/32768'
      - id: cam1_resolution
        type: u1
        doc: |
          W1 is an integer
          Range: 0 ~ 7
          0:800×480;
          1:1280×720;
          2:320×240;
          3:1440×896;
          4:640×480;
          5:1920×1080;
          6:800×600;
          7:1024×768'
      - id: cam1_image_quality
        type: u1
        doc: |
          W1 is an integer
          Range: 0 ~ 2
          0: Highest quality;
          1: Medium quality;
          2: Low quality'
      - id: cam2_resolution
        type: u1
        doc: |
          W1 is an integer
          Range: 0 ~ 7
          0:800×480;
          1:1280×720;
          2:320×240;
          3:1440×896;
          4:640×480;
          5:1920×1080;
          6:800×600;
          7:1024×768'
      - id: cam2_image_quality
        type: u1
        doc: |
          W1 is an integer
          Range: 0 ~ 2
          0: Highest quality;
          1: Medium quality;
          2: Low quality'
      - id: cam3_resolution
        type: u1
        doc: |
          W1 is an integer
          Range: 0 ~ 7
          0:800×480;
          1:1280×720;
          2:320×240;
          3:1440×896;
          4:640×480;
          5:1920×1080;
          6:800×600;
          7:1024×768'
      - id: cam3_image_quality
        type: u1
        doc: |
          W1 is an integer
          Range: 0 ~ 2
          0: Highest quality;
          1: Medium quality;
          2: Low quality'
      - id: current_delayed_telemetry_interval_time_hour
        type: u1
        doc: 'W4-Hour: 00~23, representing 0:00~23:00'
      - id: current_delayed_telemetry_interval_time_minute
        type: u1
        doc: 'W5-minute: 00~59, representing 0 minutes~59 minutes'
      - id: current_delayed_telemetry_interval_time_second
        type: u1
        doc: 'W6-second: 00~59, representing 0 seconds~59 seconds'
  data_b64_t:
    seq:
      - id: data
        process: satnogsdecoders.process.b64encode
        type: str_b64_t
        size-eos: true
  str_b64_t:
    seq:
      - id: data_str
        type: str
        encoding: ASCII
        size-eos: true
