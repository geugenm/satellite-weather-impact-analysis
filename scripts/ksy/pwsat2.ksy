---
meta:
  id: pwsat2
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field apid: ax25_frame.payload.ax25_info.hdr.apid
  :field periodic_msg_data: ax25_frame.payload.ax25_info.payload.periodic_msg_data
  :field obc_boot_ctr: ax25_frame.payload.ax25_info.payload.obc.obc_boot_ctr
  :field obc_boot_idx: ax25_frame.payload.ax25_info.payload.obc.obc_boot_idx
  :field obc_reboot_reason: ax25_frame.payload.ax25_info.payload.obc.obc_reboot_reason
  :field obc_code_crc: ax25_frame.payload.ax25_info.payload.obc.obc_code_crc
  :field obc_mission_time: ax25_frame.payload.ax25_info.payload.obc.obc_mission_time
  :field obc_ext_time: ax25_frame.payload.ax25_info.payload.obc.obc_ext_time
  :field obc_comm_err: ax25_frame.payload.ax25_info.payload.obc.obc_comm_err
  :field obc_eps_err: ax25_frame.payload.ax25_info.payload.obc.obc_eps_err
  :field obc_rtc_err: ax25_frame.payload.ax25_info.payload.obc.obc_rtc_err
  :field obc_imtq_err: ax25_frame.payload.ax25_info.payload.obc.obc_imtq_err
  :field obc_n25qflash1_err: ax25_frame.payload.ax25_info.payload.obc.obc_n25qflash1_err
  :field obc_n25qflash2_err: ax25_frame.payload.ax25_info.payload.obc.obc_n25qflash2_err
  :field obc_n25qflash3_err: ax25_frame.payload.ax25_info.payload.obc.obc_n25qflash3_err
  :field obc_n25q_tmr_corr: ax25_frame.payload.ax25_info.payload.obc.obc_n25q_tmr_corr
  :field obc_fram_tmr_corr: ax25_frame.payload.ax25_info.payload.obc.obc_fram_tmr_corr
  :field obc_payload_err: ax25_frame.payload.ax25_info.payload.obc.obc_payload_err
  :field obc_cam_err: ax25_frame.payload.ax25_info.payload.obc.obc_cam_err
  :field obc_suns_exp_err: ax25_frame.payload.ax25_info.payload.obc.obc_suns_exp_err
  :field obc_ant_prim_err: ax25_frame.payload.ax25_info.payload.obc.obc_ant_prim_err
  :field obc_ant_sec_err: ax25_frame.payload.ax25_info.payload.obc.obc_ant_sec_err
  :field obc_prim_flash_scrbg_ptr: ax25_frame.payload.ax25_info.payload.obc.obc_prim_flash_scrbg_ptr
  :field obc_sec_flash_scrbg_ptr: ax25_frame.payload.ax25_info.payload.obc.obc_sec_flash_scrbg_ptr
  :field obc_ram_scrbg_ptr: ax25_frame.payload.ax25_info.payload.obc.obc_ram_scrbg_ptr
  :field obc_system_uptime: ax25_frame.payload.ax25_info.payload.obc.obc_system_uptime
  :field obc_system_flash_free: ax25_frame.payload.ax25_info.payload.obc.obc_system_flash_free
  :field antennas_ant1_depl_sw_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_depl_sw_ch_a
  :field antennas_ant2_depl_sw_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_depl_sw_ch_a
  :field antennas_ant3_depl_sw_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_depl_sw_ch_a
  :field antennas_ant4_depl_sw_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_depl_sw_ch_a
  :field antennas_ant1_depl_sw_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_depl_sw_ch_b
  :field antennas_ant2_depl_sw_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_depl_sw_ch_b
  :field antennas_ant3_depl_sw_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_depl_sw_ch_b
  :field antennas_ant4_depl_sw_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_depl_sw_ch_b
  :field antennas_ant1_last_timed_stop_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_last_timed_stop_ch_a
  :field antennas_ant2_last_timed_stop_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_last_timed_stop_ch_a
  :field antennas_ant3_last_timed_stop_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_last_timed_stop_ch_a
  :field antennas_ant4_last_timed_stop_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_last_timed_stop_ch_a
  :field antennas_ant1_last_timed_stop_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_last_timed_stop_ch_b
  :field antennas_ant2_last_timed_stop_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_last_timed_stop_ch_b
  :field antennas_ant3_last_timed_stop_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_last_timed_stop_ch_b
  :field antennas_ant4_last_timed_stop_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_last_timed_stop_ch_b
  :field antennas_ant1_burn_active_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_burn_active_ch_a
  :field antennas_ant2_burn_active_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_burn_active_ch_a
  :field antennas_ant3_burn_active_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_burn_active_ch_a
  :field antennas_ant4_burn_active_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_burn_active_ch_a
  :field antennas_ant1_burn_active_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_burn_active_ch_b
  :field antennas_ant2_burn_active_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_burn_active_ch_b
  :field antennas_ant3_burn_active_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_burn_active_ch_b
  :field antennas_ant4_burn_active_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_burn_active_ch_b
  :field antennas_sys_indep_burn_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_sys_indep_burn_ch_a
  :field antennas_sys_indep_burn_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_sys_indep_burn_ch_b
  :field antennas_ant_ignoring_sw_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant_ignoring_sw_ch_a
  :field antennas_ant_ignoring_sw_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant_ignoring_sw_ch_b
  :field antennas_armed_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_armed_ch_a
  :field antennas_armed_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_armed_ch_b
  :field antennas_ant1_activation_cnt_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_activation_cnt_ch_a
  :field antennas_ant2_activation_cnt_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_activation_cnt_ch_a
  :field antennas_ant3_activation_cnt_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_activation_cnt_ch_a
  :field antennas_ant4_activation_cnt_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_activation_cnt_ch_a
  :field antennas_ant1_activation_cnt_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_activation_cnt_ch_b
  :field antennas_ant2_activation_cnt_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_activation_cnt_ch_b
  :field antennas_ant3_activation_cnt_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_activation_cnt_ch_b
  :field antennas_ant4_activation_cnt_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_activation_cnt_ch_b
  :field antennas_ant1_activation_time_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_activation_time_ch_a
  :field antennas_ant2_activation_time_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_activation_time_ch_a
  :field antennas_ant3_activation_time_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_activation_time_ch_a
  :field antennas_ant4_activation_time_ch_a: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_activation_time_ch_a
  :field antennas_ant1_activation_time_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant1_activation_time_ch_b
  :field antennas_ant2_activation_time_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant2_activation_time_ch_b
  :field antennas_ant3_activation_time_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant3_activation_time_ch_b
  :field antennas_ant4_activation_time_ch_b: ax25_frame.payload.ax25_info.payload.antennas.antennas_ant4_activation_time_ch_b
  :field experiments_curr_exp_code: ax25_frame.payload.ax25_info.payload.experiments.experiments_curr_exp_code
  :field experiments_exp_startup_res: ax25_frame.payload.ax25_info.payload.experiments.experiments_exp_startup_res
  :field experiments_last_exp_iter_stat_status: ax25_frame.payload.ax25_info.payload.experiments.experiments_last_exp_iter_stat_status
  :field gyroscope_x_meas: ax25_frame.payload.ax25_info.payload.gyroscope.gyroscope_x_meas
  :field gyroscope_y_meas: ax25_frame.payload.ax25_info.payload.gyroscope.gyroscope_y_meas
  :field gyroscope_z_meas: ax25_frame.payload.ax25_info.payload.gyroscope.gyroscope_z_meas
  :field gyroscope_temp: ax25_frame.payload.ax25_info.payload.gyroscope.gyroscope_temp
  :field comm_tx_trsmtr_uptime: ax25_frame.payload.ax25_info.payload.comm.comm_tx_trsmtr_uptime
  :field comm_tx_bitrate: ax25_frame.payload.ax25_info.payload.comm.comm_tx_bitrate
  :field comm_tx_last_tx_rf_refl_pwr: ax25_frame.payload.ax25_info.payload.comm.comm_tx_last_tx_rf_refl_pwr
  :field comm_tx_last_tx_pamp_temp: ax25_frame.payload.ax25_info.payload.comm.comm_tx_last_tx_pamp_temp
  :field comm_tx_last_tx_last_tx_rf_fwd_pwr: ax25_frame.payload.ax25_info.payload.comm.comm_tx_last_tx_last_tx_rf_fwd_pwr
  :field comm_tx_last_tx_curr_consmpt: ax25_frame.payload.ax25_info.payload.comm.comm_tx_last_tx_curr_consmpt
  :field comm_tx_now_tx_fwd_pwr: ax25_frame.payload.ax25_info.payload.comm.comm_tx_now_tx_fwd_pwr
  :field comm_tx_now_tx_curr_consmpt: ax25_frame.payload.ax25_info.payload.comm.comm_tx_now_tx_curr_consmpt
  :field comm_tx_state_when_idle: ax25_frame.payload.ax25_info.payload.comm.comm_tx_state_when_idle
  :field comm_tx_beacon_state: ax25_frame.payload.ax25_info.payload.comm.comm_tx_beacon_state
  :field comm_rx_uptime: ax25_frame.payload.ax25_info.payload.comm.comm_rx_uptime
  :field comm_rx_last_rx_doppler_offs: ax25_frame.payload.ax25_info.payload.comm.comm_rx_last_rx_doppler_offs
  :field comm_rx_last_rx_rssi: ax25_frame.payload.ax25_info.payload.comm.comm_rx_last_rx_rssi
  :field comm_rx_now_doppler_offs: ax25_frame.payload.ax25_info.payload.comm.comm_rx_now_doppler_offs
  :field comm_rx_now_rx_curr_consmpt: ax25_frame.payload.ax25_info.payload.comm.comm_rx_now_rx_curr_consmpt
  :field comm_rx_supply_voltage: ax25_frame.payload.ax25_info.payload.comm.comm_rx_supply_voltage
  :field comm_rx_osc_temp: ax25_frame.payload.ax25_info.payload.comm.comm_rx_osc_temp
  :field comm_rx_now_pamp_temp: ax25_frame.payload.ax25_info.payload.comm.comm_rx_now_pamp_temp
  :field comm_rx_now_rssi: ax25_frame.payload.ax25_info.payload.comm.comm_rx_now_rssi
  :field hardware_state_gpio_sail_deployed: ax25_frame.payload.ax25_info.payload.hardware_state.hardware_state_gpio_sail_deployed
  :field hardware_state_mcu_temp: ax25_frame.payload.ax25_info.payload.hardware_state.hardware_state_mcu_temp
  :field eps_controller_a_mpptx_sol_volt: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mpptx_sol_volt
  :field eps_controller_a_mpptx_sol_curr: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mpptx_sol_curr
  :field eps_controller_a_mpptx_out_volt: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mpptx_out_volt
  :field eps_controller_a_mpptx_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mpptx_temp
  :field eps_controller_a_mpptx_state: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mpptx_state
  :field eps_controller_a_mppty_pos_sol_volt: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_pos_sol_volt
  :field eps_controller_a_mppty_pos_sol_curr: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_pos_sol_curr
  :field eps_controller_a_mppty_pos_out_volt: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_pos_out_volt
  :field eps_controller_a_mppty_pos_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_pos_temp
  :field eps_controller_a_mppty_pos_state: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_pos_state
  :field eps_controller_a_mppty_neg_sol_volt: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_neg_sol_volt
  :field eps_controller_a_mppty_neg_sol_curr: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_neg_sol_curr
  :field eps_controller_a_mppty_neg_out_volt: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_neg_out_volt
  :field eps_controller_a_mppty_neg_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_neg_temp
  :field eps_controller_a_mppty_neg_state: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_mppty_neg_state
  :field eps_controller_a_distr_volt_3v3: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_volt_3v3
  :field eps_controller_a_distr_curr_3v3: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_curr_3v3
  :field eps_controller_a_distr_volt_5v: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_volt_5v
  :field eps_controller_a_distr_curr_5v: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_curr_5v
  :field eps_controller_a_distr_volt_vbat: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_volt_vbat
  :field eps_controller_a_distr_curr_vbat: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_curr_vbat
  :field eps_controller_a_distr_lcl_state: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_lcl_state
  :field eps_controller_a_distr_lcl_flagb: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_distr_lcl_flagb
  :field eps_controller_a_batc_volta: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_batc_volta
  :field eps_controller_a_batc_chrg_curr: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_batc_chrg_curr
  :field eps_controller_a_batc_dchrg_curr: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_batc_dchrg_curr
  :field eps_controller_a_batc_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_batc_temp
  :field eps_controller_a_batc_state: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_batc_state
  :field eps_controller_a_bp_temp_a: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_bp_temp_a
  :field eps_controller_a_bp_temp_b: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_bp_temp_b
  :field eps_controller_a_safety_ctr: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_safety_ctr
  :field eps_controller_a_pwr_cycles: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_pwr_cycles
  :field eps_controller_a_uptime: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_uptime
  :field eps_controller_a_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_temp
  :field eps_controller_a_supp_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_supp_temp
  :field eps_controller_b_3v3d_volt: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_b_3v3d_volt
  :field eps_controller_a_dcdc_3v3_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_dcdc_3v3_temp
  :field eps_controller_a_dcdc_5v_temp: ax25_frame.payload.ax25_info.payload.eps_controller_a.eps_controller_a_dcdc_5v_temp
  :field eps_controller_b_bptemp_c: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_b_bptemp_c
  :field eps_controller_b_battc_volt_b: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_b_battc_volt_b
  :field eps_controller_b_safety_ctr: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_b_safety_ctr
  :field eps_controller_b_pwr_cycles: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_b_pwr_cycles
  :field eps_controller_b_uptime: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_b_uptime
  :field eps_controller_b_temp: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_b_temp
  :field eps_controller_b_supp_temp: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_b_supp_temp
  :field eps_controller_a_3v3d_volt: ax25_frame.payload.ax25_info.payload.eps_controller_b.eps_controller_a_3v3d_volt
  :field imtq_mag_meas_1: ax25_frame.payload.ax25_info.payload.imtq.imtq_mag_meas_1
  :field imtq_mag_meas_2: ax25_frame.payload.ax25_info.payload.imtq.imtq_mag_meas_2
  :field imtq_mag_meas_3: ax25_frame.payload.ax25_info.payload.imtq.imtq_mag_meas_3
  :field imtq_coil_active_in_meas: ax25_frame.payload.ax25_info.payload.imtq_coil_active.imtq_coil_active_in_meas
  :field imtq_dipole_1: ax25_frame.payload.ax25_info.payload.imtq_dipole.imtq_dipole_1
  :field imtq_dipole_2: ax25_frame.payload.ax25_info.payload.imtq_dipole.imtq_dipole_2
  :field imtq_dipole_3: ax25_frame.payload.ax25_info.payload.imtq_dipole.imtq_dipole_3
  :field imtq_bdot_x: ax25_frame.payload.ax25_info.payload.imtq_bdot.imtq_bdot_x
  :field imtq_bdot_y: ax25_frame.payload.ax25_info.payload.imtq_bdot.imtq_bdot_y
  :field imtq_bdot_z: ax25_frame.payload.ax25_info.payload.imtq_bdot.imtq_bdot_z
  :field imtq_hskp_dig_volt: ax25_frame.payload.ax25_info.payload.imtq_hskp.imtq_hskp_dig_volt
  :field imtq_hskp_ana_volt: ax25_frame.payload.ax25_info.payload.imtq_hskp.imtq_hskp_ana_volt
  :field imtq_hskp_dig_curr: ax25_frame.payload.ax25_info.payload.imtq_hskp.imtq_hskp_dig_curr
  :field imtq_hskp_ana_curr: ax25_frame.payload.ax25_info.payload.imtq_hskp.imtq_hskp_ana_curr
  :field imtq_hskp_mcu_temp: ax25_frame.payload.ax25_info.payload.imtq_hskp.imtq_hskp_mcu_temp
  :field imtq_coil_current_x: ax25_frame.payload.ax25_info.payload.imtq_coil.imtq_coil_current_x
  :field imtq_coil_current_y: ax25_frame.payload.ax25_info.payload.imtq_coil.imtq_coil_current_y
  :field imtq_coil_current_z: ax25_frame.payload.ax25_info.payload.imtq_coil.imtq_coil_current_z
  :field imtq_temp_coil_x: ax25_frame.payload.ax25_info.payload.imtq_temp.imtq_temp_coil_x
  :field imtq_temp_coil_y: ax25_frame.payload.ax25_info.payload.imtq_temp.imtq_temp_coil_y
  :field imtq_temp_coil_z: ax25_frame.payload.ax25_info.payload.imtq_temp.imtq_temp_coil_z
  :field imtq_state_status: ax25_frame.payload.ax25_info.payload.imtq_state.imtq_state_status
  :field imtq_state_mode: ax25_frame.payload.ax25_info.payload.imtq_state.imtq_state_mode
  :field imtq_err_prev_iter: ax25_frame.payload.ax25_info.payload.imtq_state.imtq_err_prev_iter
  :field imtq_conf_changed: ax25_frame.payload.ax25_info.payload.imtq_state.imtq_conf_changed
  :field imtq_state_uptime: ax25_frame.payload.ax25_info.payload.imtq_state.imtq_state_uptime
  :field adcs_imtq_slftst_err_initial: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_initial
  :field adcs_imtq_slftst_err_pos_x: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_pos_x
  :field adcs_imtq_slftst_err_neg_x: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_neg_x
  :field adcs_imtq_slftst_err_pos_y: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_pos_y
  :field adcs_imtq_slftst_err_neg_y: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_neg_y
  :field adcs_imtq_slftst_err_pos_z: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_pos_z
  :field adcs_imtq_slftst_err_neg_z: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_neg_z
  :field adcs_imtq_slftst_err_final: ax25_frame.payload.ax25_info.payload.imtq_selftest.adcs_imtq_slftst_err_final

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
        type:
          switch-on: pid
          cases:
            0xF0: frame
        size-eos: true

  frame:
    seq:
      - id: hdr
        type: hdr
      - id: payload
        type:
          switch-on: hdr.apid & 0x3f
          cases:
            0x05: periodic_msg
            0x0d: telemetry

  hdr:
    seq:
      - id: apid
        type: u1

  periodic_msg:
    seq:
      - id: periodic_msg_data
        type: str
        encoding: ASCII
        size: _io.size - 1

  telemetry:
    seq:
      - id: obc
        type: obc
      - id: antennas
        type: antennas
      - id: experiments
        type: experiments
      - id: gyroscope
        type: gyroscope
      - id: comm
        type: comm
      - id: hardware_state
        type: hardware_state
      - id: eps_controller_a
        type: eps_controller_a
      - id: eps_controller_b
        type: eps_controller_b
      - id: imtq
        type: imtq
      - id: imtq_coil_active
        type: imtq_coil_active
      - id: imtq_dipole
        type: imtq_dipole
      - id: imtq_bdot
        type: imtq_bdot
      - id: imtq_hskp
        type: imtq_hskp
      - id: imtq_coil
        type: imtq_coil
      - id: imtq_temp
        type: imtq_temp
      - id: imtq_state
        type: imtq_state
      - id: imtq_selftest
        type: imtq_selftest

  obc:
    seq:
      - id: obc_boot_ctr
        type: u4
      - id: obc_boot_idx
        type: u1
      - id: obc_reboot_reason
        type: u2
      - id: obc_code_crc
        type: u2
      - id: obc_mission_time
        type: u8
      - id: obc_ext_time
        type: u4
      - id: obc_comm_err
        type: u1
      - id: obc_eps_err
        type: u1
      - id: obc_rtc_err
        type: u1
      - id: obc_imtq_err
        type: u1
      - id: obc_n25qflash1_err
        type: u1
      - id: obc_n25qflash2_err
        type: u1
      - id: obc_n25qflash3_err
        type: u1
      - id: obc_n25q_tmr_corr
        type: u1
      - id: obc_fram_tmr_corr
        type: u1
      - id: obc_payload_err
        type: u1
      - id: obc_cam_err
        type: u1
      - id: obc_suns_exp_err
        type: u1
      - id: obc_ant_prim_err
        type: u1
      - id: obc_ant_sec_err
        type: u1
      - id: obc_prim_flash_scrbg_ptr
        type: b3
      - id: obc_sec_flash_scrbg_ptr
        type: b3
      - id: obc_ram_scrbg_ptr
        type: u4
      - id: obc_system_uptime
        type: b22
      - id: obc_system_flash_free
        type: u4

  antennas:
    seq:
      - id: antennas_ant1_depl_sw_ch_a
        type: b1
      - id: antennas_ant2_depl_sw_ch_a
        type: b1
      - id: antennas_ant3_depl_sw_ch_a
        type: b1
      - id: antennas_ant4_depl_sw_ch_a
        type: b1
      - id: antennas_ant1_depl_sw_ch_b
        type: b1
      - id: antennas_ant2_depl_sw_ch_b
        type: b1
      - id: antennas_ant3_depl_sw_ch_b
        type: b1
      - id: antennas_ant4_depl_sw_ch_b
        type: b1
      - id: antennas_ant1_last_timed_stop_ch_a
        type: b1
      - id: antennas_ant2_last_timed_stop_ch_a
        type: b1
      - id: antennas_ant3_last_timed_stop_ch_a
        type: b1
      - id: antennas_ant4_last_timed_stop_ch_a
        type: b1
      - id: antennas_ant1_last_timed_stop_ch_b
        type: b1
      - id: antennas_ant2_last_timed_stop_ch_b
        type: b1
      - id: antennas_ant3_last_timed_stop_ch_b
        type: b1
      - id: antennas_ant4_last_timed_stop_ch_b
        type: b1
      - id: antennas_ant1_burn_active_ch_a
        type: b1
      - id: antennas_ant2_burn_active_ch_a
        type: b1
      - id: antennas_ant3_burn_active_ch_a
        type: b1
      - id: antennas_ant4_burn_active_ch_a
        type: b1
      - id: antennas_ant1_burn_active_ch_b
        type: b1
      - id: antennas_ant2_burn_active_ch_b
        type: b1
      - id: antennas_ant3_burn_active_ch_b
        type: b1
      - id: antennas_ant4_burn_active_ch_b
        type: b1
      - id: antennas_sys_indep_burn_ch_a
        type: b1
      - id: antennas_sys_indep_burn_ch_b
        type: b1
      - id: antennas_ant_ignoring_sw_ch_a
        type: b1
      - id: antennas_ant_ignoring_sw_ch_b
        type: b1
      - id: antennas_armed_ch_a
        type: b1
      - id: antennas_armed_ch_b
        type: b1
      - id: antennas_ant1_activation_cnt_ch_a
        type: b3
      - id: antennas_ant2_activation_cnt_ch_a
        type: b3
      - id: antennas_ant3_activation_cnt_ch_a
        type: b3
      - id: antennas_ant4_activation_cnt_ch_a
        type: b3
      - id: antennas_ant1_activation_cnt_ch_b
        type: b3
      - id: antennas_ant2_activation_cnt_ch_b
        type: b3
      - id: antennas_ant3_activation_cnt_ch_b
        type: b3
      - id: antennas_ant4_activation_cnt_ch_b
        type: b3
      - id: antennas_ant1_activation_time_ch_a
        type: b3
      - id: antennas_ant2_activation_time_ch_a
        type: b3
      - id: antennas_ant3_activation_time_ch_a
        type: b3
      - id: antennas_ant4_activation_time_ch_a
        type: b3
      - id: antennas_ant1_activation_time_ch_b
        type: b3
      - id: antennas_ant2_activation_time_ch_b
        type: b3
      - id: antennas_ant3_activation_time_ch_b
        type: b3
      - id: antennas_ant4_activation_time_ch_b
        type: b3

  experiments:
    seq:
      - id: experiments_curr_exp_code
        type: b4
      - id: experiments_exp_startup_res
        type: u1
      - id: experiments_last_exp_iter_stat_status
        type: u1

  gyroscope:
    seq:
      - id: gyroscope_x_meas
        type: u2
      - id: gyroscope_y_meas
        type: u2
      - id: gyroscope_z_meas
        type: u2
      - id: gyroscope_temp
        type: u2

  comm:
    seq:
      - id: comm_tx_trsmtr_uptime
        type: b17
      - id: comm_tx_bitrate
        type: b2
      - id: comm_tx_last_tx_rf_refl_pwr
        type: b12
      - id: comm_tx_last_tx_pamp_temp
        type: b12
      - id: comm_tx_last_tx_last_tx_rf_fwd_pwr
        type: b12
      - id: comm_tx_last_tx_curr_consmpt
        type: b12
      - id: comm_tx_now_tx_fwd_pwr
        type: b12
      - id: comm_tx_now_tx_curr_consmpt
        type: b12
      - id: comm_tx_state_when_idle
        type: b1
      - id: comm_tx_beacon_state
        type: b1
      - id: comm_rx_uptime
        type: b17
      - id: comm_rx_last_rx_doppler_offs
        type: b12
      - id: comm_rx_last_rx_rssi
        type: b12
      - id: comm_rx_now_doppler_offs
        type: b12
      - id: comm_rx_now_rx_curr_consmpt
        type: b12
      - id: comm_rx_supply_voltage
        type: b12
      - id: comm_rx_osc_temp
        type: b12
      - id: comm_rx_now_pamp_temp
        type: b12
      - id: comm_rx_now_rssi
        type: b12

  hardware_state:
    seq:
      - id: hardware_state_gpio_sail_deployed
        type: b1
      - id: hardware_state_mcu_temp
        type: b12

  eps_controller_a:
    seq:
      - id: eps_controller_a_mpptx_sol_volt
        type: b12
      - id: eps_controller_a_mpptx_sol_curr
        type: b12
      - id: eps_controller_a_mpptx_out_volt
        type: b12
      - id: eps_controller_a_mpptx_temp
        type: b12
      - id: eps_controller_a_mpptx_state
        type: b3
      - id: eps_controller_a_mppty_pos_sol_volt
        type: b12
      - id: eps_controller_a_mppty_pos_sol_curr
        type: b12
      - id: eps_controller_a_mppty_pos_out_volt
        type: b12
      - id: eps_controller_a_mppty_pos_temp
        type: b12
      - id: eps_controller_a_mppty_pos_state
        type: b3
      - id: eps_controller_a_mppty_neg_sol_volt
        type: b12
      - id: eps_controller_a_mppty_neg_sol_curr
        type: b12
      - id: eps_controller_a_mppty_neg_out_volt
        type: b12
      - id: eps_controller_a_mppty_neg_temp
        type: b12
      - id: eps_controller_a_mppty_neg_state
        type: b3
      - id: eps_controller_a_distr_volt_3v3
        type: b10
      - id: eps_controller_a_distr_curr_3v3
        type: b10
      - id: eps_controller_a_distr_volt_5v
        type: b10
      - id: eps_controller_a_distr_curr_5v
        type: b10
      - id: eps_controller_a_distr_volt_vbat
        type: b10
      - id: eps_controller_a_distr_curr_vbat
        type: b10
      - id: eps_controller_a_distr_lcl_state
        type: b7
      - id: eps_controller_a_distr_lcl_flagb
        type: b6
      - id: eps_controller_a_batc_volta
        type: b10
      - id: eps_controller_a_batc_chrg_curr
        type: b10
      - id: eps_controller_a_batc_dchrg_curr
        type: b10
      - id: eps_controller_a_batc_temp
        type: b10
      - id: eps_controller_a_batc_state
        type: b3
      - id: eps_controller_a_bp_temp_a
        type: b13
      - id: eps_controller_a_bp_temp_b
        type: b13
      - id: eps_controller_a_safety_ctr
        type: u1
      - id: eps_controller_a_pwr_cycles
        type: u2
      - id: eps_controller_a_uptime
        type: u4
      - id: eps_controller_a_temp
        type: b10
      - id: eps_controller_a_supp_temp
        type: b10
      - id: eps_controller_b_3v3d_volt
        type: b10
      - id: eps_controller_a_dcdc_3v3_temp
        type: b10
      - id: eps_controller_a_dcdc_5v_temp
        type: b10

  eps_controller_b:
    seq:
      - id: eps_controller_b_bptemp_c
        type: b10
      - id: eps_controller_b_battc_volt_b
        type: b10
      - id: eps_controller_b_safety_ctr
        type: u1
      - id: eps_controller_b_pwr_cycles
        type: u2
      - id: eps_controller_b_uptime
        type: u4
      - id: eps_controller_b_temp
        type: b10
      - id: eps_controller_b_supp_temp
        type: b10
      - id: eps_controller_a_3v3d_volt
        type: b10

  imtq:
    seq:
      - id: imtq_mag_meas_1
        type: u4
      - id: imtq_mag_meas_2
        type: u4
      - id: imtq_mag_meas_3
        type: u4

  imtq_coil_active:
    seq:
      - id: imtq_coil_active_in_meas
        type: b1

  imtq_dipole:
    seq:
      - id: imtq_dipole_1
        type: u2
      - id: imtq_dipole_2
        type: u2
      - id: imtq_dipole_3
        type: u2

  imtq_bdot:
    seq:
      - id: imtq_bdot_x
        type: u4
      - id: imtq_bdot_y
        type: u4
      - id: imtq_bdot_z
        type: u4

  imtq_hskp:
    seq:
      - id: imtq_hskp_dig_volt
        type: u2
      - id: imtq_hskp_ana_volt
        type: u2
      - id: imtq_hskp_dig_curr
        type: u2
      - id: imtq_hskp_ana_curr
        type: u2
      - id: imtq_hskp_mcu_temp
        type: u2

  imtq_coil:
    seq:
      - id: imtq_coil_current_x
        type: u2
      - id: imtq_coil_current_y
        type: u2
      - id: imtq_coil_current_z
        type: u2

  imtq_temp:
    seq:
      - id: imtq_temp_coil_x
        type: u2
      - id: imtq_temp_coil_y
        type: u2
      - id: imtq_temp_coil_z
        type: u2

  imtq_state:
    seq:
      - id: imtq_state_status
        type: u1
      - id: imtq_state_mode
        type: b2
      - id: imtq_err_prev_iter
        type: u1
      - id: imtq_conf_changed
        type: b1
      - id: imtq_state_uptime
        type: u4

  imtq_selftest:
    seq:
      - id: adcs_imtq_slftst_err_initial
        type: u1
      - id: adcs_imtq_slftst_err_pos_x
        type: u1
      - id: adcs_imtq_slftst_err_neg_x
        type: u1
      - id: adcs_imtq_slftst_err_pos_y
        type: u1
      - id: adcs_imtq_slftst_err_neg_y
        type: u1
      - id: adcs_imtq_slftst_err_pos_z
        type: u1
      - id: adcs_imtq_slftst_err_neg_z
        type: u1
      - id: adcs_imtq_slftst_err_final
        type: u1
