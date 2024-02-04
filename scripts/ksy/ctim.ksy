---
meta:
  id: ctim
  title: ctim ksy parser for sw_stat
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign
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
  :field version: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.version
  :field type: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.type
  :field sec_hdr_flag: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sec_hdr_flag
  :field pkt_apid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pkt_apid
  :field seq_flgs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.seq_flgs
  :field seq_ctr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.seq_ctr
  :field pkt_len: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pkt_len
  :field shcoarse: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.shcoarse
  :field shfine: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.shfine
  :field sw_major_version: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_major_version
  :field sw_minor_version: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_minor_version
  :field sw_patch_version: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_patch_version
  :field sw_image_id: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_image_id
  :field sw_cmd_recv_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_recv_count
  :field sw_cmd_fmt_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_fmt_count
  :field sw_cmd_rjct_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_rjct_count
  :field sw_cmd_succ_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_succ_count
  :field sw_cmd_succ_op: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_succ_op
  :field sw_cmd_rjct_op: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_rjct_op
  :field sw_cmd_fail_code: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_fail_code
  :field sw_cmd_xsum_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_xsum_state
  :field reusable_spare_1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_1
  :field reusable_spare_2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_2
  :field reusable_spare_3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_3
  :field reusable_spare_4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_4
  :field reusable_spare_5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_5
  :field sw_cmd_arm_state_uhf: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_arm_state_uhf
  :field sw_cmd_arm_state_seq: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_arm_state_seq
  :field sw_cmd_arm_state_ext: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_cmd_arm_state_ext
  :field reusable_spare_6: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_6
  :field sw_eps_pwr_state_deploy_pwr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_eps_pwr_state_deploy_pwr
  :field sw_eps_pwr_state_deploy: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_eps_pwr_state_deploy
  :field sw_eps_pwr_state_iic: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_eps_pwr_state_iic
  :field sw_eps_pwr_state_inst: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_eps_pwr_state_inst
  :field sw_eps_pwr_state_sband: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_eps_pwr_state_sband
  :field sw_eps_pwr_state_uhf: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_eps_pwr_state_uhf
  :field sw_eps_pwr_state_adcs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_eps_pwr_state_adcs
  :field reusable_spare_7: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_7
  :field reusable_spare_8: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_8
  :field reusable_spare_9: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_9
  :field reusable_spare_10: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_10
  :field reusable_spare_11: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_11
  :field reusable_spare_12: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.reusable_spare_12
  :field sw_bat_alive_state_battery1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_bat_alive_state_battery1
  :field sw_bat_alive_state_battery0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_bat_alive_state_battery0
  :field sw_mode_clt_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_mode_clt_count
  :field sw_mode_system_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_mode_system_mode
  :field sw_sband_sync_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_sband_sync_state
  :field sw_time_since_rx: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_time_since_rx
  :field sw_sband_timeout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_sband_timeout
  :field spare_2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.spare_2
  :field sw_payload_pwr_cycle_req: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_payload_pwr_cycle_req
  :field sw_payload_pwr_off_req: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_payload_pwr_off_req
  :field sw_payload_stat_msg_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_payload_stat_msg_state
  :field sw_payload_time_msg_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_payload_time_msg_state
  :field sw_payload_alive_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_payload_alive_state
  :field sw_uhf_alive: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_uhf_alive
  :field sw_uhf_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_uhf_temp
  :field sw_adcs_alive: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_alive
  :field sw_inst_cmd_succ_count_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_inst_cmd_succ_count_ctim
  :field sw_inst_cmd_rjct_count_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_inst_cmd_rjct_count_ctim
  :field sw_esr_obs_id_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_esr_obs_id_ctim
  :field sw_thrm_a1_a_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_thrm_a1_a_ctim
  :field sw_thrm_a1_b_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_thrm_a1_b_ctim
  :field sw_fss_q1_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_fss_q1_ctim
  :field sw_fss_q2_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_fss_q2_ctim
  :field sw_fss_q3_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_fss_q3_ctim
  :field sw_fss_q4_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_fss_q4_ctim
  :field sw_volt_p12v_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_volt_p12v_ctim
  :field sw_thrm_pwm_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_thrm_pwm_ctim
  :field sw_inst_fp_resp_count_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_inst_fp_resp_count_ctim
  :field sw_shutter_state_b4_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_b4_ctim
  :field sw_shutter_state_b3_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_b3_ctim
  :field sw_shutter_state_b2_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_b2_ctim
  :field sw_shutter_state_b1_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_b1_ctim
  :field sw_shutter_state_a4_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_a4_ctim
  :field sw_shutter_state_a3_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_a3_ctim
  :field sw_shutter_state_a2_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_a2_ctim
  :field sw_shutter_state_a1_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_shutter_state_a1_ctim
  :field sw_inst_cmd_fail_code_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_inst_cmd_fail_code_ctim
  :field sw_esr_filtered_a12_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_esr_filtered_a12_ctim
  :field sw_esr_filtered_b12_ctim: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_esr_filtered_b12_ctim
  :field sw_seq_state_auto: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_state_auto
  :field sw_seq_state_op1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_state_op1
  :field sw_seq_state_op2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_state_op2
  :field sw_seq_state_op3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_state_op3
  :field sw_seq_stop_code_auto: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_stop_code_auto
  :field sw_seq_stop_code_op1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_stop_code_op1
  :field sw_seq_stop_code_op2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_stop_code_op2
  :field sw_seq_stop_code_op3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_stop_code_op3
  :field sw_seq_exec_buf_auto: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_exec_buf_auto
  :field sw_seq_exec_buf_op1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_exec_buf_op1
  :field sw_seq_exec_buf_op2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_exec_buf_op2
  :field sw_seq_exec_buf_op3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_seq_exec_buf_op3
  :field sw_store_partition_write_misc: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_write_misc
  :field sw_store_partition_read_misc: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_read_misc
  :field sw_store_partition_write_adcs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_write_adcs
  :field sw_store_partition_read_adcs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_read_adcs
  :field sw_store_partition_write_beacon: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_write_beacon
  :field sw_store_partition_read_beacon: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_read_beacon
  :field sw_store_partition_write_log: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_write_log
  :field sw_store_partition_read_log: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_read_log
  :field sw_store_partition_write_payload: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_write_payload
  :field sw_store_partition_read_payload: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_store_partition_read_payload
  :field sw_fp_resp_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_fp_resp_count
  :field sw_ana_bus_v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_bus_v
  :field sw_ana_3p3_v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_3p3_v
  :field sw_ana_3p3_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_3p3_i
  :field sw_ana_1p8_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_1p8_i
  :field sw_ana_1p0_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_1p0_i
  :field sw_ana_cdh_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_cdh_temp
  :field sw_ana_sa1_v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_sa1_v
  :field sw_ana_sa1_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_sa1_i
  :field sw_ana_sa2_v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_sa2_v
  :field sw_ana_sa2_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_sa2_i
  :field sw_ana_bat1_v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_bat1_v
  :field sw_ana_bat2_v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_bat2_v
  :field sw_ana_eps_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_eps_temp
  :field sw_ana_eps_3p3_ref: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_eps_3p3_ref
  :field sw_ana_eps_bus_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_eps_bus_i
  :field sw_ana_xact_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_xact_i
  :field sw_ana_uhf_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_uhf_i
  :field sw_ana_sband_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_sband_i
  :field sw_ana_inst_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_inst_i
  :field sw_ana_hk_3p3_ref: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_hk_3p3_ref
  :field sw_ana_ifb_i: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_ifb_i
  :field sw_ana_ifb_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_ana_ifb_temp
  :field sw_adcs_eclipse: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_eclipse
  :field sw_adcs_att_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_att_valid
  :field sw_adcs_ref_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_ref_valid
  :field sw_adcs_time_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_time_valid
  :field sw_adcs_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_mode
  :field sw_adcs_recommend_sun_point: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_recommend_sun_point
  :field sw_adcs_sun_point_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_sun_point_state
  :field sw_adcs_analogs_voltage_2p5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_voltage_2p5
  :field sw_adcs_analogs_voltage_1p8: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_voltage_1p8
  :field sw_adcs_analogs_voltage_1p0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_voltage_1p0
  :field sw_adcs_analogs_det_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_det_temp
  :field sw_adcs_analogs_motor1_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_motor1_temp
  :field sw_adcs_analogs_motor2_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_motor2_temp
  :field sw_adcs_analogs_motor3_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_motor3_temp
  :field spare_16: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.spare_16
  :field sw_adcs_analogs_digital_bus_v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_analogs_digital_bus_v
  :field sw_adcs_cmd_acpt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_cmd_acpt
  :field sw_adcs_cmd_fail: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_cmd_fail
  :field sw_adcs_time: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_time
  :field sw_adcs_sun_vec1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_sun_vec1
  :field sw_adcs_sun_vec2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_sun_vec2
  :field sw_adcs_sun_vec3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_sun_vec3
  :field sw_adcs_wheel_sp1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_wheel_sp1
  :field sw_adcs_wheel_sp2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_wheel_sp2
  :field sw_adcs_wheel_sp3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_wheel_sp3
  :field sw_adcs_body_rt1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_body_rt1
  :field sw_adcs_body_rt2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_body_rt2
  :field sw_adcs_body_rt3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_body_rt3
  :field sw_adcs_body_quat1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_body_quat1
  :field sw_adcs_body_quat2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_body_quat2
  :field sw_adcs_body_quat3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_body_quat3
  :field sw_adcs_body_quat4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_adcs_body_quat4
  :field sw_spare_0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_spare_0
  :field sw_spare_1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_spare_1
  :field sw_spare_2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_spare_2
  :field sw_spare_3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sw_spare_3

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
        type: callsign
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
            - '"CTIM\0\0"'
            - '"LASP\0\0"'
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
      - id: version
        type: b3
      - id: type
        type: b1
      - id: sec_hdr_flag
        type: b1
      - id: pkt_apid
        type: b11
      - id: seq_flgs
        type: b2
      - id: seq_ctr
        type: b14
      - id: pkt_len
        type: u2
  data_section_t:
    seq:
      - id: secondary_header
        type: secondary_header_t
        size: 6
        if: _parent.packet_primary_header.sec_hdr_flag
      - id: user_data_field
        type:
          switch-on: _parent.packet_primary_header.pkt_apid
          cases:
            0x01: ctim_sw_stat_t
  secondary_header_t:
    doc: |
      The Secondary Header is a feature of the Space Packet which allows
      additional types of information that may be useful to the user
      application (e.g., a time code) to be included.
      See: 4.1.3.2 in CCSDS 133.0-B-1
    seq:
      - id: shcoarse
        type: u4
      - id: shfine
        type: u2
  ctim_sw_stat_t:
    seq:
      - id: sw_major_version
        type: u1
        doc: |
          SW Major Version
      - id: sw_minor_version
        type: u1
        doc: |
          SW Minor Version
      - id: sw_patch_version
        type: u1
        doc: |
          SW Patch Version
      - id: sw_image_id
        type: u1
        doc: |
          SW Image ID
      - id: sw_cmd_recv_count
        type: u2
        doc: |
          Number of received commands
      - id: sw_cmd_fmt_count
        type: u2
        doc: |
          Number of bad format commands
      - id: sw_cmd_rjct_count
        type: u2
        doc: |
          Number of received commands
      - id: sw_cmd_succ_count
        type: u2
        doc: |
          Number of successful commands
      - id: sw_cmd_succ_op
        type: u2
        doc: |
          Last successful command opcode
          Enumeration values: 0/NOOP 1/ARM 2/CMD_RST_STATS
          3/CMD_XSUM 4/CMD_ECHO_STATE 5/CMD_VERSION 48/LOG_ROUTE
          49/LOG_STATE 50/LOG_RST_STATS 52/LOG_RESET_READ 53/LOG_ISSUE
          54/LOG_DUMP_INFO 55/LOG_SET_PUBLISH 80/MEM_DUMP 81/MEM_LOAD
          82/MEM_ERASE 83/MEM_XSUM 84/MEM_ABORT 85/MEM_RESET
          86/MEM_LOAD_DWORD 87/MEM_LOAD_WORD 88/MEM_LOAD_BYTE
          96/PKT_ISSUE 97/PKT_SET_RATE 98/PKT_SET_STREAM
          99/PKT_SET_PRIORITY 100/PKT_QUERY_APID 101/PKT_SET_DELAY
          102/PKT_COMMIT_TABLE 112/TBL_DUMP 113/TBL_LOAD
          114/TBL_LOAD_START 115/TBL_COMMIT 116/TBL_ABORT
          117/TBL_VERIFY 118/TBL_SAVE 33/DES_RST_STATS 34/DES_ADD_TASK
          35/DES_SUB_TASK 36/DES_ADD_BACK 37/DES_SUB_BACK
          38/DES_SET_TIME 39/DES_DUMP_SCHED 40/DES_SET_TASK_NUM
          64/SEQ_LOAD 65/SEQ_INIT 66/SEQ_STATE 67/SEQ_VERIFY
          68/SEQ_STOP 69/SEQ_FIND 70/SEQ_INFO 71/SEQ_DUMP
          72/SEQ_RST_STATS 73/SEQ_LD_START 74/SEQ_LD_COMMIT
          75/SEQ_LD_ABORT 76/SEQ_LIBRARY 16/FP_RST_STATS
          17/FP_RST_RESULTS 18/FP_VALIDATE 19/FP_SET_STATE
          20/FP_SET_WP_STATE 22/FP_DUMP_RESULTS 23/FP_SET_WP
          24/FP_SET_WP_THRESH 25/FP_SET_WP_RESP 26/FP_SET_TEST
          128/CMD_OPCODE_UHF_PASS 129/CMD_OPCODE_UHF_INIT
          130/CMD_OPCODE_UHF_RESP_STATE 144/ADCS_PASS 145/ADCS_RESET
          146/ADCS_READ 147/ADCS_COARSE_POINT 148/ADCS_FINE_POINT
          149/ADCS_RAM_POINT 150/ADCS_FINE_UPDATE 151/ADCS_RAM_UPDATE
          152/ADCS_ECLIPSE_CHECK 153/ADCS_DUMP_IMAGE
          154/ADCS_DUMP_STATE 155/ADCS_INIT_EPHEMERIS
          156/ADCS_SET_TIME 224/CMD_OPCODE_CFI_PWR_ON
          225/CMD_OPCODE_CFI_PWR_OFF 226/CMD_OPCODE_CFI_SELECT
          227/CMD_OPCODE_CFI_SELECT_TRIO 240/STORE_WRITE_STATE
          241/STORE_READ 242/STORE_HALT 243/STORE_PLAYBACK
          245/STORE_SELECT 246/STORE_SET_PARTITION
          247/STORE_RESET_PARTITION 248/STORE_FLUSH
          249/STORE_MOVE_READ 208/PAYLOAD_MSG_STATE
          209/PAYLOAD_HK_RESET 210/PAYLOAD_FLAGS_RESET
          203/EPS_SET_BAT_TIME 204/EPS_GET_BAT_TIME 205/EPS_BAT_PASS
          206/EPS_BAT_TLM_STATE 207/EPS_BAT_HEATER 192/EPS_PWR_ON
          193/EPS_PWR_OFF 194/EPS_PWR_CYCLE 195/EPS_DEPLOY
          196/EPS_ANT_BURN 197/EPS_ANT_HALT_BURN
          198/EPS_ANT_SET_BACKUP 199/EPS_ANT_RESET
          200/EPS_DEPLOY_ABORT 201/EPS_ANT_TLM 202/EPS_RELAY
          160/MRAM_CLEAR 161/MRAM_ERR_INJ 162/MRAM_PWR
          163/MRAM_PWR_TOGGLE 164/FLASH_SEL_PAYLOAD 239/CLT_RESET
          238/CLT_THRESHOLD 237/WATCHDOG 236/PHOENIX 235/SAFE
          234/NOMINAL 169/NAND_BB_INIT 170/NAND_REMAP
          171/NAND_BAD_BLOCK 172/NAND_FORMAT 173/NAND_FORMAT_HALT
          176/SBAND_SYNC_ON 177/SBAND_SYNC_OFF 178/SBAND_CLOCK
      - id: sw_cmd_rjct_op
        type: u2
        doc: |
          Last rejected command opcode
          Enumeration values: 0/NOOP 1/ARM 2/CMD_RST_STATS
          3/CMD_XSUM 4/CMD_ECHO_STATE 5/CMD_VERSION 48/LOG_ROUTE
          49/LOG_STATE 50/LOG_RST_STATS 52/LOG_RESET_READ 53/LOG_ISSUE
          54/LOG_DUMP_INFO 55/LOG_SET_PUBLISH 80/MEM_DUMP 81/MEM_LOAD
          82/MEM_ERASE 83/MEM_XSUM 84/MEM_ABORT 85/MEM_RESET
          86/MEM_LOAD_DWORD 87/MEM_LOAD_WORD 88/MEM_LOAD_BYTE
          96/PKT_ISSUE 97/PKT_SET_RATE 98/PKT_SET_STREAM
          99/PKT_SET_PRIORITY 100/PKT_QUERY_APID 101/PKT_SET_DELAY
          102/PKT_COMMIT_TABLE 112/TBL_DUMP 113/TBL_LOAD
          114/TBL_LOAD_START 115/TBL_COMMIT 116/TBL_ABORT
          117/TBL_VERIFY 118/TBL_SAVE 33/DES_RST_STATS 34/DES_ADD_TASK
          35/DES_SUB_TASK 36/DES_ADD_BACK 37/DES_SUB_BACK
          38/DES_SET_TIME 39/DES_DUMP_SCHED 40/DES_SET_TASK_NUM
          64/SEQ_LOAD 65/SEQ_INIT 66/SEQ_STATE 67/SEQ_VERIFY
          68/SEQ_STOP 69/SEQ_FIND 70/SEQ_INFO 71/SEQ_DUMP
          72/SEQ_RST_STATS 73/SEQ_LD_START 74/SEQ_LD_COMMIT
          75/SEQ_LD_ABORT 76/SEQ_LIBRARY 16/FP_RST_STATS
          17/FP_RST_RESULTS 18/FP_VALIDATE 19/FP_SET_STATE
          20/FP_SET_WP_STATE 22/FP_DUMP_RESULTS 23/FP_SET_WP
          24/FP_SET_WP_THRESH 25/FP_SET_WP_RESP 26/FP_SET_TEST
          128/CMD_OPCODE_UHF_PASS 129/CMD_OPCODE_UHF_INIT
          130/CMD_OPCODE_UHF_RESP_STATE 144/ADCS_PASS 145/ADCS_RESET
          146/ADCS_READ 147/ADCS_COARSE_POINT 148/ADCS_FINE_POINT
          149/ADCS_RAM_POINT 150/ADCS_FINE_UPDATE 151/ADCS_RAM_UPDATE
          152/ADCS_ECLIPSE_CHECK 153/ADCS_DUMP_IMAGE
          154/ADCS_DUMP_STATE 155/ADCS_INIT_EPHEMERIS
          156/ADCS_SET_TIME 224/CMD_OPCODE_CFI_PWR_ON
          225/CMD_OPCODE_CFI_PWR_OFF 226/CMD_OPCODE_CFI_SELECT
          227/CMD_OPCODE_CFI_SELECT_TRIO 240/STORE_WRITE_STATE
          241/STORE_READ 242/STORE_HALT 243/STORE_PLAYBACK
          245/STORE_SELECT 246/STORE_SET_PARTITION
          247/STORE_RESET_PARTITION 248/STORE_FLUSH
          249/STORE_MOVE_READ 208/PAYLOAD_MSG_STATE
          209/PAYLOAD_HK_RESET 210/PAYLOAD_FLAGS_RESET
          203/EPS_SET_BAT_TIME 204/EPS_GET_BAT_TIME 205/EPS_BAT_PASS
          206/EPS_BAT_TLM_STATE 207/EPS_BAT_HEATER 192/EPS_PWR_ON
          193/EPS_PWR_OFF 194/EPS_PWR_CYCLE 195/EPS_DEPLOY
          196/EPS_ANT_BURN 197/EPS_ANT_HALT_BURN
          198/EPS_ANT_SET_BACKUP 199/EPS_ANT_RESET
          200/EPS_DEPLOY_ABORT 201/EPS_ANT_TLM 202/EPS_RELAY
          160/MRAM_CLEAR 161/MRAM_ERR_INJ 162/MRAM_PWR
          163/MRAM_PWR_TOGGLE 164/FLASH_SEL_PAYLOAD 239/CLT_RESET
          238/CLT_THRESHOLD 237/WATCHDOG 236/PHOENIX 235/SAFE
          234/NOMINAL 169/NAND_BB_INIT 170/NAND_REMAP
          171/NAND_BAD_BLOCK 172/NAND_FORMAT 173/NAND_FORMAT_HALT
          176/SBAND_SYNC_ON 177/SBAND_SYNC_OFF 178/SBAND_CLOCK
      - id: sw_cmd_fail_code
        type: u1
        doc: |
          Command failure code
          Enumeration values: 0/SUCCESS 1/MODE 2/ARM 3/SOURCE 4/OPCODE 5/METHOD 6/LENGTH 7/RANGE 8/CHECKSUM 9/PKT_TYPE
      - id: sw_cmd_xsum_state
        type: u1
        doc: |
          Checksum checking state
          Enumeration values: 0/DIS 1/ENA
      - id: reusable_spare_1
        type: b1
      - id: reusable_spare_2
        type: b1
      - id: reusable_spare_3
        type: b1
      - id: reusable_spare_4
        type: b1
      - id: reusable_spare_5
        type: b1
      - id: sw_cmd_arm_state_uhf
        type: b1
        doc: |
          Command arm state uhf
          Enumeration values: 0/OFF 1/ARMED
      - id: sw_cmd_arm_state_seq
        type: b1
        doc: |
          Command arm state seq
          Enumeration values: 0/OFF 1/ARMED
      - id: sw_cmd_arm_state_ext
        type: b1
        doc: |
          Command arm state ext
          Enumeration values: 0/OFF 1/ARMED
      - id: reusable_spare_6
        type: b1
      - id: sw_eps_pwr_state_deploy_pwr
        type: b1
        doc: |
          Power States deploy_pwr
          Enumeration values: 0/OFF 1/ON
      - id: sw_eps_pwr_state_deploy
        type: b1
        doc: |
          Power States deploy
          Enumeration values: 0/OFF 1/ON
      - id: sw_eps_pwr_state_iic
        type: b1
        doc: |
          Power States iic
          Enumeration values: 0/OFF 1/ON
      - id: sw_eps_pwr_state_inst
        type: b1
        doc: |
          Power States inst
          Enumeration values: 0/OFF 1/ON
      - id: sw_eps_pwr_state_sband
        type: b1
        doc: |
          Power States sband
          Enumeration values: 0/OFF 1/ON
      - id: sw_eps_pwr_state_uhf
        type: b1
        doc: |
          Power States uhf
          Enumeration values: 0/OFF 1/ON
      - id: sw_eps_pwr_state_adcs
        type: b1
        doc: |
          Power States adcs
          Enumeration values: 0/OFF 1/ON
      - id: reusable_spare_7
        type: b1
      - id: reusable_spare_8
        type: b1
      - id: reusable_spare_9
        type: b1
      - id: reusable_spare_10
        type: b1
      - id: reusable_spare_11
        type: b1
      - id: reusable_spare_12
        type: b1
      - id: sw_bat_alive_state_battery1
        type: b1
        doc: |
          Battery State battery1
          Enumeration values: 0/DEAD 1/ALIVE
      - id: sw_bat_alive_state_battery0
        type: b1
        doc: |
          Battery State battery0
          Enumeration values: 0/DEAD 1/ALIVE
      - id: sw_mode_clt_count
        type: u1
        doc: |
          CLT Count
      - id: sw_mode_system_mode
        type: u1
        doc: |
          System mode
          Enumeration values: 0/PHOENIX 1/SAFE 2/NOMINAL
      - id: sw_sband_sync_state
        type: u1
        doc: |
          SBAND Sync State
          Enumeration values: 0/DIS 1/ENA
      - id: sw_time_since_rx
        type: u2
        doc: |
          Time since last packet received (minutes)
      - id: sw_sband_timeout
        type: u2
        doc: |
          SBAND Sync Timeout Count
      - id: spare_2
        type: b2
      - id: sw_payload_pwr_cycle_req
        type: b1
        doc: |
          Power Cycle Request State
          Enumeration values: 0/INACTIVE 1/ACTIVE
      - id: sw_payload_pwr_off_req
        type: b1
        doc: |
          Power Off Request State
          Enumeration values: 0/INACTIVE 1/ACTIVE
      - id: sw_payload_stat_msg_state
        type: b1
        doc: |
          Status Message State
          Enumeration values: 0/DIS 1/ENA
      - id: sw_payload_time_msg_state
        type: b1
        doc: |
          Time Message State
          Enumeration values: 0/DIS 1/ENA
      - id: sw_payload_alive_state
        type: b2
        doc: |
          Aliveness State
          Enumeration values: 0/OFF 1/DEAD 2/ALIVE
      - id: sw_uhf_alive
        type: u1
        doc: |
          Indicates good communication with UHF
      - id: sw_uhf_temp
        type: s1
        doc: |
          UHF Temperature
      - id: sw_adcs_alive
        type: u1
        doc: |
          Alive state of communication
          Enumeration values: 0/OFF 1/DEAD 2/ALIVE
      - id: sw_inst_cmd_succ_count_ctim
        type: u2
        doc: |
          CTIM Number of successful commands
      - id: sw_inst_cmd_rjct_count_ctim
        type: u1
        doc: |
          CTIM Number of rejected commands
      - id: sw_esr_obs_id_ctim
        type: u1
        doc: |
          CTIM Observation ID
      - id: sw_thrm_a1_a_ctim
        type: u2
        doc: |
          CTIM Aperture A1 Temperature
      - id: sw_thrm_a1_b_ctim
        type: u2
        doc: |
          CTIM Aperture B1 Temperature
      - id: sw_fss_q1_ctim
        type: u2
        doc: |
          CTIM FSS Q1
      - id: sw_fss_q2_ctim
        type: u2
        doc: |
          CTIM FSS Q2
      - id: sw_fss_q3_ctim
        type: u2
        doc: |
          CTIM FSS Q3
      - id: sw_fss_q4_ctim
        type: u2
        doc: |
          CTIM FSS Q4
      - id: sw_volt_p12v_ctim
        type: u2
        doc: |
          CTIM +12V Voltage Monitor
      - id: sw_thrm_pwm_ctim
        type: u2
        doc: |
          CTIM PWM Board Temperature
      - id: sw_inst_fp_resp_count_ctim
        type: u2
        doc: |
          CTIM FP Response Count
      - id: sw_shutter_state_b4_ctim
        type: b1
        doc: |
          CTIM Shutter State b4
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_shutter_state_b3_ctim
        type: b1
        doc: |
          CTIM Shutter State b3
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_shutter_state_b2_ctim
        type: b1
        doc: |
          CTIM Shutter State b2
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_shutter_state_b1_ctim
        type: b1
        doc: |
          CTIM Shutter State b1
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_shutter_state_a4_ctim
        type: b1
        doc: |
          CTIM Shutter State a4
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_shutter_state_a3_ctim
        type: b1
        doc: |
          CTIM Shutter State a3
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_shutter_state_a2_ctim
        type: b1
        doc: |
          CTIM Shutter State a2
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_shutter_state_a1_ctim
        type: b1
        doc: |
          CTIM Shutter State a1
          Enumeration values: 0/OPEN 1/CLOSE
      - id: sw_inst_cmd_fail_code_ctim
        type: u1
        doc: |
          CTIM Command failure code
          Enumeration values: 0/SUCCESS 1/MODE 2/ARM 3/SOURCE 4/OPCODE
          5/METHOD 6/LENGTH 7/RANGE 8/CHECKSUM 9/PKT_TYPE
      - id: sw_esr_filtered_a12_ctim
        type: f4
        doc: |
          CTIM Filtered ESR Values
      - id: sw_esr_filtered_b12_ctim
        type: f4
        doc: |
          CTIM Filtered ESR Values
      - id: sw_seq_state_auto
        type: u1
        doc: |
          State of the engines auto
          Enumeration values: 0/IDLE 1/ACTIVE 2/SUSPEND 3/PAUSE 4/STALE
      - id: sw_seq_state_op1
        type: u1
        doc: |
          State of the engines op1
          Enumeration values: 0/IDLE 1/ACTIVE 2/SUSPEND 3/PAUSE 4/STALE
      - id: sw_seq_state_op2
        type: u1
        doc: |
          State of the engines op2
          Enumeration values: 0/IDLE 1/ACTIVE 2/SUSPEND 3/PAUSE 4/STALE
      - id: sw_seq_state_op3
        type: u1
        doc: |
          State of the engines op3
          Enumeration values: 0/IDLE 1/ACTIVE 2/SUSPEND 3/PAUSE 4/STALE
      - id: sw_seq_stop_code_auto
        type: u1
        doc: |
          Reason for last termination auto
          Enumeration values: 0/NOMINAL 1/CMD 2/INIT 3/REJECT 4/STALE
          5/BAD_INT 6/INT_FAIL
      - id: sw_seq_stop_code_op1
        type: u1
        doc: |
          Reason for last termination op1
          Enumeration values: 0/NOMINAL 1/CMD 2/INIT 3/REJECT 4/STALE
          5/BAD_INT 6/INT_FAIL
      - id: sw_seq_stop_code_op2
        type: u1
        doc: |
          Reason for last termination op2
          Enumeration values: 0/NOMINAL 1/CMD 2/INIT 3/REJECT 4/STALE
          5/BAD_INT 6/INT_FAIL
      - id: sw_seq_stop_code_op3
        type: u1
        doc: |
          Reason for last termination op3
          Enumeration values: 0/NOMINAL 1/CMD 2/INIT 3/REJECT 4/STALE
          5/BAD_INT 6/INT_FAIL
      - id: sw_seq_exec_buf_auto
        type: u2
        doc: |
          Buffer ID of Top level sequence auto
          Enumeration values: 0/RAM_SMALL0 1/RAM_SMALL1
          2/RAM_SMALL2 3/RAM_SMALL3 4/RAM_SMALL4 5/RAM_SMALL5 6/RAM_SMALL6
          7/RAM_SMALL7 8/RAM_LARGE0 9/RAM_LARGE1 10/RAM_LARGE2
          11/RAM_LARGE3 12/NVM_SMALL0 13/NVM_SMALL1 14/NVM_SMALL2
          15/NVM_SMALL3 16/NVM_SMALL4 17/NVM_SMALL5 18/NVM_SMALL6
          19/NVM_SMALL7 20/NVM_SMALL8 21/NVM_SMALL9 22/NVM_SMALL10
          23/NVM_SMALL11 24/NVM_SMALL12 25/NVM_SMALL13 26/NVM_SMALL14
          27/NVM_SMALL15 28/NVM_SMALL16 29/NVM_SMALL17 30/NVM_SMALL18
          31/NVM_SMALL19 32/NVM_SMALL20 33/NVM_SMALL21 34/NVM_SMALL22
          35/NVM_SMALL23 36/NVM_SMALL24 37/NVM_SMALL25 38/NVM_SMALL26
          39/NVM_SMALL27 40/NVM_SMALL28 41/NVM_SMALL29 42/NVM_SMALL30
          43/NVM_SMALL31 44/NVM_SMALL32 45/NVM_SMALL33 46/NVM_SMALL34
          47/NVM_SMALL35 48/NVM_SMALL36 49/NVM_SMALL37 50/NVM_SMALL38
          51/NVM_SMALL39 52/NVM_SMALL40 53/NVM_SMALL41 54/NVM_SMALL42
          55/NVM_SMALL43 56/NVM_SMALL44 57/NVM_SMALL45 58/NVM_SMALL46
          59/NVM_SMALL47 60/NVM_SMALL48 61/NVM_SMALL49 62/NVM_SMALL50
          63/NVM_SMALL51 64/NVM_SMALL52 65/NVM_SMALL53 66/NVM_SMALL54
          67/NVM_SMALL55 68/NVM_SMALL56 69/NVM_SMALL57 70/NVM_SMALL58
          71/NVM_SMALL59 72/NVM_SMALL60 73/NVM_SMALL61 74/NVM_SMALL62
          75/NVM_SMALL63 76/NVM_SMALL64 77/NVM_SMALL65 78/NVM_SMALL66
          79/NVM_SMALL67 80/NVM_SMALL68 81/NVM_SMALL69 82/NVM_SMALL70
          83/NVM_SMALL71 84/NVM_SMALL72 85/NVM_SMALL73 86/NVM_SMALL74
          87/NVM_SMALL75 88/NVM_SMALL76 89/NVM_SMALL77 90/NVM_SMALL78
          91/NVM_SMALL79 92/NVM_SMALL80 93/NVM_SMALL81 94/NVM_SMALL82
          95/NVM_SMALL83 96/NVM_SMALL84 97/NVM_SMALL85 98/NVM_SMALL86
          99/NVM_SMALL87 100/NVM_SMALL88 101/NVM_SMALL89 102/NVM_SMALL90
          103/NVM_SMALL91 104/NVM_SMALL92 105/NVM_SMALL93 106/NVM_SMALL94
          107/NVM_SMALL95 108/NVM_SMALL96 109/NVM_SMALL97 110/NVM_SMALL98
          111/NVM_SMALL99 112/NVM_SMALL100 113/NVM_SMALL101
          114/NVM_SMALL102 115/NVM_SMALL103 116/NVM_SMALL104
          117/NVM_SMALL105 118/NVM_SMALL106 119/NVM_SMALL107
          120/NVM_SMALL108 121/NVM_SMALL109 122/NVM_SMALL110
          123/NVM_SMALL111 124/NVM_SMALL112 125/NVM_SMALL113
          126/NVM_SMALL114 127/NVM_SMALL115 128/NVM_SMALL116
          129/NVM_SMALL117 130/NVM_SMALL118 131/NVM_SMALL119
          132/NVM_SMALL120 133/NVM_SMALL121 134/NVM_SMALL122
          135/NVM_SMALL123 136/NVM_SMALL124 137/NVM_SMALL125
          138/NVM_SMALL126 139/NVM_SMALL127 140/HOLDING0
      - id: sw_seq_exec_buf_op1
        type: u2
        doc: |
          Buffer ID of Top level sequence op1
          Enumeration values: 0/RAM_SMALL0 1/RAM_SMALL1
          2/RAM_SMALL2 3/RAM_SMALL3 4/RAM_SMALL4 5/RAM_SMALL5 6/RAM_SMALL6
          7/RAM_SMALL7 8/RAM_LARGE0 9/RAM_LARGE1 10/RAM_LARGE2
          11/RAM_LARGE3 12/NVM_SMALL0 13/NVM_SMALL1 14/NVM_SMALL2
          15/NVM_SMALL3 16/NVM_SMALL4 17/NVM_SMALL5 18/NVM_SMALL6
          19/NVM_SMALL7 20/NVM_SMALL8 21/NVM_SMALL9 22/NVM_SMALL10
          23/NVM_SMALL11 24/NVM_SMALL12 25/NVM_SMALL13 26/NVM_SMALL14
          27/NVM_SMALL15 28/NVM_SMALL16 29/NVM_SMALL17 30/NVM_SMALL18
          31/NVM_SMALL19 32/NVM_SMALL20 33/NVM_SMALL21 34/NVM_SMALL22
          35/NVM_SMALL23 36/NVM_SMALL24 37/NVM_SMALL25 38/NVM_SMALL26
          39/NVM_SMALL27 40/NVM_SMALL28 41/NVM_SMALL29 42/NVM_SMALL30
          43/NVM_SMALL31 44/NVM_SMALL32 45/NVM_SMALL33 46/NVM_SMALL34
          47/NVM_SMALL35 48/NVM_SMALL36 49/NVM_SMALL37 50/NVM_SMALL38
          51/NVM_SMALL39 52/NVM_SMALL40 53/NVM_SMALL41 54/NVM_SMALL42
          55/NVM_SMALL43 56/NVM_SMALL44 57/NVM_SMALL45 58/NVM_SMALL46
          59/NVM_SMALL47 60/NVM_SMALL48 61/NVM_SMALL49 62/NVM_SMALL50
          63/NVM_SMALL51 64/NVM_SMALL52 65/NVM_SMALL53 66/NVM_SMALL54
          67/NVM_SMALL55 68/NVM_SMALL56 69/NVM_SMALL57 70/NVM_SMALL58
          71/NVM_SMALL59 72/NVM_SMALL60 73/NVM_SMALL61 74/NVM_SMALL62
          75/NVM_SMALL63 76/NVM_SMALL64 77/NVM_SMALL65 78/NVM_SMALL66
          79/NVM_SMALL67 80/NVM_SMALL68 81/NVM_SMALL69 82/NVM_SMALL70
          83/NVM_SMALL71 84/NVM_SMALL72 85/NVM_SMALL73 86/NVM_SMALL74
          87/NVM_SMALL75 88/NVM_SMALL76 89/NVM_SMALL77 90/NVM_SMALL78
          91/NVM_SMALL79 92/NVM_SMALL80 93/NVM_SMALL81 94/NVM_SMALL82
          95/NVM_SMALL83 96/NVM_SMALL84 97/NVM_SMALL85 98/NVM_SMALL86
          99/NVM_SMALL87 100/NVM_SMALL88 101/NVM_SMALL89 102/NVM_SMALL90
          103/NVM_SMALL91 104/NVM_SMALL92 105/NVM_SMALL93 106/NVM_SMALL94
          107/NVM_SMALL95 108/NVM_SMALL96 109/NVM_SMALL97 110/NVM_SMALL98
          111/NVM_SMALL99 112/NVM_SMALL100 113/NVM_SMALL101
          114/NVM_SMALL102 115/NVM_SMALL103 116/NVM_SMALL104
          117/NVM_SMALL105 118/NVM_SMALL106 119/NVM_SMALL107
          120/NVM_SMALL108 121/NVM_SMALL109 122/NVM_SMALL110
          123/NVM_SMALL111 124/NVM_SMALL112 125/NVM_SMALL113
          126/NVM_SMALL114 127/NVM_SMALL115 128/NVM_SMALL116
          129/NVM_SMALL117 130/NVM_SMALL118 131/NVM_SMALL119
          132/NVM_SMALL120 133/NVM_SMALL121 134/NVM_SMALL122
          135/NVM_SMALL123 136/NVM_SMALL124 137/NVM_SMALL125
          138/NVM_SMALL126 139/NVM_SMALL127 140/HOLDING0
      - id: sw_seq_exec_buf_op2
        type: u2
        doc: |
          Buffer ID of Top level sequence op2
          Enumeration values: 0/RAM_SMALL0 1/RAM_SMALL1
          2/RAM_SMALL2 3/RAM_SMALL3 4/RAM_SMALL4 5/RAM_SMALL5 6/RAM_SMALL6
          7/RAM_SMALL7 8/RAM_LARGE0 9/RAM_LARGE1 10/RAM_LARGE2
          11/RAM_LARGE3 12/NVM_SMALL0 13/NVM_SMALL1 14/NVM_SMALL2
          15/NVM_SMALL3 16/NVM_SMALL4 17/NVM_SMALL5 18/NVM_SMALL6
          19/NVM_SMALL7 20/NVM_SMALL8 21/NVM_SMALL9 22/NVM_SMALL10
          23/NVM_SMALL11 24/NVM_SMALL12 25/NVM_SMALL13 26/NVM_SMALL14
          27/NVM_SMALL15 28/NVM_SMALL16 29/NVM_SMALL17 30/NVM_SMALL18
          31/NVM_SMALL19 32/NVM_SMALL20 33/NVM_SMALL21 34/NVM_SMALL22
          35/NVM_SMALL23 36/NVM_SMALL24 37/NVM_SMALL25 38/NVM_SMALL26
          39/NVM_SMALL27 40/NVM_SMALL28 41/NVM_SMALL29 42/NVM_SMALL30
          43/NVM_SMALL31 44/NVM_SMALL32 45/NVM_SMALL33 46/NVM_SMALL34
          47/NVM_SMALL35 48/NVM_SMALL36 49/NVM_SMALL37 50/NVM_SMALL38
          51/NVM_SMALL39 52/NVM_SMALL40 53/NVM_SMALL41 54/NVM_SMALL42
          55/NVM_SMALL43 56/NVM_SMALL44 57/NVM_SMALL45 58/NVM_SMALL46
          59/NVM_SMALL47 60/NVM_SMALL48 61/NVM_SMALL49 62/NVM_SMALL50
          63/NVM_SMALL51 64/NVM_SMALL52 65/NVM_SMALL53 66/NVM_SMALL54
          67/NVM_SMALL55 68/NVM_SMALL56 69/NVM_SMALL57 70/NVM_SMALL58
          71/NVM_SMALL59 72/NVM_SMALL60 73/NVM_SMALL61 74/NVM_SMALL62
          75/NVM_SMALL63 76/NVM_SMALL64 77/NVM_SMALL65 78/NVM_SMALL66
          79/NVM_SMALL67 80/NVM_SMALL68 81/NVM_SMALL69 82/NVM_SMALL70
          83/NVM_SMALL71 84/NVM_SMALL72 85/NVM_SMALL73 86/NVM_SMALL74
          87/NVM_SMALL75 88/NVM_SMALL76 89/NVM_SMALL77 90/NVM_SMALL78
          91/NVM_SMALL79 92/NVM_SMALL80 93/NVM_SMALL81 94/NVM_SMALL82
          95/NVM_SMALL83 96/NVM_SMALL84 97/NVM_SMALL85 98/NVM_SMALL86
          99/NVM_SMALL87 100/NVM_SMALL88 101/NVM_SMALL89 102/NVM_SMALL90
          103/NVM_SMALL91 104/NVM_SMALL92 105/NVM_SMALL93 106/NVM_SMALL94
          107/NVM_SMALL95 108/NVM_SMALL96 109/NVM_SMALL97 110/NVM_SMALL98
          111/NVM_SMALL99 112/NVM_SMALL100 113/NVM_SMALL101
          114/NVM_SMALL102 115/NVM_SMALL103 116/NVM_SMALL104
          117/NVM_SMALL105 118/NVM_SMALL106 119/NVM_SMALL107
          120/NVM_SMALL108 121/NVM_SMALL109 122/NVM_SMALL110
          123/NVM_SMALL111 124/NVM_SMALL112 125/NVM_SMALL113
          126/NVM_SMALL114 127/NVM_SMALL115 128/NVM_SMALL116
          129/NVM_SMALL117 130/NVM_SMALL118 131/NVM_SMALL119
          132/NVM_SMALL120 133/NVM_SMALL121 134/NVM_SMALL122
          135/NVM_SMALL123 136/NVM_SMALL124 137/NVM_SMALL125
          138/NVM_SMALL126 139/NVM_SMALL127 140/HOLDING0
      - id: sw_seq_exec_buf_op3
        type: u2
        doc: |
          Buffer ID of Top level sequence op3
          Enumeration values: 0/RAM_SMALL0 1/RAM_SMALL1
          2/RAM_SMALL2 3/RAM_SMALL3 4/RAM_SMALL4 5/RAM_SMALL5 6/RAM_SMALL6
          7/RAM_SMALL7 8/RAM_LARGE0 9/RAM_LARGE1 10/RAM_LARGE2
          11/RAM_LARGE3 12/NVM_SMALL0 13/NVM_SMALL1 14/NVM_SMALL2
          15/NVM_SMALL3 16/NVM_SMALL4 17/NVM_SMALL5 18/NVM_SMALL6
          19/NVM_SMALL7 20/NVM_SMALL8 21/NVM_SMALL9 22/NVM_SMALL10
          23/NVM_SMALL11 24/NVM_SMALL12 25/NVM_SMALL13 26/NVM_SMALL14
          27/NVM_SMALL15 28/NVM_SMALL16 29/NVM_SMALL17 30/NVM_SMALL18
          31/NVM_SMALL19 32/NVM_SMALL20 33/NVM_SMALL21 34/NVM_SMALL22
          35/NVM_SMALL23 36/NVM_SMALL24 37/NVM_SMALL25 38/NVM_SMALL26
          39/NVM_SMALL27 40/NVM_SMALL28 41/NVM_SMALL29 42/NVM_SMALL30
          43/NVM_SMALL31 44/NVM_SMALL32 45/NVM_SMALL33 46/NVM_SMALL34
          47/NVM_SMALL35 48/NVM_SMALL36 49/NVM_SMALL37 50/NVM_SMALL38
          51/NVM_SMALL39 52/NVM_SMALL40 53/NVM_SMALL41 54/NVM_SMALL42
          55/NVM_SMALL43 56/NVM_SMALL44 57/NVM_SMALL45 58/NVM_SMALL46
          59/NVM_SMALL47 60/NVM_SMALL48 61/NVM_SMALL49 62/NVM_SMALL50
          63/NVM_SMALL51 64/NVM_SMALL52 65/NVM_SMALL53 66/NVM_SMALL54
          67/NVM_SMALL55 68/NVM_SMALL56 69/NVM_SMALL57 70/NVM_SMALL58
          71/NVM_SMALL59 72/NVM_SMALL60 73/NVM_SMALL61 74/NVM_SMALL62
          75/NVM_SMALL63 76/NVM_SMALL64 77/NVM_SMALL65 78/NVM_SMALL66
          79/NVM_SMALL67 80/NVM_SMALL68 81/NVM_SMALL69 82/NVM_SMALL70
          83/NVM_SMALL71 84/NVM_SMALL72 85/NVM_SMALL73 86/NVM_SMALL74
          87/NVM_SMALL75 88/NVM_SMALL76 89/NVM_SMALL77 90/NVM_SMALL78
          91/NVM_SMALL79 92/NVM_SMALL80 93/NVM_SMALL81 94/NVM_SMALL82
          95/NVM_SMALL83 96/NVM_SMALL84 97/NVM_SMALL85 98/NVM_SMALL86
          99/NVM_SMALL87 100/NVM_SMALL88 101/NVM_SMALL89 102/NVM_SMALL90
          103/NVM_SMALL91 104/NVM_SMALL92 105/NVM_SMALL93 106/NVM_SMALL94
          107/NVM_SMALL95 108/NVM_SMALL96 109/NVM_SMALL97 110/NVM_SMALL98
          111/NVM_SMALL99 112/NVM_SMALL100 113/NVM_SMALL101
          114/NVM_SMALL102 115/NVM_SMALL103 116/NVM_SMALL104
          117/NVM_SMALL105 118/NVM_SMALL106 119/NVM_SMALL107
          120/NVM_SMALL108 121/NVM_SMALL109 122/NVM_SMALL110
          123/NVM_SMALL111 124/NVM_SMALL112 125/NVM_SMALL113
          126/NVM_SMALL114 127/NVM_SMALL115 128/NVM_SMALL116
          129/NVM_SMALL117 130/NVM_SMALL118 131/NVM_SMALL119
          132/NVM_SMALL120 133/NVM_SMALL121 134/NVM_SMALL122
          135/NVM_SMALL123 136/NVM_SMALL124 137/NVM_SMALL125
          138/NVM_SMALL126 139/NVM_SMALL127 140/HOLDING0
      - id: sw_store_partition_write_misc
        type: u4
        doc: |
          Partition write address
      - id: sw_store_partition_read_misc
        type: u4
        doc: |
          Partition read address
      - id: sw_store_partition_write_adcs
        type: u4
        doc: |
          Partition write address
      - id: sw_store_partition_read_adcs
        type: u4
        doc: |
          Partition read address
      - id: sw_store_partition_write_beacon
        type: u4
        doc: |
          Partition write address
      - id: sw_store_partition_read_beacon
        type: u4
        doc: |
          Partition read address
      - id: sw_store_partition_write_log
        type: u4
        doc: |
          Partition write address
      - id: sw_store_partition_read_log
        type: u4
        doc: |
          Partition read address
      - id: sw_store_partition_write_payload
        type: u4
        doc: |
          Partition write address
      - id: sw_store_partition_read_payload
        type: u4
        doc: |
          Partition read address
      - id: sw_fp_resp_count
        type: u2
        doc: |
          FP Response Count
      - id: sw_ana_bus_v
        type: u2
        doc: |
          Bus Voltage
          Conversion coefficients: C0=0.0, C1=0.008862
      - id: sw_ana_3p3_v
        type: u2
        doc: |
          3p3 Voltage
          Conversion coefficients: C0=0.0, C1=0.001611
      - id: sw_ana_3p3_i
        type: u2
        doc: |
          3p3 Current
          Conversion coefficients: C0=0.0, C1=8.1e-05
      - id: sw_ana_1p8_i
        type: u2
        doc: |
          1p8 Current
          Conversion coefficients: C0=0.0, C1=8.1e-05
      - id: sw_ana_1p0_i
        type: u2
        doc: |
          1p0 Current
          Conversion coefficients: C0=0.0, C1=8.1e-05
      - id: sw_ana_cdh_temp
        type: u2
        doc: |
          CDH Temperature
          Conversion coefficients: C0=98.0, C1=-0.05936, C2=1.6e-05, C3=-0.000000002361
      - id: sw_ana_sa1_v
        type: u2
        doc: |
          Solar Array 1 Voltage
          Conversion coefficients: C0=0.0, C1=0.009659
      - id: sw_ana_sa1_i
        type: u2
        doc: |
          Solar Array 1 Current
          Conversion coefficients: C0=-0.04241, C1=0.002525
      - id: sw_ana_sa2_v
        type: u2
        doc: |
          Solar Array 2 Voltage
          Conversion coefficients: C0=0.0, C1=0.009659
      - id: sw_ana_sa2_i
        type: u2
        doc: |
          Solar Array 2 Current
          Conversion coefficients: C0=-0.04262, C1=0.002525
      - id: sw_ana_bat1_v
        type: u2
        doc: |
          Battery 1 Voltage
          Conversion coefficients: C0=0.0, C1=0.008862
      - id: sw_ana_bat2_v
        type: u2
        doc: |
          Battery 2 Voltage
          Conversion coefficients: C0=0.0, C1=0.008862
      - id: sw_ana_eps_temp
        type: u2
        doc: |
          EPS Board Temperature
          Conversion coefficients: C0=98.0, C1=-0.05936, C2=1.6e-05, C3=-0.000000002361
      - id: sw_ana_eps_3p3_ref
        type: u2
        doc: |
          EPS Board 3.3V Ref
          Conversion coefficients: C0=0.0, C1=0.001611
      - id: sw_ana_eps_bus_i
        type: u2
        doc: |
          EPS Bus Current
          Conversion coefficients: C0=0.0, C1=0.001221
      - id: sw_ana_xact_i
        type: u2
        doc: |
          XACT Current
          Conversion coefficients: C0=-0.02489, C1=0.001992
      - id: sw_ana_uhf_i
        type: u2
        doc: |
          UHF Current
          Conversion coefficients: C0=-0.02489, C1=0.001992
      - id: sw_ana_sband_i
        type: u2
        doc: |
          SBAND Current
          Conversion coefficients: C0=-0.02489, C1=0.001992
      - id: sw_ana_inst_i
        type: u2
        doc: |
          Payload Current
          Conversion coefficients: C0=0.0, C1=0.000807
      - id: sw_ana_hk_3p3_ref
        type: u2
        doc: |
          HK 3.3V Ref
          Conversion coefficients: C0=0.0, C1=0.001611
      - id: sw_ana_ifb_i
        type: u2
        doc: |
          Interface Board Current
          Conversion coefficients: C0=0.0, C1=0.000269
      - id: sw_ana_ifb_temp
        type: u2
        doc: |
          Interface Board Temperature
          Conversion coefficients: C0=98.0, C1=-0.05936, C2=1.6e-05, C3=-0.000000002361
      - id: sw_adcs_eclipse
        type: u1
        doc: |
          State of eclipse
      - id: sw_adcs_att_valid
        type: b1
        doc: |
          Attitude Valid
          Enumeration values: 1/YES 0/NO
      - id: sw_adcs_ref_valid
        type: b1
        doc: |
          Refs Valid
          Enumeration values: 1/YES 0/NO
      - id: sw_adcs_time_valid
        type: b1
        doc: |
          Time Valid
          Enumeration values: 1/YES 0/NO
      - id: sw_adcs_mode
        type: b1
        doc: |
          ADCS Mode
          Enumeration values: 1/FINE_REF_POINT 0/SUN_POINT
      - id: sw_adcs_recommend_sun_point
        type: b1
        doc: |
          Recommend Sun Point
          Enumeration values: 1/YES 0/NO
      - id: sw_adcs_sun_point_state
        type: b3
        doc: |
          Sun Point State
          Enumeration values: 3/SEARCHING 4/WAITING 5/CONVERGING
          7/NOT_ACTIVE 6/ON_SUN 2/SEARCH_INIT
      - id: sw_adcs_analogs_voltage_2p5
        type: u1
        doc: |
          Voltage_2p5
          Conversion coefficients: C0=0.0, C1=0.015
      - id: sw_adcs_analogs_voltage_1p8
        type: u1
        doc: |
          Voltage_1p8
          Conversion coefficients: C0=0.0, C1=0.015
      - id: sw_adcs_analogs_voltage_1p0
        type: u1
        doc: |
          Voltage_1p0
          Conversion coefficients: C0=0.0, C1=0.015
      - id: sw_adcs_analogs_det_temp
        type: s1
        doc: |
          Tracker Detector temperature
          Conversion coefficients: C0=0.0, C1=0.8
      - id: sw_adcs_analogs_motor1_temp
        type: s2
        doc: |
          Wheel 1 Temp
          Conversion coefficients: C0=0.0, C1=0.005
      - id: sw_adcs_analogs_motor2_temp
        type: s2
        doc: |
          Wheel 2 Temp
          Conversion coefficients: C0=0.0, C1=0.005
      - id: sw_adcs_analogs_motor3_temp
        type: s2
        doc: |
          Wheel 3 Temp
          Conversion coefficients: C0=0.0, C1=0.005
      - id: spare_16
        type: s2
      - id: sw_adcs_analogs_digital_bus_v
        type: s2
        doc: |
          Digital Bus Voltage
          Conversion coefficients: C0=0.0, C1=0.00125
      - id: sw_adcs_cmd_acpt
        type: u1
        doc: |
          ADCS Command Accept Count
      - id: sw_adcs_cmd_fail
        type: u1
        doc: |
          ADCS Command Reject Count
      - id: sw_adcs_time
        type: s4
        doc: |
          ADCS GPS Time
      - id: sw_adcs_sun_vec1
        type: s2
        doc: |
          ADCS Sun Vector 1
          Conversion coefficients: C0=0.0, C1=0.0001
      - id: sw_adcs_sun_vec2
        type: s2
        doc: |
          ADCS Sun Vector 2
          Conversion coefficients: C0=0.0, C1=0.0001
      - id: sw_adcs_sun_vec3
        type: s2
        doc: |
          ADCS Sun Vector 3
          Conversion coefficients: C0=0.0, C1=0.0001
      - id: sw_adcs_wheel_sp1
        type: s2
        doc: |
          ADCS Wheel Speed 1
          Conversion coefficients: C0=0.0, C1=0.4
      - id: sw_adcs_wheel_sp2
        type: s2
        doc: |
          ADCS Wheel Speed 2
          Conversion coefficients: C0=0.0, C1=0.4
      - id: sw_adcs_wheel_sp3
        type: s2
        doc: |
          ADCS Wheel Speed 3
          Conversion coefficients: C0=0.0, C1=0.4
      - id: sw_adcs_body_rt1
        type: s4
        doc: |
          ADCS Body Frame Rate 1
          Conversion coefficients: C0=0.0, C1=5E-9
      - id: sw_adcs_body_rt2
        type: s4
        doc: |
          ADCS Body Frame Rate 2
          Conversion coefficients: C0=0.0, C1=5E-9
      - id: sw_adcs_body_rt3
        type: s4
        doc: |
          ADCS Body Frame Rate 3
          Conversion coefficients: C0=0.0, C1=5E-9
      - id: sw_adcs_body_quat1
        type: s4
        doc: |
          ADCS Body Quat 1
          Conversion coefficients: C0=0.0, C1=5E-10
      - id: sw_adcs_body_quat2
        type: s4
        doc: |
          ADCS Body Quat 2
          Conversion coefficients: C0=0.0, C1=5E-10
      - id: sw_adcs_body_quat3
        type: s4
        doc: |
          ADCS Body Quat 3
          Conversion coefficients: C0=0.0, C1=5E-10
      - id: sw_adcs_body_quat4
        type: s4
        doc: |
          ADCS Body Quat 4
          Conversion coefficients: C0=0.0, C1=5E-10
      - id: sw_spare_0
        type: u4
        doc: |
          Spare Telemetry 0
      - id: sw_spare_1
        type: u4
        doc: |
          Spare Telemetry 1
      - id: sw_spare_2
        type: u4
        doc: |
          Spare Telemetry 2
      - id: sw_spare_3
        type: u4
        doc: |
          Spare Telemetry 3
