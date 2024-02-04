---
meta:
  id: elfin
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field beacon_setting: ax25_frame.payload.ax25_info.beacon_setting
  :field status_1_safe_mode: ax25_frame.payload.ax25_info.status_1_safe_mode
  :field status_1_reserved: ax25_frame.payload.ax25_info.status_1_reserved
  :field status_1_early_orbit: ax25_frame.payload.ax25_info.status_1_early_orbit
  :field status_2_payload_power: ax25_frame.payload.ax25_info.status_2_payload_power
  :field status_2_9v_boost: ax25_frame.payload.ax25_info.status_2_9v_boost
  :field status_2_bat_htr_allow: ax25_frame.payload.ax25_info.
  :field status_2_htr_force: ax25_frame.payload.ax25_info.status_2_htr_force
  :field status_2_htr_alert: ax25_frame.payload.ax25_info.status_2_htr_alert
  :field status_2_reserved: ax25_frame.payload.ax25_info.status_2_reserved
  :field reserved: ax25_frame.payload.ax25_info.reserved
  :field hskp_pwr1_rtcc_year: ax25_frame.payload.ax25_info.hskp_pwr1_rtcc_year
  :field hskp_pwr1_rtcc_month: ax25_frame.payload.ax25_info.hskp_pwr1_rtcc_month
  :field hskp_pwr1_rtcc_day: ax25_frame.payload.ax25_info.hskp_pwr1_rtcc_day
  :field hskp_pwr1_rtcc_hour: ax25_frame.payload.ax25_info.hskp_pwr1_rtcc_hour
  :field hskp_pwr1_rtcc_minute: ax25_frame.payload.ax25_info.hskp_pwr1_rtcc_minute
  :field hskp_pwr1_rtcc_second: ax25_frame.payload.ax25_info.hskp_pwr1_rtcc_second
  :field hskp_pwr1_adc_data_adc_sa_volt_12: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_adc_sa_volt_12
  :field hskp_pwr1_adc_data_adc_sa_volt_34: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_adc_sa_volt_34
  :field hskp_pwr1_adc_data_adc_sa_volt_56: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_adc_sa_volt_56
  :field hskp_pwr1_adc_data_sa_short_circuit_current: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_sa_short_circuit_current
  :field hskp_pwr1_adc_data_bat_2_volt: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_bat_2_volt
  :field hskp_pwr1_adc_data_bat_1_volt: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_bat_1_volt
  :field hskp_pwr1_adc_data_reg_sa_volt_1: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_reg_sa_volt_1
  :field hskp_pwr1_adc_data_reg_sa_volt_2: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_reg_sa_volt_2
  :field hskp_pwr1_adc_data_reg_sa_volt_3: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_reg_sa_volt_3
  :field hskp_pwr1_adc_data_power_bus_current_1: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_power_bus_current_1
  :field hskp_pwr1_adc_data_power_bus_current_2: ax25_frame.payload.ax25_info.hskp_pwr1_adc_data_power_bus_current_2
  :field hskp_pwr1_bat_mon_1_avg_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_1_avg_cur_reg
  :field hskp_pwr1_bat_mon_1_temperature_register: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_1_temperature_register
  :field hskp_pwr1_bat_mon_1_volt_reg: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_1_volt_reg
  :field hskp_pwr1_bat_mon_1_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_1_cur_reg
  :field hskp_pwr1_bat_mon_1_acc_curr_reg: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_1_acc_curr_reg
  :field hskp_pwr1_bat_mon_2_avg_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_2_avg_cur_reg
  :field hskp_pwr1_bat_mon_2_temperature_register: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_2_temperature_register
  :field hskp_pwr1_bat_mon_2_volt_reg: ax2_frame.payload.ax25_info.hskp_pwr1_bat_mon_2_volt_reg
  :field hskp_pwr1_bat_mon_2_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_2_cur_reg
  :field hskp_pwr1_bat_mon_2_acc_curr_reg: ax25_frame.payload.ax25_info.hskp_pwr1_bat_mon_2_acc_curr_reg
  :field hskp_pwr1_bv_mon: ax25_frame.payload.ax25_info.hskp_pwr1_bv_mon
  :field hskp_pwr1_tmps_tmp1: ax25_frame.payload.ax25_info.hskp_pwr1_tmps_tmp1
  :field hskp_pwr1_tmps_tmp2: ax25_frame.payload.ax25_info.hskp_pwr1_tmps_tmp2
  :field hskp_pwr1_tmps_tmp3: ax25_frame.payload.ax25_info.hskp_pwr1_tmps_tmp3
  :field hskp_pwr1_tmps_tmp4: ax25_frame.payload.ax25_info.hskp_pwr1_tmps_tmp4
  :field hskp_pwr1_accumulated_curr_bat1_rarc: ax25_frame.payload.ax25_info.hskp_pwr1_accumulated_curr_bat1_rarc
  :field hskp_pwr1_accumulated_curr_bat1_rsrc: ax25_frame.payload.ax25_info.hskp_pwr1_accumulated_curr_bat1_rsrc
  :field hskp_pwr1_accumulated_curr_bat2_rarc: ax25_frame.payload.ax25_info.hskp_pwr1_accumulated_curr_bat2_rarc
  :field hskp_pwr1_accumulated_curr_bat2_rsrc: ax25_frame.payload.ax25_info.hskp_pwr1_accumulated_curr_bat2_rsrc
  :field hskp_pwr2_rtcc_year: ax25_frame.payload.ax25_info.hskp_pwr2_rtcc_year
  :field hskp_pwr2_rtcc_month: ax25_frame.payload.ax25_info.hskp_pwr2_rtcc_month
  :field hskp_pwr2_rtcc_day: ax25_frame.payload.ax25_info.hskp_pwr2_rtcc_day
  :field hskp_pwr2_rtcc_hour: ax25_frame.payload.ax25_info.hskp_pwr2_rtcc_hour
  :field hskp_pwr2_rtcc_minute: ax25_frame.payload.ax25_info.hskp_pwr2_rtcc_minute
  :field hskp_pwr2_rtcc_second: ax25_frame.payload.ax25_info.hskp_pwr2_rtcc_second
  :field hskp_pwr2_adc_data_adc_sa_volt_12: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_adc_sa_volt_12
  :field hskp_pwr2_adc_data_adc_sa_volt_34: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_adc_sa_volt_34
  :field hskp_pwr2_adc_data_adc_sa_volt_56: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_adc_sa_volt_56
  :field hskp_pwr2_adc_data_sa_short_circuit_current: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_sa_short_circuit_current
  :field hskp_pwr2_adc_data_bat_2_volt: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_bat_2_volt
  :field hskp_pwr2_adc_data_bat_1_volt: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_bat_1_volt
  :field hskp_pwr2_adc_data_reg_sa_volt_1: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_reg_sa_volt_1
  :field hskp_pwr2_adc_data_reg_sa_volt_2: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_reg_sa_volt_2
  :field hskp_pwr2_adc_data_reg_sa_volt_3: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_reg_sa_volt_3
  :field hskp_pwr2_adc_data_power_bus_current_1: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_power_bus_current_1
  :field hskp_pwr2_adc_data_power_bus_current_2: ax25_frame.payload.ax25_info.hskp_pwr2_adc_data_power_bus_current_2
  :field hskp_pwr2_bat_mon_1_avg_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_1_avg_cur_reg
  :field hskp_pwr2_bat_mon_1_temperature_register: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_1_temperature_register
  :field hskp_pwr2_bat_mon_1_volt_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_1_volt_reg
  :field hskp_pwr2_bat_mon_1_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_1_cur_reg
  :field hskp_pwr2_bat_mon_1_acc_curr_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_1_acc_curr_reg
  :field hskp_pwr2_bat_mon_2_avg_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_2_avg_cur_reg
  :field hskp_pwr2_bat_mon_2_temperature_register: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_2_temperature_register
  :field hskp_pwr2_bat_mon_2_volt_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_2_volt_reg
  :field hskp_pwr2_bat_mon_2_cur_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_2_cur_reg
  :field hskp_pwr2_bat_mon_2_acc_curr_reg: ax25_frame.payload.ax25_info.hskp_pwr2_bat_mon_2_acc_curr_reg
  :field hskp_pwr2_bv_mon: ax25_frame.payload.ax25_info.hskp_pwr2_bv_mon
  :field hskp_pwr2_tmps_tmp1: ax25_frame.payload.ax25_info.hskp_pwr2_tmps_tmp1
  :field hskp_pwr2_tmps_tmp2: ax25_frame.payload.ax25_info.hskp_pwr2_tmps_tmp2
  :field hskp_pwr2_tmps_tmp3: ax25_frame.payload.ax25_info.hskp_pwr2_tmps_tmp3
  :field hskp_pwr2_tmps_tmp4: ax25_frame.payload.ax25_info.hskp_pwr2_tmps_tmp4
  :field hskp_pwr2_accumulated_curr_bat1_rarc: ax25_frame.payload.ax25_info.hskp_pwr2_accumulated_curr_bat1_rarc
  :field hskp_pwr2_accumulated_curr_bat1_rsrc: ax25_frame.payload.ax25_info.hskp_pwr2_accumulated_curr_bat1_rsrc
  :field hskp_pwr2_accumulated_curr_bat2_rarc: ax25_frame.payload.ax25_info.hskp_pwr2_accumulated_curr_bat2_rarc
  :field hskp_pwr2_accumulated_curr_bat2_rsrc: ax25_frame.payload.ax25_info.hskp_pwr2_accumulated_curr_bat2_rsrc
  :field acb_pc_data1_rtcc_year: ax25_frame.payload.ax25_info.acb_pc_data1_rtcc_year
  :field acb_pc_data1_rtcc_month: ax25_frame.payload.ax25_info.acb_pc_data1_rtcc_month
  :field acb_pc_data1_rtcc_day: ax25_frame.payload.ax25_info.acb_pc_data1_rtcc_day
  :field acb_pc_data1_rtcc_hour: ax25_frame.payload.ax25_info.acb_pc_data1_rtcc_hour
  :field acb_pc_data1_rtcc_minute: ax25_frame.payload.ax25_info.acb_pc_data1_rtcc_minute
  :field acb_pc_data1_rtcc_second: ax25_frame.payload.ax25_info.acb_pc_data1_rtcc_second
  :field acb_pc_data1_acb_mrm_x: ax25_frame.payload.ax25_info.acb_pc_data1_acb_mrm_x
  :field acb_pc_data1_acb_mrm_y: ax25_frame.payload.ax25_info.acb_pc_data1_acb_mrm_y
  :field acb_pc_data1_acb_mrm_z: ax25_frame.payload.ax25_info.acb_pc_data1_acb_mrm_z
  :field acb_pc_data1_ipdu_mrm_x: ax25_frame.payload.ax25_info.acb_pc_data1_ipdu_mrm_x
  :field acb_pc_data1_ipdu_mrm_y: ax25_frame.payload.ax25_info.acb_pc_data1_ipdu_mrm_y
  :field acb_pc_data1_ipdu_mrm_z: ax25_frame.payload.ax25_info.acb_pc_data1_ipdu_mrm_z
  :field acb_pc_data1_tmps_tmp1: ax25_frame.payload.ax25_info.acb_pc_data1_tmps_tmp1
  :field acb_pc_data1_tmps_tmp2: ax25_frame.payload.ax25_info.acb_pc_data1_tmps_tmp2
  :field acb_pc_data1_tmps_tmp3: ax25_frame.payload.ax25_info.acb_pc_data1_tmps_tmp3
  :field acb_pc_data1_tmps_tmp4: ax25_frame.payload.ax25_info.acb_pc_data1_tmps_tmp4
  :field acb_pc_data2_rtcc_year: ax25_frame.payload.ax25_info.acb_pc_data2_rtcc_year
  :field acb_pc_data2_rtcc_month: ax25_frame.payload.ax25_info.acb_pc_data2_rtcc_month
  :field acb_pc_data2_rtcc_day: ax25_frame.payload.ax25_info.acb_pc_data2_rtcc_day
  :field acb_pc_data2_rtcc_hour: ax25_frame.payload.ax25_info.acb_pc_data2_rtcc_hour
  :field acb_pc_data2_rtcc_minute: ax25_frame.payload.ax25_info.acb_pc_data2_rtcc_minute
  :field acb_pc_data2_rtcc_second: ax25_frame.payload.ax25_info.acb_pc_data2_rtcc_second
  :field acb_pc_data2_acb_mrm_x: ax25_frame.payload.ax25_info.acb_pc_data2_acb_mrm_x
  :field acb_pc_data2_acb_mrm_y: ax25_frame.payload.ax25_info.acb_pc_data2_acb_mrm_y
  :field acb_pc_data2_acb_mrm_z: ax25_frame.payload.ax25_info.acb_pc_data2_acb_mrm_z
  :field acb_pc_data2_ipdu_mrm_x: ax25_frame.payload.ax25_info.acb_pc_data2_ipdu_mrm_x
  :field acb_pc_data2_ipdu_mrm_y: ax25_frame.payload.ax25_info.acb_pc_data2_ipdu_mrm_y
  :field acb_pc_data2_ipdu_mrm_z: ax25_frame.payload.ax25_info.acb_pc_data2_ipdu_mrm_z
  :field acb_pc_data2_tmps_tmp1: ax25_frame.payload.ax25_info.acb_pc_data2_tmps_tmp1
  :field acb_pc_data2_tmps_tmp2: ax25_frame.payload.ax25_info.acb_pc_data2_tmps_tmp2
  :field acb_pc_data2_tmps_tmp3: ax25_frame.payload.ax25_info.acb_pc_data2_tmps_tmp3
  :field acb_pc_data2_tmps_tmp4: ax25_frame.payload.ax25_info.acb_pc_data2_tmps_tmp4
  :field acb_sense_adc_data_current: ax25_frame.payload.ax25_info.acb_sense_adc_data_current
  :field acb_sense_adc_data_voltage: ax25_frame.payload.ax25_info.acb_sense_adc_data_voltage
  :field fc_counters_cmds_recv: ax25_frame.payload.ax25_info.fc_counters_cmds_recv
  :field fc_counters_badcmds_recv: ax25_frame.payload.ax25_info.fc_counters_badcmds_recv
  :field fc_counters_badpkts_fm_radio: ax25_frame.payload.ax25_info.fc_counters_badpkts_fm_radio
  :field fc_counters_fcpkts_fm_radio: ax25_frame.payload.ax25_info.fc_counters_fcpkts_fm_radio
  :field fc_counters_errors: ax25_frame.payload.ax25_info.fc_counters_errors
  :field fc_counters_reboots: ax25_frame.payload.ax25_info.fc_counters_reboots
  :field fc_counters_intrnl_wdttmout: ax25_frame.payload.ax25_info.fc_counters_intrnl_wdttmout
  :field fc_counters_brwnouts: ax25_frame.payload.ax25_info.fc_counters_brwnouts
  :field fc_counters_wdpicrst: ax25_frame.payload.ax25_info.fc_counters_wdpicrst
  :field fc_counters_porst: ax25_frame.payload.ax25_info.fc_counters_porst
  :field fc_counters_uart1_recvpkts: ax25_frame.payload.ax25_info.fc_counters_uart1_recvpkts
  :field fc_counters_uart1_parseerrs: ax25_frame.payload.ax25_info.fc_counters_uart1_parseerrs
  :field fc_counters_sips_ovcur_evts: ax25_frame.payload.ax25_info.fc_counters_sips_ovcur_evts
  :field fc_counters_vu1_on: ax25_frame.payload.ax25_info.fc_counters_vu1_on
  :field fc_counters_vu1_off: ax25_frame.payload.ax25_info.fc_counters_vu1_off
  :field fc_counters_vu2_on: ax25_frame.payload.ax25_info.fc_counters_vu2_on
  :field fc_counters_vu2_off: ax25_frame.payload.ax25_info.fc_counters_vu2_off
  :field radio_tlm_rssi: ax25_frame.payload.ax25_info.radio_tlm_rssi
  :field radio_tlm_bytes_rx: ax25_frame.payload.ax25_info.radio_tlm_bytes_rx
  :field radio_tlm_bytes_tx: ax25_frame.payload.ax25_info.radio_tlm_bytes_tx
  :field radio_cfg_read_radio_palvl: ax25_frame.payload.ax25_info.radio_cfg_read_radio_palvl
  :field errors_error1_day: ax25_frame.payload.ax25_info.errors_error1_day
  :field errors_error1_hour: ax25_frame.payload.ax25_info.errors_error1_hour
  :field errors_error1_minute: ax25_frame.payload.ax25_info.errors_error1_minute
  :field errors_error1_second: ax25_frame.payload.ax25_info.errors_error1_second
  :field errors_error1_error: ax25_frame.payload.ax25_info.errors_error1_error
  :field errors_error2_day: ax25_frame.payload.ax25_info.errors_error2_day
  :field errors_error2_hour: ax25_frame.payload.ax25_info.errors_error2_hour
  :field errors_error2_minute: ax25_frame.payload.ax25_info.errors_error2_minute
  :field errors_error2_second: ax25_frame.payload.ax25_info.errors_error2_second
  :field errors_error2_error: ax25_frame.payload.ax25_info.errors_error2_error
  :field errors_error3_day: ax25_frame.payload.ax25_info.errors_error3_day
  :field errors_error3_hour: ax25_frame.payload.ax25_info.errors_error3_hour
  :field errors_error3_minute: ax25_frame.payload.ax25_info.errors_error3_minute
  :field errors_error3_second: ax25_frame.payload.ax25_info.errors_error3_second
  :field errors_error3_error: ax25_frame.payload.ax25_info.errors_error3_error
  :field errors_error4_day: ax25_frame.payload.ax25_info.errors_error4_day
  :field errors_error4_hour: ax25_frame.payload.ax25_info.errors_error4_hour
  :field errors_error4_minute: ax25_frame.payload.ax25_info.errors_error4_minute
  :field errors_error4_second: ax25_frame.payload.ax25_info.errors_error4_second
  :field errors_error4_error: ax25_frame.payload.ax25_info.errors_error4_error
  :field errors_error5_day: ax25_frame.payload.ax25_info.errors_error5_day
  :field errors_error5_hour: ax25_frame.payload.ax25_info.errors_error5_hour
  :field errors_error5_minute: ax25_frame.payload.ax25_info.errors_error5_minute
  :field errors_error5_second: ax25_frame.payload.ax25_info.errors_error5_second
  :field errors_error5_error: ax25_frame.payload.ax25_info.errors_error5_error
  :field errors_error6_day: ax25_frame.payload.ax25_info.errors_error6_day
  :field errors_error6_hour: ax25_frame.payload.ax25_info.errors_error6_hour
  :field errors_error6_minute: ax25_frame.payload.ax25_info.errors_error6_minute
  :field errors_error6_second: ax25_frame.payload.ax25_info.errors_error6_second
  :field errors_error6_error: ax25_frame.payload.ax25_info.errors_error6_error
  :field errors_error7_day: ax25_frame.payload.ax25_info.errors_error7_day
  :field errors_error7_hour: ax25_frame.payload.ax25_info.errors_error7_hour
  :field errors_error7_minute: ax25_frame.payload.ax25_info.errors_error7_minute
  :field errors_error7_second: ax25_frame.payload.ax25_info.errors_error7_second
  :field errors_error7_error: ax25_frame.payload.ax25_info.errors_error7_error
  :field fc_salt: ax25_frame.payload.ax25_info.fc_salt
  :field fc_crc: ax25_frame.payload.ax25_info.fc_crc
  :field fc_status_safe_mode: ax25_frame.payload.ax25_info.fc_status_safe_mode
  :field fc_status_reserved: ax25_frame.payload.ax25_info.fc_status_reserved
  :field fc_status_early_orbit: ax25_frame.payload.ax25_info.fc_status_early_orbit
  :field opcode: ax25_frame.payload.ax25_info.opcode
  :field hskp_pwr1_rtcc_year: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_rtcc_year
  :field hskp_pwr1_rtcc_month: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_rtcc_month
  :field hskp_pwr1_rtcc_day: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_rtcc_day
  :field hskp_pwr1_rtcc_hour: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_rtcc_hour
  :field hskp_pwr1_rtcc_minute: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_rtcc_minute
  :field hskp_pwr1_rtcc_second: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_rtcc_second
  :field hskp_pwr1_pwr_board_id: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_pwr_board_id
  :field hskp_pwr1_adc_data_adc_sa_volt_12: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_adc_sa_volt_12
  :field hskp_pwr1_adc_data_adc_sa_volt_34: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_adc_sa_volt_34
  :field hskp_pwr1_adc_data_adc_sa_volt_56: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_adc_sa_volt_56
  :field hskp_pwr1_adc_data_sa_short_circuit_current: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_sa_short_circuit_current
  :field hskp_pwr1_adc_data_bat_2_volt: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_bat_2_volt
  :field hskp_pwr1_adc_data_bat_1_volt: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_bat_1_volt
  :field hskp_pwr1_adc_data_reg_sa_volt_1: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_reg_sa_volt_1
  :field hskp_pwr1_adc_data_reg_sa_volt_2: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_reg_sa_volt_2
  :field hskp_pwr1_adc_data_reg_sa_volt_3: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_reg_sa_volt_3
  :field hskp_pwr1_adc_data_power_bus_current_1: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_power_bus_current_1
  :field hskp_pwr1_adc_data_power_bus_current_2: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_adc_data_power_bus_current_2
  :field hskp_pwr1_bat_mon_1_avg_cur_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_1_avg_cur_reg
  :field hskp_pwr1_bat_mon_1_temperature_register: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_1_temperature_register
  :field hskp_pwr1_bat_mon_1_volt_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_1_volt_reg
  :field hskp_pwr1_bat_mon_1_cur_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_1_cur_reg
  :field hskp_pwr1_bat_mon_1_acc_curr_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_1_acc_curr_reg
  :field hskp_pwr1_bat_mon_2_avg_cur_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_2_avg_cur_reg
  :field hskp_pwr1_bat_mon_2_temperature_register: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_2_temperature_register
  :field hskp_pwr1_bat_mon_2_volt_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_2_volt_reg
  :field hskp_pwr1_bat_mon_2_cur_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_2_cur_reg
  :field hskp_pwr1_bat_mon_2_acc_curr_reg: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bat_mon_2_acc_curr_reg
  :field hskp_pwr1_bv_mon: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_bv_mon
  :field hskp_pwr1_tmps_tmp1: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_tmps_tmp1
  :field hskp_pwr1_tmps_tmp2: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_tmps_tmp2
  :field hskp_pwr1_tmps_tmp3: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_tmps_tmp3
  :field hskp_pwr1_tmps_tmp4: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_tmps_tmp4
  :field hskp_pwr1_accumulated_curr_bat1_rsrc: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_accumulated_curr_bat1_rsrc
  :field hskp_pwr1_accumulated_curr_bat2_rsrc: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_accumulated_curr_bat2_rsrc
  :field hskp_pwr1_accumulated_curr_bat1_rarc: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_accumulated_curr_bat1_rarc
  :field hskp_pwr1_accumulated_curr_bat2_rarc: ax25_frame.payload.ax25_info.cmd_response.hskp_pwr1_accumulated_curr_bat2_rarc

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
        process: satnogsdecoders.process.elfin_pp
        size-eos: true
        type:
          switch-on: _io.size
          cases:
            269: tlm_data
            _: cmd_response

  tlm_data:
    doc-ref: 'https://elfin.igpp.ucla.edu/s/Beacon-Format_v2.xlsx'
    seq:
      - id: frame_start
        contents: [0x93]
        doc: |
          0x93 marks the framestart
          Any data byte following after this framestart must not contain:
          0x27, 0x5e or 0x93, as 0x93 is the framestart and 0x5e is the
          frameend! If a value reaches 0x93 or 0x5e, this byte is escaped by
          0x27. This also throws an exception on values containing 0x27 itself.
          An additional escape character (0x27) is added to escape the escape
          character.
          Substitutions:
          b'\x2727' -> b'\x27'
          b'\x275e' -> b'\x5e'
          b'\x2793' -> b'\x93'
          With some values containing 0x27 the maximum size of an ax.25 UI
          frame is exceeded (254 bytes).
          The 'preprocessing' to remove the escapoe sequences is done by an
          external process called 'elfin_pp' and is implemented in a separate
          file.

      - id: beacon_setting
        type: u1
      - id: status_1_early_orbit
        type: b4
      - id: status_1_reserved
        type: b3
      - id: status_1_safe_mode
        type: b1
        doc: 'Safe mode (first bit), early orbit flags (last 4 bits)'

      - id: status_2_reserved
        type: b3
      - id: status_2_htr_alert
        type: b1
      - id: status_2_htr_force
        type: b1
      - id: status_2_bat_htr_allow
        type: b1
      - id: status_2_9v_boost
        type: b1
      - id: status_2_payload_power
        type: b1
        doc: |
          Bits 7 to 3 (in order):
          Payload Power, 9V Boost, battery heater allow, heater force,
          heater alert

      - id: reserved
        type: u1

      - id: hskp_pwr1_rtcc_year
        type: u1
      - id: hskp_pwr1_rtcc_month
        type: u1
      - id: hskp_pwr1_rtcc_day
        type: u1
      - id: hskp_pwr1_rtcc_hour
        type: u1
      - id: hskp_pwr1_rtcc_minute
        type: u1
      - id: hskp_pwr1_rtcc_second
        type: u1
      - id: hskp_pwr1_adc_data_adc_sa_volt_12
        type: u2
      - id: hskp_pwr1_adc_data_adc_sa_volt_34
        type: u2
      - id: hskp_pwr1_adc_data_adc_sa_volt_56
        type: u2
      - id: hskp_pwr1_adc_data_sa_short_circuit_current
        type: u2
      - id: hskp_pwr1_adc_data_bat_2_volt
        type: u2
      - id: hskp_pwr1_adc_data_bat_1_volt
        type: u2
      - id: hskp_pwr1_adc_data_reg_sa_volt_1
        type: u2
      - id: hskp_pwr1_adc_data_reg_sa_volt_2
        type: u2
      - id: hskp_pwr1_adc_data_reg_sa_volt_3
        type: u2
      - id: hskp_pwr1_adc_data_power_bus_current_1
        type: u2
      - id: hskp_pwr1_adc_data_power_bus_current_2
        type: u2
      - id: hskp_pwr1_bat_mon_1_avg_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_1_temperature_register
        type: s2
      - id: hskp_pwr1_bat_mon_1_volt_reg
        type: s2
      - id: hskp_pwr1_bat_mon_1_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_1_acc_curr_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_avg_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_temperature_register
        type: s2
      - id: hskp_pwr1_bat_mon_2_volt_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_acc_curr_reg
        type: s2
      - id: hskp_pwr1_bv_mon
        type: s2
      - id: hskp_pwr1_tmps_tmp1
        type: s2
      - id: hskp_pwr1_tmps_tmp2
        type: s2
      - id: hskp_pwr1_tmps_tmp3
        type: s2
      - id: hskp_pwr1_tmps_tmp4
        type: s2
      - id: hskp_pwr1_accumulated_curr_bat1_rarc
        type: u1
      - id: hskp_pwr1_accumulated_curr_bat1_rsrc
        type: u1
      - id: hskp_pwr1_accumulated_curr_bat2_rarc
        type: u1
      - id: hskp_pwr1_accumulated_curr_bat2_rsrc
        type: u1

      - id: hskp_pwr2_rtcc_year
        type: u1
      - id: hskp_pwr2_rtcc_month
        type: u1
      - id: hskp_pwr2_rtcc_day
        type: u1
      - id: hskp_pwr2_rtcc_hour
        type: u1
      - id: hskp_pwr2_rtcc_minute
        type: u1
      - id: hskp_pwr2_rtcc_second
        type: u1
      - id: hskp_pwr2_adc_data_adc_sa_volt_12
        type: u2
      - id: hskp_pwr2_adc_data_adc_sa_volt_34
        type: u2
      - id: hskp_pwr2_adc_data_adc_sa_volt_56
        type: u2
      - id: hskp_pwr2_adc_data_sa_short_circuit_current
        type: u2
      - id: hskp_pwr2_adc_data_bat_2_volt
        type: u2
      - id: hskp_pwr2_adc_data_bat_1_volt
        type: u2
      - id: hskp_pwr2_adc_data_reg_sa_volt_1
        type: u2
      - id: hskp_pwr2_adc_data_reg_sa_volt_2
        type: u2
      - id: hskp_pwr2_adc_data_reg_sa_volt_3
        type: u2
      - id: hskp_pwr2_adc_data_power_bus_current_1
        type: u2
      - id: hskp_pwr2_adc_data_power_bus_current_2
        type: u2
      - id: hskp_pwr2_bat_mon_1_avg_cur_reg
        type: s2
      - id: hskp_pwr2_bat_mon_1_temperature_register
        type: s2
      - id: hskp_pwr2_bat_mon_1_volt_reg
        type: s2
      - id: hskp_pwr2_bat_mon_1_cur_reg
        type: s2
      - id: hskp_pwr2_bat_mon_1_acc_curr_reg
        type: s2
      - id: hskp_pwr2_bat_mon_2_avg_cur_reg
        type: s2
      - id: hskp_pwr2_bat_mon_2_temperature_register
        type: s2
      - id: hskp_pwr2_bat_mon_2_volt_reg
        type: s2
      - id: hskp_pwr2_bat_mon_2_cur_reg
        type: s2
      - id: hskp_pwr2_bat_mon_2_acc_curr_reg
        type: s2
      - id: hskp_pwr2_bv_mon
        type: s2
      - id: hskp_pwr2_tmps_tmp1
        type: s2
      - id: hskp_pwr2_tmps_tmp2
        type: s2
      - id: hskp_pwr2_tmps_tmp3
        type: s2
      - id: hskp_pwr2_tmps_tmp4
        type: s2
      - id: hskp_pwr2_accumulated_curr_bat1_rarc
        type: u1
      - id: hskp_pwr2_accumulated_curr_bat1_rsrc
        type: u1
      - id: hskp_pwr2_accumulated_curr_bat2_rarc
        type: u1
      - id: hskp_pwr2_accumulated_curr_bat2_rsrc
        type: u1

      - id: acb_pc_data1_rtcc_year
        type: u1
      - id: acb_pc_data1_rtcc_month
        type: u1
      - id: acb_pc_data1_rtcc_day
        type: u1
      - id: acb_pc_data1_rtcc_hour
        type: u1
      - id: acb_pc_data1_rtcc_minute
        type: u1
      - id: acb_pc_data1_rtcc_second
        type: u1
      - id: acb_pc_data1_acb_mrm_x
        type: s2
      - id: acb_pc_data1_acb_mrm_y
        type: s2
      - id: acb_pc_data1_acb_mrm_z
        type: s2
      - id: acb_pc_data1_ipdu_mrm_x
        type: s2
      - id: acb_pc_data1_ipdu_mrm_y
        type: s2
      - id: acb_pc_data1_ipdu_mrm_z
        type: s2
      - id: acb_pc_data1_tmps_tmp1
        type: s2
      - id: acb_pc_data1_tmps_tmp2
        type: s2
      - id: acb_pc_data1_tmps_tmp3
        type: s2
      - id: acb_pc_data1_tmps_tmp4
        type: s2

      - id: acb_pc_data2_rtcc_year
        type: u1
      - id: acb_pc_data2_rtcc_month
        type: u1
      - id: acb_pc_data2_rtcc_day
        type: u1
      - id: acb_pc_data2_rtcc_hour
        type: u1
      - id: acb_pc_data2_rtcc_minute
        type: u1
      - id: acb_pc_data2_rtcc_second
        type: u1
      - id: acb_pc_data2_acb_mrm_x
        type: s2
      - id: acb_pc_data2_acb_mrm_y
        type: s2
      - id: acb_pc_data2_acb_mrm_z
        type: s2
      - id: acb_pc_data2_ipdu_mrm_x
        type: s2
      - id: acb_pc_data2_ipdu_mrm_y
        type: s2
      - id: acb_pc_data2_ipdu_mrm_z
        type: s2
      - id: acb_pc_data2_tmps_tmp1
        type: s2
      - id: acb_pc_data2_tmps_tmp2
        type: s2
      - id: acb_pc_data2_tmps_tmp3
        type: s2
      - id: acb_pc_data2_tmps_tmp4
        type: s2

      - id: acb_sense_adc_data_current
        type: u2le
      - id: acb_sense_adc_data_voltage
        type: u2le

      - id: fc_counters_cmds_recv
        type: u1
      - id: fc_counters_badcmds_recv
        type: u1
      - id: fc_counters_badpkts_fm_radio
        type: u1
      - id: fc_counters_fcpkts_fm_radio
        type: u1
      - id: fc_counters_errors
        type: u1
      - id: fc_counters_reboots
        type: u1
      - id: fc_counters_intrnl_wdttmout
        type: u1
      - id: fc_counters_brwnouts
        type: u1
      - id: fc_counters_wdpicrst
        type: u1
      - id: fc_counters_porst
        type: u1
      - id: fc_counters_uart1_recvpkts
        type: u1
      - id: fc_counters_uart1_parseerrs
        type: u1
      - id: fc_counters_sips_ovcur_evts
        type: u1
      - id: fc_counters_vu1_on
        type: u1
      - id: fc_counters_vu1_off
        type: u1
      - id: fc_counters_vu2_on
        type: u1
      - id: fc_counters_vu2_off
        type: u1

      - id: radio_tlm_rssi
        type: u1
      - id: radio_tlm_bytes_rx
        type: u4
      - id: radio_tlm_bytes_tx
        type: u4

      - id: radio_cfg_read_radio_palvl
        type: u1

      - id: errors_error1_day
        type: u1
      - id: errors_error1_hour
        type: u1
      - id: errors_error1_minute
        type: u1
      - id: errors_error1_second
        type: u1
      - id: errors_error1_error
        type: u1
      - id: errors_error2_day
        type: u1
      - id: errors_error2_hour
        type: u1
      - id: errors_error2_minute
        type: u1
      - id: errors_error2_second
        type: u1
      - id: errors_error2_error
        type: u1
      - id: errors_error3_day
        type: u1
      - id: errors_error3_hour
        type: u1
      - id: errors_error3_minute
        type: u1
      - id: errors_error3_second
        type: u1
      - id: errors_error3_error
        type: u1
      - id: errors_error4_day
        type: u1
      - id: errors_error4_hour
        type: u1
      - id: errors_error4_minute
        type: u1
      - id: errors_error4_second
        type: u1
      - id: errors_error4_error
        type: u1
      - id: errors_error5_day
        type: u1
      - id: errors_error5_hour
        type: u1
      - id: errors_error5_minute
        type: u1
      - id: errors_error5_second
        type: u1
      - id: errors_error5_error
        type: u1
      - id: errors_error6_day
        type: u1
      - id: errors_error6_hour
        type: u1
      - id: errors_error6_minute
        type: u1
      - id: errors_error6_second
        type: u1
      - id: errors_error6_error
        type: u1
      - id: errors_error7_day
        type: u1
      - id: errors_error7_hour
        type: u1
      - id: errors_error7_minute
        type: u1
      - id: errors_error7_second
        type: u1
      - id: errors_error7_error
        type: u1

      - id: fc_salt
        type: str
        encoding: utf-8
        size: 4

      - id: fc_crc
        type: u1

      - id: frame_end
        contents: [0x5e]
        doc: '0x5e marks the end of a frame'

  # hskp_data:
  #   seq:
  #     - id: hskp_pkt
  #       type: hskp_packet
  #       repeat: eos

  hskp_packet:
    seq:
      - id: hskp_pwr1_rtcc_year
        type: u1
      - id: hskp_pwr1_rtcc_month
        type: u1
      - id: hskp_pwr1_rtcc_day
        type: u1
      - id: hskp_pwr1_rtcc_hour
        type: u1
      - id: hskp_pwr1_rtcc_minute
        type: u1
      - id: hskp_pwr1_rtcc_second
        type: u1
      - id: hskp_pwr1_pwr_board_id
        type: u1
      - id: hskp_pwr1_adc_data_adc_sa_volt_12
        type: u2
      - id: hskp_pwr1_adc_data_adc_sa_volt_34
        type: u2
      - id: hskp_pwr1_adc_data_adc_sa_volt_56
        type: u2
      - id: hskp_pwr1_adc_data_sa_short_circuit_current
        type: u2
      - id: hskp_pwr1_adc_data_bat_2_volt
        type: u2
      - id: hskp_pwr1_adc_data_bat_1_volt
        type: u2
      - id: hskp_pwr1_adc_data_reg_sa_volt_1
        type: u2
      - id: hskp_pwr1_adc_data_reg_sa_volt_2
        type: u2
      - id: hskp_pwr1_adc_data_reg_sa_volt_3
        type: u2
      - id: hskp_pwr1_adc_data_power_bus_current_1
        type: u2
      - id: hskp_pwr1_adc_data_power_bus_current_2
        type: u2
      - id: hskp_pwr1_bat_mon_1_avg_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_1_temperature_register
        type: s2
      - id: hskp_pwr1_bat_mon_1_volt_reg
        type: s2
      - id: hskp_pwr1_bat_mon_1_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_1_acc_curr_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_avg_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_temperature_register
        type: s2
      - id: hskp_pwr1_bat_mon_2_volt_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_cur_reg
        type: s2
      - id: hskp_pwr1_bat_mon_2_acc_curr_reg
        type: s2
      - id: hskp_pwr1_bv_mon
        type: s2
      - id: hskp_pwr1_tmps_tmp1
        type: s2
      - id: hskp_pwr1_tmps_tmp2
        type: s2
      - id: hskp_pwr1_tmps_tmp3
        type: s2
      - id: hskp_pwr1_tmps_tmp4
        type: s2
      - id: hskp_pwr1_accumulated_curr_bat1_rsrc
        type: u1
      - id: hskp_pwr1_accumulated_curr_bat2_rsrc
        type: u1
      - id: hskp_pwr1_accumulated_curr_bat1_rarc
        type: u1
      - id: hskp_pwr1_accumulated_curr_bat2_rarc
        type: u1
      - id: fc_status_early_orbit
        type: b4
      - id: fc_status_reserved
        type: b3
      - id: fc_status_safe_mode
        type: b1
        doc: 'Safe mode (first bit), early orbit flags (last 4 bits)'

  cmd_response:
    seq:
      - id: frame_start
        contents: [0x93]
        doc: '0x93 marks the framestart'
      - id: opcode
        type: u1
      - id: cmd_response
        # repeat: eos
        type:
          switch-on: opcode
          cases:
            0x30: hskp_packet
      - id: fc_crc
        type: u1
      - id: frame_end
        contents: [0x5e]
        doc: '0x5e marks the end of a frame'
