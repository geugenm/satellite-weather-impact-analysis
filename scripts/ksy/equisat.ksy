---
meta:
  id: equisat
  endian: le
doc: |
  :field timestamp: equisat_frame.preamble.timestamp
  :field msg_op_states: equisat_frame.preamble.msg_op_states
  :field message_type: equisat_frame.preamble.message_type
  :field bytes_of_data: equisat_frame.preamble.bytes_of_data
  :field num_errors: equisat_frame.preamble.num_errors
  :field time_to_flash: equisat_frame.current_info.time_to_flash
  :field boot_count: equisat_frame.current_info.boot_count
  :field l1_ref: equisat_frame.current_info.l1_ref.int16
  :field l2_ref: equisat_frame.current_info.l2_ref.int16
  :field l1_sns: equisat_frame.current_info.l1_sns.int16
  :field l2_sns: equisat_frame.current_info.l2_sns.int16
  :field l1_temp: equisat_frame.current_info.l1_temp.int16
  :field l2_temp: equisat_frame.current_info.l2_temp.int16
  :field panel_ref: equisat_frame.current_info.panel_ref.int16
  :field l_ref: equisat_frame.current_info.l_ref.int16
  :field bat_digsigs_1: equisat_frame.current_info.bat_digsigs_1
  :field bat_digsigs_2: equisat_frame.current_info.bat_digsigs_2
  :field lf1ref: equisat_frame.current_info.lf1ref.int16
  :field lf2ref: equisat_frame.current_info.lf2ref.int16
  :field lf3ref: equisat_frame.current_info.lf3ref.int16
  :field lf4ref: equisat_frame.current_info.lf4ref.int16
  :field idle_batch_0_event_history: equisat_frame.data_section.idle_batch_0.event_history
  :field idle_batch_0_l1_ref: equisat_frame.data_section.idle_batch_0.l1_ref.int16
  :field idle_batch_0_l2_ref: equisat_frame.data_section.idle_batch_0.l2_ref.int16
  :field idle_batch_0_l1_sns: equisat_frame.data_section.idle_batch_0.l1_sns.int16
  :field idle_batch_0_l2_sns: equisat_frame.data_section.idle_batch_0.l2_sns.int16
  :field idle_batch_0_l1_temp: equisat_frame.data_section.idle_batch_0.l1_temp.int16
  :field idle_batch_0_l2_temp: equisat_frame.data_section.idle_batch_0.l2_temp.int16
  :field idle_batch_0_panel_ref: equisat_frame.data_section.idle_batch_0.panel_ref.int16
  :field idle_batch_0_l_ref: equisat_frame.data_section.idle_batch_0.l_ref.int16
  :field idle_batch_0_bat_digsigs_1: equisat_frame.data_section.idle_batch_0.bat_digsigs_1
  :field idle_batch_0_bat_digsigs_2: equisat_frame.data_section.idle_batch_0.bat_digsigs_2
  :field idle_batch_0_rad_temp: equisat_frame.data_section.idle_batch_0.rad_temp.int16
  :field idle_batch_0_imu_temp: equisat_frame.data_section.idle_batch_0.imu_temp.int16
  :field idle_batch_0_ir_flash_amb: equisat_frame.data_section.idle_batch_0.ir_flash_amb.int16
  :field idle_batch_0_ir_side1_amb: equisat_frame.data_section.idle_batch_0.ir_side1_amb.int16
  :field idle_batch_0_ir_side2_amb: equisat_frame.data_section.idle_batch_0.ir_side2_amb.int16
  :field idle_batch_0_ir_rbf_amb: equisat_frame.data_section.idle_batch_0.ir_rbf_amb.int16
  :field idle_batch_0_ir_access_amb: equisat_frame.data_section.idle_batch_0.ir_access_amb.int16
  :field idle_batch_0_ir_top1_amb: equisat_frame.data_section.idle_batch_0.ir_top1_amb.int16
  :field idle_batch_0_timestamp: equisat_frame.data_section.idle_batch_0.timestamp
  :field idle_batch_1_event_history: equisat_frame.data_section.idle_batch_1.event_history
  :field idle_batch_1_l1_ref: equisat_frame.data_section.idle_batch_1.l1_ref.int16
  :field idle_batch_1_l2_ref: equisat_frame.data_section.idle_batch_1.l2_ref.int16
  :field idle_batch_1_l1_sns: equisat_frame.data_section.idle_batch_1.l1_sns.int16
  :field idle_batch_1_l2_sns: equisat_frame.data_section.idle_batch_1.l2_sns.int16
  :field idle_batch_1_l1_temp: equisat_frame.data_section.idle_batch_1.l1_temp.int16
  :field idle_batch_1_l2_temp: equisat_frame.data_section.idle_batch_1.l2_temp.int16
  :field idle_batch_1_panel_ref: equisat_frame.data_section.idle_batch_1.panel_ref.int16
  :field idle_batch_1_l_ref: equisat_frame.data_section.idle_batch_1.l_ref.int16
  :field idle_batch_1_bat_digsigs_1: equisat_frame.data_section.idle_batch_1.bat_digsigs_1
  :field idle_batch_1_bat_digsigs_2: equisat_frame.data_section.idle_batch_1.bat_digsigs_2
  :field idle_batch_1_rad_temp: equisat_frame.data_section.idle_batch_1.rad_temp.int16
  :field idle_batch_1_imu_temp: equisat_frame.data_section.idle_batch_1.imu_temp.int16
  :field idle_batch_1_ir_flash_amb: equisat_frame.data_section.idle_batch_1.ir_flash_amb.int16
  :field idle_batch_1_ir_side1_amb: equisat_frame.data_section.idle_batch_1.ir_side1_amb.int16
  :field idle_batch_1_ir_side2_amb: equisat_frame.data_section.idle_batch_1.ir_side2_amb.int16
  :field idle_batch_1_ir_rbf_amb: equisat_frame.data_section.idle_batch_1.ir_rbf_amb.int16
  :field idle_batch_1_ir_access_amb: equisat_frame.data_section.idle_batch_1.ir_access_amb.int16
  :field idle_batch_1_ir_top1_amb: equisat_frame.data_section.idle_batch_1.ir_top1_amb.int16
  :field idle_batch_1_timestamp: equisat_frame.data_section.idle_batch_1.timestamp
  :field idle_batch_2_event_history: equisat_frame.data_section.idle_batch_2.event_history
  :field idle_batch_2_l1_ref: equisat_frame.data_section.idle_batch_2.l1_ref.int16
  :field idle_batch_2_l2_ref: equisat_frame.data_section.idle_batch_2.l2_ref.int16
  :field idle_batch_2_l1_sns: equisat_frame.data_section.idle_batch_2.l1_sns.int16
  :field idle_batch_2_l2_sns: equisat_frame.data_section.idle_batch_2.l2_sns.int16
  :field idle_batch_2_l1_temp: equisat_frame.data_section.idle_batch_2.l1_temp.int16
  :field idle_batch_2_l2_temp: equisat_frame.data_section.idle_batch_2.l2_temp.int16
  :field idle_batch_2_panel_ref: equisat_frame.data_section.idle_batch_2.panel_ref.int16
  :field idle_batch_2_l_ref: equisat_frame.data_section.idle_batch_2.l_ref.int16
  :field idle_batch_2_bat_digsigs_1: equisat_frame.data_section.idle_batch_2.bat_digsigs_1
  :field idle_batch_2_bat_digsigs_2: equisat_frame.data_section.idle_batch_2.bat_digsigs_2
  :field idle_batch_2_rad_temp: equisat_frame.data_section.idle_batch_2.rad_temp.int16
  :field idle_batch_2_imu_temp: equisat_frame.data_section.idle_batch_2.imu_temp.int16
  :field idle_batch_2_ir_flash_amb: equisat_frame.data_section.idle_batch_2.ir_flash_amb.int16
  :field idle_batch_2_ir_side1_amb: equisat_frame.data_section.idle_batch_2.ir_side1_amb.int16
  :field idle_batch_2_ir_side2_amb: equisat_frame.data_section.idle_batch_2.ir_side2_amb.int16
  :field idle_batch_2_ir_rbf_amb: equisat_frame.data_section.idle_batch_2.ir_rbf_amb.int16
  :field idle_batch_2_ir_access_amb: equisat_frame.data_section.idle_batch_2.ir_access_amb.int16
  :field idle_batch_2_ir_top1_amb: equisat_frame.data_section.idle_batch_2.ir_top1_amb.int16
  :field idle_batch_2_timestamp: equisat_frame.data_section.idle_batch_2.timestamp
  :field idle_batch_3_event_history: equisat_frame.data_section.idle_batch_3.event_history
  :field idle_batch_3_l1_ref: equisat_frame.data_section.idle_batch_3.l1_ref.int16
  :field idle_batch_3_l2_ref: equisat_frame.data_section.idle_batch_3.l2_ref.int16
  :field idle_batch_3_l1_sns: equisat_frame.data_section.idle_batch_3.l1_sns.int16
  :field idle_batch_3_l2_sns: equisat_frame.data_section.idle_batch_3.l2_sns.int16
  :field idle_batch_3_l1_temp: equisat_frame.data_section.idle_batch_3.l1_temp.int16
  :field idle_batch_3_l2_temp: equisat_frame.data_section.idle_batch_3.l2_temp.int16
  :field idle_batch_3_panel_ref: equisat_frame.data_section.idle_batch_3.panel_ref.int16
  :field idle_batch_3_l_ref: equisat_frame.data_section.idle_batch_3.l_ref.int16
  :field idle_batch_3_bat_digsigs_1: equisat_frame.data_section.idle_batch_3.bat_digsigs_1
  :field idle_batch_3_bat_digsigs_2: equisat_frame.data_section.idle_batch_3.bat_digsigs_2
  :field idle_batch_3_rad_temp: equisat_frame.data_section.idle_batch_3.rad_temp.int16
  :field idle_batch_3_imu_temp: equisat_frame.data_section.idle_batch_3.imu_temp.int16
  :field idle_batch_3_ir_flash_amb: equisat_frame.data_section.idle_batch_3.ir_flash_amb.int16
  :field idle_batch_3_ir_side1_amb: equisat_frame.data_section.idle_batch_3.ir_side1_amb.int16
  :field idle_batch_3_ir_side2_amb: equisat_frame.data_section.idle_batch_3.ir_side2_amb.int16
  :field idle_batch_3_ir_rbf_amb: equisat_frame.data_section.idle_batch_3.ir_rbf_amb.int16
  :field idle_batch_3_ir_access_amb: equisat_frame.data_section.idle_batch_3.ir_access_amb.int16
  :field idle_batch_3_ir_top1_amb: equisat_frame.data_section.idle_batch_3.ir_top1_amb.int16
  :field idle_batch_3_timestamp: equisat_frame.data_section.idle_batch_3.timestamp
  :field idle_batch_4_event_history: equisat_frame.data_section.idle_batch_4.event_history
  :field idle_batch_4_l1_ref: equisat_frame.data_section.idle_batch_4.l1_ref.int16
  :field idle_batch_4_l2_ref: equisat_frame.data_section.idle_batch_4.l2_ref.int16
  :field idle_batch_4_l1_sns: equisat_frame.data_section.idle_batch_4.l1_sns.int16
  :field idle_batch_4_l2_sns: equisat_frame.data_section.idle_batch_4.l2_sns.int16
  :field idle_batch_4_l1_temp: equisat_frame.data_section.idle_batch_4.l1_temp.int16
  :field idle_batch_4_l2_temp: equisat_frame.data_section.idle_batch_4.l2_temp.int16
  :field idle_batch_4_panel_ref: equisat_frame.data_section.idle_batch_4.panel_ref.int16
  :field idle_batch_4_l_ref: equisat_frame.data_section.idle_batch_4.l_ref.int16
  :field idle_batch_4_bat_digsigs_1: equisat_frame.data_section.idle_batch_4.bat_digsigs_1
  :field idle_batch_4_bat_digsigs_2: equisat_frame.data_section.idle_batch_4.bat_digsigs_2
  :field idle_batch_4_rad_temp: equisat_frame.data_section.idle_batch_4.rad_temp.int16
  :field idle_batch_4_imu_temp: equisat_frame.data_section.idle_batch_4.imu_temp.int16
  :field idle_batch_4_ir_flash_amb: equisat_frame.data_section.idle_batch_4.ir_flash_amb.int16
  :field idle_batch_4_ir_side1_amb: equisat_frame.data_section.idle_batch_4.ir_side1_amb.int16
  :field idle_batch_4_ir_side2_amb: equisat_frame.data_section.idle_batch_4.ir_side2_amb.int16
  :field idle_batch_4_ir_rbf_amb: equisat_frame.data_section.idle_batch_4.ir_rbf_amb.int16
  :field idle_batch_4_ir_access_amb: equisat_frame.data_section.idle_batch_4.ir_access_amb.int16
  :field idle_batch_4_ir_top1_amb: equisat_frame.data_section.idle_batch_4.ir_top1_amb.int16
  :field idle_batch_4_timestamp: equisat_frame.data_section.idle_batch_4.timestamp
  :field idle_batch_5_event_history: equisat_frame.data_section.idle_batch_5.event_history
  :field idle_batch_5_l1_ref: equisat_frame.data_section.idle_batch_5.l1_ref.int16
  :field idle_batch_5_l2_ref: equisat_frame.data_section.idle_batch_5.l2_ref.int16
  :field idle_batch_5_l1_sns: equisat_frame.data_section.idle_batch_5.l1_sns.int16
  :field idle_batch_5_l2_sns: equisat_frame.data_section.idle_batch_5.l2_sns.int16
  :field idle_batch_5_l1_temp: equisat_frame.data_section.idle_batch_5.l1_temp.int16
  :field idle_batch_5_l2_temp: equisat_frame.data_section.idle_batch_5.l2_temp.int16
  :field idle_batch_5_panel_ref: equisat_frame.data_section.idle_batch_5.panel_ref.int16
  :field idle_batch_5_l_ref: equisat_frame.data_section.idle_batch_5.l_ref.int16
  :field idle_batch_5_bat_digsigs_1: equisat_frame.data_section.idle_batch_5.bat_digsigs_1
  :field idle_batch_5_bat_digsigs_2: equisat_frame.data_section.idle_batch_5.bat_digsigs_2
  :field idle_batch_5_rad_temp: equisat_frame.data_section.idle_batch_5.rad_temp.int16
  :field idle_batch_5_imu_temp: equisat_frame.data_section.idle_batch_5.imu_temp.int16
  :field idle_batch_5_ir_flash_amb: equisat_frame.data_section.idle_batch_5.ir_flash_amb.int16
  :field idle_batch_5_ir_side1_amb: equisat_frame.data_section.idle_batch_5.ir_side1_amb.int16
  :field idle_batch_5_ir_side2_amb: equisat_frame.data_section.idle_batch_5.ir_side2_amb.int16
  :field idle_batch_5_ir_rbf_amb: equisat_frame.data_section.idle_batch_5.ir_rbf_amb.int16
  :field idle_batch_5_ir_access_amb: equisat_frame.data_section.idle_batch_5.ir_access_amb.int16
  :field idle_batch_5_ir_top1_amb: equisat_frame.data_section.idle_batch_5.ir_top1_amb.int16
  :field idle_batch_5_timestamp: equisat_frame.data_section.idle_batch_5.timestamp
  :field idle_batch_6_event_history: equisat_frame.data_section.idle_batch_6.event_history
  :field idle_batch_6_l1_ref: equisat_frame.data_section.idle_batch_6.l1_ref.int16
  :field idle_batch_6_l2_ref: equisat_frame.data_section.idle_batch_6.l2_ref.int16
  :field idle_batch_6_l1_sns: equisat_frame.data_section.idle_batch_6.l1_sns.int16
  :field idle_batch_6_l2_sns: equisat_frame.data_section.idle_batch_6.l2_sns.int16
  :field idle_batch_6_l1_temp: equisat_frame.data_section.idle_batch_6.l1_temp.int16
  :field idle_batch_6_l2_temp: equisat_frame.data_section.idle_batch_6.l2_temp.int16
  :field idle_batch_6_panel_ref: equisat_frame.data_section.idle_batch_6.panel_ref.int16
  :field idle_batch_6_l_ref: equisat_frame.data_section.idle_batch_6.l_ref.int16
  :field idle_batch_6_bat_digsigs_1: equisat_frame.data_section.idle_batch_6.bat_digsigs_1
  :field idle_batch_6_bat_digsigs_2: equisat_frame.data_section.idle_batch_6.bat_digsigs_2
  :field idle_batch_6_rad_temp: equisat_frame.data_section.idle_batch_6.rad_temp.int16
  :field idle_batch_6_imu_temp: equisat_frame.data_section.idle_batch_6.imu_temp.int16
  :field idle_batch_6_ir_flash_amb: equisat_frame.data_section.idle_batch_6.ir_flash_amb.int16
  :field idle_batch_6_ir_side1_amb: equisat_frame.data_section.idle_batch_6.ir_side1_amb.int16
  :field idle_batch_6_ir_side2_amb: equisat_frame.data_section.idle_batch_6.ir_side2_amb.int16
  :field idle_batch_6_ir_rbf_amb: equisat_frame.data_section.idle_batch_6.ir_rbf_amb.int16
  :field idle_batch_6_ir_access_amb: equisat_frame.data_section.idle_batch_6.ir_access_amb.int16
  :field idle_batch_6_ir_top1_amb: equisat_frame.data_section.idle_batch_6.ir_top1_amb.int16
  :field idle_batch_6_timestamp: equisat_frame.data_section.idle_batch_6.timestamp
  :field attitude_batch_0_ir_flash_obj: equisat_frame.data_section.attitude_batch_0.ir_flash_obj
  :field attitude_batch_0_ir_side1_obj: equisat_frame.data_section.attitude_batch_0.ir_side1_obj
  :field attitude_batch_0_ir_side2_obj: equisat_frame.data_section.attitude_batch_0.ir_side2_obj
  :field attitude_batch_0_ir_rbf_obj: equisat_frame.data_section.attitude_batch_0.ir_rbf_obj
  :field attitude_batch_0_ir_access_obj: equisat_frame.data_section.attitude_batch_0.ir_access_obj
  :field attitude_batch_0_ir_top1_obj: equisat_frame.data_section.attitude_batch_0.ir_top1_obj
  :field attitude_batch_0_pd_1: equisat_frame.data_section.attitude_batch_0.pd_1
  :field attitude_batch_0_pd_2: equisat_frame.data_section.attitude_batch_0.pd_2
  :field attitude_batch_0_accelerometer1_x: equisat_frame.data_section.attitude_batch_0.accelerometer1_x.int16
  :field attitude_batch_0_accelerometer1_z: equisat_frame.data_section.attitude_batch_0.accelerometer1_z.int16
  :field attitude_batch_0_accelerometer1_y: equisat_frame.data_section.attitude_batch_0.accelerometer1_y.int16
  :field attitude_batch_0_accelerometer2_x: equisat_frame.data_section.attitude_batch_0.accelerometer2_x.int16
  :field attitude_batch_0_accelerometer2_z: equisat_frame.data_section.attitude_batch_0.accelerometer2_z.int16
  :field attitude_batch_0_accelerometer2_y: equisat_frame.data_section.attitude_batch_0.accelerometer2_y.int16
  :field attitude_batch_0_gyroscope_x: equisat_frame.data_section.attitude_batch_0.gyroscope_x.int16
  :field attitude_batch_0_gyroscope_z: equisat_frame.data_section.attitude_batch_0.gyroscope_z.int16
  :field attitude_batch_0_gyroscope_y: equisat_frame.data_section.attitude_batch_0.gyroscope_y.int16
  :field attitude_batch_0_magnetometer1_x: equisat_frame.data_section.attitude_batch_0.magnetometer1_x.int16
  :field attitude_batch_0_magnetometer1_z: equisat_frame.data_section.attitude_batch_0.magnetometer1_z.int16
  :field attitude_batch_0_magnetometer1_y: equisat_frame.data_section.attitude_batch_0.magnetometer1_y.int16
  :field attitude_batch_0_magnetometer2_x: equisat_frame.data_section.attitude_batch_0.magnetometer2_x.int16
  :field attitude_batch_0_magnetometer2_z: equisat_frame.data_section.attitude_batch_0.magnetometer2_z.int16
  :field attitude_batch_0_magnetometer2_y: equisat_frame.data_section.attitude_batch_0.magnetometer2_y.int16
  :field attitude_batch_0_timestamp: equisat_frame.data_section.attitude_batch_0.timestamp
  :field attitude_batch_0_pd_flash: equisat_frame.data_section.attitude_batch_0.pd_flash
  :field attitude_batch_0_pd_side1: equisat_frame.data_section.attitude_batch_0.pd_side1
  :field attitude_batch_0_pd_side2: equisat_frame.data_section.attitude_batch_0.pd_side2
  :field attitude_batch_0_pd_access: equisat_frame.data_section.attitude_batch_0.pd_access
  :field attitude_batch_0_pd_top1: equisat_frame.data_section.attitude_batch_0.pd_top1
  :field attitude_batch_0_pd_top2: equisat_frame.data_section.attitude_batch_0.pd_top2
  :field attitude_batch_1_ir_flash_obj: equisat_frame.data_section.attitude_batch_1.ir_flash_obj
  :field attitude_batch_1_ir_side1_obj: equisat_frame.data_section.attitude_batch_1.ir_side1_obj
  :field attitude_batch_1_ir_side2_obj: equisat_frame.data_section.attitude_batch_1.ir_side2_obj
  :field attitude_batch_1_ir_rbf_obj: equisat_frame.data_section.attitude_batch_1.ir_rbf_obj
  :field attitude_batch_1_ir_access_obj: equisat_frame.data_section.attitude_batch_1.ir_access_obj
  :field attitude_batch_1_ir_top1_obj: equisat_frame.data_section.attitude_batch_1.ir_top1_obj
  :field attitude_batch_1_pd_1: equisat_frame.data_section.attitude_batch_1.pd_1
  :field attitude_batch_1_pd_2: equisat_frame.data_section.attitude_batch_1.pd_2
  :field attitude_batch_1_accelerometer1_x: equisat_frame.data_section.attitude_batch_1.accelerometer1_x.int16
  :field attitude_batch_1_accelerometer1_z: equisat_frame.data_section.attitude_batch_1.accelerometer1_z.int16
  :field attitude_batch_1_accelerometer1_y: equisat_frame.data_section.attitude_batch_1.accelerometer1_y.int16
  :field attitude_batch_1_accelerometer2_x: equisat_frame.data_section.attitude_batch_1.accelerometer2_x.int16
  :field attitude_batch_1_accelerometer2_z: equisat_frame.data_section.attitude_batch_1.accelerometer2_z.int16
  :field attitude_batch_1_accelerometer2_y: equisat_frame.data_section.attitude_batch_1.accelerometer2_y.int16
  :field attitude_batch_1_gyroscope_x: equisat_frame.data_section.attitude_batch_1.gyroscope_x.int16
  :field attitude_batch_1_gyroscope_z: equisat_frame.data_section.attitude_batch_1.gyroscope_z.int16
  :field attitude_batch_1_gyroscope_y: equisat_frame.data_section.attitude_batch_1.gyroscope_y.int16
  :field attitude_batch_1_magnetometer1_x: equisat_frame.data_section.attitude_batch_1.magnetometer1_x.int16
  :field attitude_batch_1_magnetometer1_z: equisat_frame.data_section.attitude_batch_1.magnetometer1_z.int16
  :field attitude_batch_1_magnetometer1_y: equisat_frame.data_section.attitude_batch_1.magnetometer1_y.int16
  :field attitude_batch_1_magnetometer2_x: equisat_frame.data_section.attitude_batch_1.magnetometer2_x.int16
  :field attitude_batch_1_magnetometer2_z: equisat_frame.data_section.attitude_batch_1.magnetometer2_z.int16
  :field attitude_batch_1_magnetometer2_y: equisat_frame.data_section.attitude_batch_1.magnetometer2_y.int16
  :field attitude_batch_1_timestamp: equisat_frame.data_section.attitude_batch_1.timestamp
  :field attitude_batch_1_pd_flash: equisat_frame.data_section.attitude_batch_1.pd_flash
  :field attitude_batch_1_pd_side1: equisat_frame.data_section.attitude_batch_1.pd_side1
  :field attitude_batch_1_pd_side2: equisat_frame.data_section.attitude_batch_1.pd_side2
  :field attitude_batch_1_pd_access: equisat_frame.data_section.attitude_batch_1.pd_access
  :field attitude_batch_1_pd_top1: equisat_frame.data_section.attitude_batch_1.pd_top1
  :field attitude_batch_1_pd_top2: equisat_frame.data_section.attitude_batch_1.pd_top2
  :field attitude_batch_2_ir_flash_obj: equisat_frame.data_section.attitude_batch_2.ir_flash_obj
  :field attitude_batch_2_ir_side1_obj: equisat_frame.data_section.attitude_batch_2.ir_side1_obj
  :field attitude_batch_2_ir_side2_obj: equisat_frame.data_section.attitude_batch_2.ir_side2_obj
  :field attitude_batch_2_ir_rbf_obj: equisat_frame.data_section.attitude_batch_2.ir_rbf_obj
  :field attitude_batch_2_ir_access_obj: equisat_frame.data_section.attitude_batch_2.ir_access_obj
  :field attitude_batch_2_ir_top1_obj: equisat_frame.data_section.attitude_batch_2.ir_top1_obj
  :field attitude_batch_2_pd_1: equisat_frame.data_section.attitude_batch_2.pd_1
  :field attitude_batch_2_pd_2: equisat_frame.data_section.attitude_batch_2.pd_2
  :field attitude_batch_2_accelerometer1_x: equisat_frame.data_section.attitude_batch_2.accelerometer1_x.int16
  :field attitude_batch_2_accelerometer1_z: equisat_frame.data_section.attitude_batch_2.accelerometer1_z.int16
  :field attitude_batch_2_accelerometer1_y: equisat_frame.data_section.attitude_batch_2.accelerometer1_y.int16
  :field attitude_batch_2_accelerometer2_x: equisat_frame.data_section.attitude_batch_2.accelerometer2_x.int16
  :field attitude_batch_2_accelerometer2_z: equisat_frame.data_section.attitude_batch_2.accelerometer2_z.int16
  :field attitude_batch_2_accelerometer2_y: equisat_frame.data_section.attitude_batch_2.accelerometer2_y.int16
  :field attitude_batch_2_gyroscope_x: equisat_frame.data_section.attitude_batch_2.gyroscope_x.int16
  :field attitude_batch_2_gyroscope_z: equisat_frame.data_section.attitude_batch_2.gyroscope_z.int16
  :field attitude_batch_2_gyroscope_y: equisat_frame.data_section.attitude_batch_2.gyroscope_y.int16
  :field attitude_batch_2_magnetometer1_x: equisat_frame.data_section.attitude_batch_2.magnetometer1_x.int16
  :field attitude_batch_2_magnetometer1_z: equisat_frame.data_section.attitude_batch_2.magnetometer1_z.int16
  :field attitude_batch_2_magnetometer1_y: equisat_frame.data_section.attitude_batch_2.magnetometer1_y.int16
  :field attitude_batch_2_magnetometer2_x: equisat_frame.data_section.attitude_batch_2.magnetometer2_x.int16
  :field attitude_batch_2_magnetometer2_z: equisat_frame.data_section.attitude_batch_2.magnetometer2_z.int16
  :field attitude_batch_2_magnetometer2_y: equisat_frame.data_section.attitude_batch_2.magnetometer2_y.int16
  :field attitude_batch_2_timestamp: equisat_frame.data_section.attitude_batch_2.timestamp
  :field attitude_batch_2_pd_flash: equisat_frame.data_section.attitude_batch_2.pd_flash
  :field attitude_batch_2_pd_side1: equisat_frame.data_section.attitude_batch_2.pd_side1
  :field attitude_batch_2_pd_side2: equisat_frame.data_section.attitude_batch_2.pd_side2
  :field attitude_batch_2_pd_access: equisat_frame.data_section.attitude_batch_2.pd_access
  :field attitude_batch_2_pd_top1: equisat_frame.data_section.attitude_batch_2.pd_top1
  :field attitude_batch_2_pd_top2: equisat_frame.data_section.attitude_batch_2.pd_top2
  :field attitude_batch_3_ir_flash_obj: equisat_frame.data_section.attitude_batch_3.ir_flash_obj
  :field attitude_batch_3_ir_side1_obj: equisat_frame.data_section.attitude_batch_3.ir_side1_obj
  :field attitude_batch_3_ir_side2_obj: equisat_frame.data_section.attitude_batch_3.ir_side2_obj
  :field attitude_batch_3_ir_rbf_obj: equisat_frame.data_section.attitude_batch_3.ir_rbf_obj
  :field attitude_batch_3_ir_access_obj: equisat_frame.data_section.attitude_batch_3.ir_access_obj
  :field attitude_batch_3_ir_top1_obj: equisat_frame.data_section.attitude_batch_3.ir_top1_obj
  :field attitude_batch_3_pd_1: equisat_frame.data_section.attitude_batch_3.pd_1
  :field attitude_batch_3_pd_2: equisat_frame.data_section.attitude_batch_3.pd_2
  :field attitude_batch_3_accelerometer1_x: equisat_frame.data_section.attitude_batch_3.accelerometer1_x.int16
  :field attitude_batch_3_accelerometer1_z: equisat_frame.data_section.attitude_batch_3.accelerometer1_z.int16
  :field attitude_batch_3_accelerometer1_y: equisat_frame.data_section.attitude_batch_3.accelerometer1_y.int16
  :field attitude_batch_3_accelerometer2_x: equisat_frame.data_section.attitude_batch_3.accelerometer2_x.int16
  :field attitude_batch_3_accelerometer2_z: equisat_frame.data_section.attitude_batch_3.accelerometer2_z.int16
  :field attitude_batch_3_accelerometer2_y: equisat_frame.data_section.attitude_batch_3.accelerometer2_y.int16
  :field attitude_batch_3_gyroscope_x: equisat_frame.data_section.attitude_batch_3.gyroscope_x.int16
  :field attitude_batch_3_gyroscope_z: equisat_frame.data_section.attitude_batch_3.gyroscope_z.int16
  :field attitude_batch_3_gyroscope_y: equisat_frame.data_section.attitude_batch_3.gyroscope_y.int16
  :field attitude_batch_3_magnetometer1_x: equisat_frame.data_section.attitude_batch_3.magnetometer1_x.int16
  :field attitude_batch_3_magnetometer1_z: equisat_frame.data_section.attitude_batch_3.magnetometer1_z.int16
  :field attitude_batch_3_magnetometer1_y: equisat_frame.data_section.attitude_batch_3.magnetometer1_y.int16
  :field attitude_batch_3_magnetometer2_x: equisat_frame.data_section.attitude_batch_3.magnetometer2_x.int16
  :field attitude_batch_3_magnetometer2_z: equisat_frame.data_section.attitude_batch_3.magnetometer2_z.int16
  :field attitude_batch_3_magnetometer2_y: equisat_frame.data_section.attitude_batch_3.magnetometer2_y.int16
  :field attitude_batch_3_timestamp: equisat_frame.data_section.attitude_batch_3.timestamp
  :field attitude_batch_3_pd_flash: equisat_frame.data_section.attitude_batch_3.pd_flash
  :field attitude_batch_3_pd_side1: equisat_frame.data_section.attitude_batch_3.pd_side1
  :field attitude_batch_3_pd_side2: equisat_frame.data_section.attitude_batch_3.pd_side2
  :field attitude_batch_3_pd_access: equisat_frame.data_section.attitude_batch_3.pd_access
  :field attitude_batch_3_pd_top1: equisat_frame.data_section.attitude_batch_3.pd_top1
  :field attitude_batch_3_pd_top2: equisat_frame.data_section.attitude_batch_3.pd_top2
  :field attitude_batch_4_ir_flash_obj: equisat_frame.data_section.attitude_batch_4.ir_flash_obj
  :field attitude_batch_4_ir_side1_obj: equisat_frame.data_section.attitude_batch_4.ir_side1_obj
  :field attitude_batch_4_ir_side2_obj: equisat_frame.data_section.attitude_batch_4.ir_side2_obj
  :field attitude_batch_4_ir_rbf_obj: equisat_frame.data_section.attitude_batch_4.ir_rbf_obj
  :field attitude_batch_4_ir_access_obj: equisat_frame.data_section.attitude_batch_4.ir_access_obj
  :field attitude_batch_4_ir_top1_obj: equisat_frame.data_section.attitude_batch_4.ir_top1_obj
  :field attitude_batch_4_pd_1: equisat_frame.data_section.attitude_batch_4.pd_1
  :field attitude_batch_4_pd_2: equisat_frame.data_section.attitude_batch_4.pd_2
  :field attitude_batch_4_accelerometer1_x: equisat_frame.data_section.attitude_batch_4.accelerometer1_x.int16
  :field attitude_batch_4_accelerometer1_z: equisat_frame.data_section.attitude_batch_4.accelerometer1_z.int16
  :field attitude_batch_4_accelerometer1_y: equisat_frame.data_section.attitude_batch_4.accelerometer1_y.int16
  :field attitude_batch_4_accelerometer2_x: equisat_frame.data_section.attitude_batch_4.accelerometer2_x.int16
  :field attitude_batch_4_accelerometer2_z: equisat_frame.data_section.attitude_batch_4.accelerometer2_z.int16
  :field attitude_batch_4_accelerometer2_y: equisat_frame.data_section.attitude_batch_4.accelerometer2_y.int16
  :field attitude_batch_4_gyroscope_x: equisat_frame.data_section.attitude_batch_4.gyroscope_x.int16
  :field attitude_batch_4_gyroscope_z: equisat_frame.data_section.attitude_batch_4.gyroscope_z.int16
  :field attitude_batch_4_gyroscope_y: equisat_frame.data_section.attitude_batch_4.gyroscope_y.int16
  :field attitude_batch_4_magnetometer1_x: equisat_frame.data_section.attitude_batch_4.magnetometer1_x.int16
  :field attitude_batch_4_magnetometer1_z: equisat_frame.data_section.attitude_batch_4.magnetometer1_z.int16
  :field attitude_batch_4_magnetometer1_y: equisat_frame.data_section.attitude_batch_4.magnetometer1_y.int16
  :field attitude_batch_4_magnetometer2_x: equisat_frame.data_section.attitude_batch_4.magnetometer2_x.int16
  :field attitude_batch_4_magnetometer2_z: equisat_frame.data_section.attitude_batch_4.magnetometer2_z.int16
  :field attitude_batch_4_magnetometer2_y: equisat_frame.data_section.attitude_batch_4.magnetometer2_y.int16
  :field attitude_batch_4_timestamp: equisat_frame.data_section.attitude_batch_4.timestamp
  :field attitude_batch_4_pd_flash: equisat_frame.data_section.attitude_batch_4.pd_flash
  :field attitude_batch_4_pd_side1: equisat_frame.data_section.attitude_batch_4.pd_side1
  :field attitude_batch_4_pd_side2: equisat_frame.data_section.attitude_batch_4.pd_side2
  :field attitude_batch_4_pd_access: equisat_frame.data_section.attitude_batch_4.pd_access
  :field attitude_batch_4_pd_top1: equisat_frame.data_section.attitude_batch_4.pd_top1
  :field attitude_batch_4_pd_top2: equisat_frame.data_section.attitude_batch_4.pd_top2
  :field flash_burst_data_led1_temp_0: equisat_frame.data_section.led1_temp_0.int16
  :field flash_burst_data_led1_temp_1: equisat_frame.data_section.led1_temp_1.int16
  :field flash_burst_data_led1_temp_2: equisat_frame.data_section.led1_temp_2.int16
  :field flash_burst_data_led1_temp_3: equisat_frame.data_section.led1_temp_3.int16
  :field flash_burst_data_led1_temp_4: equisat_frame.data_section.led1_temp_4.int16
  :field flash_burst_data_led1_temp_5: equisat_frame.data_section.led1_temp_5.int16
  :field flash_burst_data_led1_temp_6: equisat_frame.data_section.led1_temp_6.int16
  :field flash_burst_data_led2_temp_0: equisat_frame.data_section.led2_temp_0.int16
  :field flash_burst_data_led2_temp_1: equisat_frame.data_section.led2_temp_1.int16
  :field flash_burst_data_led2_temp_2: equisat_frame.data_section.led2_temp_2.int16
  :field flash_burst_data_led2_temp_3: equisat_frame.data_section.led2_temp_3.int16
  :field flash_burst_data_led2_temp_4: equisat_frame.data_section.led2_temp_4.int16
  :field flash_burst_data_led2_temp_5: equisat_frame.data_section.led2_temp_5.int16
  :field flash_burst_data_led2_temp_6: equisat_frame.data_section.led2_temp_6.int16
  :field flash_burst_data_led3_temp_0: equisat_frame.data_section.led3_temp_0.int16
  :field flash_burst_data_led3_temp_1: equisat_frame.data_section.led3_temp_1.int16
  :field flash_burst_data_led3_temp_2: equisat_frame.data_section.led3_temp_2.int16
  :field flash_burst_data_led3_temp_3: equisat_frame.data_section.led3_temp_3.int16
  :field flash_burst_data_led3_temp_4: equisat_frame.data_section.led3_temp_4.int16
  :field flash_burst_data_led3_temp_5: equisat_frame.data_section.led3_temp_5.int16
  :field flash_burst_data_led3_temp_6: equisat_frame.data_section.led3_temp_6.int16
  :field flash_burst_data_led4_temp_0: equisat_frame.data_section.led4_temp_0.int16
  :field flash_burst_data_led4_temp_1: equisat_frame.data_section.led4_temp_1.int16
  :field flash_burst_data_led4_temp_2: equisat_frame.data_section.led4_temp_2.int16
  :field flash_burst_data_led4_temp_3: equisat_frame.data_section.led4_temp_3.int16
  :field flash_burst_data_led4_temp_4: equisat_frame.data_section.led4_temp_4.int16
  :field flash_burst_data_led4_temp_5: equisat_frame.data_section.led4_temp_5.int16
  :field flash_burst_data_led4_temp_6: equisat_frame.data_section.led4_temp_6.int16
  :field flash_burst_data_lf1_temp_0: equisat_frame.data_section.lf1_temp_0.int16
  :field flash_burst_data_lf1_temp_1: equisat_frame.data_section.lf1_temp_1.int16
  :field flash_burst_data_lf1_temp_2: equisat_frame.data_section.lf1_temp_2.int16
  :field flash_burst_data_lf1_temp_3: equisat_frame.data_section.lf1_temp_3.int16
  :field flash_burst_data_lf1_temp_4: equisat_frame.data_section.lf1_temp_4.int16
  :field flash_burst_data_lf1_temp_5: equisat_frame.data_section.lf1_temp_5.int16
  :field flash_burst_data_lf1_temp_6: equisat_frame.data_section.lf1_temp_6.int16
  :field flash_burst_data_lf3_temp_0: equisat_frame.data_section.lf3_temp_0.int16
  :field flash_burst_data_lf3_temp_1: equisat_frame.data_section.lf3_temp_1.int16
  :field flash_burst_data_lf3_temp_2: equisat_frame.data_section.lf3_temp_2.int16
  :field flash_burst_data_lf3_temp_3: equisat_frame.data_section.lf3_temp_3.int16
  :field flash_burst_data_lf3_temp_4: equisat_frame.data_section.lf3_temp_4.int16
  :field flash_burst_data_lf3_temp_5: equisat_frame.data_section.lf3_temp_5.int16
  :field flash_burst_data_lf3_temp_6: equisat_frame.data_section.lf3_temp_6.int16
  :field flash_burst_data_lfb1_sns_0: equisat_frame.data_section.lfb1_sns_0.int16
  :field flash_burst_data_lfb1_sns_1: equisat_frame.data_section.lfb1_sns_1.int16
  :field flash_burst_data_lfb1_sns_2: equisat_frame.data_section.lfb1_sns_2.int16
  :field flash_burst_data_lfb1_sns_3: equisat_frame.data_section.lfb1_sns_3.int16
  :field flash_burst_data_lfb1_sns_4: equisat_frame.data_section.lfb1_sns_4.int16
  :field flash_burst_data_lfb1_sns_5: equisat_frame.data_section.lfb1_sns_5.int16
  :field flash_burst_data_lfb1_sns_6: equisat_frame.data_section.lfb1_sns_6.int16
  :field flash_burst_data_lfb1_osns_0: equisat_frame.data_section.lfb1_osns_0.int16
  :field flash_burst_data_lfb1_osns_1: equisat_frame.data_section.lfb1_osns_1.int16
  :field flash_burst_data_lfb1_osns_2: equisat_frame.data_section.lfb1_osns_2.int16
  :field flash_burst_data_lfb1_osns_3: equisat_frame.data_section.lfb1_osns_3.int16
  :field flash_burst_data_lfb1_osns_4: equisat_frame.data_section.lfb1_osns_4.int16
  :field flash_burst_data_lfb1_osns_5: equisat_frame.data_section.lfb1_osns_5.int16
  :field flash_burst_data_lfb1_osns_6: equisat_frame.data_section.lfb1_osns_6.int16
  :field flash_burst_data_lfb2_sns_0: equisat_frame.data_section.lfb2_sns_0.int16
  :field flash_burst_data_lfb2_sns_1: equisat_frame.data_section.lfb2_sns_1.int16
  :field flash_burst_data_lfb2_sns_2: equisat_frame.data_section.lfb2_sns_2.int16
  :field flash_burst_data_lfb2_sns_3: equisat_frame.data_section.lfb2_sns_3.int16
  :field flash_burst_data_lfb2_sns_4: equisat_frame.data_section.lfb2_sns_4.int16
  :field flash_burst_data_lfb2_sns_5: equisat_frame.data_section.lfb2_sns_5.int16
  :field flash_burst_data_lfb2_sns_6: equisat_frame.data_section.lfb2_sns_6.int16
  :field flash_burst_data_lfb2_osns_0: equisat_frame.data_section.lfb2_osns_0.int16
  :field flash_burst_data_lfb2_osns_1: equisat_frame.data_section.lfb2_osns_1.int16
  :field flash_burst_data_lfb2_osns_2: equisat_frame.data_section.lfb2_osns_2.int16
  :field flash_burst_data_lfb2_osns_3: equisat_frame.data_section.lfb2_osns_3.int16
  :field flash_burst_data_lfb2_osns_4: equisat_frame.data_section.lfb2_osns_4.int16
  :field flash_burst_data_lfb2_osns_5: equisat_frame.data_section.lfb2_osns_5.int16
  :field flash_burst_data_lfb2_osns_6: equisat_frame.data_section.lfb2_osns_6.int16
  :field flash_burst_data_lf1_ref_0: equisat_frame.data_section.lf1_ref_0.int16
  :field flash_burst_data_lf1_ref_1: equisat_frame.data_section.lf1_ref_1.int16
  :field flash_burst_data_lf1_ref_2: equisat_frame.data_section.lf1_ref_2.int16
  :field flash_burst_data_lf1_ref_3: equisat_frame.data_section.lf1_ref_3.int16
  :field flash_burst_data_lf1_ref_4: equisat_frame.data_section.lf1_ref_4.int16
  :field flash_burst_data_lf1_ref_5: equisat_frame.data_section.lf1_ref_5.int16
  :field flash_burst_data_lf1_ref_6: equisat_frame.data_section.lf1_ref_6.int16
  :field flash_burst_data_lf2_ref_0: equisat_frame.data_section.lf2_ref_0.int16
  :field flash_burst_data_lf2_ref_1: equisat_frame.data_section.lf2_ref_1.int16
  :field flash_burst_data_lf2_ref_2: equisat_frame.data_section.lf2_ref_2.int16
  :field flash_burst_data_lf2_ref_3: equisat_frame.data_section.lf2_ref_3.int16
  :field flash_burst_data_lf2_ref_4: equisat_frame.data_section.lf2_ref_4.int16
  :field flash_burst_data_lf2_ref_5: equisat_frame.data_section.lf2_ref_5.int16
  :field flash_burst_data_lf2_ref_6: equisat_frame.data_section.lf2_ref_6.int16
  :field flash_burst_data_lf3_ref_0: equisat_frame.data_section.lf3_ref_0.int16
  :field flash_burst_data_lf3_ref_1: equisat_frame.data_section.lf3_ref_1.int16
  :field flash_burst_data_lf3_ref_2: equisat_frame.data_section.lf3_ref_2.int16
  :field flash_burst_data_lf3_ref_3: equisat_frame.data_section.lf3_ref_3.int16
  :field flash_burst_data_lf3_ref_4: equisat_frame.data_section.lf3_ref_4.int16
  :field flash_burst_data_lf3_ref_5: equisat_frame.data_section.lf3_ref_5.int16
  :field flash_burst_data_lf3_ref_6: equisat_frame.data_section.lf3_ref_6.int16
  :field flash_burst_data_lf4_ref_0: equisat_frame.data_section.lf4_ref_0.int16
  :field flash_burst_data_lf4_ref_1: equisat_frame.data_section.lf4_ref_1.int16
  :field flash_burst_data_lf4_ref_2: equisat_frame.data_section.lf4_ref_2.int16
  :field flash_burst_data_lf4_ref_3: equisat_frame.data_section.lf4_ref_3.int16
  :field flash_burst_data_lf4_ref_4: equisat_frame.data_section.lf4_ref_4.int16
  :field flash_burst_data_lf4_ref_5: equisat_frame.data_section.lf4_ref_5.int16
  :field flash_burst_data_lf4_ref_6: equisat_frame.data_section.lf4_ref_6.int16
  :field flash_burst_data_led1_sns_0: equisat_frame.data_section.led1_sns_0.int16
  :field flash_burst_data_led1_sns_1: equisat_frame.data_section.led1_sns_1.int16
  :field flash_burst_data_led1_sns_2: equisat_frame.data_section.led1_sns_2.int16
  :field flash_burst_data_led1_sns_3: equisat_frame.data_section.led1_sns_3.int16
  :field flash_burst_data_led1_sns_4: equisat_frame.data_section.led1_sns_4.int16
  :field flash_burst_data_led1_sns_5: equisat_frame.data_section.led1_sns_5.int16
  :field flash_burst_data_led1_sns_6: equisat_frame.data_section.led1_sns_6.int16
  :field flash_burst_data_led2_sns_0: equisat_frame.data_section.led2_sns_0.int16
  :field flash_burst_data_led2_sns_1: equisat_frame.data_section.led2_sns_1.int16
  :field flash_burst_data_led2_sns_2: equisat_frame.data_section.led2_sns_2.int16
  :field flash_burst_data_led2_sns_3: equisat_frame.data_section.led2_sns_3.int16
  :field flash_burst_data_led2_sns_4: equisat_frame.data_section.led2_sns_4.int16
  :field flash_burst_data_led2_sns_5: equisat_frame.data_section.led2_sns_5.int16
  :field flash_burst_data_led2_sns_6: equisat_frame.data_section.led2_sns_6.int16
  :field flash_burst_data_led3_sns_0: equisat_frame.data_section.led3_sns_0.int16
  :field flash_burst_data_led3_sns_1: equisat_frame.data_section.led3_sns_1.int16
  :field flash_burst_data_led3_sns_2: equisat_frame.data_section.led3_sns_2.int16
  :field flash_burst_data_led3_sns_3: equisat_frame.data_section.led3_sns_3.int16
  :field flash_burst_data_led3_sns_4: equisat_frame.data_section.led3_sns_4.int16
  :field flash_burst_data_led3_sns_5: equisat_frame.data_section.led3_sns_5.int16
  :field flash_burst_data_led3_sns_6: equisat_frame.data_section.led3_sns_6.int16
  :field flash_burst_data_led4_sns_0: equisat_frame.data_section.led4_sns_0.int16
  :field flash_burst_data_led4_sns_1: equisat_frame.data_section.led4_sns_1.int16
  :field flash_burst_data_led4_sns_2: equisat_frame.data_section.led4_sns_2.int16
  :field flash_burst_data_led4_sns_3: equisat_frame.data_section.led4_sns_3.int16
  :field flash_burst_data_led4_sns_4: equisat_frame.data_section.led4_sns_4.int16
  :field flash_burst_data_led4_sns_5: equisat_frame.data_section.led4_sns_5.int16
  :field flash_burst_data_led4_sns_6: equisat_frame.data_section.led4_sns_6.int16
  :field flash_burst_data_gyroscope_x_0: equisat_frame.data_section.gyroscope_x_0.int16
  :field flash_burst_data_gyroscope_x_1: equisat_frame.data_section.gyroscope_x_1.int16
  :field flash_burst_data_gyroscope_x_2: equisat_frame.data_section.gyroscope_x_2.int16
  :field flash_burst_data_gyroscope_x_3: equisat_frame.data_section.gyroscope_x_3.int16
  :field flash_burst_data_gyroscope_x_4: equisat_frame.data_section.gyroscope_x_4.int16
  :field flash_burst_data_gyroscope_x_5: equisat_frame.data_section.gyroscope_x_5.int16
  :field flash_burst_data_gyroscope_x_6: equisat_frame.data_section.gyroscope_x_6.int16
  :field flash_burst_data_gyroscope_z_0: equisat_frame.data_section.gyroscope_z_0.int16
  :field flash_burst_data_gyroscope_z_1: equisat_frame.data_section.gyroscope_z_1.int16
  :field flash_burst_data_gyroscope_z_2: equisat_frame.data_section.gyroscope_z_2.int16
  :field flash_burst_data_gyroscope_z_3: equisat_frame.data_section.gyroscope_z_3.int16
  :field flash_burst_data_gyroscope_z_4: equisat_frame.data_section.gyroscope_z_4.int16
  :field flash_burst_data_gyroscope_z_5: equisat_frame.data_section.gyroscope_z_5.int16
  :field flash_burst_data_gyroscope_z_6: equisat_frame.data_section.gyroscope_z_6.int16
  :field flash_burst_data_gyroscope_y_0: equisat_frame.data_section.gyroscope_y_0.int16
  :field flash_burst_data_gyroscope_y_1: equisat_frame.data_section.gyroscope_y_1.int16
  :field flash_burst_data_gyroscope_y_2: equisat_frame.data_section.gyroscope_y_2.int16
  :field flash_burst_data_gyroscope_y_3: equisat_frame.data_section.gyroscope_y_3.int16
  :field flash_burst_data_gyroscope_y_4: equisat_frame.data_section.gyroscope_y_4.int16
  :field flash_burst_data_gyroscope_y_5: equisat_frame.data_section.gyroscope_y_5.int16
  :field flash_burst_data_gyroscope_y_6: equisat_frame.data_section.gyroscope_y_6.int16
  :field flash_cmp_batch_0_led1_temp: equisat_frame.data_section.flash_cmp_batch_0.led1_temp.int16
  :field flash_cmp_batch_0_led2_temp: equisat_frame.data_section.flash_cmp_batch_0.led2_temp.int16
  :field flash_cmp_batch_0_led3_temp: equisat_frame.data_section.flash_cmp_batch_0.led3_temp.int16
  :field flash_cmp_batch_0_led4_temp: equisat_frame.data_section.flash_cmp_batch_0.led4_temp.int16
  :field flash_cmp_batch_0_lf1_temp: equisat_frame.data_section.flash_cmp_batch_0.lf1_temp.int16
  :field flash_cmp_batch_0_lf3_temp: equisat_frame.data_section.flash_cmp_batch_0.lf3_temp.int16
  :field flash_cmp_batch_0_lfb1_sns: equisat_frame.data_section.flash_cmp_batch_0.lfb1_sns.int16
  :field flash_cmp_batch_0_lfb1_osns: equisat_frame.data_section.flash_cmp_batch_0.lfb1_osns.int16
  :field flash_cmp_batch_0_lfb2_sns: equisat_frame.data_section.flash_cmp_batch_0.lfb2_sns.int16
  :field flash_cmp_batch_0_lfb2_osns: equisat_frame.data_section.flash_cmp_batch_0.lfb2_osns.int16
  :field flash_cmp_batch_0_lf1_ref: equisat_frame.data_section.flash_cmp_batch_0.lf1_ref.int16
  :field flash_cmp_batch_0_lf2_ref: equisat_frame.data_section.flash_cmp_batch_0.lf2_ref.int16
  :field flash_cmp_batch_0_lf3_ref: equisat_frame.data_section.flash_cmp_batch_0.lf3_ref.int16
  :field flash_cmp_batch_0_lf4_ref: equisat_frame.data_section.flash_cmp_batch_0.lf4_ref.int16
  :field flash_cmp_batch_0_led1_sns: equisat_frame.data_section.flash_cmp_batch_0.led1_sns.int16
  :field flash_cmp_batch_0_led2_sns: equisat_frame.data_section.flash_cmp_batch_0.led2_sns.int16
  :field flash_cmp_batch_0_led3_sns: equisat_frame.data_section.flash_cmp_batch_0.led3_sns.int16
  :field flash_cmp_batch_0_led4_sns: equisat_frame.data_section.flash_cmp_batch_0.led4_sns.int16
  :field flash_cmp_batch_0_magnetometer_x: equisat_frame.data_section.flash_cmp_batch_0.magnetometer_x.int16
  :field flash_cmp_batch_0_magnetometer_z: equisat_frame.data_section.flash_cmp_batch_0.magnetometer_z.int16
  :field flash_cmp_batch_0_magnetometer_y: equisat_frame.data_section.flash_cmp_batch_0.magnetometer_y.int16
  :field flash_cmp_batch_0_timestamp: equisat_frame.data_section.flash_cmp_batch_0.timestamp
  :field flash_cmp_batch_1_led1_temp: equisat_frame.data_section.flash_cmp_batch_1.led1_temp.int16
  :field flash_cmp_batch_1_led2_temp: equisat_frame.data_section.flash_cmp_batch_1.led2_temp.int16
  :field flash_cmp_batch_1_led3_temp: equisat_frame.data_section.flash_cmp_batch_1.led3_temp.int16
  :field flash_cmp_batch_1_led4_temp: equisat_frame.data_section.flash_cmp_batch_1.led4_temp.int16
  :field flash_cmp_batch_1_lf1_temp: equisat_frame.data_section.flash_cmp_batch_1.lf1_temp.int16
  :field flash_cmp_batch_1_lf3_temp: equisat_frame.data_section.flash_cmp_batch_1.lf3_temp.int16
  :field flash_cmp_batch_1_lfb1_sns: equisat_frame.data_section.flash_cmp_batch_1.lfb1_sns.int16
  :field flash_cmp_batch_1_lfb1_osns: equisat_frame.data_section.flash_cmp_batch_1.lfb1_osns.int16
  :field flash_cmp_batch_1_lfb2_sns: equisat_frame.data_section.flash_cmp_batch_1.lfb2_sns.int16
  :field flash_cmp_batch_1_lfb2_osns: equisat_frame.data_section.flash_cmp_batch_1.lfb2_osns.int16
  :field flash_cmp_batch_1_lf1_ref: equisat_frame.data_section.flash_cmp_batch_1.lf1_ref.int16
  :field flash_cmp_batch_1_lf2_ref: equisat_frame.data_section.flash_cmp_batch_1.lf2_ref.int16
  :field flash_cmp_batch_1_lf3_ref: equisat_frame.data_section.flash_cmp_batch_1.lf3_ref.int16
  :field flash_cmp_batch_1_lf4_ref: equisat_frame.data_section.flash_cmp_batch_1.lf4_ref.int16
  :field flash_cmp_batch_1_led1_sns: equisat_frame.data_section.flash_cmp_batch_1.led1_sns.int16
  :field flash_cmp_batch_1_led2_sns: equisat_frame.data_section.flash_cmp_batch_1.led2_sns.int16
  :field flash_cmp_batch_1_led3_sns: equisat_frame.data_section.flash_cmp_batch_1.led3_sns.int16
  :field flash_cmp_batch_1_led4_sns: equisat_frame.data_section.flash_cmp_batch_1.led4_sns.int16
  :field flash_cmp_batch_1_magnetometer_x: equisat_frame.data_section.flash_cmp_batch_1.magnetometer_x.int16
  :field flash_cmp_batch_1_magnetometer_z: equisat_frame.data_section.flash_cmp_batch_1.magnetometer_z.int16
  :field flash_cmp_batch_1_magnetometer_y: equisat_frame.data_section.flash_cmp_batch_1.magnetometer_y.int16
  :field flash_cmp_batch_1_timestamp: equisat_frame.data_section.flash_cmp_batch_1.timestamp
  :field flash_cmp_batch_2_led1_temp: equisat_frame.data_section.flash_cmp_batch_2.led1_temp.int16
  :field flash_cmp_batch_2_led2_temp: equisat_frame.data_section.flash_cmp_batch_2.led2_temp.int16
  :field flash_cmp_batch_2_led3_temp: equisat_frame.data_section.flash_cmp_batch_2.led3_temp.int16
  :field flash_cmp_batch_2_led4_temp: equisat_frame.data_section.flash_cmp_batch_2.led4_temp.int16
  :field flash_cmp_batch_2_lf1_temp: equisat_frame.data_section.flash_cmp_batch_2.lf1_temp.int16
  :field flash_cmp_batch_2_lf3_temp: equisat_frame.data_section.flash_cmp_batch_2.lf3_temp.int16
  :field flash_cmp_batch_2_lfb1_sns: equisat_frame.data_section.flash_cmp_batch_2.lfb1_sns.int16
  :field flash_cmp_batch_2_lfb1_osns: equisat_frame.data_section.flash_cmp_batch_2.lfb1_osns.int16
  :field flash_cmp_batch_2_lfb2_sns: equisat_frame.data_section.flash_cmp_batch_2.lfb2_sns.int16
  :field flash_cmp_batch_2_lfb2_osns: equisat_frame.data_section.flash_cmp_batch_2.lfb2_osns.int16
  :field flash_cmp_batch_2_lf1_ref: equisat_frame.data_section.flash_cmp_batch_2.lf1_ref.int16
  :field flash_cmp_batch_2_lf2_ref: equisat_frame.data_section.flash_cmp_batch_2.lf2_ref.int16
  :field flash_cmp_batch_2_lf3_ref: equisat_frame.data_section.flash_cmp_batch_2.lf3_ref.int16
  :field flash_cmp_batch_2_lf4_ref: equisat_frame.data_section.flash_cmp_batch_2.lf4_ref.int16
  :field flash_cmp_batch_2_led1_sns: equisat_frame.data_section.flash_cmp_batch_2.led1_sns.int16
  :field flash_cmp_batch_2_led2_sns: equisat_frame.data_section.flash_cmp_batch_2.led2_sns.int16
  :field flash_cmp_batch_2_led3_sns: equisat_frame.data_section.flash_cmp_batch_2.led3_sns.int16
  :field flash_cmp_batch_2_led4_sns: equisat_frame.data_section.flash_cmp_batch_2.led4_sns.int16
  :field flash_cmp_batch_2_magnetometer_x: equisat_frame.data_section.flash_cmp_batch_2.magnetometer_x.int16
  :field flash_cmp_batch_2_magnetometer_z: equisat_frame.data_section.flash_cmp_batch_2.magnetometer_z.int16
  :field flash_cmp_batch_2_magnetometer_y: equisat_frame.data_section.flash_cmp_batch_2.magnetometer_y.int16
  :field flash_cmp_batch_2_timestamp: equisat_frame.data_section.flash_cmp_batch_2.timestamp
  :field flash_cmp_batch_3_led1_temp: equisat_frame.data_section.flash_cmp_batch_3.led1_temp.int16
  :field flash_cmp_batch_3_led2_temp: equisat_frame.data_section.flash_cmp_batch_3.led2_temp.int16
  :field flash_cmp_batch_3_led3_temp: equisat_frame.data_section.flash_cmp_batch_3.led3_temp.int16
  :field flash_cmp_batch_3_led4_temp: equisat_frame.data_section.flash_cmp_batch_3.led4_temp.int16
  :field flash_cmp_batch_3_lf1_temp: equisat_frame.data_section.flash_cmp_batch_3.lf1_temp.int16
  :field flash_cmp_batch_3_lf3_temp: equisat_frame.data_section.flash_cmp_batch_3.lf3_temp.int16
  :field flash_cmp_batch_3_lfb1_sns: equisat_frame.data_section.flash_cmp_batch_3.lfb1_sns.int16
  :field flash_cmp_batch_3_lfb1_osns: equisat_frame.data_section.flash_cmp_batch_3.lfb1_osns.int16
  :field flash_cmp_batch_3_lfb2_sns: equisat_frame.data_section.flash_cmp_batch_3.lfb2_sns.int16
  :field flash_cmp_batch_3_lfb2_osns: equisat_frame.data_section.flash_cmp_batch_3.lfb2_osns.int16
  :field flash_cmp_batch_3_lf1_ref: equisat_frame.data_section.flash_cmp_batch_3.lf1_ref.int16
  :field flash_cmp_batch_3_lf2_ref: equisat_frame.data_section.flash_cmp_batch_3.lf2_ref.int16
  :field flash_cmp_batch_3_lf3_ref: equisat_frame.data_section.flash_cmp_batch_3.lf3_ref.int16
  :field flash_cmp_batch_3_lf4_ref: equisat_frame.data_section.flash_cmp_batch_3.lf4_ref.int16
  :field flash_cmp_batch_3_led1_sns: equisat_frame.data_section.flash_cmp_batch_3.led1_sns.int16
  :field flash_cmp_batch_3_led2_sns: equisat_frame.data_section.flash_cmp_batch_3.led2_sns.int16
  :field flash_cmp_batch_3_led3_sns: equisat_frame.data_section.flash_cmp_batch_3.led3_sns.int16
  :field flash_cmp_batch_3_led4_sns: equisat_frame.data_section.flash_cmp_batch_3.led4_sns.int16
  :field flash_cmp_batch_3_magnetometer_x: equisat_frame.data_section.flash_cmp_batch_3.magnetometer_x.int16
  :field flash_cmp_batch_3_magnetometer_z: equisat_frame.data_section.flash_cmp_batch_3.magnetometer_z.int16
  :field flash_cmp_batch_3_magnetometer_y: equisat_frame.data_section.flash_cmp_batch_3.magnetometer_y.int16
  :field flash_cmp_batch_3_timestamp: equisat_frame.data_section.flash_cmp_batch_3.timestamp
  :field flash_cmp_batch_4_led1_temp: equisat_frame.data_section.flash_cmp_batch_4.led1_temp.int16
  :field flash_cmp_batch_4_led2_temp: equisat_frame.data_section.flash_cmp_batch_4.led2_temp.int16
  :field flash_cmp_batch_4_led3_temp: equisat_frame.data_section.flash_cmp_batch_4.led3_temp.int16
  :field flash_cmp_batch_4_led4_temp: equisat_frame.data_section.flash_cmp_batch_4.led4_temp.int16
  :field flash_cmp_batch_4_lf1_temp: equisat_frame.data_section.flash_cmp_batch_4.lf1_temp.int16
  :field flash_cmp_batch_4_lf3_temp: equisat_frame.data_section.flash_cmp_batch_4.lf3_temp.int16
  :field flash_cmp_batch_4_lfb1_sns: equisat_frame.data_section.flash_cmp_batch_4.lfb1_sns.int16
  :field flash_cmp_batch_4_lfb1_osns: equisat_frame.data_section.flash_cmp_batch_4.lfb1_osns.int16
  :field flash_cmp_batch_4_lfb2_sns: equisat_frame.data_section.flash_cmp_batch_4.lfb2_sns.int16
  :field flash_cmp_batch_4_lfb2_osns: equisat_frame.data_section.flash_cmp_batch_4.lfb2_osns.int16
  :field flash_cmp_batch_4_lf1_ref: equisat_frame.data_section.flash_cmp_batch_4.lf1_ref.int16
  :field flash_cmp_batch_4_lf2_ref: equisat_frame.data_section.flash_cmp_batch_4.lf2_ref.int16
  :field flash_cmp_batch_4_lf3_ref: equisat_frame.data_section.flash_cmp_batch_4.lf3_ref.int16
  :field flash_cmp_batch_4_lf4_ref: equisat_frame.data_section.flash_cmp_batch_4.lf4_ref.int16
  :field flash_cmp_batch_4_led1_sns: equisat_frame.data_section.flash_cmp_batch_4.led1_sns.int16
  :field flash_cmp_batch_4_led2_sns: equisat_frame.data_section.flash_cmp_batch_4.led2_sns.int16
  :field flash_cmp_batch_4_led3_sns: equisat_frame.data_section.flash_cmp_batch_4.led3_sns.int16
  :field flash_cmp_batch_4_led4_sns: equisat_frame.data_section.flash_cmp_batch_4.led4_sns.int16
  :field flash_cmp_batch_4_magnetometer_x: equisat_frame.data_section.flash_cmp_batch_4.magnetometer_x.int16
  :field flash_cmp_batch_4_magnetometer_z: equisat_frame.data_section.flash_cmp_batch_4.magnetometer_z.int16
  :field flash_cmp_batch_4_magnetometer_y: equisat_frame.data_section.flash_cmp_batch_4.magnetometer_y.int16
  :field flash_cmp_batch_4_timestamp: equisat_frame.data_section.flash_cmp_batch_4.timestamp
  :field flash_cmp_batch_5_led1_temp: equisat_frame.data_section.flash_cmp_batch_5.led1_temp.int16
  :field flash_cmp_batch_5_led2_temp: equisat_frame.data_section.flash_cmp_batch_5.led2_temp.int16
  :field flash_cmp_batch_5_led3_temp: equisat_frame.data_section.flash_cmp_batch_5.led3_temp.int16
  :field flash_cmp_batch_5_led4_temp: equisat_frame.data_section.flash_cmp_batch_5.led4_temp.int16
  :field flash_cmp_batch_5_lf1_temp: equisat_frame.data_section.flash_cmp_batch_5.lf1_temp.int16
  :field flash_cmp_batch_5_lf3_temp: equisat_frame.data_section.flash_cmp_batch_5.lf3_temp.int16
  :field flash_cmp_batch_5_lfb1_sns: equisat_frame.data_section.flash_cmp_batch_5.lfb1_sns.int16
  :field flash_cmp_batch_5_lfb1_osns: equisat_frame.data_section.flash_cmp_batch_5.lfb1_osns.int16
  :field flash_cmp_batch_5_lfb2_sns: equisat_frame.data_section.flash_cmp_batch_5.lfb2_sns.int16
  :field flash_cmp_batch_5_lfb2_osns: equisat_frame.data_section.flash_cmp_batch_5.lfb2_osns.int16
  :field flash_cmp_batch_5_lf1_ref: equisat_frame.data_section.flash_cmp_batch_5.lf1_ref.int16
  :field flash_cmp_batch_5_lf2_ref: equisat_frame.data_section.flash_cmp_batch_5.lf2_ref.int16
  :field flash_cmp_batch_5_lf3_ref: equisat_frame.data_section.flash_cmp_batch_5.lf3_ref.int16
  :field flash_cmp_batch_5_lf4_ref: equisat_frame.data_section.flash_cmp_batch_5.lf4_ref.int16
  :field flash_cmp_batch_5_led1_sns: equisat_frame.data_section.flash_cmp_batch_5.led1_sns.int16
  :field flash_cmp_batch_5_led2_sns: equisat_frame.data_section.flash_cmp_batch_5.led2_sns.int16
  :field flash_cmp_batch_5_led3_sns: equisat_frame.data_section.flash_cmp_batch_5.led3_sns.int16
  :field flash_cmp_batch_5_led4_sns: equisat_frame.data_section.flash_cmp_batch_5.led4_sns.int16
  :field flash_cmp_batch_5_magnetometer_x: equisat_frame.data_section.flash_cmp_batch_5.magnetometer_x.int16
  :field flash_cmp_batch_5_magnetometer_z: equisat_frame.data_section.flash_cmp_batch_5.magnetometer_z.int16
  :field flash_cmp_batch_5_magnetometer_y: equisat_frame.data_section.flash_cmp_batch_5.magnetometer_y.int16
  :field flash_cmp_batch_5_timestamp: equisat_frame.data_section.flash_cmp_batch_5.timestamp
  :field lowpower_batch_0_event_history: equisat_frame.data_section.lowpower_batch_0.event_history
  :field lowpower_batch_0_l1_ref: equisat_frame.data_section.lowpower_batch_0.l1_ref.int16
  :field lowpower_batch_0_l2_ref: equisat_frame.data_section.lowpower_batch_0.l2_ref.int16
  :field lowpower_batch_0_l1_sns: equisat_frame.data_section.lowpower_batch_0.l1_sns.int16
  :field lowpower_batch_0_l2_sns: equisat_frame.data_section.lowpower_batch_0.l2_sns.int16
  :field lowpower_batch_0_l1_temp: equisat_frame.data_section.lowpower_batch_0.l1_temp.int16
  :field lowpower_batch_0_l2_temp: equisat_frame.data_section.lowpower_batch_0.l2_temp.int16
  :field lowpower_batch_0_panel_ref: equisat_frame.data_section.lowpower_batch_0.panel_ref.int16
  :field lowpower_batch_0_l_ref: equisat_frame.data_section.lowpower_batch_0.l_ref.int16
  :field lowpower_batch_0_bat_digsigs_1: equisat_frame.data_section.lowpower_batch_0.bat_digsigs_1
  :field lowpower_batch_0_bat_digsigs_2: equisat_frame.data_section.lowpower_batch_0.bat_digsigs_2
  :field lowpower_batch_0_ir_flash_obj: equisat_frame.data_section.lowpower_batch_0.ir_flash_obj
  :field lowpower_batch_0_ir_side1_obj: equisat_frame.data_section.lowpower_batch_0.ir_side1_obj
  :field lowpower_batch_0_ir_side2_obj: equisat_frame.data_section.lowpower_batch_0.ir_side2_obj
  :field lowpower_batch_0_ir_rbf_obj: equisat_frame.data_section.lowpower_batch_0.ir_rbf_obj
  :field lowpower_batch_0_ir_access_obj: equisat_frame.data_section.lowpower_batch_0.ir_access_obj
  :field lowpower_batch_0_ir_top1_obj: equisat_frame.data_section.lowpower_batch_0.ir_top1_obj
  :field lowpower_batch_0_gyroscope_x: equisat_frame.data_section.lowpower_batch_0.gyroscope_x.int16
  :field lowpower_batch_0_gyroscope_z: equisat_frame.data_section.lowpower_batch_0.gyroscope_z.int16
  :field lowpower_batch_0_gyroscope_y: equisat_frame.data_section.lowpower_batch_0.gyroscope_y.int16
  :field lowpower_batch_1_event_history: equisat_frame.data_section.lowpower_batch_1.event_history
  :field lowpower_batch_1_l1_ref: equisat_frame.data_section.lowpower_batch_1.l1_ref.int16
  :field lowpower_batch_1_l2_ref: equisat_frame.data_section.lowpower_batch_1.l2_ref.int16
  :field lowpower_batch_1_l1_sns: equisat_frame.data_section.lowpower_batch_1.l1_sns.int16
  :field lowpower_batch_1_l2_sns: equisat_frame.data_section.lowpower_batch_1.l2_sns.int16
  :field lowpower_batch_1_l1_temp: equisat_frame.data_section.lowpower_batch_1.l1_temp.int16
  :field lowpower_batch_1_l2_temp: equisat_frame.data_section.lowpower_batch_1.l2_temp.int16
  :field lowpower_batch_1_panel_ref: equisat_frame.data_section.lowpower_batch_1.panel_ref.int16
  :field lowpower_batch_1_l_ref: equisat_frame.data_section.lowpower_batch_1.l_ref.int16
  :field lowpower_batch_1_bat_digsigs_1: equisat_frame.data_section.lowpower_batch_1.bat_digsigs_1
  :field lowpower_batch_1_bat_digsigs_2: equisat_frame.data_section.lowpower_batch_1.bat_digsigs_2
  :field lowpower_batch_1_ir_flash_obj: equisat_frame.data_section.lowpower_batch_1.ir_flash_obj
  :field lowpower_batch_1_ir_side1_obj: equisat_frame.data_section.lowpower_batch_1.ir_side1_obj
  :field lowpower_batch_1_ir_side2_obj: equisat_frame.data_section.lowpower_batch_1.ir_side2_obj
  :field lowpower_batch_1_ir_rbf_obj: equisat_frame.data_section.lowpower_batch_1.ir_rbf_obj
  :field lowpower_batch_1_ir_access_obj: equisat_frame.data_section.lowpower_batch_1.ir_access_obj
  :field lowpower_batch_1_ir_top1_obj: equisat_frame.data_section.lowpower_batch_1.ir_top1_obj
  :field lowpower_batch_1_gyroscope_x: equisat_frame.data_section.lowpower_batch_1.gyroscope_x.int16
  :field lowpower_batch_1_gyroscope_z: equisat_frame.data_section.lowpower_batch_1.gyroscope_z.int16
  :field lowpower_batch_1_gyroscope_y: equisat_frame.data_section.lowpower_batch_1.gyroscope_y.int16
  :field lowpower_batch_2_event_history: equisat_frame.data_section.lowpower_batch_2.event_history
  :field lowpower_batch_2_l1_ref: equisat_frame.data_section.lowpower_batch_2.l1_ref.int16
  :field lowpower_batch_2_l2_ref: equisat_frame.data_section.lowpower_batch_2.l2_ref.int16
  :field lowpower_batch_2_l1_sns: equisat_frame.data_section.lowpower_batch_2.l1_sns.int16
  :field lowpower_batch_2_l2_sns: equisat_frame.data_section.lowpower_batch_2.l2_sns.int16
  :field lowpower_batch_2_l1_temp: equisat_frame.data_section.lowpower_batch_2.l1_temp.int16
  :field lowpower_batch_2_l2_temp: equisat_frame.data_section.lowpower_batch_2.l2_temp.int16
  :field lowpower_batch_2_panel_ref: equisat_frame.data_section.lowpower_batch_2.panel_ref.int16
  :field lowpower_batch_2_l_ref: equisat_frame.data_section.lowpower_batch_2.l_ref.int16
  :field lowpower_batch_2_bat_digsigs_1: equisat_frame.data_section.lowpower_batch_2.bat_digsigs_1
  :field lowpower_batch_2_bat_digsigs_2: equisat_frame.data_section.lowpower_batch_2.bat_digsigs_2
  :field lowpower_batch_2_ir_flash_obj: equisat_frame.data_section.lowpower_batch_2.ir_flash_obj
  :field lowpower_batch_2_ir_side1_obj: equisat_frame.data_section.lowpower_batch_2.ir_side1_obj
  :field lowpower_batch_2_ir_side2_obj: equisat_frame.data_section.lowpower_batch_2.ir_side2_obj
  :field lowpower_batch_2_ir_rbf_obj: equisat_frame.data_section.lowpower_batch_2.ir_rbf_obj
  :field lowpower_batch_2_ir_access_obj: equisat_frame.data_section.lowpower_batch_2.ir_access_obj
  :field lowpower_batch_2_ir_top1_obj: equisat_frame.data_section.lowpower_batch_2.ir_top1_obj
  :field lowpower_batch_2_gyroscope_x: equisat_frame.data_section.lowpower_batch_2.gyroscope_x.int16
  :field lowpower_batch_2_gyroscope_z: equisat_frame.data_section.lowpower_batch_2.gyroscope_z.int16
  :field lowpower_batch_2_gyroscope_y: equisat_frame.data_section.lowpower_batch_2.gyroscope_y.int16
  :field lowpower_batch_3_event_history: equisat_frame.data_section.lowpower_batch_3.event_history
  :field lowpower_batch_3_l1_ref: equisat_frame.data_section.lowpower_batch_3.l1_ref.int16
  :field lowpower_batch_3_l2_ref: equisat_frame.data_section.lowpower_batch_3.l2_ref.int16
  :field lowpower_batch_3_l1_sns: equisat_frame.data_section.lowpower_batch_3.l1_sns.int16
  :field lowpower_batch_3_l2_sns: equisat_frame.data_section.lowpower_batch_3.l2_sns.int16
  :field lowpower_batch_3_l1_temp: equisat_frame.data_section.lowpower_batch_3.l1_temp.int16
  :field lowpower_batch_3_l2_temp: equisat_frame.data_section.lowpower_batch_3.l2_temp.int16
  :field lowpower_batch_3_panel_ref: equisat_frame.data_section.lowpower_batch_3.panel_ref.int16
  :field lowpower_batch_3_l_ref: equisat_frame.data_section.lowpower_batch_3.l_ref.int16
  :field lowpower_batch_3_bat_digsigs_1: equisat_frame.data_section.lowpower_batch_3.bat_digsigs_1
  :field lowpower_batch_3_bat_digsigs_2: equisat_frame.data_section.lowpower_batch_3.bat_digsigs_2
  :field lowpower_batch_3_ir_flash_obj: equisat_frame.data_section.lowpower_batch_3.ir_flash_obj
  :field lowpower_batch_3_ir_side1_obj: equisat_frame.data_section.lowpower_batch_3.ir_side1_obj
  :field lowpower_batch_3_ir_side2_obj: equisat_frame.data_section.lowpower_batch_3.ir_side2_obj
  :field lowpower_batch_3_ir_rbf_obj: equisat_frame.data_section.lowpower_batch_3.ir_rbf_obj
  :field lowpower_batch_3_ir_access_obj: equisat_frame.data_section.lowpower_batch_3.ir_access_obj
  :field lowpower_batch_3_ir_top1_obj: equisat_frame.data_section.lowpower_batch_3.ir_top1_obj
  :field lowpower_batch_3_gyroscope_x: equisat_frame.data_section.lowpower_batch_3.gyroscope_x.int16
  :field lowpower_batch_3_gyroscope_z: equisat_frame.data_section.lowpower_batch_3.gyroscope_z.int16
  :field lowpower_batch_3_gyroscope_y: equisat_frame.data_section.lowpower_batch_3.gyroscope_y.int16
  :field lowpower_batch_4_event_history: equisat_frame.data_section.lowpower_batch_4.event_history
  :field lowpower_batch_4_l1_ref: equisat_frame.data_section.lowpower_batch_4.l1_ref.int16
  :field lowpower_batch_4_l2_ref: equisat_frame.data_section.lowpower_batch_4.l2_ref.int16
  :field lowpower_batch_4_l1_sns: equisat_frame.data_section.lowpower_batch_4.l1_sns.int16
  :field lowpower_batch_4_l2_sns: equisat_frame.data_section.lowpower_batch_4.l2_sns.int16
  :field lowpower_batch_4_l1_temp: equisat_frame.data_section.lowpower_batch_4.l1_temp.int16
  :field lowpower_batch_4_l2_temp: equisat_frame.data_section.lowpower_batch_4.l2_temp.int16
  :field lowpower_batch_4_panel_ref: equisat_frame.data_section.lowpower_batch_4.panel_ref.int16
  :field lowpower_batch_4_l_ref: equisat_frame.data_section.lowpower_batch_4.l_ref.int16
  :field lowpower_batch_4_bat_digsigs_1: equisat_frame.data_section.lowpower_batch_4.bat_digsigs_1
  :field lowpower_batch_4_bat_digsigs_2: equisat_frame.data_section.lowpower_batch_4.bat_digsigs_2
  :field lowpower_batch_4_ir_flash_obj: equisat_frame.data_section.lowpower_batch_4.ir_flash_obj
  :field lowpower_batch_4_ir_side1_obj: equisat_frame.data_section.lowpower_batch_4.ir_side1_obj
  :field lowpower_batch_4_ir_side2_obj: equisat_frame.data_section.lowpower_batch_4.ir_side2_obj
  :field lowpower_batch_4_ir_rbf_obj: equisat_frame.data_section.lowpower_batch_4.ir_rbf_obj
  :field lowpower_batch_4_ir_access_obj: equisat_frame.data_section.lowpower_batch_4.ir_access_obj
  :field lowpower_batch_4_ir_top1_obj: equisat_frame.data_section.lowpower_batch_4.ir_top1_obj
  :field lowpower_batch_4_gyroscope_x: equisat_frame.data_section.lowpower_batch_4.gyroscope_x.int16
  :field lowpower_batch_4_gyroscope_z: equisat_frame.data_section.lowpower_batch_4.gyroscope_z.int16
  :field lowpower_batch_4_gyroscope_y: equisat_frame.data_section.lowpower_batch_4.gyroscope_y.int16

seq:
  - id: equisat_frame
    type: equisat_frame_t
    doc-ref: |
      https://github.com/BrownSpaceEngineering/packetparse/blob/master/packetparse.py
      https://github.com/BrownSpaceEngineering/packetparse/blob/master/constants.py
instances:
  frame_length:
    value: _io.size

types:
  compressed_l_ref_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 14 - 0
          )
  compressed_l_sns_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 20 - 150
          )
  compressed_l_temp_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 32 - 0
          )
  compressed_panelref_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 6 - 0
          )
  compressed_led_temp_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 32 - 0
          )
  compressed_lf_temp_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 32 - 0
          )
  compressed_lfb_sns_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 45 - (-960)
          )
  compressed_lfb_osns_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 72 - 0
          )
  compressed_lf_volt_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 14 - 0
          )
  compressed_led_sns_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 650 - 0
          )
  compressed_gyroscope_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 1 - 32750
          )
  compressed_magnetometer_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 11 - 2800
          )
  compressed_accelerometer_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 1 - 32768
          )
  compressed_rad_temp_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 16 - 2000
          )
  compressed_imu_temp_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 1 - 20374
          )
  compressed_ir_amb_t:
    seq:
      - id: cint16
        type: s1
    instances:
      int16:
        value: >-
          (
            ((cint16) << 8) / 7 - (-11657)
          )
  callsign_str_t:
    seq:
      - id: callsign_string
        type: str
        encoding: utf-8
        size-eos: true
  equisat_frame_t:
    seq:
      - id: preamble
        type: preamble_t
        size: 13
      - id: current_info
        type: current_info_t
        size: 16
      - id: data_section
        type:
          switch-on: preamble.message_type
          cases:
            0: idle_data_t
            1: attitude_data_t
            2: flash_burst_data_t
            3: flash_cmp_data_t
            4: lowpower_data_t
      - id: unparsed
        size-eos: true
    enums:
      sat_state:
        0: initial
        1: antenna_deploy
        2: hello_world
        3: idle_no_flash
        4: idle_flash
        5: low_power
      message_type:
        0: idle
        1: attitude
        2: flash_burst
        3: flash_cmp
        4: low_power
  preamble_t:
    seq:
      - id: source
        contents: [0x57, 0x4c, 0x39, 0x58, 0x5a, 0x45]
        size: 6
      - id: timestamp
        type: u4
      - id: msg_op_states
        type: u1
      - id: bytes_of_data
        type: u1
      - id: num_errors
        type: u1
    instances:
      callsign:
        value: source.as<callsign_str_t>
        # currently not returning a string!
      message_type:
        value: msg_op_states & 0x07
      satellite_state:
        value: (msg_op_states >> 3) & 0x07
      flash_killed:
        value: (msg_op_states & (1 << 6)) / (1 << 6)
      mram_killed:
        value: (msg_op_states & (1 << 7)) / (1 << 7)
  current_info_t:
    seq:
      - id: time_to_flash
        type: u1
      - id: boot_count
        type: u1
      - id: l1_ref
        type: compressed_l_ref_t
      - id: l2_ref
        type: compressed_l_ref_t
      - id: l1_sns
        type: compressed_l_sns_t
      - id: l2_sns
        type: compressed_l_sns_t
      - id: l1_temp
        type: compressed_l_temp_t
      - id: l2_temp
        type: compressed_l_temp_t
      - id: panel_ref
        type: compressed_panelref_t
      - id: l_ref
        type: compressed_l_ref_t
      - id: bat_digsigs_1
        type: u1
      - id: bat_digsigs_2
        type: u1
      - id: lf1ref
        type: compressed_l_ref_t
      - id: lf2ref
        type: compressed_l_ref_t
      - id: lf3ref
        type: compressed_l_ref_t
      - id: lf4ref
        type: compressed_l_ref_t
  idle_data_t:
    seq:
      - id: idle_batch_0
        type: idle_batch_t
      - id: idle_batch_1
        type: idle_batch_t
      - id: idle_batch_2
        type: idle_batch_t
      - id: idle_batch_3
        type: idle_batch_t
      - id: idle_batch_4
        type: idle_batch_t
      - id: idle_batch_5
        type: idle_batch_t
      - id: idle_batch_6
        type: idle_batch_t
  idle_batch_t:
    seq:
      - id: event_history
        type: u1
      - id: l1_ref
        type: compressed_l_ref_t
      - id: l2_ref
        type: compressed_l_ref_t
      - id: l1_sns
        type: compressed_l_sns_t
      - id: l2_sns
        type: compressed_l_sns_t
      - id: l1_temp
        type: compressed_l_temp_t
      - id: l2_temp
        type: compressed_l_temp_t
      - id: panel_ref
        type: compressed_panelref_t
      - id: l_ref
        type: compressed_l_ref_t
      - id: bat_digsigs_1
        type: u1
      - id: bat_digsigs_2
        type: u1
      - id: rad_temp
        type: compressed_rad_temp_t
      - id: imu_temp
        type: compressed_imu_temp_t
      - id: ir_flash_amb
        type: compressed_ir_amb_t
      - id: ir_side1_amb
        type: compressed_ir_amb_t
      - id: ir_side2_amb
        type: compressed_ir_amb_t
      - id: ir_rbf_amb
        type: compressed_ir_amb_t
      - id: ir_access_amb
        type: compressed_ir_amb_t
      - id: ir_top1_amb
        type: compressed_ir_amb_t
      - id: timestamp
        type: u4le
  attitude_data_t:
    seq:
      - id: attitude_batch_0
        type: attitude_batch_t
      - id: attitude_batch_1
        type: attitude_batch_t
      - id: attitude_batch_2
        type: attitude_batch_t
      - id: attitude_batch_3
        type: attitude_batch_t
      - id: attitude_batch_4
        type: attitude_batch_t
  attitude_batch_t:
    seq:
      - id: ir_flash_obj
        type: u2le
      - id: ir_side1_obj
        type: u2le
      - id: ir_side2_obj
        type: u2le
      - id: ir_rbf_obj
        type: u2le
      - id: ir_access_obj
        type: u2le
      - id: ir_top1_obj
        type: u2le
      - id: pd_1
        type: u1
      - id: pd_2
        type: u1
      - id: accelerometer1_x
        type: compressed_accelerometer_t
      - id: accelerometer1_z
        type: compressed_accelerometer_t
      - id: accelerometer1_y
        type: compressed_accelerometer_t
      - id: accelerometer2_x
        type: compressed_accelerometer_t
      - id: accelerometer2_z
        type: compressed_accelerometer_t
      - id: accelerometer2_y
        type: compressed_accelerometer_t
      - id: gyroscope_x
        type: compressed_gyroscope_t
      - id: gyroscope_z
        type: compressed_gyroscope_t
      - id: gyroscope_y
        type: compressed_gyroscope_t
      - id: magnetometer1_x
        type: compressed_magnetometer_t
      - id: magnetometer1_z
        type: compressed_magnetometer_t
      - id: magnetometer1_y
        type: compressed_magnetometer_t
      - id: magnetometer2_x
        type: compressed_magnetometer_t
      - id: magnetometer2_z
        type: compressed_magnetometer_t
      - id: magnetometer2_y
        type: compressed_magnetometer_t
      - id: timestamp
        type: u4le
    instances:
      pd_flash:
        value: (pd_1 >> 6) & (0x03)
      pd_side1:
        value: (pd_1 >> 4) & (0x03)
      pd_side2:
        value: (pd_1 >> 2) & (0x03)
      pd_access:
        value: (pd_1 >> 0) & (0x03)
      pd_top1:
        value: (pd_2 >> 6) & (0x03)
      pd_top2:
        value: (pd_2 >> 4) & (0x03)
  flash_burst_data_t:
    seq:
      - id: led1_temp_0
        type: compressed_led_temp_t
      - id: led1_temp_1
        type: compressed_led_temp_t
      - id: led1_temp_2
        type: compressed_led_temp_t
      - id: led1_temp_3
        type: compressed_led_temp_t
      - id: led1_temp_4
        type: compressed_led_temp_t
      - id: led1_temp_5
        type: compressed_led_temp_t
      - id: led1_temp_6
        type: compressed_led_temp_t
      - id: led2_temp_0
        type: compressed_led_temp_t
      - id: led2_temp_1
        type: compressed_led_temp_t
      - id: led2_temp_2
        type: compressed_led_temp_t
      - id: led2_temp_3
        type: compressed_led_temp_t
      - id: led2_temp_4
        type: compressed_led_temp_t
      - id: led2_temp_5
        type: compressed_led_temp_t
      - id: led2_temp_6
        type: compressed_led_temp_t
      - id: led3_temp_0
        type: compressed_led_temp_t
      - id: led3_temp_1
        type: compressed_led_temp_t
      - id: led3_temp_2
        type: compressed_led_temp_t
      - id: led3_temp_3
        type: compressed_led_temp_t
      - id: led3_temp_4
        type: compressed_led_temp_t
      - id: led3_temp_5
        type: compressed_led_temp_t
      - id: led3_temp_6
        type: compressed_led_temp_t
      - id: led4_temp_0
        type: compressed_led_temp_t
      - id: led4_temp_1
        type: compressed_led_temp_t
      - id: led4_temp_2
        type: compressed_led_temp_t
      - id: led4_temp_3
        type: compressed_led_temp_t
      - id: led4_temp_4
        type: compressed_led_temp_t
      - id: led4_temp_5
        type: compressed_led_temp_t
      - id: led4_temp_6
        type: compressed_led_temp_t
      - id: lf1_temp_0
        type: compressed_lf_temp_t
      - id: lf1_temp_1
        type: compressed_lf_temp_t
      - id: lf1_temp_2
        type: compressed_lf_temp_t
      - id: lf1_temp_3
        type: compressed_lf_temp_t
      - id: lf1_temp_4
        type: compressed_lf_temp_t
      - id: lf1_temp_5
        type: compressed_lf_temp_t
      - id: lf1_temp_6
        type: compressed_lf_temp_t
      - id: lf3_temp_0
        type: compressed_lf_temp_t
      - id: lf3_temp_1
        type: compressed_lf_temp_t
      - id: lf3_temp_2
        type: compressed_lf_temp_t
      - id: lf3_temp_3
        type: compressed_lf_temp_t
      - id: lf3_temp_4
        type: compressed_lf_temp_t
      - id: lf3_temp_5
        type: compressed_lf_temp_t
      - id: lf3_temp_6
        type: compressed_lf_temp_t
      - id: lfb1_sns_0
        type: compressed_lfb_sns_t
      - id: lfb1_sns_1
        type: compressed_lfb_sns_t
      - id: lfb1_sns_2
        type: compressed_lfb_sns_t
      - id: lfb1_sns_3
        type: compressed_lfb_sns_t
      - id: lfb1_sns_4
        type: compressed_lfb_sns_t
      - id: lfb1_sns_5
        type: compressed_lfb_sns_t
      - id: lfb1_sns_6
        type: compressed_lfb_sns_t
      - id: lfb1_osns_0
        type: compressed_lfb_osns_t
      - id: lfb1_osns_1
        type: compressed_lfb_osns_t
      - id: lfb1_osns_2
        type: compressed_lfb_osns_t
      - id: lfb1_osns_3
        type: compressed_lfb_osns_t
      - id: lfb1_osns_4
        type: compressed_lfb_osns_t
      - id: lfb1_osns_5
        type: compressed_lfb_osns_t
      - id: lfb1_osns_6
        type: compressed_lfb_osns_t
      - id: lfb2_sns_0
        type: compressed_lfb_sns_t
      - id: lfb2_sns_1
        type: compressed_lfb_sns_t
      - id: lfb2_sns_2
        type: compressed_lfb_sns_t
      - id: lfb2_sns_3
        type: compressed_lfb_sns_t
      - id: lfb2_sns_4
        type: compressed_lfb_sns_t
      - id: lfb2_sns_5
        type: compressed_lfb_sns_t
      - id: lfb2_sns_6
        type: compressed_lfb_sns_t
      - id: lfb2_osns_0
        type: compressed_lfb_osns_t
      - id: lfb2_osns_1
        type: compressed_lfb_osns_t
      - id: lfb2_osns_2
        type: compressed_lfb_osns_t
      - id: lfb2_osns_3
        type: compressed_lfb_osns_t
      - id: lfb2_osns_4
        type: compressed_lfb_osns_t
      - id: lfb2_osns_5
        type: compressed_lfb_osns_t
      - id: lfb2_osns_6
        type: compressed_lfb_osns_t
      - id: lf1_ref_0
        type: compressed_lf_volt_t
      - id: lf1_ref_1
        type: compressed_lf_volt_t
      - id: lf1_ref_2
        type: compressed_lf_volt_t
      - id: lf1_ref_3
        type: compressed_lf_volt_t
      - id: lf1_ref_4
        type: compressed_lf_volt_t
      - id: lf1_ref_5
        type: compressed_lf_volt_t
      - id: lf1_ref_6
        type: compressed_lf_volt_t
      - id: lf2_ref_0
        type: compressed_lf_volt_t
      - id: lf2_ref_1
        type: compressed_lf_volt_t
      - id: lf2_ref_2
        type: compressed_lf_volt_t
      - id: lf2_ref_3
        type: compressed_lf_volt_t
      - id: lf2_ref_4
        type: compressed_lf_volt_t
      - id: lf2_ref_5
        type: compressed_lf_volt_t
      - id: lf2_ref_6
        type: compressed_lf_volt_t
      - id: lf3_ref_0
        type: compressed_lf_volt_t
      - id: lf3_ref_1
        type: compressed_lf_volt_t
      - id: lf3_ref_2
        type: compressed_lf_volt_t
      - id: lf3_ref_3
        type: compressed_lf_volt_t
      - id: lf3_ref_4
        type: compressed_lf_volt_t
      - id: lf3_ref_5
        type: compressed_lf_volt_t
      - id: lf3_ref_6
        type: compressed_lf_volt_t
      - id: lf4_ref_0
        type: compressed_lf_volt_t
      - id: lf4_ref_1
        type: compressed_lf_volt_t
      - id: lf4_ref_2
        type: compressed_lf_volt_t
      - id: lf4_ref_3
        type: compressed_lf_volt_t
      - id: lf4_ref_4
        type: compressed_lf_volt_t
      - id: lf4_ref_5
        type: compressed_lf_volt_t
      - id: lf4_ref_6
        type: compressed_lf_volt_t
      - id: led1_sns_0
        type: compressed_led_sns_t
      - id: led1_sns_1
        type: compressed_led_sns_t
      - id: led1_sns_2
        type: compressed_led_sns_t
      - id: led1_sns_3
        type: compressed_led_sns_t
      - id: led1_sns_4
        type: compressed_led_sns_t
      - id: led1_sns_5
        type: compressed_led_sns_t
      - id: led1_sns_6
        type: compressed_led_sns_t
      - id: led2_sns_0
        type: compressed_led_sns_t
      - id: led2_sns_1
        type: compressed_led_sns_t
      - id: led2_sns_2
        type: compressed_led_sns_t
      - id: led2_sns_3
        type: compressed_led_sns_t
      - id: led2_sns_4
        type: compressed_led_sns_t
      - id: led2_sns_5
        type: compressed_led_sns_t
      - id: led2_sns_6
        type: compressed_led_sns_t
      - id: led3_sns_0
        type: compressed_led_sns_t
      - id: led3_sns_1
        type: compressed_led_sns_t
      - id: led3_sns_2
        type: compressed_led_sns_t
      - id: led3_sns_3
        type: compressed_led_sns_t
      - id: led3_sns_4
        type: compressed_led_sns_t
      - id: led3_sns_5
        type: compressed_led_sns_t
      - id: led3_sns_6
        type: compressed_led_sns_t
      - id: led4_sns_0
        type: compressed_led_sns_t
      - id: led4_sns_1
        type: compressed_led_sns_t
      - id: led4_sns_2
        type: compressed_led_sns_t
      - id: led4_sns_3
        type: compressed_led_sns_t
      - id: led4_sns_4
        type: compressed_led_sns_t
      - id: led4_sns_5
        type: compressed_led_sns_t
      - id: led4_sns_6
        type: compressed_led_sns_t
      - id: gyroscope_x_0
        type: compressed_gyroscope_t
      - id: gyroscope_x_1
        type: compressed_gyroscope_t
      - id: gyroscope_x_2
        type: compressed_gyroscope_t
      - id: gyroscope_x_3
        type: compressed_gyroscope_t
      - id: gyroscope_x_4
        type: compressed_gyroscope_t
      - id: gyroscope_x_5
        type: compressed_gyroscope_t
      - id: gyroscope_x_6
        type: compressed_gyroscope_t
      - id: gyroscope_z_0
        type: compressed_gyroscope_t
      - id: gyroscope_z_1
        type: compressed_gyroscope_t
      - id: gyroscope_z_2
        type: compressed_gyroscope_t
      - id: gyroscope_z_3
        type: compressed_gyroscope_t
      - id: gyroscope_z_4
        type: compressed_gyroscope_t
      - id: gyroscope_z_5
        type: compressed_gyroscope_t
      - id: gyroscope_z_6
        type: compressed_gyroscope_t
      - id: gyroscope_y_0
        type: compressed_gyroscope_t
      - id: gyroscope_y_1
        type: compressed_gyroscope_t
      - id: gyroscope_y_2
        type: compressed_gyroscope_t
      - id: gyroscope_y_3
        type: compressed_gyroscope_t
      - id: gyroscope_y_4
        type: compressed_gyroscope_t
      - id: gyroscope_y_5
        type: compressed_gyroscope_t
      - id: gyroscope_y_6
        type: compressed_gyroscope_t
  flash_cmp_data_t:
    seq:
      - id: flash_cmp_batch_0
        type: flash_cmp_batch_t
      - id: flash_cmp_batch_1
        type: flash_cmp_batch_t
      - id: flash_cmp_batch_2
        type: flash_cmp_batch_t
      - id: flash_cmp_batch_3
        type: flash_cmp_batch_t
      - id: flash_cmp_batch_4
        type: flash_cmp_batch_t
      - id: flash_cmp_batch_5
        type: flash_cmp_batch_t
  flash_cmp_batch_t:
    seq:
      - id: led1_temp
        type: compressed_led_temp_t
      - id: led2_temp
        type: compressed_led_temp_t
      - id: led3_temp
        type: compressed_led_temp_t
      - id: led4_temp
        type: compressed_led_temp_t
      - id: lf1_temp
        type: compressed_lf_temp_t
      - id: lf3_temp
        type: compressed_lf_temp_t
      - id: lfb1_sns
        type: compressed_lfb_sns_t
      - id: lfb1_osns
        type: compressed_lfb_osns_t
      - id: lfb2_sns
        type: compressed_lfb_sns_t
      - id: lfb2_osns
        type: compressed_lfb_osns_t
      - id: lf1_ref
        type: compressed_lf_volt_t
      - id: lf2_ref
        type: compressed_lf_volt_t
      - id: lf3_ref
        type: compressed_lf_volt_t
      - id: lf4_ref
        type: compressed_lf_volt_t
      - id: led1_sns
        type: compressed_led_sns_t
      - id: led2_sns
        type: compressed_led_sns_t
      - id: led3_sns
        type: compressed_led_sns_t
      - id: led4_sns
        type: compressed_led_sns_t
      - id: magnetometer_x
        type: compressed_magnetometer_t
      - id: magnetometer_z
        type: compressed_magnetometer_t
      - id: magnetometer_y
        type: compressed_magnetometer_t
      - id: timestamp
        type: u4le
  lowpower_data_t:
    seq:
      - id: lowpower_batch_0
        type: lowpower_batch_t
      - id: lowpower_batch_1
        type: lowpower_batch_t
      - id: lowpower_batch_2
        type: lowpower_batch_t
      - id: lowpower_batch_3
        type: lowpower_batch_t
      - id: lowpower_batch_4
        type: lowpower_batch_t
  lowpower_batch_t:
    seq:
      - id: event_history
        type: u1
      - id: l1_ref
        type: compressed_l_ref_t
      - id: l2_ref
        type: compressed_l_ref_t
      - id: l1_sns
        type: compressed_l_sns_t
      - id: l2_sns
        type: compressed_l_sns_t
      - id: l1_temp
        type: compressed_l_temp_t
      - id: l2_temp
        type: compressed_l_temp_t
      - id: panel_ref
        type: compressed_panelref_t
      - id: l_ref
        type: compressed_l_ref_t
      - id: bat_digsigs_1
        type: u1
      - id: bat_digsigs_2
        type: u1
      - id: ir_flash_obj
        type: u2le
      - id: ir_side1_obj
        type: u2le
      - id: ir_side2_obj
        type: u2le
      - id: ir_rbf_obj
        type: u2le
      - id: ir_access_obj
        type: u2le
      - id: ir_top1_obj
        type: u2le
      - id: gyroscope_x
        type: compressed_gyroscope_t
      - id: gyroscope_z
        type: compressed_gyroscope_t
      - id: gyroscope_y
        type: compressed_gyroscope_t
