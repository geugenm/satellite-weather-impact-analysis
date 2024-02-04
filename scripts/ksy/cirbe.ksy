meta:
  id: cirbe
  title: CIRBE 70cm SOH Packet Struct
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
  :field soh_l0_spare_end: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_l0.spare_end
  :field soh_command_tlm_cmd_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.cmd_status
  :field soh_command_tlm_realtime_cmd_accept_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.realtime_cmd_accept_count
  :field soh_command_tlm_realtime_cmd_reject_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.realtime_cmd_reject_count
  :field soh_command_tlm_stored_cmd_accept_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.stored_cmd_accept_count
  :field soh_command_tlm_stored_cmd_reject_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_command_tlm.stored_cmd_reject_count
  :field soh_general_scrub_status_overall: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_general.scrub_status_overall
  :field soh_general_image_booted: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_general.image_booted
  :field soh_general_image_auto_failover: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_general.image_auto_failover
  :field soh_general_inertia_index: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_general.inertia_index
  :field soh_time_tai_seconds: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.tai_seconds
  :field soh_time_time_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.time_valid
  :field soh_time_health1_pack_spare2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.health1_pack_spare2
  :field soh_time_rtc_osc_rst_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.rtc_osc_rst_count
  :field soh_time_rtc_init_time_at_boot: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.rtc_init_time_at_boot
  :field soh_time_rtc_sync_stat: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.rtc_sync_stat
  :field soh_time_rtc_alive: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.rtc_alive
  :field soh_time_rtc_power: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_time.rtc_power
  :field soh_refs_position_wrt_eci1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.position_wrt_eci1
  :field soh_refs_position_wrt_eci2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.position_wrt_eci2
  :field soh_refs_position_wrt_eci3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.position_wrt_eci3
  :field soh_refs_velocity_wrt_eci1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.velocity_wrt_eci1
  :field soh_refs_velocity_wrt_eci2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.velocity_wrt_eci2
  :field soh_refs_velocity_wrt_eci3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.velocity_wrt_eci3
  :field soh_refs_modeled_sun_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.modeled_sun_vector_body1
  :field soh_refs_modeled_sun_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.modeled_sun_vector_body2
  :field soh_refs_modeled_sun_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.modeled_sun_vector_body3
  :field soh_refs_mag_model_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.mag_model_vector_body1
  :field soh_refs_mag_model_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.mag_model_vector_body2
  :field soh_refs_mag_model_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.mag_model_vector_body3
  :field soh_refs_refs_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.refs_valid
  :field soh_refs_run_low_rate_task: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_refs.run_low_rate_task
  :field soh_att_det_q_body_wrt_eci1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci1
  :field soh_att_det_q_body_wrt_eci2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci2
  :field soh_att_det_q_body_wrt_eci3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci3
  :field soh_att_det_q_body_wrt_eci4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.q_body_wrt_eci4
  :field soh_att_det_tracker_sol_mixed: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.tracker_sol_mixed
  :field soh_att_det_tracker2_data_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.tracker2_data_valid
  :field soh_att_det_tracker1_data_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.tracker1_data_valid
  :field soh_att_det_imu_data_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.imu_data_valid
  :field soh_att_det_meas_rate_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.meas_rate_valid
  :field soh_att_det_meas_att_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.meas_att_valid
  :field soh_att_det_attitude_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_det.attitude_valid
  :field soh_att_cmd_hr_cycle_safe_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.hr_cycle_safe_mode
  :field soh_att_cmd_health1_pack_spare1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.health1_pack_spare1
  :field soh_att_cmd_sun_point_reason: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.sun_point_reason
  :field soh_att_cmd_recommend_sun_point: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.recommend_sun_point
  :field soh_att_cmd_adcs_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_cmd.adcs_mode
  :field soh_rw_drive_filtered_speed_rpm1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_rw_drive.filtered_speed_rpm1
  :field soh_rw_drive_filtered_speed_rpm2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_rw_drive.filtered_speed_rpm2
  :field soh_rw_drive_filtered_speed_rpm3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_rw_drive.filtered_speed_rpm3
  :field soh_tracker_operating_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.operating_mode
  :field soh_tracker_star_id_step: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.star_id_step
  :field soh_tracker_att_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.att_status
  :field soh_tracker_num_attitude_stars: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker.num_attitude_stars
  :field soh_att_ctrl_eigen_error: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.eigen_error
  :field soh_att_ctrl_sun_point_angle_error: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.sun_point_angle_error
  :field soh_att_ctrl_health1_pack_spare1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.health1_pack_spare1
  :field soh_att_ctrl_sun_source_failover: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.sun_source_failover
  :field soh_att_ctrl_sun_avoid_flag: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.sun_avoid_flag
  :field soh_att_ctrl_on_sun_flag: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.on_sun_flag
  :field soh_att_ctrl_momentum_too_high: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.momentum_too_high
  :field soh_att_ctrl_att_ctrl_active: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_att_ctrl.att_ctrl_active
  :field soh_momentum_total_momentum_mag: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.total_momentum_mag
  :field soh_momentum_duty_cycle1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.duty_cycle1
  :field soh_momentum_duty_cycle2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.duty_cycle2
  :field soh_momentum_duty_cycle3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.duty_cycle3
  :field soh_momentum_torque_rod_mode1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_mode1
  :field soh_momentum_torque_rod_mode2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_mode2
  :field soh_momentum_torque_rod_mode3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_mode3
  :field soh_momentum_torque_rod_firing_pack_spare: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_firing_pack_spare
  :field soh_momentum_torque_rod_direction3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_direction3
  :field soh_momentum_torque_rod_direction2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_direction2
  :field soh_momentum_torque_rod_direction1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_direction1
  :field soh_momentum_torque_rod_enable3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_enable3
  :field soh_momentum_torque_rod_enable2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_enable2
  :field soh_momentum_torque_rod_enable1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.torque_rod_enable1
  :field soh_momentum_health1_pack_spare2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.health1_pack_spare2
  :field soh_momentum_mag_source_failover: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.mag_source_failover
  :field soh_momentum_tr_fault: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.tr_fault
  :field soh_momentum_health1_pack_spare1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.health1_pack_spare1
  :field soh_momentum_momentum_vector_enabled: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.momentum_vector_enabled
  :field soh_momentum_momentum_vector_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.momentum_vector_valid
  :field soh_momentum_tr_drive_power_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_momentum.tr_drive_power_state
  :field soh_css_sun_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_body1
  :field soh_css_sun_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_body2
  :field soh_css_sun_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_body3
  :field soh_css_sun_vector_status: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_status
  :field soh_css_css_invalid_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.css_invalid_count
  :field soh_css_health1_pack_spare1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.health1_pack_spare1
  :field soh_css_sun_sensor_used: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_sensor_used
  :field soh_css_css_test_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.css_test_mode
  :field soh_css_sun_vector_enabled: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.sun_vector_enabled
  :field soh_css_meas_sun_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.meas_sun_valid
  :field soh_css_css_power_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_css.css_power_state
  :field soh_mag_mag_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_body1
  :field soh_mag_mag_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_body2
  :field soh_mag_mag_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_body3
  :field soh_mag_mag_invalid_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_invalid_count
  :field soh_mag_health1_pack_spare1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.health1_pack_spare1
  :field soh_mag_mag_sensor_used: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_sensor_used
  :field soh_mag_mag_test_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_test_mode
  :field soh_mag_mag_vector_enabled: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_enabled
  :field soh_mag_mag_vector_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_vector_valid
  :field soh_mag_mag_power_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_mag.mag_power_state
  :field soh_imu_imu_avg_vector_body1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body1
  :field soh_imu_imu_avg_vector_body1_dps: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body1_dps
  :field soh_imu_imu_avg_vector_body1_rpm: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body1_rpm
  :field soh_imu_imu_avg_vector_body2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body2
  :field soh_imu_imu_avg_vector_body2_dps: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body2_dps
  :field soh_imu_imu_avg_vector_body2_rpm: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body2_rpm
  :field soh_imu_imu_avg_vector_body3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body3
  :field soh_imu_imu_avg_vector_body3_dps: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body3_dps
  :field soh_imu_imu_avg_vector_body3_rpm: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_avg_vector_body3_rpm
  :field soh_imu_imu_invalid_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_invalid_count
  :field soh_imu_health1_pack_spare1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.health1_pack_spare1
  :field soh_imu_imu_valid_packets: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_valid_packets
  :field soh_imu_imu_test_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_test_mode
  :field soh_imu_imu_vector_enabled: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_vector_enabled
  :field soh_imu_imu_vector_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_vector_valid
  :field soh_imu_imu_power_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_imu.imu_power_state
  :field soh_clock_sync_hr_run_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_run_count
  :field soh_clock_sync_hr_exec_time_ms1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_exec_time_ms1
  :field soh_clock_sync_hr_exec_time_ms2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_exec_time_ms2
  :field soh_clock_sync_hr_exec_time_ms3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_exec_time_ms3
  :field soh_clock_sync_hr_exec_time_ms4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_exec_time_ms4
  :field soh_clock_sync_hr_exec_time_ms5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_clock_sync.hr_exec_time_ms5
  :field soh_analogs_battery_voltage: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_analogs.battery_voltage
  :field soh_gps_gps_cycles_since_crc_data: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_cycles_since_crc_data
  :field soh_gps_gps_lock_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_lock_count
  :field soh_gps_msg_used_satellites: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.msg_used_satellites
  :field soh_gps_gps_pos_lock: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_pos_lock
  :field soh_gps_gps_time_lock: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_time_lock
  :field soh_gps_msg_data_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.msg_data_valid
  :field soh_gps_gps_new_data_received: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_new_data_received
  :field soh_gps_gps_enable: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_enable
  :field soh_gps_gps_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.gps_valid
  :field soh_gps_health1_pack_spare1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_gps.health1_pack_spare1
  :field soh_event_check_latched_resp_fire_pack_bit8: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit8
  :field soh_event_check_latched_resp_fire_pack_bit7: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit7
  :field soh_event_check_latched_resp_fire_pack_bit6: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit6
  :field soh_event_check_latched_resp_fire_pack_bit5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit5
  :field soh_event_check_latched_resp_fire_pack_bit4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit4
  :field soh_event_check_latched_resp_fire_pack_bit3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit3
  :field soh_event_check_latched_resp_fire_pack_bit2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit2
  :field soh_event_check_latched_resp_fire_pack_bit1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_event_check.latched_resp_fire_pack_bit1
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
  :field soh_radio_sq_channel: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sq_channel
  :field soh_radio_sq_trap_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sq_trap_count
  :field soh_radio_sq_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sq_temp
  :field soh_radio_sdr_tx_tx_frames: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sdr_tx_tx_frames
  :field soh_radio_sdr_tx_tx_power: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sdr_tx_tx_power
  :field soh_radio_sdr_tx_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sdr_tx_temp
  :field soh_radio_sdr_tx_comm_error: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_radio.sdr_tx_comm_error
  :field soh_tracker_ctrl_tracker_att_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.soh_tracker_ctrl.tracker_att_valid

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
            - '"CIRBE "'
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
            0x50: cirbe_bct_soh_t
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
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: reset_armed
        type: b1
        doc: |
          Processor reset armed status
          Conversion coefficients: C0=1.0
          Enumeration values: 1/ARMED 0/NOT_ARMED
      - id: wdt_stat
        type: b1
        doc: |
          Watch Reset Event Status
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO_WDT 1/WDT
      - id: wdt_en
        type: b1
        doc: |
          Watchdog Reset Enable Status
          Conversion coefficients: C0=1.0
          Enumeration values: 0/DISABLED 1/ENABLED
      - id: table_select
        type: b1
        doc: |
          Table select
          Conversion coefficients: C0=1.0
          Enumeration values: 0/FLASH 1/COMPILED
      - id: boot_relay
        type: b1
        doc: |
          Boot Relay Status
          Conversion coefficients: C0=1.0
          Enumeration values: 1/PRIMARY 0/REDUNDANT
      - id: l0_acpt_cnt
        type: u1
        doc: |
          Level 0 Accept Counter
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: l0_rjct_cnt
        type: u1
        doc: |
          Level 0 Reject Counter
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: hw_sec_cnt
        type: u1
        doc: |
          Hardware Second Counter
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: padding_0
        type: u8
      - id: time_tag
        type: u4
        doc: |
          Unused PIQ
          Conversion coefficients: C0=1.0
          Eng. units: USEC
      - id: padding_1a
        type: u8
      - id: padding_1b
        type: u2
      - id: spare_end
        type: u4
        doc: |
          spare end
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: spare_end_b
        type: u2
  soh_command_tlm_t:
    seq:
      - id: cmd_status
        type: u1
        doc: |
          Command Status
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OK 1/BAD_APID 2/BAD_OPCODE 3/BAD_DATA
          4/NOW_READING 5/DONE_READING 6/IDLE 7/NO_CMD_DATA 8/CMD_SRVC_OVERRUN
          9/CMD_APID_OVERRUN 10/INCORRECT_WHEEL_MODE 11/BAD_ELEMENT
          12/TABLES_BUSY 13/FLASH_NOT_ARMED 14/THRUSTERS_DISABLED
          15/ATT_ERR_TOO_HIGH 16/ASYNC_REFUSED 17/DRIVER_ERROR
      - id: realtime_cmd_accept_count
        type: u1
        doc: |
          Realtime Command Accept Count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: realtime_cmd_reject_count
        type: u1
        doc: |
          Realtime Command Reject Count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: stored_cmd_accept_count
        type: u1
        doc: |
          Stored Command Accept Count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: stored_cmd_reject_count
        type: u1
        doc: |
          Stored Command Reject Count
          Conversion coefficients: C0=1.0
          Eng. units: none
  soh_general_t:
    seq:
      - id: scrub_status_overall
        type: s1
        doc: |
          Scrub Status Overall
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OK -1/FAIL 1/IN_PROG -2/ABORTED
      - id: image_booted
        type: u1
        doc: |
          Which image was booted
          Conversion coefficients: C0=1.0
          Enumeration values: 0/PRIMARY 1/REDUNDANT
      - id: image_auto_failover
        type: u1
        doc: |
          Automatic image failover occurred
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OK 1/FAIL
      - id: inertia_index
        type: u1
        doc: |
          Spacecraft Software Inertia Index Used
          Conversion coefficients: C0=1.0
          Eng. units: none
  soh_time_t:
    seq:
      - id: tai_seconds
        type: f8
        doc: |
          TAI Seconds
          Conversion coefficients: C0=1.0
          Eng. units: sec
      - id: time_valid
        type: u1
        doc: |
          Time Valid
          Conversion coefficients: C0=1.0
          Enumeration values: 1/YES 0/NO
      - id: health1_pack_spare2
        type: b1
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: rtc_osc_rst_count
        type: b3
        doc: |
          RTC oscillator reset count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: rtc_init_time_at_boot
        type: b1
        doc: |
          Configuration if avionics will initialize to RTC time at boot
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: rtc_sync_stat
        type: b1
        doc: |
          RTC sync status
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON
      - id: rtc_alive
        type: b1
        doc: |
          RTC aliveness flag
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: rtc_power
        type: b1
        doc: |
          RTC Power status
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON
  soh_refs_t:
    seq:
      - id: position_wrt_eci1
        type: s4
        doc: |
          Orbit Position, reported in the ECI (J2000) frame
          Conversion coefficients: C0=1.9999999e-05
          Eng. units: km
      - id: position_wrt_eci2
        type: s4
        doc: |
          Orbit Position, reported in the ECI (J2000) frame
          Conversion coefficients: C0=1.9999999e-05
          Eng. units: km
      - id: position_wrt_eci3
        type: s4
        doc: |
          Orbit Position, reported in the ECI (J2000) frame
          Conversion coefficients: C0=1.9999999e-05
          Eng. units: km
      - id: velocity_wrt_eci1
        type: s4
        doc: |
          Orbit Velocity, reported in the ECI (J2000) frame
          Conversion coefficients: C0=5e-09
          Eng. units: km/s
      - id: velocity_wrt_eci2
        type: s4
        doc: |
          Orbit Velocity, reported in the ECI (J2000) frame
          Conversion coefficients: C0=5e-09
          Eng. units: km/s
      - id: velocity_wrt_eci3
        type: s4
        doc: |
          Orbit Velocity, reported in the ECI (J2000) frame
          Conversion coefficients: C0=5e-09
          Eng. units: km/s
      - id: modeled_sun_vector_body1
        type: s2
        doc: |
          Sun vector (from spacecraft to Sun), reported in the spacecraft body frame
          Conversion coefficients: C0=3.9999999e-05
          Eng. units: none
      - id: modeled_sun_vector_body2
        type: s2
        doc: |
          Sun vector (from spacecraft to Sun), reported in the spacecraft body frame
          Conversion coefficients: C0=3.9999999e-05
          Eng. units: none
      - id: modeled_sun_vector_body3
        type: s2
        doc: |
          Sun vector (from spacecraft to Sun), reported in the spacecraft body frame
          Conversion coefficients: C0=3.9999999e-05
          Eng. units: none
      - id: mag_model_vector_body1
        type: s2
        doc: |
          Mag Model Vector, reported in the spacecraft body frame
          Conversion coefficients: C0=5e-09
          Eng. units: T
      - id: mag_model_vector_body2
        type: s2
        doc: |
          Mag Model Vector, reported in the spacecraft body frame
          Conversion coefficients: C0=5e-09
          Eng. units: T
      - id: mag_model_vector_body3
        type: s2
        doc: |
          Mag Model Vector, reported in the spacecraft body frame
          Conversion coefficients: C0=5e-09
          Eng. units: T
      - id: refs_valid
        type: u1
        doc: |
          Refs Valid
          Conversion coefficients: C0=1.0
          Enumeration values: 1/YES 0/NO
      - id: run_low_rate_task
        type: u1
        doc: |
          RunLowRateTask
          Conversion coefficients: C0=1.0
          Enumeration values: 1/YES 0/NO
  soh_att_det_t:
    seq:
      - id: q_body_wrt_eci1
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Conversion coefficients: C0=4.9999999e-10
          Eng. units: none
      - id: q_body_wrt_eci2
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Conversion coefficients: C0=4.9999999e-10
          Eng. units: none
      - id: q_body_wrt_eci3
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Conversion coefficients: C0=4.9999999e-10
          Eng. units: none
      - id: q_body_wrt_eci4
        type: s4
        doc: |
          Attitude Quaternion, spacecraft body frame with respect to ECI (J2000) frame
          Conversion coefficients: C0=4.9999999e-10
          Eng. units: none
      - id: tracker_sol_mixed
        type: b1
        doc: |
          Tracker solutions optimally mixed
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: padding_0
        type: b1
      - id: tracker2_data_valid
        type: b1
        doc: |
          Tracker 2 data valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: tracker1_data_valid
        type: b1
        doc: |
          Tracker 1 data valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: imu_data_valid
        type: b1
        doc: |
          IMU data valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: meas_rate_valid
        type: b1
        doc: |
          Measured rate valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: meas_att_valid
        type: b1
        doc: |
          Measured attitude valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: attitude_valid
        type: b1
        doc: |
          Attitude Validity Flag
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
  soh_att_cmd_t:
    seq:
      - id: hr_cycle_safe_mode
        type: u4
        doc: |
          HR Run Count at Time of Safe Mode
          Conversion coefficients: C0=1.0
          Eng. units: cycles
      - id: health1_pack_spare1
        type: b1
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sun_point_reason
        type: b3
        doc: |
          Reason ADCS reverted to Sun Point ADCS Mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/BOOT 1/COMMAND 2/ATTITUDE_INVALID 3/TIME_INVALID 4/REFS_INVALID
      - id: recommend_sun_point
        type: b1
        doc: |
          Recommend Sun Point ADCS mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: padding_0
        type: b2
      - id: adcs_mode
        type: b1
        doc: |
          ADCS Mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/SUN_POINT 1/FINE_REF_POINT
  soh_rw_drive_t:
    seq:
      - id: filtered_speed_rpm1
        type: s2
        doc: |
          Wheel Meas Speed
          Conversion coefficients: C0=0.40000001
          Eng. units: RPM
      - id: filtered_speed_rpm2
        type: s2
        doc: |
          Wheel Meas Speed
          Conversion coefficients: C0=0.40000001
          Eng. units: RPM
      - id: filtered_speed_rpm3
        type: s2
        doc: |
          Wheel Meas Speed
          Conversion coefficients: C0=0.40000001
          Eng. units: RPM
  soh_tracker_t:
    seq:
      - id: operating_mode
        type: u1
        doc: |
          Tracker Operating Mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/IDLE 1/INITIALIZE 2/STARID 3/TRACK 4/PHOTO 5/CAL 6/BLOCK
      - id: star_id_step
        type: u1
        doc: |
          Star ID Step
          Conversion coefficients: C0=1.0
          Enumeration values: 0/IDLE 1/INITIALIZE 2/WAITING_FOR_IMAGE1
          3/WAITING_FOR_IMAGE2 4/CALCULATE_RATE 5/MAKE_UNIT_VECTORS
          6/AWAITING_TRISTAR 7/OK_FOUND_4 8/OK_FOUND_3 9/TIME_OUT 10/SPARE 11/NO_MATCH
      - id: att_status
        type: u1
        doc: |
          Tracker Attitude Status
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OK 1/PENDING 2/BAD 3/TOO_FEW_STARS
          4/QUEST_FAILED 5/RESIDUALS_TOO_HIGH 6/TOO_CLOSE_TO_EDGE
          7/PIX_AMP_TOO_LOW 8/PIX_AMP_TOO_HIGH 9/BACKGND_TOO_HIGH
          10/TRACK_FAILURE 11/PIX_SUM_TOO_LOW 12/UNUSED 13/TOO_DIM_FOR_STARID
          14/TOO_MANY_GROUPS 15/TOO_FEW_GROUPS 16/CHANNEL_DISABLED
          17/TRACK_BLK_OVERLAP 18/OK_FOR_STARID 19/TOO_CLOSE_TO_OTHER
          20/TOO_MANY_PIXELS 21/TOO_MANY_COLUMNS 22/TOO_MANY_ROWS 23/OPEN
          24/CLOSED 25/RATE_TOO_HIGH
      - id: num_attitude_stars
        type: u1
        doc: |
          Num Stars Used in Att
          Conversion coefficients: C0=1.0
          Eng. units: none
  soh_att_ctrl_t:
    seq:
      - id: eigen_error
        type: u4
        doc: |
          Eigen Error, reported in the spacecraft body frame
          Conversion coefficients: C0=1.5151516e-09
          Eng. units: rad
      - id: sun_point_angle_error
        type: u2
        doc: |
          Sun Point Angle Error, angle between estimated sun and command sun vector
          Conversion coefficients: C0=0.0029999998
          Eng. units: deg
      - id: health1_pack_spare1
        type: b2
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sun_source_failover
        type: b1
        doc: |
          Flag if sun source used is not valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OK 1/FAIL
      - id: sun_avoid_flag
        type: b1
        doc: |
          Flag if sun avoid control override is active
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: padding_0
        type: b1
      - id: on_sun_flag
        type: b1
        doc: |
          Flag if sun point state equals ON_SUN
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: momentum_too_high
        type: b1
        doc: |
          Momentum too high for attitude control
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: att_ctrl_active
        type: b1
        doc: |
          Attitude Control Active
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
  soh_momentum_t:
    seq:
      - id: total_momentum_mag
        type: u2
        doc: |
          System Momentum Magnitude
          Conversion coefficients: C0=0.00050000002
          Eng. units: Nms
      - id: duty_cycle1
        type: s1
        doc: |
          Torque Rod Duty Cycle
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: duty_cycle2
        type: s1
        doc: |
          Torque Rod Duty Cycle
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: duty_cycle3
        type: s1
        doc: |
          Torque Rod Duty Cycle
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: torque_rod_mode1
        type: u1
        doc: |
          Torque Rod Ctrl Mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON_POS 2/ON_NEG 3/AUTO 4/MEASURED 5/MODELED 6/DELAYED_AUTO 7/NO_FIELD_VALID 8/UNUSED1 9/UNUSED2 10/BIDIRECTIONAL 11/POS_ONLY 12/NEG_ONLY
      - id: torque_rod_mode2
        type: u1
        doc: |
          Torque Rod Ctrl Mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON_POS 2/ON_NEG 3/AUTO 4/MEASURED 5/MODELED 6/DELAYED_AUTO 7/NO_FIELD_VALID 8/UNUSED1 9/UNUSED2 10/BIDIRECTIONAL 11/POS_ONLY 12/NEG_ONLY
      - id: torque_rod_mode3
        type: u1
        doc: |
          Torque Rod Ctrl Mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON_POS 2/ON_NEG 3/AUTO 4/MEASURED 5/MODELED 6/DELAYED_AUTO 7/NO_FIELD_VALID 8/UNUSED1 9/UNUSED2 10/BIDIRECTIONAL 11/POS_ONLY 12/NEG_ONLY
      - id: torque_rod_firing_pack_spare
        type: b1
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: torque_rod_direction3
        type: b1
        doc: |
          Torque Rod 3 Direction
          Conversion coefficients: C0=1.0
          Enumeration values: 0/POS 1/NEG
      - id: torque_rod_direction2
        type: b1
        doc: |
          Torque Rod 2 Direction
          Conversion coefficients: C0=1.0
          Enumeration values: 0/POS 1/NEG
      - id: torque_rod_direction1
        type: b1
        doc: |
          Torque Rod 1 Direction
          Conversion coefficients: C0=1.0
          Enumeration values: 0/POS 1/NEG
      - id: padding_0
        type: b1
      - id: torque_rod_enable3
        type: b1
        doc: |
          Torque Rod 3 Enable
          Conversion coefficients: C0=1.0
          Enumeration values: 0/DS 1/EN
      - id: torque_rod_enable2
        type: b1
        doc: |
          Torque Rod 2 Enable
          Conversion coefficients: C0=1.0
          Enumeration values: 0/DS 1/EN
      - id: torque_rod_enable1
        type: b1
        doc: |
          Torque Rod 1 Enable
          Conversion coefficients: C0=1.0
          Enumeration values: 0/DS 1/EN
      - id: health1_pack_spare2
        type: b2
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: mag_source_failover
        type: b1
        doc: |
          Flag if preferred mag field source is invalid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OK 1/FAULT
      - id: tr_fault
        type: b1
        doc: |
          Flag if torque rod fault detected
          Conversion coefficients: C0=1.0
          Enumeration values: 0/FAULT 1/OK
      - id: health1_pack_spare1
        type: b1
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: momentum_vector_enabled
        type: b1
        doc: |
          Momentum vector usage enabled
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: momentum_vector_valid
        type: b1
        doc: |
          Momentum data valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: tr_drive_power_state
        type: b1
        doc: |
          TR drive power state
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON
  soh_css_t:
    seq:
      - id: sun_vector_body1
        type: s2
        doc: |
          Meas Sun Body Vector, reported in the spacecraft body frame
          Conversion coefficients: C0=9.9999997e-05
          Eng. units: none
      - id: sun_vector_body2
        type: s2
        doc: |
          Meas Sun Body Vector, reported in the spacecraft body frame
          Conversion coefficients: C0=9.9999997e-05
          Eng. units: none
      - id: sun_vector_body3
        type: s2
        doc: |
          Meas Sun Body Vector, reported in the spacecraft body frame
          Conversion coefficients: C0=9.9999997e-05
          Eng. units: none
      - id: sun_vector_status
        type: u1
        doc: |
          Meas Sun Body Vector Status
          Conversion coefficients: C0=1.0
          Enumeration values: 0/GOOD 1/COARSE 2/BAD
      - id: css_invalid_count
        type: u2
        doc: |
          CSS Invalid Measurement Count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: health1_pack_spare1
        type: b1
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sun_sensor_used
        type: b3
        doc: |
          Currently sun sensor used
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: css_test_mode
        type: b1
        doc: |
          CSS Test Mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: sun_vector_enabled
        type: b1
        doc: |
          Sun vector enabled
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: meas_sun_valid
        type: b1
        doc: |
          Measured sun valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: css_power_state
        type: b1
        doc: |
          CSS power state
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON
  soh_mag_t:
    seq:
      - id: mag_vector_body1
        type: s2
        doc: |
          Meas Mag Field, reported in the spacecraft body frame
          Conversion coefficients: C0=5e-09
          Eng. units: T
      - id: mag_vector_body2
        type: s2
        doc: |
          Meas Mag Field, reported in the spacecraft body frame
          Conversion coefficients: C0=5e-09
          Eng. units: T
      - id: mag_vector_body3
        type: s2
        doc: |
          Meas Mag Field, reported in the spacecraft body frame
          Conversion coefficients: C0=5e-09
          Eng. units: T
      - id: mag_invalid_count
        type: u2
        doc: |
          Cycles with invalid Measured Mag Data
          Conversion coefficients: C0=1.0
          Eng. units: counts
      - id: health1_pack_spare1
        type: b1
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: mag_sensor_used
        type: b3
        doc: |
          Flag if IMU received valid packets
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: mag_test_mode
        type: b1
        doc: |
          Magnetometer test mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: mag_vector_enabled
        type: b1
        doc: |
          Magnetometer vector usage enabled
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: mag_vector_valid
        type: b1
        doc: |
          Magnetometer data valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: mag_power_state
        type: b1
        doc: |
          MAG power state
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON
  soh_imu_t:
    seq:
      - id: imu_avg_vector_body1
        type: s2
        doc: |
          IMU Body Rate, reported in the spacecraft body frame
          Conversion coefficients: C0=9.9999997e-06
          Eng. units: rad/sec
      - id: imu_avg_vector_body2
        type: s2
        doc: |
          IMU Body Rate, reported in the spacecraft body frame
          Conversion coefficients: C0=9.9999997e-06
          Eng. units: rad/sec
      - id: imu_avg_vector_body3
        type: s2
        doc: |
          IMU Body Rate, reported in the spacecraft body frame
          Conversion coefficients: C0=9.9999997e-06
          Eng. units: rad/sec
      - id: imu_invalid_count
        type: u2
        doc: |
          IMU Invalid Count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: health1_pack_spare1
        type: b3
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: imu_valid_packets
        type: b1
        doc: |
          Flag if IMU received valid packets
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: imu_test_mode
        type: b1
        doc: |
          IMU test mode
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: imu_vector_enabled
        type: b1
        doc: |
          IMU vector usage enabled
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: imu_vector_valid
        type: b1
        doc: |
          IMU valid
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: imu_power_state
        type: b1
        doc: |
          IMU power state
          Conversion coefficients: C0=1.0
          Enumeration values: 0/OFF 1/ON
  soh_clock_sync_t:
    seq:
      - id: hr_run_count
        type: u4
        doc: |
          High Rate Run Count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: hr_exec_time_ms1
        type: u1
        doc: |
          High Rate Duration
          Conversion coefficients: C0=1.0
          Eng. units: msec
      - id: hr_exec_time_ms2
        type: u1
        doc: |
          High Rate Duration
          Conversion coefficients: C0=1.0
          Eng. units: msec
      - id: hr_exec_time_ms3
        type: u1
        doc: |
          High Rate Duration
          Conversion coefficients: C0=1.0
          Eng. units: msec
      - id: hr_exec_time_ms4
        type: u1
        doc: |
          High Rate Duration
          Conversion coefficients: C0=1.0
          Eng. units: msec
      - id: hr_exec_time_ms5
        type: u1
        doc: |
          High Rate Duration
          Conversion coefficients: C0=1.0
          Eng. units: msec
  soh_analogs_t:
    seq:
      - id: battery_voltage
        type: u2
        doc: |
          Battery Voltage
          Conversion coefficients: C0=0.0020000001
          Eng. units: V
  soh_gps_t:
    seq:
      - id: gps_cycles_since_crc_data
        type: u4
        doc: |
          Number of 5 Hz cycles since bus received any correctly formatted messages from the GPS
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: gps_lock_count
        type: u2
        doc: |
          Number of GPS Locks Obtained (Number of times GpsValid telemetry has transitioned from 'FALSE' to 'TRUE')
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: msg_used_satellites
        type: u1
        doc: |
          MSG Used Sats. Directly reported from the NovAtel BESTXYZ log, field '#solnSVs'
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: gps_pos_lock
        type: b1
        doc: |
          GPS has position lock
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: gps_time_lock
        type: b1
        doc: |
          GPS has time lock
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: msg_data_valid
        type: b1
        doc: |
          MSG Decode Successful. Flag that indicates if a new BESTXYZ packet was successfully received
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: gps_new_data_received
        type: b1
        doc: |
          New GPS Data Received. Flag if any valid GPS message was received this past cycle
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: padding_0
        type: b1
      - id: gps_enable
        type: b1
        doc: |
          GPS Enabled. Flag that determines if GPS is enabled in software
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: gps_valid
        type: b1
        doc: |
          GPS Valid. Flag to determine if the GPS has established a lock
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: health1_pack_spare1
        type: b1
        doc: |
          spare
          Conversion coefficients: C0=1.0
          Eng. units: none
  soh_event_check_t:
    seq:
      - id: latched_resp_fire_pack_bit8
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 8
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit7
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 7
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit6
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 6
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit5
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 5
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit4
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 4
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit3
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 3
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit2
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 2
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit1
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 1
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit16
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 16
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit15
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 15
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit14
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 14
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit13
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 13
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit12
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 12
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit11
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 11
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit10
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 10
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
      - id: latched_resp_fire_pack_bit9
        type: b1
        doc: |
          Latched Response Fired Bitpack bit 9
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
  soh_radio_t:
    seq:
      - id: sd_minute_cur
        type: u4
        doc: |
          SD Card Current Minute Number
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sd_percent_used_total
        type: u1
        doc: |
          SD Card Used Space Percentage Total
          Conversion coefficients: C0=1.0
          Eng. units: percent
      - id: sd_ok
        type: u1
        doc: |
          SD Card Healthy?
          Conversion coefficients: C0=1.0
          Enumeration values: 1/YES 0/NO
      - id: sd_fault_count
        type: u1
        doc: |
          SD Card Count Of Re-openings
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sq_channel
        type: s1
        doc: |
          SpaceQuest Current Channel Selection
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sq_trap_count
        type: u1
        doc: |
          SpaceQuest Trap-Error Cycle Count
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sq_temp
        type: s1
        doc: |
          SpaceQuest Temperature
          Conversion coefficients: C0=1.0
          Eng. units: C
      - id: sdr_tx_tx_frames
        type: u4
        doc: |
          BCT-SDR-TX tx frame counter
          Conversion coefficients: C0=1.0
          Eng. units: none
      - id: sdr_tx_tx_power
        type: s1
        doc: |
          BCT-SDR-TX tx power
          Conversion coefficients: C0=1.0
          Eng. units: dBm
      - id: sdr_tx_temp
        type: s1
        doc: |
          BCT-SDR-TX temperature
          Conversion coefficients: C0=1.0
          Eng. units: C
      - id: sdr_tx_comm_error
        type: u1
        doc: |
          BCT-SDR-TX temperature
          Conversion coefficients: C0=1.0
          Enumeration values: 0/NO 1/YES
  soh_tracker_ctrl_t:
    seq:
      - id: tracker_att_valid
        type: u1
        doc: |
          Tracker Valid Flag
          Conversion coefficients: C0=1.0
          Enumeration values: 1/YES 0/NO
  cirbe_bct_soh_t:
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
      - id: soh_gps
        type: soh_gps_t
      - id: soh_event_check
        type: soh_event_check_t
      - id: soh_radio
        type: soh_radio_t
      - id: soh_tracker_ctrl
        type: soh_tracker_ctrl_t

