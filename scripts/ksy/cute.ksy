---
meta:
  id: cute
  title: CUTE 70cm decoder struct
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field ccsds_version: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.ccsds_version
  :field packet_type: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.packet_type
  :field secondary_header_flag: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.secondary_header_flag
  :field is_stored_data: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.is_stored_data
  :field application_process_id: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.application_process_id
  :field grouping_flag: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.grouping_flag
  :field sequence_count: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.sequence_count
  :field packet_length: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.packet_length
  :field time_stamp_seconds: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.time_stamp_seconds
  :field sub_seconds: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.sub_seconds
  :field padding: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.padding
  :field soh_l0_wdt_2sec_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.wdt_2sec_cnt
  :field soh_l0_reset_armed: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.reset_armed
  :field soh_l0_wdt_stat: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.wdt_stat
  :field soh_l0_wdt_en: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.wdt_en
  :field soh_l0_table_select: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.table_select
  :field soh_l0_boot_relay: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.boot_relay
  :field soh_l0_l0_acpt_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.l0_acpt_cnt
  :field soh_l0_l0_rjct_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.l0_rjct_cnt
  :field soh_l0_hw_sec_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.hw_sec_cnt
  :field soh_l0_time_tag: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.time_tag
  :field soh_l0_pld_tlm_ack_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.pld_tlm_ack_cnt
  :field soh_l0_pld_cmd_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.pld_cmd_cnt
  :field soh_l0_pld_tlm_to_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.pld_tlm_to_cnt
  :field soh_l0_pld_tlm_nak_cnt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.pld_tlm_nak_cnt
  :field soh_l0_spare_end: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.spare_end
  :field soh_command_tlm_cmd_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.cmd_status
  :field soh_command_tlm_realtime_cmd_accept_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.realtime_cmd_accept_count
  :field soh_command_tlm_realtime_cmd_reject_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.realtime_cmd_reject_count
  :field soh_command_tlm_stored_cmd_accept_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.stored_cmd_accept_count
  :field soh_command_tlm_stored_cmd_reject_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.stored_cmd_reject_count
  :field soh_command_tlm_macros_executing_pack1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack1
  :field soh_command_tlm_macros_executing_pack_bit8: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit8
  :field soh_command_tlm_macros_executing_pack_bit7: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit7
  :field soh_command_tlm_macros_executing_pack_bit6: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit6
  :field soh_command_tlm_macros_executing_pack_bit5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit5
  :field soh_command_tlm_macros_executing_pack_bit4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit4
  :field soh_command_tlm_macros_executing_pack_bit3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit3
  :field soh_command_tlm_macros_executing_pack_bit2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit2
  :field soh_command_tlm_macros_executing_pack_bit1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit1
  :field soh_command_tlm_macros_executing_pack2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack2
  :field soh_command_tlm_macros_executing_pack_bit16: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit16
  :field soh_command_tlm_macros_executing_pack_bit15: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit15
  :field soh_command_tlm_macros_executing_pack_bit14: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit14
  :field soh_command_tlm_macros_executing_pack_bit13: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit13
  :field soh_command_tlm_macros_executing_pack_bit12: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit12
  :field soh_command_tlm_macros_executing_pack_bit11: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit11
  :field soh_command_tlm_macros_executing_pack_bit10: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit10
  :field soh_command_tlm_macros_executing_pack_bit9: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.macros_executing_pack_bit9
  :field soh_general_scrub_status_overall: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_general.scrub_status_overall
  :field soh_general_image_booted: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_general.image_booted
  :field soh_general_image_auto_failover: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_general.image_auto_failover
  :field soh_time_tai_seconds: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.tai_seconds
  :field soh_time_time_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.time_valid
  :field soh_refs_position_wrt_eci1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.position_wrt_eci1
  :field soh_refs_position_wrt_eci2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.position_wrt_eci2
  :field soh_refs_position_wrt_eci3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.position_wrt_eci3
  :field soh_refs_velocity_wrt_eci1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.velocity_wrt_eci1
  :field soh_refs_velocity_wrt_eci2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.velocity_wrt_eci2
  :field soh_refs_velocity_wrt_eci3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.velocity_wrt_eci3
  :field soh_refs_refs_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.refs_valid
  :field soh_att_det_q_body_wrt_eci1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci1
  :field soh_att_det_q_body_wrt_eci2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci2
  :field soh_att_det_q_body_wrt_eci3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci3
  :field soh_att_det_q_body_wrt_eci4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci4
  :field soh_att_det_body_rate1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate1
  :field soh_att_det_body_rate1_dps: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate1_dps
  :field soh_att_det_body_rate1_rpm: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate1_rpm
  :field soh_att_det_body_rate2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate2
  :field soh_att_det_body_rate2_dps: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate2_dps
  :field soh_att_det_body_rate2_rpm: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate2_rpm
  :field soh_att_det_body_rate3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate3
  :field soh_att_det_body_rate3_dps: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate3_dps
  :field soh_att_det_body_rate3_rpm: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.body_rate3_rpm
  :field soh_att_det_bad_att_timer: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.bad_att_timer
  :field soh_att_det_bad_rate_timer: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.bad_rate_timer
  :field soh_att_det_reinit_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.reinit_count
  :field soh_att_det_attitude_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.attitude_valid
  :field soh_att_det_meas_att_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.meas_att_valid
  :field soh_att_det_meas_rate_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.meas_rate_valid
  :field soh_att_det_tracker_used: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.tracker_used
  :field soh_att_cmd_hr_cycle_safe_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.hr_cycle_safe_mode
  :field soh_att_cmd_rotisserie_rate: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.rotisserie_rate
  :field soh_att_cmd_rotisserie_rate_dps: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.rotisserie_rate_dps
  :field soh_att_cmd_rotisserie_rate_rpm: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.rotisserie_rate_rpm
  :field soh_att_cmd_adcs_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.adcs_mode
  :field soh_att_cmd_safe_mode_reason: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.safe_mode_reason
  :field soh_att_cmd_recommend_sun_point: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.recommend_sun_point
  :field soh_rw_drive_filtered_speed_rpm1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_rw_drive.filtered_speed_rpm1
  :field soh_rw_drive_filtered_speed_rpm2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_rw_drive.filtered_speed_rpm2
  :field soh_rw_drive_filtered_speed_rpm3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_rw_drive.filtered_speed_rpm3
  :field soh_tracker_operating_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.operating_mode
  :field soh_tracker_star_id_step: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.star_id_step
  :field soh_tracker_att_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.att_status
  :field soh_tracker_num_attitude_stars: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.num_attitude_stars
  :field soh_att_ctrl_position_error1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.position_error1
  :field soh_att_ctrl_position_error2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.position_error2
  :field soh_att_ctrl_position_error3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.position_error3
  :field soh_att_ctrl_time_into_search: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.time_into_search
  :field soh_att_ctrl_wait_timer: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.wait_timer
  :field soh_att_ctrl_sun_point_angle_error: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.sun_point_angle_error
  :field soh_att_ctrl_sun_point_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.sun_point_state
  :field soh_momentum_momentum_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.momentum_vector_body1
  :field soh_momentum_momentum_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.momentum_vector_body2
  :field soh_momentum_momentum_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.momentum_vector_body3
  :field soh_momentum_duty_cycle1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.duty_cycle1
  :field soh_momentum_duty_cycle2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.duty_cycle2
  :field soh_momentum_duty_cycle3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.duty_cycle3
  :field soh_momentum_torque_rod_mode1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_mode1
  :field soh_momentum_torque_rod_mode2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_mode2
  :field soh_momentum_torque_rod_mode3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_mode3
  :field soh_momentum_mag_source_used: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.mag_source_used
  :field soh_momentum_momentum_vector_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.momentum_vector_valid
  :field soh_css_sun_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_body1
  :field soh_css_sun_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_body2
  :field soh_css_sun_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_body3
  :field soh_css_sun_vector_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_status
  :field soh_css_sun_sensor_used: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_sensor_used
  :field soh_mag_mag_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_body1
  :field soh_mag_mag_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_body2
  :field soh_mag_mag_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_body3
  :field soh_mag_mag_vector_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_valid
  :field soh_imu_new_packet_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.new_packet_count
  :field soh_imu_imu_vector_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_vector_valid
  :field soh_clock_sync_hr_run_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_run_count
  :field soh_clock_sync_hr_exec_time_ms: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_exec_time_ms
  :field soh_analogs_box1_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_analogs.box1_temp
  :field soh_analogs_bus_voltage: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_analogs.bus_voltage
  :field soh_analogs_battery_voltage: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_analogs.battery_voltage
  :field soh_analogs_battery_current: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_analogs.battery_current
  :field soh_tracker2_operating_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker2.operating_mode
  :field soh_tracker2_star_id_step: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker2.star_id_step
  :field soh_tracker2_att_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker2.att_status
  :field soh_tracker2_num_attitude_stars: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker2.num_attitude_stars
  :field soh_gps_gps_lock_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_lock_count
  :field soh_gps_gps_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_valid
  :field soh_gps_gps_enable: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_enable
  :field soh_event_check_latched_resp_fire_pack1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack1
  :field soh_event_check_latched_resp_fire_pack_bit8: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit8
  :field soh_event_check_latched_resp_fire_pack_bit7: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit7
  :field soh_event_check_latched_resp_fire_pack_bit6: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit6
  :field soh_event_check_latched_resp_fire_pack_bit5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit5
  :field soh_event_check_latched_resp_fire_pack_bit4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit4
  :field soh_event_check_latched_resp_fire_pack_bit3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit3
  :field soh_event_check_latched_resp_fire_pack_bit2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit2
  :field soh_event_check_latched_resp_fire_pack_bit1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit1
  :field soh_event_check_latched_resp_fire_pack2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack2
  :field soh_event_check_latched_resp_fire_pack_bit16: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit16
  :field soh_event_check_latched_resp_fire_pack_bit15: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit15
  :field soh_event_check_latched_resp_fire_pack_bit14: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit14
  :field soh_event_check_latched_resp_fire_pack_bit13: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit13
  :field soh_event_check_latched_resp_fire_pack_bit12: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit12
  :field soh_event_check_latched_resp_fire_pack_bit11: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit11
  :field soh_event_check_latched_resp_fire_pack_bit10: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit10
  :field soh_event_check_latched_resp_fire_pack_bit9: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit9
  :field soh_radio_sd_minute_cur: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sd_minute_cur
  :field soh_radio_sd_percent_used_total: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sd_percent_used_total
  :field soh_radio_sd_ok: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sd_ok
  :field soh_radio_sd_fault_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sd_fault_count
  :field soh_radio_sdr_tx_tx_frames: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sdr_tx_tx_frames
  :field soh_radio_sdr_tx_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sdr_tx_temp
  :field soh_radio_sdr_tx_comm_error: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sdr_tx_comm_error
  :field soh_radio_sq_channel: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sq_channel
  :field soh_radio_sq_trap_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sq_trap_count
  :field soh_radio_sq_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sq_temp
  :field soh_tracker_ctrl_aid_status1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status1
  :field soh_tracker_ctrl_aid_status_bit8: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit8
  :field soh_tracker_ctrl_aid_status_bit7: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit7
  :field soh_tracker_ctrl_aid_status_bit6: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit6
  :field soh_tracker_ctrl_aid_status_bit5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit5
  :field soh_tracker_ctrl_aid_status_bit4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit4
  :field soh_tracker_ctrl_aid_status_bit3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit3
  :field soh_tracker_ctrl_aid_status_bit2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit2
  :field soh_tracker_ctrl_aid_status_bit1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit1
  :field soh_tracker_ctrl_aid_status2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status2
  :field soh_tracker_ctrl_aid_status_bit16: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit16
  :field soh_tracker_ctrl_aid_status_bit15: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit15
  :field soh_tracker_ctrl_aid_status_bit14: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit14
  :field soh_tracker_ctrl_aid_status_bit13: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit13
  :field soh_tracker_ctrl_aid_status_bit12: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit12
  :field soh_tracker_ctrl_aid_status_bit11: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit11
  :field soh_tracker_ctrl_aid_status_bit10: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit10
  :field soh_tracker_ctrl_aid_status_bit9: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.aid_status_bit9
  :field soh_tracker_ctrl_star_id_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.star_id_status
  :field pld_pkt_ccsds_version: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.ccsds_version
  :field pld_pkt_packet_type: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.packet_type
  :field pld_pkt_secondary_header_flag: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.secondary_header_flag
  :field pld_pkt_application_process_id: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.application_process_id
  :field pld_pkt_sequence_flags: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sequence_flags
  :field pld_pkt_sequence_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sequence_count
  :field pld_pkt_packet_length: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.packet_length
  :field pld_sw_stat_sh_coarse: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.sh_coarse
  :field pld_sw_stat_sh_fine: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.sh_fine
  :field pld_sw_stat_pld_sw_ver_maj: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.pld_sw_ver_maj
  :field pld_sw_stat_pld_sw_ver_min: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.pld_sw_ver_min
  :field pld_sw_stat_pld_sw_ver_patch: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.pld_sw_ver_patch
  :field pld_sw_stat_spare: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.spare
  :field pld_sw_stat_sd_state_card1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.sd_state_card1
  :field pld_sw_stat_sd_state_card0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.sd_state_card0
  :field pld_sw_stat_zynq_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_temp
  :field pld_sw_stat_zynq_vcc_int: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_vcc_int
  :field pld_sw_stat_zynq_vcc_aux: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_vcc_aux
  :field pld_sw_stat_zynq_vcc_bram: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_vcc_bram
  :field pld_sw_stat_zynq_vcc_pint: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_vcc_pint
  :field pld_sw_stat_zynq_vcc_paux: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_vcc_paux
  :field pld_sw_stat_zynq_vcc_pdr0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_vcc_pdr0
  :field pld_sw_stat_zynq_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.zynq_status
  :field pld_sw_stat_spare8: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.spare8
  :field pld_sw_stat_roc_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.roc_temp
  :field pld_sw_stat_ccd_p5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.ccd_p5
  :field pld_sw_stat_ccd_p15: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.ccd_p15
  :field pld_sw_stat_ccd_p32: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.ccd_p32
  :field pld_sw_stat_ccd_n5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.ccd_n5
  :field pld_sw_stat_spare16: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.spare16
  :field pld_sw_stat_cmd_recv_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.cmd_recv_count
  :field pld_sw_stat_cmd_rjct_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.cmd_rjct_count
  :field pld_sw_stat_cmd_succ_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.cmd_succ_count
  :field pld_sw_stat_cmd_succ_op: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.cmd_succ_op
  :field pld_sw_stat_cmd_rjct_op: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.cmd_rjct_op
  :field pld_sw_stat_cmd_fail_code: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.cmd_fail_code
  :field pld_sw_stat_spare6: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.spare6
  :field pld_sw_stat_arm_state_sc: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.arm_state_sc
  :field pld_sw_stat_arm_state_dbg: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.arm_state_dbg
  :field pld_sw_stat_log_write_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.log_write_count
  :field pld_sw_stat_log_drop_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.log_drop_count
  :field pld_sw_stat_ccd_ena_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.ccd_ena_state
  :field pld_sw_stat_ccd_ctrl_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.ccd_ctrl_state
  :field pld_sw_stat_ccd_shutter: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.ccd_shutter
  :field pld_sw_stat_shutter_override: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.shutter_override
  :field pld_sw_stat_frame_id: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.frame_id
  :field pld_sw_stat_os_cpu_usage: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.os_cpu_usage
  :field pld_sw_stat_os_cpu_max: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.os_cpu_max
  :field pld_sw_stat_time_pps_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.time_pps_count
  :field pld_sw_stat_time_recv_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.time_recv_count
  :field pld_sw_stat_time_miss_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.time_miss_count
  :field pld_sw_stat_fsw_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.fsw_mode
  :field pld_sw_stat_tec_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_state
  :field pld_sw_stat_tec_slew_rate: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_slew_rate
  :field pld_sw_stat_tec_setpoint: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_setpoint
  :field pld_sw_stat_tec_ccd_rtd: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_ccd_rtd
  :field pld_sw_stat_tec_sc_rtd5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_sc_rtd5
  :field pld_sw_stat_tec_sc_rtd4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_sc_rtd4
  :field pld_sw_stat_tec_sc_rtd3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_sc_rtd3
  :field pld_sw_stat_tec_sc_rtd2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_sc_rtd2
  :field pld_sw_stat_tec_sc_rtd1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_sc_rtd1
  :field pld_sw_stat_tec_shutter: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_shutter
  :field pld_sw_stat_tec_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_volt
  :field pld_sw_stat_tec_avg_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_avg_curr
  :field pld_sw_stat_tec_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.tec_curr
  :field pld_sw_stat_img_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.img_state
  :field pld_sw_stat_img_curr_proc_type: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.user_data_field.img_curr_proc_type

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
            - '"CUTE  "'
            - '"BCT   "'
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
      - id: ccsds_space_packet
        type: ccsds_space_packet_t
  ccsds_space_packet_t:
    seq:
      - id: packet_primary_header
        type: packet_primary_header_t
        size: 6
      - id: data_section
        type: data_section_t
  packet_primary_header_t:
    seq:
      - id: ccsds_version
        type: b3
      - id: packet_type
        type: b1
      - id: secondary_header_flag
        type: b1
      - id: is_stored_data
        type: b1
      - id: application_process_id
        type: b10
      - id: grouping_flag
        type: b2
      - id: sequence_count
        type: b14
      - id: packet_length
        type: u2
  data_section_t:
    seq:
      - id: secondary_header
        type: secondary_header_t
        size: 6
        if: _parent.packet_primary_header.secondary_header_flag
      - id: user_data_field
        type:
          switch-on: _parent.packet_primary_header.application_process_id
          cases:
            0x56: cute_bct_soh_t
            0x1FF: pld_packet_primary_header_t
  secondary_header_t:
    doc: |
      The Secondary Header is a feature of the Space Packet which allows
      additional types of information that may be useful to the user
      application (e.g., a time code) to be included.
      See: 4.1.3.2 in CCSDS 133.0-B-1
    seq:
      - id: time_stamp_seconds
        type: u4
      - id: sub_seconds
        type: u1
      - id: padding
        type: u1
  soh_l0_t:
    seq:
      - id: wdt_2sec_cnt
        type: b3
        doc: |
          Watchdog 2 Second Counter
          Eng. units: none
      - id: reset_armed
        type: b1
        doc: |
          Processor reset armed status
      - id: wdt_stat
        type: b1
        doc: |
          Watch Reset Event Status
      - id: wdt_en
        type: b1
        doc: |
          Watchdog Reset Enable Status
      - id: table_select
        type: b1
        doc: |
          Table select
      - id: boot_relay
        type: b1
        doc: |
          Boot Relay Status
      - id: l0_acpt_cnt
        type: u1
        doc: |
          Level 0 Accept Counter
          Eng. units: none
      - id: l0_rjct_cnt
        type: u1
        doc: |
          Level 0 Reject Counter
          Eng. units: none
      - id: hw_sec_cnt
        type: u1
        doc: |
          Hardware Second Counter
          Eng. units: none
      - id: padding_0
        type: u8
      - id: time_tag
        type: u4
        doc: |
          Time Tag of Last Incoming Command
          Eng. units: USEC
      - id: padding_1
        type: u4
      - id: pld_tlm_ack_cnt
        type: u1
        doc: |
          Number of accepted telemetry packets
          Eng. units: none
      - id: pld_cmd_cnt
        type: u1
        doc: |
          Number of commands sent
          Eng. units: none
      - id: pld_tlm_to_cnt
        type: u1
        doc: |
          Number of timeouts waiting for telemetry
          Eng. units: none
      - id: pld_tlm_nak_cnt
        type: u1
        doc: |
          Number of rejected telemetry packets
          Eng. units: none
      - id: spare_end
        type: u8
        doc: |
          spare end
          Eng. units: none
  soh_command_tlm_t:
    seq:
      - id: cmd_status
        type: u1
        doc: |
          Command Status
      - id: realtime_cmd_accept_count
        type: u1
        doc: |
          Realtime Command Accept Count
          Eng. units: none
      - id: realtime_cmd_reject_count
        type: u1
        doc: |
          Realtime Command Reject Count
          Eng. units: none
      - id: stored_cmd_accept_count
        type: u1
        doc: |
          Stored Command Accept Count
          Eng. units: none
      - id: stored_cmd_reject_count
        type: u1
        doc: |
          Stored Command Reject Count
          Eng. units: none
      - id: macros_executing_pack1
        type: u1
        doc: |
          Macros Executing Bitpack
          Eng. units: bitpack
      - id: macros_executing_pack2
        type: u1
        doc: |
          Macros Executing Bitpack
          Eng. units: bitpack
  soh_general_t:
    seq:
      - id: scrub_status_overall
        type: s1
        doc: |
          Scrub Status Overall
      - id: image_booted
        type: u1
        doc: |
          Which image was booted
      - id: image_auto_failover
        type: u1
        doc: |
          Automatic image failover occurred
  soh_time_t:
    seq:
      - id: tai_seconds
        type: u4
        doc: |
          TAI Seconds
          Scale factor: 0.2
          Eng. units: sec
      - id: time_valid
        type: u1
        doc: |
          Time Valid
  soh_refs_t:
    seq:
      - id: position_wrt_eci1
        type: s4
        doc: |
          Orbit Position, repoted in the ECI (J2000) frame
          Scale factor: 2e-05
          Eng. units: km
      - id: position_wrt_eci2
        type: s4
        doc: |
          Orbit Position, repoted in the ECI (J2000) frame
          Scale factor: 2e-05
          Eng. units: km
      - id: position_wrt_eci3
        type: s4
        doc: |
          Orbit Position, repoted in the ECI (J2000) frame
          Scale factor: 2e-05
          Eng. units: km
      - id: velocity_wrt_eci1
        type: s4
        doc: |
          Orbit Velocity, repoted in the ECI (J2000) frame
          Scale factor: 5e-09
          Eng. units: km/s
      - id: velocity_wrt_eci2
        type: s4
        doc: |
          Orbit Velocity, repoted in the ECI (J2000) frame
          Scale factor: 5e-09
          Eng. units: km/s
      - id: velocity_wrt_eci3
        type: s4
        doc: |
          Orbit Velocity, repoted in the ECI (J2000) frame
          Scale factor: 5e-09
          Eng. units: km/s
      - id: refs_valid
        type: u1
        doc: |
          Refs Valid
  soh_att_det_t:
    seq:
      - id: q_body_wrt_eci1
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Scale factor: 5e-10
          Eng. units: none
      - id: q_body_wrt_eci2
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Scale factor: 5e-10
          Eng. units: none
      - id: q_body_wrt_eci3
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Scale factor: 5e-10
          Eng. units: none
      - id: q_body_wrt_eci4
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Scale factor: 5e-10
          Eng. units: none
      - id: body_rate1
        type: s4
        doc: |
          Body Frame Rate, repoted in the spacecraft body frame
          Scale factor: 5e-09
          Eng. units: rad/sec
      - id: body_rate2
        type: s4
        doc: |
          Body Frame Rate, repoted in the spacecraft body frame
          Scale factor: 5e-09
          Eng. units: rad/sec
      - id: body_rate3
        type: s4
        doc: |
          Body Frame Rate, repoted in the spacecraft body frame
          Scale factor: 5e-09
          Eng. units: rad/sec
      - id: bad_att_timer
        type: u4
        doc: |
          BadAttTimer
          Eng. units: cycles
      - id: bad_rate_timer
        type: u4
        doc: |
          BadRateTimer
          Eng. units: cycles
      - id: reinit_count
        type: u4
        doc: |
          Attitude Filter Reinit Count
          Eng. units: none
      - id: attitude_valid
        type: u1
        doc: |
          Attitude Valid
      - id: meas_att_valid
        type: u1
        doc: |
          Measured Attitude Valid
      - id: meas_rate_valid
        type: u1
        doc: |
          Measured Rate Valid
      - id: tracker_used
        type: u1
        doc: |
          Tracker Used
          Eng. units: none
  soh_att_cmd_t:
    seq:
      - id: hr_cycle_safe_mode
        type: u4
        doc: |
          HR Run Count at Time of Safe Mode
          Eng. units: cycles
      - id: rotisserie_rate
        type: s2
        doc: |
          Desired Sun Rot Rate, about the commanded sun vector
          Scale factor: 4e-05
          Eng. units: rad/sec
      - id: adcs_mode
        type: u1
        doc: |
          ADCS Mode
      - id: safe_mode_reason
        type: u1
        doc: |
          Safe Mode Reason
      - id: recommend_sun_point
        type: u1
        doc: |
          RecommendSunPoint
  soh_rw_drive_t:
    seq:
      - id: filtered_speed_rpm1
        type: s2
        doc: |
          Wheel Meas Speed
          Scale factor: 0.4
          Eng. units: RPM
      - id: filtered_speed_rpm2
        type: s2
        doc: |
          Wheel Meas Speed
          Scale factor: 0.4
          Eng. units: RPM
      - id: filtered_speed_rpm3
        type: s2
        doc: |
          Wheel Meas Speed
          Scale factor: 0.4
          Eng. units: RPM
  soh_tracker_t:
    seq:
      - id: operating_mode
        type: u1
        doc: |
          Tracker Operating Mode
      - id: star_id_step
        type: u1
        doc: |
          Star ID Step
      - id: att_status
        type: u1
        doc: |
          Tracker Attitude Status
      - id: num_attitude_stars
        type: u1
        doc: |
          Num Stars Used in Att
          Eng. units: none
  soh_att_ctrl_t:
    seq:
      - id: position_error1
        type: s4
        doc: |
          Attitude Error, reported in the spacecraft body frame
          Scale factor: 2e-09
          Eng. units: rad
      - id: position_error2
        type: s4
        doc: |
          Attitude Error, reported in the spacecraft body frame
          Scale factor: 2e-09
          Eng. units: rad
      - id: position_error3
        type: s4
        doc: |
          Attitude Error, reported in the spacecraft body frame
          Scale factor: 2e-09
          Eng. units: rad
      - id: time_into_search
        type: u2
        doc: |
          Time Into Sun Search
          Eng. units: sec
      - id: wait_timer
        type: u2
        doc: |
          Sun Search Wait Timer
          Eng. units: sec
      - id: sun_point_angle_error
        type: u2
        doc: |
          Sun Point Angle Error, angle between estimated sun and command sun vector
          Scale factor: 0.003
          Eng. units: deg
      - id: sun_point_state
        type: u1
        doc: |
          Sun Point State
  soh_momentum_t:
    seq:
      - id: momentum_vector_body1
        type: s2
        doc: |
          System Momentum in Body Frame, reported in the spacecraft body frame
          Scale factor: 0.0002
          Eng. units: Nms
      - id: momentum_vector_body2
        type: s2
        doc: |
          System Momentum in Body Frame, reported in the spacecraft body frame
          Scale factor: 0.0002
          Eng. units: Nms
      - id: momentum_vector_body3
        type: s2
        doc: |
          System Momentum in Body Frame, reported in the spacecraft body frame
          Scale factor: 0.0002
          Eng. units: Nms
      - id: duty_cycle1
        type: s1
        doc: |
          Torque Rod Duty Cycle
          Eng. units: none
      - id: duty_cycle2
        type: s1
        doc: |
          Torque Rod Duty Cycle
          Eng. units: none
      - id: duty_cycle3
        type: s1
        doc: |
          Torque Rod Duty Cycle
          Eng. units: none
      - id: torque_rod_mode1
        type: u1
        doc: |
          Torque Rod Ctrl Mode
      - id: torque_rod_mode2
        type: u1
        doc: |
          Torque Rod Ctrl Mode
      - id: torque_rod_mode3
        type: u1
        doc: |
          Torque Rod Ctrl Mode
      - id: mag_source_used
        type: u1
        doc: |
          Mag Field Source
      - id: momentum_vector_valid
        type: u1
        doc: |
          Momentum Vector Valid
  soh_css_t:
    seq:
      - id: sun_vector_body1
        type: s2
        doc: |
          Meas Sun Body Vector, reported in the spacecraft body frame
          Scale factor: 0.0001
          Eng. units: none
      - id: sun_vector_body2
        type: s2
        doc: |
          Meas Sun Body Vector, reported in the spacecraft body frame
          Scale factor: 0.0001
          Eng. units: none
      - id: sun_vector_body3
        type: s2
        doc: |
          Meas Sun Body Vector, reported in the spacecraft body frame
          Scale factor: 0.0001
          Eng. units: none
      - id: sun_vector_status
        type: u1
        doc: |
          Meas Sun Body Vector Status
      - id: sun_sensor_used
        type: u1
        doc: |
          Sun Sensor Package Used
          Eng. units: none
  soh_mag_t:
    seq:
      - id: mag_vector_body1
        type: s2
        doc: |
          Meas Mag Field, reported in the spacecraft body frame
          Scale factor: 5e-09
          Eng. units: T
      - id: mag_vector_body2
        type: s2
        doc: |
          Meas Mag Field, reported in the spacecraft body frame
          Scale factor: 5e-09
          Eng. units: T
      - id: mag_vector_body3
        type: s2
        doc: |
          Meas Mag Field, reported in the spacecraft body frame
          Scale factor: 5e-09
          Eng. units: T
      - id: mag_vector_valid
        type: u1
        doc: |
          Meas Mag Field Valid
  soh_imu_t:
    seq:
      - id: new_packet_count
        type: u1
        doc: |
          IMU Packet Count
          Eng. units: none
      - id: imu_vector_valid
        type: u1
        doc: |
          IMU Rate Valid
  soh_clock_sync_t:
    seq:
      - id: hr_run_count
        type: u4
        doc: |
          High Rate Run Count
          Eng. units: none
      - id: hr_exec_time_ms
        type: u1
        doc: |
          High Rate Duration
          Eng. units: msec
  soh_analogs_t:
    seq:
      - id: box1_temp
        type: s2
        doc: |
          Box 1 Temp
          Scale factor: 0.005
          Eng. units: degC
      - id: bus_voltage
        type: s2
        doc: |
          Bus Voltage
          Scale factor: 0.001
          Eng. units: V
      - id: battery_voltage
        type: u2
        doc: |
          Battery Voltage
          Scale factor: 0.002
          Eng. units: V
      - id: battery_current
        type: s2
        doc: |
          Battery Current
          Scale factor: 0.002
          Eng. units: A
  soh_tracker2_t:
    seq:
      - id: operating_mode
        type: u1
        doc: |
          Tracker Operating Mode
      - id: star_id_step
        type: u1
        doc: |
          Star ID Step
      - id: att_status
        type: u1
        doc: |
          Tracker Attitude Status
      - id: num_attitude_stars
        type: u1
        doc: |
          Num Stars Used in Att
          Eng. units: none
  soh_gps_t:
    seq:
      - id: gps_lock_count
        type: u2
        doc: |
          Number of GPS Locks Obtained
          Eng. units: none
      - id: gps_valid
        type: u1
        doc: |
          GPS Valid
      - id: gps_enable
        type: u1
        doc: |
          GPS Enabled
  soh_event_check_t:
    seq:
      - id: latched_resp_fire_pack1
        type: u1
        doc: |
          Latched Response Fired Bitpack
          Eng. units: bitpack
      - id: latched_resp_fire_pack2
        type: u1
        doc: |
          Latched Response Fired Bitpack
          Eng. units: bitpack
  soh_radio_t:
    seq:
      - id: sd_minute_cur
        type: u4
        doc: |
          SD Card Current Minute Number
          Eng. units: none
      - id: sd_percent_used_total
        type: u1
        doc: |
          SD Card Used Space Percentage Total
          Eng. units: percent
      - id: sd_ok
        type: u1
        doc: |
          SD Card Healthy?
      - id: sd_fault_count
        type: u1
        doc: |
          SD Card Count Of Re-openings
          Eng. units: none
      - id: sdr_tx_tx_frames
        type: u4
        doc: |
          BCT-SDR-TX tx frame counter
          Eng. units: none
      - id: sdr_tx_temp
        type: s1
        doc: |
          BCT-SDR-TX temperature
          Eng. units: C
      - id: sdr_tx_comm_error
        type: u1
        doc: |
          BCT-SDR-TX temperature
      - id: sq_channel
        type: s1
        doc: |
          SpaceQuest Current Channel Selection
          Eng. units: none
      - id: sq_trap_count
        type: u1
        doc: |
          SpaceQuest Trap-Error Cycle Count
          Eng. units: none
      - id: sq_temp
        type: u1
        doc: |
          SpaceQuest Temperature
          Eng. units: C
  soh_tracker_ctrl_t:
    seq:
      - id: aid_status1
        type: u1
        doc: |
          Tracker Aiding Status
          Eng. units: bitpack_(see_User_Guide)
      - id: aid_status2
        type: u1
        doc: |
          Tracker Aiding Status
          Eng. units: bitpack_(see_User_Guide)
      - id: star_id_status
        type: u1
        doc: |
          Tracker Performing StarId
          Eng. units: none
  cute_bct_soh_t:
    seq:
      - id: soh_l0
        type: soh_l0_t
      - id: soh_command_tlm
        type: soh_command_tlm_t
      - id: soh_general
        type: soh_general_t
      - id: soh_time
        type: soh_time_t
      - id: soh_refs
        type: soh_refs_t
      - id: soh_att_det
        type: soh_att_det_t
      - id: soh_att_cmd
        type: soh_att_cmd_t
      - id: soh_rw_drive
        type: soh_rw_drive_t
      - id: soh_tracker
        type: soh_tracker_t
      - id: soh_att_ctrl
        type: soh_att_ctrl_t
      - id: soh_momentum
        type: soh_momentum_t
      - id: soh_css
        type: soh_css_t
      - id: soh_mag
        type: soh_mag_t
      - id: soh_imu
        type: soh_imu_t
      - id: soh_clock_sync
        type: soh_clock_sync_t
      - id: soh_analogs
        type: soh_analogs_t
      - id: soh_tracker2
        type: soh_tracker2_t
      - id: soh_gps
        type: soh_gps_t
      - id: soh_event_check
        type: soh_event_check_t
      - id: soh_radio
        type: soh_radio_t
      - id: soh_tracker_ctrl
        type: soh_tracker_ctrl_t
  pld_packet_primary_header_t:
    seq:
      - id: ccsds_version
        type: b3
      - id: packet_type
        type: b1
      - id: secondary_header_flag
        type: b1
      - id: application_process_id
        type: b11
      - id: sequence_flags
        type: b2
      - id: sequence_count
        type: b14
      - id: packet_length
        type: u2
      - id: user_data_field
        type:
          switch-on: application_process_id
          cases:
            1: cute_pld_sw_stat_t
  cute_pld_sw_stat_t:
    seq:
      - id: sh_coarse
        type: u4
      - id: sh_fine
        type: u2
      - id: pld_sw_ver_maj
        type: u1
      - id: pld_sw_ver_min
        type: u1
      - id: pld_sw_ver_patch
        type: u1
      - id: spare
        type: b6
      - id: sd_state_card1
        type: b1
        doc: |
          DEAD=0, ALIVE=1
      - id: sd_state_card0
        type: b1
        doc: |
          DEAD=0, ALIVE=1
      - id: zynq_temp
        type: u2
        doc: |
          Conversion: temperature = 0.007690*zynq_temp-273.150000
      - id: zynq_vcc_int
        type: u2
        doc: |
          Conversion: VCC(INT) = 0.000046 * zynq_vcc_int
      - id: zynq_vcc_aux
        type: u2
        doc: |
          Conversion: VCC(AUX) = 0.000046 * zynq_vcc_aux
      - id: zynq_vcc_bram
        type: u2
        doc: |
          Conversion: VCC(BRAM) = 0.000046 * zynq_vcc_bram
      - id: zynq_vcc_pint
        type: u2
        doc: |
          Conversion: VCC(PINT) = 0.000046 * zynq_vcc_pint
      - id: zynq_vcc_paux
        type: u2
        doc: |
          Conversion: VCC(PAUX) = 0.000046 * zynq_vcc_paux
      - id: zynq_vcc_pdr0
        type: u2
        doc: |
          Conversion: VCC(PDR0) = 0.000046 * zynq_vcc_pdr0
      - id: zynq_status
        type: u1
      - id: spare8
        type: u1
      - id: proc_temp
        type: s2
        doc: |
          Conversion: Temperature = 0.00390625*proc_temp
      - id: ccd_p5
        type: u2
        doc: |
          Conversion: CCD PCB +5.5V rail voltage = 0.00161172*ccd_p5
      - id: ccd_p15
        type: u2
        doc: |
          Conversion: CCD PCB +15V rail voltage = 0.00447253*ccd_p15
      - id: ccd_p32
        type: u2
        doc: |
          Conversion: CCD PCB +32V rail voltage = 0.00886447*ccd_p32
      - id: ccd_n5
        type: u2
        doc: |
          Conversion: CCD PCB -5V rail voltage = 0.00313565*ccd_n5-7.229570
      - id: spare16
        type: u2
      - id: cmd_recv_count
        type: u2
      - id: cmd_rjct_count
        type: u2
      - id: cmd_succ_count
        type: u2
      - id: cmd_succ_op
        type: u2
        doc: |
          0/NOOP 1/ARM 2/CMD_RST_STATS 3/CMD_XSUM 4/CMD_ECHO_STATE
          48/LOG_ROUTE 49/LOG_STATE 50/LOG_RST_STATS 52/LOG_RESET_READ
          53/LOG_ISSUE 54/LOG_DUMP_INFO 55/LOG_SET_PUBLISH 80/MEM_DUMP
          81/MEM_LOAD 82/MEM_ERASE 83/MEM_XSUM 84/MEM_ABORT 85/MEM_RESET
          86/MEM_LOAD_DWORD 87/MEM_LOAD_WORD 88/MEM_LOAD_BYTE 96/PKT_ISSUE
          97/PKT_SET_RATE 98/PKT_SET_STREAM 99/PKT_SET_PRIORITY
          100/PKT_QUERY_APID 101/PKT_SET_DELAY 112/TIME_RESET 128/TBL_DUMP
          129/TBL_LOAD 130/TBL_LOAD_START 131/TBL_COMMIT 132/TBL_ABORT
          133/TBL_VERIFY 144/OS_RESET 145/OS_SEND_HK 160/FS_MKDIR 161/FS_RMDIR
          162/FS_RENAME 163/FS_DIRLIST 164/FS_RM 165/FS_DUMP 166/FS_DEV_STAT
          167/FS_LOAD 168/FS_COMMIT 169/FS_FORMAT 170/FS_COPY 171/FS_SD_STATE
          176/TEC_ENA 177/TEC_DIS 178/TEC_SET_SLEW_RATE 179/TEC_SET_TEMP
          180/TEC_READ_REG 181/TEC_WRITE_REG 182/TEC_WRITE_DAC
          184/TEC_SELECT_RTC 192/CCD_EXPOSE 193/CCD_ABORT 194/CCD_SHUTTER_OVER
          195/CCD_SHUTTER_OPEN 196/CCD_SHUTTER_CLOSE 197/CCD_SET_ID
          198/CCD_COPY_IMG_SLOT 199/CCD_COPY_REF_SLOT 200/CCD_ADD_REF
          201/CCD_MULT_REF 202/CCD_LOAD_REF 203/CCD_REPLAY 204/CCD_DUMP
          205/CCD_ENA 206/CCD_DIS 207/CCD_SET_DAC 208/IMAGE_PROCESS
          209/IMAGE_ABORT 224/MODE_STANDBY 225/MODE_SCIENCE 240/CCD_STORE_REF
      - id: cmd_rjct_op
        type: u2
        doc: |
          0/NOOP 1/ARM 2/CMD_RST_STATS 3/CMD_XSUM 4/CMD_ECHO_STATE
          48/LOG_ROUTE 49/LOG_STATE 50/LOG_RST_STATS 52/LOG_RESET_READ
          53/LOG_ISSUE 54/LOG_DUMP_INFO 55/LOG_SET_PUBLISH 80/MEM_DUMP
          81/MEM_LOAD 82/MEM_ERASE 83/MEM_XSUM 84/MEM_ABORT 85/MEM_RESET
          86/MEM_LOAD_DWORD 87/MEM_LOAD_WORD 88/MEM_LOAD_BYTE 96/PKT_ISSUE
          97/PKT_SET_RATE 98/PKT_SET_STREAM 99/PKT_SET_PRIORITY
          100/PKT_QUERY_APID 101/PKT_SET_DELAY 112/TIME_RESET 128/TBL_DUMP
          129/TBL_LOAD 130/TBL_LOAD_START 131/TBL_COMMIT 132/TBL_ABORT
          133/TBL_VERIFY 144/OS_RESET 145/OS_SEND_HK 160/FS_MKDIR 161/FS_RMDIR
          162/FS_RENAME 163/FS_DIRLIST 164/FS_RM 165/FS_DUMP 166/FS_DEV_STAT
          167/FS_LOAD 168/FS_COMMIT 169/FS_FORMAT 170/FS_COPY 171/FS_SD_STATE
          176/TEC_ENA 177/TEC_DIS 178/TEC_SET_SLEW_RATE 179/TEC_SET_TEMP
          180/TEC_READ_REG 181/TEC_WRITE_REG 182/TEC_WRITE_DAC
          184/TEC_SELECT_RTC 192/CCD_EXPOSE 193/CCD_ABORT 194/CCD_SHUTTER_OVER
          195/CCD_SHUTTER_OPEN 196/CCD_SHUTTER_CLOSE 197/CCD_SET_ID
          198/CCD_COPY_IMG_SLOT 199/CCD_COPY_REF_SLOT 200/CCD_ADD_REF
          201/CCD_MULT_REF 202/CCD_LOAD_REF 203/CCD_REPLAY 204/CCD_DUMP
          205/CCD_ENA 206/CCD_DIS 207/CCD_SET_DAC 208/IMAGE_PROCESS
          209/IMAGE_ABORT 224/MODE_STANDBY 225/MODE_SCIENCE 240/CCD_STORE_REF
      - id: cmd_fail_code
        type: u1
        doc: |
          0/SUCCESS 1/MODE 2/ARM 3/SOURCE 4/OPCODE 5/METHOD 6/LENGTH 7/RANGE
          8/CHECKSUM 9/PKT_TYPE
      - id: spare6
        type: b6
      - id: arm_state_sc
        doc: |
          0/OFF 1/ARMED
        type: b1
      - id: arm_state_dbg
        type: b1
        doc: |
          0/OFF 1/ARMED
      - id: log_write_count
        type: u2
      - id: log_drop_count
        type: u2
      - id: ccd_ena_state
        type: u1
        doc: |
          0/OFF 1/ARMED
      - id: ccd_ctrl_state
        type: u1
        doc: |
          0/IDLE 1/ERASE 2/OPEN 3/EXPOSE 4/READOUT 5/REPLAY 6/PROCESS 7/ENA 8/DIS
      - id: ccd_shutter
        type: u1
        doc: |
          0/CLOSED 1/OPEN
      - id: shutter_override
        type: u1
        doc: |
          0/DIS 1/ENA
      - id: frame_id
        type: u4
      - id: os_cpu_usage
        type: u2
      - id: os_cpu_max
        type: u2
      - id: time_pps_count
        type: u2
      - id: time_recv_count
        type: u2
      - id: time_miss_count
        type: u2
      - id: fsw_mode
        type: u1
        doc: |
          0/STANDBY 1/SCIENCE
      - id: tec_state
        type: u1
        doc: |
          Indicates if the TEC is enabled or not.
          0/DIS 1/ENA
      - id: tec_slew_rate
        type: f4
      - id: tec_setpoint
        type: f4
      - id: tec_ccd_rtd
        type: u2
        doc: |
          Temperature at back of CCD ceramic package
          Conversion: temperature = 0.07926885578181089*tec_ccd_rtd - 259.7402597402597
      - id: tec_sc_rtd5
        type: u2
        doc: |
          Temperature at top of spectograph housing
          Conversion: temperature = 0.07926885578181089*tec_sc_rtd5 - 259.7402597402597
      - id: tec_sc_rtd4
        type: u2
        doc: |
          Temperature at rear of primary mirror
          Conversion: temperature = 0.07926885578181089*tec_sc_rtd4 - 259.7402597402597
      - id: tec_sc_rtd3
        type: u2
        doc: |
          Temperature at heatsink on rear of CCD TEC
          Conversion: temperature = 0.07926885578181089*tec_sc_rtd3 - 259.7402597402597
      - id: tec_sc_rtd2
        type: u2
        doc: |
          Temperature at radiator panel panel near to heat strap
          Conversion: temperature = 0.07926885578181089*tec_sc_rtd2 - 259.7402597402597
      - id: tec_sc_rtd1
        type: u2
        doc: |
          Temperature at the radiator panel far from heat strap
          Conversion: temperature = 0.07926885578181089*tec_sc_rtd1 - 259.7402597402597
      - id: tec_shutter
        doc: |
          Voltage output of the G-MRCO-003 magnetoresistive bridge sensor for shutter position sensing
          Conversion: sensor voltage = 1.910352233280647e-4*tec_shutter
        type: u2
      - id: tec_volt
        type: u2
      - id: tec_avg_curr
        type: u2
      - id: tec_curr
        type: u2
      - id: img_state
        type: u1
      - id: img_curr_proc_type
        type: u1
        doc: |
          0/SKIP 1/RAW 2/BIN2D 3/BIAS 4/DARK 5/OUTSPEC 6/SPEC1D 7/TRIM2D 8/XDISP
