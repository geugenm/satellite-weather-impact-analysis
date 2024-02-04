---
meta:
  id: catsat
  endian: be
doc: |
  :field type: packet.header.type

  :field callsign: packet.payload.callsign
  :field motd: packet.payload.motd

  :field obc_temp_mcu: packet.payload.obc_temp_mcu
  :field obc_boot_cnt: packet.payload.obc_boot_cnt
  :field obc_clock: packet.payload.obc_clock
  :field batt_vbatt: packet.payload.bpx_vbatt
  :field batt_temp_0: packet.payload.bpx_temp
  :field batt_boot_cnt: packet.payload.bpx_boot_cnt
  :field ax100_temp_brd: packet.payload.ax100_temp_brd
  :field ax100_boot_cnt: packet.payload.ax100_boot_cnt
  :field ax100_last_contact: packet.payload.ax100_last_contact
  :field p60_boot_cnt: packet.payload.p60_boot_cnt
  :field p60_batt_mode: packet.payload.p60_batt_mode
  :field p60_batt_v: packet.payload.p60_batt_v
  :field p60_batt_c: packet.payload.p60_batt_c
  :field pdu_x2_cout_obc: packet.payload.pdu_x2_cout.0
  :field pdu_x2_cout_hdcam: packet.payload.pdu_x2_cout.1
  :field pdu_x2_cout_ant_sel: packet.payload.pdu_x2_cout.2
  :field pdu_x2_cout_met_pwr: packet.payload.pdu_x2_cout.3
  :field pdu_x2_cout_wspr_dep: packet.payload.pdu_x2_cout.5
  :field pdu_x2_cout_asdr: packet.payload.pdu_x2_cout.6
  :field pdu_x2_cout_ax100: packet.payload.pdu_x2_cout.7
  :field pdu_x2_cout_inf_5v: packet.payload.pdu_x2_cout.8

  :field pdu_x3_cout_hf_up: packet.payload.pdu_x3_cout.0
  :field pdu_x3_cout_xband: packet.payload.pdu_x3_cout.1
  :field pdu_x3_cout_adcs: packet.payload.pdu_x3_cout.2
  :field pdu_x3_cout_rwheels: packet.payload.pdu_x3_cout.3
  :field pdu_x3_cout_gyro: packet.payload.pdu_x3_cout.4
  :field pdu_x3_cout_met_sel: packet.payload.pdu_x3_cout.5
  :field pdu_x3_cout_inf_12v: packet.payload.pdu_x3_cout.6
  :field pdu_x3_cout_inf_3v: packet.payload.pdu_x3_cout.7
  :field acu_power_0: packet.payload.acu_power.0
  :field acu_power_1: packet.payload.acu_power.1
  :field acu_power_2: packet.payload.acu_power.2
  :field acu_power_3: packet.payload.acu_power.3
  :field acu_power_4: packet.payload.acu_power.4
  :field acu_power_5: packet.payload.acu_power.5
  :field adcs_boot_cnt: packet.payload.adcs_boot_cnt
  :field adcs_clock: packet.payload.adcs_clock
  :field extgyro_x: packet.payload.extgyro.0
  :field extgyro_y: packet.payload.extgyro.1
  :field extgyro_z: packet.payload.extgyro.2
  :field gps_pos_x: packet.payload.gps_pos.0
  :field gps_pos_y: packet.payload.gps_pos.1
  :field gps_pos_z: packet.payload.gps_pos.2
  :field gps_vel_x: packet.payload.gps_vel.0
  :field gps_vel_y: packet.payload.gps_vel.1
  :field gps_vel_z: packet.payload.gps_vel.2
  :field acs_mode: packet.payload.acs_mode
  :field status_extmag: packet.payload.status_extmag
  :field status_fss_xneg: packet.payload.status_fss.0
  :field status_fss_yneg: packet.payload.status_fss.1
  :field status_fss_zneg: packet.payload.status_fss.2
  :field status_fss_xpos: packet.payload.status_fss.3
  :field status_fss_ypos: packet.payload.status_fss.4
  :field status_extgyro: packet.payload.status_extgyro
  :field status_gps: packet.payload.status_gps

  :field obc_fs_mnted: packet.payload.obc_fs_mnted
  :field obc_temp_ram: packet.payload.obc_temp_ram
  :field obc_resetcause: packet.payload.obc_resetcause
  :field obc_bootcause: packet.payload.obc_bootcause
  :field obc_uptime: packet.payload.obc_uptime
  :field batt_charge: packet.payload.batt_charge
  :field batt_dcharge: packet.payload.batt_dcharge
  :field batt_heater: packet.payload.batt_heater
  :field batt_temp_1: packet.payload.batt_temp2
  :field batt_temp_2: packet.payload.batt_temp3
  :field batt_temp_3: packet.payload.batt_temp4
  :field batt_bootcause: packet.payload.batt_bootcause
  :field sat_temps_met_cam: packet.payload.sat_temps.0
  :field sat_temps_hd_cam: packet.payload.sat_temps.1
  :field sat_temps_asdr: packet.payload.sat_temps.2
  :field sat_temps_xband: packet.payload.sat_temps.3
  :field sat_temps_rad_y: packet.payload.sat_temps.4
  :field sat_temps_rad_z: packet.payload.sat_temps.5
  :field ax100_reboot_in: packet.payload.ax100_reboot_in
  :field ax100_tx_inhibit: packet.payload.ax100_tx_inhibit
  :field ax100_rx_freq: packet.payload.ax100_rx_freq
  :field ax100_rx_baud: packet.payload.ax100_rx_baud
  :field ax100_temp_pa: packet.payload.ax100_temp_pa
  :field ax100_last_rssi: packet.payload.ax100_last_rssi
  :field ax100_active_conf: packet.payload.ax100_active_conf
  :field ax100_bootcause: packet.payload.ax100_bootcause
  :field ax100_bgnd_rssi: packet.payload.ax100_bgnd_rssi
  :field ax100_tx_duty: packet.payload.ax100_tx_duty
  :field ax100_tx_freq: packet.payload.ax100_tx_freq
  :field ax100_tx_baud: packet.payload.ax100_tx_baud

  :field p60_cout_acu_x1_vcc: packet.payload.p60_cout.0
  :field p60_cout_pdu_x2_vcc: packet.payload.p60_cout.1
  :field p60_cout_pdu_x3_vcc: packet.payload.p60_cout.2
  :field p60_cout_acu_x1_vbatt: packet.payload.p60_cout.4
  :field p60_cout_pdu_x2_vbatt: packet.payload.p60_cout.5
  :field p60_cout_pdu_x3_vbatt: packet.payload.p60_cout.6
  :field p60_cout_stk_vbatt: packet.payload.p60_cout.8
  :field p60_cout_stk_3v: packet.payload.p60_cout.9
  :field p60_cout_stk_5v: packet.payload.p60_cout.10
  :field p60_cout_gssb_3v: packet.payload.p60_cout.11
  :field p60_cout_gssb_5v: packet.payload.p60_cout.12
  :field p60_out_en_acu_x1_vcc: packet.payload.p60_out_en.0
  :field p60_out_en_pdu_x2_vcc: packet.payload.p60_out_en.1
  :field p60_out_en_pdu_x3_vcc: packet.payload.p60_out_en.2
  :field p60_out_en_acu_x1_vbatt: packet.payload.p60_out_en.4
  :field p60_out_en_pdu_x2_vbatt: packet.payload.p60_out_en.5
  :field p60_out_en_pdu_x3_vbatt: packet.payload.p60_out_en.6
  :field p60_out_en_stk_vbatt:packet.payload.p60_out_en.8
  :field p60_out_en_stk_3v: packet.payload.p60_out_en.9
  :field p60_out_en_stk_5v: packet.payload.p60_out_en.10
  :field p60_out_en_gssb_3v: packet.payload.p60_out_en.11
  :field p60_out_en_gssb_5v: packet.payload.p60_out_en.12
  :field p60_temp_0: packet.payload.p60_temp.0
  :field p60_temp_1: packet.payload.p60_temp.1
  :field p60_bootcause: packet.payload.p60_bootcause
  :field p60_uptime: packet.payload.p60_uptime
  :field p60_resetcause: packet.payload.p60_resetcause
  :field p60_latchup_acu_x1_vcc: packet.payload.p60_latchup.0
  :field p60_latchup_pdu_x2_vcc: packet.payload.p60_latchup.1
  :field p60_latchup_pdu_x3_vcc: packet.payload.p60_latchup.2
  :field p60_latchup_acu_x1_vbatt:  packet.payload.p60_latchup.4
  :field p60_latchup_pdu_x2_vbatt:  packet.payload.p60_latchup.5
  :field p60_latchup_pdu_x3_vbatt:  packet.payload.p60_latchup.6
  :field p60_latchup_stk_vbatt: packet.payload.p60_latchup.8
  :field p60_latchup_stk_3v: packet.payload.p60_latchup.9
  :field p60_latchup_stk_5v: packet.payload.p60_latchup.10
  :field p60_latchup_gssb_3v: packet.payload.p60_latchup.11
  :field p60_latchup_gssb_5v: packet.payload.p60_latchup.12
  :field p60_vcc_c: packet.payload.p60_vcc_c
  :field p60_batt_v: packet.payload.p60_batt_v
  :field p60_dearm_status: packet.payload.p60_dearm_status
  :field p60_wdt_cnt_gnd: packet.payload.p60_wdt_cnt_gnd
  :field p60_wdt_cnt_can: packet.payload.p60_wdt_cnt_can
  :field p60_wdt_cnt_left: packet.payload.p60_wdt_cnt_left
  :field p60_batt_chrg: packet.payload.p60_batt_chrg
  :field p60_batt_dchrg: packet.payload.p60_batt_dchrg
  :field ant6_depl: packet.payload.ant6_depl
  :field ar6_depl: packet.payload.ar6_depl
  :field pdu_x2_vout_obc: packet.payload.pdu_x2_vout.0
  :field pdu_x2_vout_hdcam: packet.payload.pdu_x2_vout.1
  :field pdu_x2_vout_ant_sel: packet.payload.pdu_x2_vout.2
  :field pdu_x2_vout_met_pwr: packet.payload.pdu_x2_vout.3
  :field pdu_x2_vout_wspr_dep: packet.payload.pdu_x2_vout.5
  :field pdu_x2_vout_asdr: packet.payload.pdu_x2_vout.6
  :field pdu_x2_vout_ax100: packet.payload.pdu_x2_vout.7
  :field pdu_x2_vout_inf_5v: packet.payload.pdu_x2_vout.8
  :field pdu_x2_temp: packet.payload.pdu_x2_temp
  :field pdu_x2_out_en_obc: packet.payload.pdu_x2_out_en.0
  :field pdu_x2_out_en_hdcam: packet.payload.pdu_x2_out_en.1
  :field pdu_x2_out_en_ant_sel: packet.payload.pdu_x2_out_en.2
  :field pdu_x2_out_en_met_pwr: packet.payload.pdu_x2_out_en.3
  :field pdu_x2_out_en_wspr_dep: packet.payload.pdu_x2_out_en.5
  :field pdu_x2_out_en_asdr: packet.payload.pdu_x2_out_en.6
  :field pdu_x2_out_en_ax100: packet.payload.pdu_x2_out_en.7
  :field pdu_x2_out_en_inf_5v: packet.payload.pdu_x2_out_en.8
  :field pdu_x2_bootcause: packet.payload.pdu_x2_bootcause
  :field pdu_x2_boot_cnt: packet.payload.pdu_x2_boot_cnt
  :field pdu_x2_uptime: packet.payload.pdu_x2_uptime
  :field pdu_x2_resetcause: packet.payload.pdu_x2_resetcause
  :field pdu_x2_latchup_obc: packet.payload.pdu_x2_latchup.0
  :field pdu_x2_latchup_hdcam: packet.payload.pdu_x2_latchup.1
  :field pdu_x2_latchup_ant_sel: packet.payload.pdu_x2_latchup.2
  :field pdu_x2_latchup_met_pwr: packet.payload.pdu_x2_latchup.3
  :field pdu_x2_latchup_wspr_dep: packet.payload.pdu_x2_latchup.5
  :field pdu_x2_latchup_asdr: packet.payload.pdu_x2_latchup.6
  :field pdu_x2_latchup_ax100: packet.payload.pdu_x2_latchup.7
  :field pdu_x2_latchup_inf_5v: packet.payload.pdu_x2_latchup.8

  :field pdu_x3_vout_hf_up: packet.payload.pdu_x3_vout.0
  :field pdu_x3_vout_xband: packet.payload.pdu_x3_vout.1
  :field pdu_x3_vout_adcs: packet.payload.pdu_x3_vout.2
  :field pdu_x3_vout_rwheels: packet.payload.pdu_x3_vout.3
  :field pdu_x3_vout_gyro: packet.payload.pdu_x3_vout.4
  :field pdu_x3_vout_met_sel: packet.payload.pdu_x3_vout.5
  :field pdu_x3_vout_inf_12v: packet.payload.pdu_x3_vout.6
  :field pdu_x3_vout_inf_3v: packet.payload.pdu_x3_vout.7
  :field pdu_x3_temp: packet.payload.pdu_x3_temp
  :field pdu_x3_out_en_hf_up: packet.payload.pdu_x3_out_en.0
  :field pdu_x3_out_en_xband: packet.payload.pdu_x3_out_en.1
  :field pdu_x3_out_en_adcs: packet.payload.pdu_x3_out_en.2
  :field pdu_x3_out_en_rwheels: packet.payload.pdu_x3_out_en.3
  :field pdu_x3_out_en_gyro: packet.payload.pdu_x3_out_en.4
  :field pdu_x3_out_en_met_sel: packet.payload.pdu_x3_out_en.5
  :field pdu_x3_out_en_inf_12v: packet.payload.pdu_x3_out_en.6
  :field pdu_x3_out_en_inf_3v: packet.payload.pdu_x3_out_en.7
  :field pdu_x3_bootcause: packet.payload.pdu_x3_bootcause
  :field pdu_x3_boot_cnt: packet.payload.pdu_x3_boot_cnt
  :field pdu_x3_uptime: packet.payload.pdu_x3_uptime
  :field pdu_x3_resetcause: packet.payload.pdu_x3_resetcause
  :field pdu_x3_latchup_hf_up: packet.payload.pdu_x3_latchup.0
  :field pdu_x3_latchup_xband: packet.payload.pdu_x3_latchup.1
  :field pdu_x3_latchup_adcs: packet.payload.pdu_x3_latchup.2
  :field pdu_x3_latchup_rwheels: packet.payload.pdu_x3_latchup.3
  :field pdu_x3_latchup_gyro: packet.payload.pdu_x3_latchup.4
  :field pdu_x3_latchup_met_sel: packet.payload.pdu_x3_latchup.5
  :field pdu_x3_latchup_inf_12v: packet.payload.pdu_x3_latchup.6
  :field pdu_x3_latchup_inf_3v: packet.payload.pdu_x3_latchup.7
  :field acu_cin_0: packet.payload.acu_cin.0
  :field acu_cin_1: packet.payload.acu_cin.1
  :field acu_cin_2: packet.payload.acu_cin.2
  :field acu_cin_3: packet.payload.acu_cin.3
  :field acu_cin_4: packet.payload.acu_cin.4
  :field acu_cin_5: packet.payload.acu_cin.5
  :field acu_vin_0: packet.payload.acu_vin.0
  :field acu_vin_1: packet.payload.acu_vin.1
  :field acu_vin_2: packet.payload.acu_vin.2
  :field acu_vin_3: packet.payload.acu_vin.3
  :field acu_vin_4: packet.payload.acu_vin.4
  :field acu_vin_5: packet.payload.acu_vin.5
  :field acu_vbatt: packet.payload.acu_vbatt
  :field acu_temp_0: packet.payload.acu_temp.0
  :field acu_temp_1: packet.payload.acu_temp.1
  :field acu_temp_2: packet.payload.acu_temp.2
  :field acu_mppt_mode: packet.payload.acu_mppt_mode
  :field acu_vboost_0: packet.payload.acu_vboost.0
  :field acu_vboost_1: packet.payload.acu_vboost.1
  :field acu_vboost_2: packet.payload.acu_vboost.2
  :field acu_vboost_3: packet.payload.acu_vboost.3
  :field acu_vboost_4: packet.payload.acu_vboost.4
  :field acu_vboost_5: packet.payload.acu_vboost.5
  :field acu_bootcause: packet.payload.acu_bootcause
  :field acu_boot_cnt: packet.payload.acu_boot_cnt
  :field acu_uptime: packet.payload.acu_uptime
  :field acu_resetcause: packet.payload.acu_resetcause

  :field ant_1_brn: packet.payload_ant_1_brn
  :field ant_2_brn: packet.payload_ant_2_brn
  :field ant_3_brn: packet.payload_ant_3_brn
  :field ant_4_brn: packet.payload_ant_4_brn
  :field ant_1_rel: packet.payload_ant_1_rel
  :field ant_2_rel: packet.payload_ant_2_rel
  :field ant_3_rel: packet.payload_ant_3_rel
  :field ant_4_rel: packet.payload_ant_4_rel
  :field dsp_1_brn: packet.payload_dsp_1_brn
  :field dsp_2_brn: packet.payload_dsp_2_brn
  :field dsp_1_rel: packet.payload_dsp_1_rel
  :field dsp_2_rel: packet.payload_dsp_2_rel

  :field extmag_x: packet.payload.extmag.0
  :field extmag_y: packet.payload.extmag.1
  :field extmag_z: packet.payload.extmag.2
  :field extmag_temp: packet.payload.extmag_temp
  :field extmag_valid: packet.payload.extmag_valid
  :field suns_xneg: packet.payload.suns.0
  :field suns_yneg: packet.payload.suns.1
  :field suns_xpos: packet.payload.suns.3
  :field suns_ypos: packet.payload.suns.4
  :field suns_zpos: packet.payload.suns.5
  :field suns_temp_xneg: packet.payload.suns_temp.0
  :field suns_temp_yneg: packet.payload.suns_temp.1
  :field suns_temp_xpos: packet.payload.suns_temp.3
  :field suns_temp_ypos: packet.payload.suns_temp.4
  :field suns_temp_zpos: packet.payload.suns_temp.5
  :field suns_valid: packet.payload.suns_valid
  :field extgyro_x: packet.payload.extgyro.0
  :field extgyro_y: packet.payload.extgyro.1
  :field extgyro_z: packet.payload.extgyro.2
  :field extgyro_temp: packet.payload.extgyro_temp
  :field extgyro_valid: packet.payload.extgyro_valid
  :field fss_xneg_x: packet.payload.fss.0
  :field fss_xneg_y: packet.payload.fss.1
  :field fss_xneg_z: packet.payload.fss.2
  :field fss_yneg_x: packet.payload.fss.3
  :field fss_yneg_y: packet.payload.fss.4
  :field fss_yneg_z: packet.payload.fss.5
  :field fss_zneg_x: packet.payload.fss.6
  :field fss_zneg_y: packet.payload.fss.7
  :field fss_zneg_z: packet.payload.fss.8
  :field fss_xpos_x: packet.payload.fss.9
  :field fss_xpos_y: packet.payload.fss.10
  :field fss_xpos_z: packet.payload.fss.11
  :field fss_ypos_x: packet.payload.fss.12
  :field fss_ypos_y: packet.payload.fss.13
  :field fss_ypos_z: packet.payload.fss.14
  :field fss_temp: packet.payload.fss_temp
  :field fss_valid_xneg: packet.payload.fss_valid.0
  :field fss_valid_yneg: packet.payload.fss_valid.1
  :field fss_valid_zneg: packet.payload.fss_valid.2
  :field fss_valid_xpos: packet.payload.fss_valid.3
  :field fss_valid_ypos: packet.payload.fss_valid.4
  :field gps_pos_x: packet.payload.gps_pos.0
  :field gps_pos_y: packet.payload.gps_pos.1
  :field gps_pos_z: packet.payload.gps_pos.2
  :field gps_vel_x: packet.payload.gps_vel.0
  :field gps_vel_y: packet.payload.gps_vel.1
  :field gps_vel_z: packet.payload.gps_vel.2
  :field gps_epoch: packet.payload.gps_epoch
  :field gps_valid: packet.payload.gps_valid
  :field gps_sat: packet.payload.gps_sat
  :field gps_satsol: packet.payload.gps_satsol
  :field pps_unix: packet.payload.pps_unix

  :field wheel_torque_0: packet.payload.wheel_torque.0
  :field wheel_torque_1: packet.payload.wheel_torque.1
  :field wheel_torque_2: packet.payload.wheel_torque.2
  :field wheel_torque_3: packet.payload.wheel_torque.3
  :field wheel_momentum_0: packet.payload.wheel_momentum.0
  :field wheel_momentum_1: packet.payload.wheel_momentum.1
  :field wheel_momentum_2: packet.payload.wheel_momentum.2
  :field wheel_momentum_3: packet.payload.wheel_momentum.3
  :field wheel_speed_0: packet.payload.wheel_speed.0
  :field wheel_speed_1: packet.payload.wheel_speed.1
  :field wheel_speed_2: packet.payload.wheel_speed.2
  :field wheel_speed_3: packet.payload.wheel_speed.3
  :field wheel_enable_0: packet.payload.wheel_enable.0
  :field wheel_enable_1: packet.payload.wheel_enable.1
  :field wheel_enable_2: packet.payload.wheel_enable.2
  :field wheel_enable_3: packet.payload.wheel_enable.3
  :field wheel_current_0: packet.payload.wheel_current.0
  :field wheel_current_1: packet.payload.wheel_current.1
  :field wheel_current_2: packet.payload.wheel_current.2
  :field wheel_current_3: packet.payload.wheel_current.3
  :field torquer_duty_x: packet.payload.torquer_duty.0
  :field torquer_duty_y: packet.payload.torquer_duty.1
  :field torquer_duty_z: packet.payload.torquer_duty.2
  :field torquer_calib_x: packet.payload.torquer_calib.0
  :field torquer_calib_y: packet.payload.torquer_calib.1
  :field torquer_calib_z: packet.payload.torquer_calib.2
  :field acs_mode: packet.payload.acs_mode
  :field acs_dmode: packet.payload.acs_dmode
  :field ads_mode: packet.payload.ads_mode
  :field ads_dmode: packet.payload.ads_dmode
  :field ephem_mode: packet.payload.ephem_mode
  :field ephem_dmode: packet.payload.ephem_dmode
  :field spin_mode: packet.payload.spin_mode
  :field status_mag: packet.payload.status_mag
  :field status_extmag: packet.payload.status_extmag
  :field status_css: packet.payload.status_css
  :field status_fss_xneg: packet.payload.status_fss.0
  :field status_fss_yneg: packet.payload.status_fss.1
  :field status_fss_zneg: packet.payload.status_fss.2
  :field status_fss_xpos: packet.payload.status_fss.3
  :field status_fss_ypos: packet.payload.status_fss.4
  :field status_gyro: packet.payload.status_gyro
  :field status_extgyro: packet.payload.status_extgyro
  :field status_gps: packet.payload.status_gps
  :field status_bdot: packet.payload.status_bdot
  :field status_ukf: packet.payload.status_ukf
  :field status_etime: packet.payload.status_etime
  :field status_ephem: packet.payload.status_ephem
  :field status_run: packet.payload.status_run
  :field looptime: packet.payload.looptime
  :field max_looptime: packet.payload.max_looptime
  :field bdot_rate_filter1: packet.payload.bdot_rate.0
  :field bdot_rate_filter2: packet.payload.bdot_rate.1
  :field bdot_dmag_x: packet.payload.bdot_dmag.0
  :field bdot_dmag_y: packet.payload.bdot_dmag.1
  :field bdot_dmag_z: packet.payload.bdot_dmag.2
  :field bdot_torquer_x: packet.payload.bdot_torquer.0
  :field bdot_torquer_y: packet.payload.bdot_torquer.1
  :field bdot_torquer_z: packet.payload.bdot_torquer.2
  :field bdot_detumble: packet.payload.bdot_detumble

  :field ukf_x_0: packet.payload.ukf_x.0
  :field ukf_x_1: packet.payload.ukf_x.1
  :field ukf_x_2: packet.payload.ukf_x.2
  :field ukf_x_3: packet.payload.ukf_x.3
  :field ukf_x_4: packet.payload.ukf_x.4
  :field ukf_x_5: packet.payload.ukf_x.5
  :field ukf_x_6: packet.payload.ukf_x.6
  :field ukf_x_7: packet.payload.ukf_x.7
  :field ukf_x_8: packet.payload.ukf_x.8
  :field ukf_x_9: packet.payload.ukf_x.9
  :field ukf_x_10: packet.payload.ukf_x.10
  :field ukf_x_11: packet.payload.ukf_x.11
  :field ukf_x_12: packet.payload.ukf_x.12
  :field ukf_q_0: packet.payload.ukf_q.0
  :field ukf_q_1: packet.payload.ukf_q.1
  :field ukf_q_2: packet.payload.ukf_q.2
  :field ukf_q_3: packet.payload.ukf_q.3
  :field ukf_w_0: packet.payload.ukf_w.0
  :field ukf_w_1: packet.payload.ukf_w.1
  :field ukf_w_2: packet.payload.ukf_w.2
  :field ukf_xpred_0: packet.payload.ukf_xpred.0
  :field ukf_xpred_1: packet.payload.ukf_xpred.1
  :field ukf_xpred_2: packet.payload.ukf_xpred.2
  :field ukf_xpred_3: packet.payload.ukf_xpred.3
  :field ukf_xpred_4: packet.payload.ukf_xpred.4
  :field ukf_xpred_5: packet.payload.ukf_xpred.5
  :field ukf_xpred_6: packet.payload.ukf_xpred.6
  :field ukf_xpred_7: packet.payload.ukf_xpred.7
  :field ukf_xpred_8: packet.payload.ukf_xpred.8
  :field ukf_xpred_9: packet.payload.ukf_xpred.9
  :field ukf_xpred_10: packet.payload.ukf_xpred.10
  :field ukf_xpred_11: packet.payload.ukf_xpred.11
  :field ukf_xpred_12: packet.payload.ukf_xpred.12
  :field ukf_zpred_0: packet.payload.ukf_zpred.0
  :field ukf_zpred_1: packet.payload.ukf_zpred.1
  :field ukf_zpred_2: packet.payload.ukf_zpred.2
  :field ukf_zpred_3: packet.payload.ukf_zpred.3
  :field ukf_zpred_4: packet.payload.ukf_zpred.4
  :field ukf_zpred_5: packet.payload.ukf_zpred.5
  :field ukf_zpred_6: packet.payload.ukf_zpred.6
  :field ukf_zpred_7: packet.payload.ukf_zpred.7
  :field ukf_zpred_8: packet.payload.ukf_zpred.8
  :field ukf_zpred_9: packet.payload.ukf_zpred.9
  :field ukf_zpred_10: packet.payload.ukf_zpred.10
  :field ukf_zpred_11: packet.payload.ukf_zpred.11

  :field ukf_z_0: packet.payload.ukf_z.0
  :field ukf_z_1: packet.payload.ukf_z.1
  :field ukf_z_2: packet.payload.ukf_z.2
  :field ukf_z_3: packet.payload.ukf_z.3
  :field ukf_z_4: packet.payload.ukf_z.4
  :field ukf_z_5: packet.payload.ukf_z.5
  :field ukf_z_6: packet.payload.ukf_z.6
  :field ukf_z_7: packet.payload.ukf_z.7
  :field ukf_z_8: packet.payload.ukf_z.8
  :field ukf_z_9: packet.payload.ukf_z.9
  :field ukf_z_10: packet.payload.ukf_z.10
  :field ukf_z_11: packet.payload.ukf_z.11
  :field ukf_enable_0: packet.payload.ukf_enable.0
  :field ukf_enable_1: packet.payload.ukf_enable.1
  :field ukf_enable_2: packet.payload.ukf_enable.2
  :field ukf_enable_3: packet.payload.ukf_enable.3
  :field ukf_enable_4: packet.payload.ukf_enable.4
  :field ukf_enable_5: packet.payload.ukf_enable.5
  :field ukf_enable_6: packet.payload.ukf_enable.6
  :field ukf_enable_7: packet.payload.ukf_enable.7
  :field ukf_enable_8: packet.payload.ukf_enable.8
  :field ukf_enable_9: packet.payload.ukf_enable.9
  :field ukf_enable_10: packet.payload.ukf_enable.10
  :field ukf_enable_11: packet.payload.ukf_enable.11
  :field ukf_sunmax_0: packet.payload.ukf_sunmax.0
  :field ukf_sunmax_1: packet.payload.ukf_sunmax.1
  :field ukf_sunmax_2: packet.payload.ukf_sunmax.2
  :field ukf_sunmax_3: packet.payload.ukf_sunmax.3
  :field ukf_sunmax_4: packet.payload.ukf_sunmax.4
  :field ukf_sunmax_5: packet.payload.ukf_sunmax.5
  :field ukf_in_ecl: packet.payload.ukf_in_eclipse
  :field ukf_choice: packet.payload.ukf_choice
  :field ukf_ctrl_t_0: packet.payload.ukf_ctrl_t.0
  :field ukf_ctrl_t_1: packet.payload.ukf_ctrl_t.1
  :field ukf_ctrl_t_2: packet.payload.ukf_ctrl_t.2
  :field ukf_ctrl_m_0: packet.payload.ukf_ctrl_m.0
  :field ukf_ctrl_m_1: packet.payload.ukf_ctrl_m.1
  :field ukf_ctrl_m_2: packet.payload.ukf_ctrl_m.2
  :field ukf_rate_x: packet.payload.ukf_rate.0
  :field ukf_rate_y: packet.payload.ukf_rate.1
  :field ukf_rate_z: packet.payload.ukf_rate.2

  :field ephem_jdat: packet.payload.ephem_jdat
  :field ephem_reci_0: packet.payload.ephem_reci.0
  :field ephem_reci_1: packet.payload.ephem_reci.1
  :field ephem_reci_2: packet.payload.ephem_reci.2
  :field ephem_veci_0: packet.payload.ephem_veci.0
  :field ephem_veci_1: packet.payload.ephem_veci.1
  :field ephem_veci_2: packet.payload.ephem_veci.2
  :field ephem_sun_eci_x: packet.payload.ephem_sun_eci.0
  :field ephem_sun_eci_y: packet.payload.ephem_sun_eci.1
  :field ephem_sun_eci_z: packet.payload.ephem_sun_eci.2
  :field ephem_quat_ie_0: packet.payload.ephem_quat_ie.0
  :field ephem_quat_ie_1: packet.payload.ephem_quat_ie.1
  :field ephem_quat_ie_2: packet.payload.ephem_quat_ie.2
  :field ephem_quat_ie_3: packet.payload.ephem_quat_ie.3
  :field ephem_quat_io_0: packet.payload.ephem_quat_io.0
  :field ephem_quat_io_1: packet.payload.ephem_quat_io.1
  :field ephem_quat_io_2: packet.payload.ephem_quat_io.2
  :field ephem_quat_io_3: packet.payload.ephem_quat_io.3
  :field ephem_quat_il_0: packet.payload.ephem_quat_il.0
  :field ephem_quat_il_1: packet.payload.ephem_quat_il.1
  :field ephem_quat_il_2: packet.payload.ephem_quat_il.2
  :field ephem_quat_il_3: packet.payload.ephem_quat_il.3
  :field ephem_rate_io_x: packet.payload.ephem_rate_io.0
  :field ephem_rate_io_y: packet.payload.ephem_rate_io.1
  :field ephem_rate_io_z: packet.payload.ephem_rate_io.2
  :field ephem_rate_il_x: packet.payload.ephem_rate_il.0
  :field ephem_rate_il_y: packet.payload.ephem_rate_il.1
  :field ephem_rate_il_z: packet.payload.ephem_rate_il.2
  :field ephem_t_eclipse: packet.payload.ephem_t_eclipse
  :field ephem_time: packet.payload.ephem_time

  :field ads_time: packet.payload.ads_time
  :field acs_time: packet.payload.acs_time
  :field sens_time: packet.payload.sens_time
  :field adcs_swload_cnt1: packet.payload.adcs_swload_cnt1
  :field adcs_fs_mounted: packet.payload.adcs_fs_mounted
  :field adcs_temp_mcu: packet.payload.adcs_temp_mcu
  :field adcs_temp_ram: packet.payload.adcs_temp_ram
  :field adcs_resetcause: packet.payload.adcs_resetcause
  :field adcs_bootcause: packet.payload.adcs_bootcause
  :field adcs_boot_cnt: packet.payload.adcs_boot_cnt
  :field adcs_clock: packet.payload.adcs_clock
  :field adcs_uptime: packet.payload.adcs_uptime

  :field core: packet.payload.core_loaded
  :field sector_history_0: packet.payload.sector_history.0
  :field sector_history_1: packet.payload.sector_history.1
  :field sector_history_2: packet.payload.sector_history.2
  :field sector_history_3: packet.payload.sector_history.3
  :field sector_history_4: packet.payload.sector_history.4
  :field sector_history_5: packet.payload.sector_history.5
  :field sector_history_6: packet.payload.sector_history.6
  :field sector_history_7: packet.payload.sector_history.7
  :field sector_history_8: packet.payload.sector_history.8
  :field sector_history_9: packet.payload.sector_history.9
  :field sector_history_10: packet.payload.sector_history.10
  :field sector_history_11: packet.payload.sector_history.11
  :field sector_history_12: packet.payload.sector_history.12
  :field sector_history_13: packet.payload.sector_history.13
  :field sector_history_14: packet.payload.sector_history.14
  :field sector_history_15: packet.payload.sector_history.15
  :field mbytes_history_0: packet.payload.mbytes_history.0
  :field mbytes_history_1: packet.payload.mbytes_history.1
  :field mbytes_history_2: packet.payload.mbytes_history.2
  :field mbytes_history_3: packet.payload.mbytes_history.3
  :field mbytes_history_4: packet.payload.mbytes_history.4
  :field mbytes_history_5: packet.payload.mbytes_history.5
  :field mbytes_history_6: packet.payload.mbytes_history.6
  :field mbytes_history_7: packet.payload.mbytes_history.7
  :field mbytes_history_8: packet.payload.mbytes_history.8
  :field mbytes_history_9: packet.payload.mbytes_history.9
  :field mbytes_history_10: packet.payload.mbytes_history.10
  :field mbytes_history_11: packet.payload.mbytes_history.11
  :field mbytes_history_12: packet.payload.mbytes_history.12
  :field mbytes_history_13: packet.payload.mbytes_history.13
  :field mbytes_history_14: packet.payload.mbytes_history.14
  :field mbytes_history_15: packet.payload.mbytes_history.15
  :field hdcam_exposure: packet.payload.exposure
  :field hdcam_gain: packet.payload.gain
  :field chan_ref_lock: packet.payload.chan_ref_lock
  :field chan_temp: packet.payload.chan_temp
  :field chan_inited: packet.payload.chan_inited
  :field chan_written: packet.payload.chan_written
  :field chan_rec_status: packet.payload.chan_rec_status
  :field chan_req_mbytes: packet.payload.chan_req_mbytes
  :field chan_time: packet.payload.chan_time

  :field chan_pps_present: packet.payload.chan_pps_present
  :field chan_pps_count: packet.payload.chan_pps_count
  :field rec_inited: packet.payload.rec_inited
  :field rec_written: packet.payload.rec_written
  :field rec_rec_status: packet.payload.rec_rec_status
  :field rec_req_mbytes: packet.payload.rec_req_mbytes
  :field rec_time: packet.payload.rec_time
  :field rec_temp: packet.payload.rec_temp
  :field trans_inited: packet.payload.trans_inited
  :field trans_mbytes_sent: packet.payload.trans_mbytes_sent
  :field trans_system_time: packet.payload.trans_system_time
  :field mis1_temp: packet.payload.mis1_temp
  :field mis1_fsk_incr: packet.payload.mis1_fsk_incr
  :field mis1_system_time: packet.payload.mis1_system_time

  :field inf_blob: packet.payload.inf_blob

seq:
  - id: packet
    type: beacon_frame

instances:
  frame_length:
    value: _io.size

types:
  beacon_frame:
    seq:
      - id: header
        type: header
      - id: payload
        type:
          switch-on: header.type
          cases:
            0: motd_bcn
            1: crit1_bcn_high
            2: crit2_bcn_high
            3: obc_bcn_med
            4: pdu1_bcn_med
            5: pdu2_bcn_med
            6: dep_bcn_low
            11: adcs1_bcn_low
            12: adcs2_bcn_low
            13: adcs3_bcn_low
            14: adcs4_bcn_low
            15: adcs5_bcn_low
            16: adcs6_bcn_low
            21: asdr1_bcn_low
            22: asdr2_bcn_low
            93: bcn_inf

  motd_bcn:
    seq:
      - id: hk_1_95
        type: element_header
      - id: callsign
        type: strz
        encoding: ASCII
        size: 8
      - id: motd
        type: strz
        encoding: ASCII
        size: 80

  crit1_bcn_high:
    seq:
      - id: hk_1_4_1
        type: element_header
      - id: obc_temp_mcu
        type: s2
      - id: obc_boot_cnt
        type: u2
      - id: obc_clock
        type: u4
      - id: hk_1_91
        type: element_header
      - id: bpx_vbatt
        type: u2
      - id: bpx_temp
        type: s2
      - id: bpx_boot_cnt
        type: u4
      - id: hk_5_4_1
        type: element_header
      - id: ax100_temp_brd
        type: s2
      - id: ax100_boot_cnt
        type: u2
      - id: ax100_last_contact
        type: u4
      - id: hk_8_4_1
        type: element_header
      - id: p60_boot_cnt
        type: u4
      - id: p60_batt_mode
        type: u1
      - id: p60_batt_v
        type: u2
      - id: p60_batt_c
        type: s2
      - id: hk_9_4
        type: element_header
      - id: pdu_x2_cout
        type: s2
        repeat: expr
        repeat-expr: 9

  crit2_bcn_high:
    seq:
      - id: hk_10_4_2
        type: element_header
      - id: pdu_x3_cout
        type: s2
        repeat: expr
        repeat-expr: 9
      - id: hk_11_4_2
        type: element_header
      - id: acu_power
        type: u2
        repeat: expr
        repeat-expr: 6
      - id: hk_4_4_2
        type: element_header
      - id: adcs_boot_cnt
        type: u2
      - id: adcs_clock
        type: u4
      - id: hk_4_150_2
        type: element_header
      - id: extgyro
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: gps_pos
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: gps_vel
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: hk_4_151_2
        type: element_header
      - id: acs_mode
        type: s1
      - id: status_extmag
        type: s1
      - id: status_fss
        type: s1
        repeat: expr
        repeat-expr: 5
      - id: status_extgyro
        type: s1
      - id: status_gps
        type: s1

  obc_bcn_med:
    seq:
      - id: hk_1_4_3
        type: element_header
      - id: obc_fs_mnted
        type: u1
      - id: obc_temp_ram
        type: s2
      - id: obc_resetcause
        type: u4
      - id: obc_bootcause
        type: u4
      - id: obc_uptime
        type: u4
      - id: hk_1_91_3
        type: element_header
      - id: batt_charge
        type: u2
      - id: batt_dcharge
        type: u2
      - id: batt_heater
        type: u2
      - id: batt_temp2
        type: s2
      - id: batt_temp3
        type: s2
      - id: batt_temp4
        type: s2
      - id: batt_bootcause
        type: u1
      - id: hk_1_94_3
        type: element_header
      - id: sat_temps
        type: f4
        repeat: expr
        repeat-expr: 6
      - id: hk_5_0_3
        type: element_header
      - id: ax100_reboot_in
        type: u2
      - id: ax100_tx_inhibit
        type: u4
      - id: hk_5_1_3
        type: element_header
      - id: ax100_rx_freq
        type: u4
      - id: ax100_rx_baud
        type: u4
      - id: hk_5_4_3
        type: element_header
      - id: ax100_temp_pa
        type: s2
      - id: ax100_last_rssi
        type: s2
      - id: ax100_last_rferr
        type: s2
      - id: ax100_active_conf
        type: u1
      - id: ax100_bootcause
        type: u2
      - id: ax100_bgnd_rssi
        type: s2
      - id: ax100_tx_duty
        type: u1
      - id: hk_5_5_3
        type: element_header
      - id: ax100_tx_freq
        type: u4
      - id: ax100_tx_baud
        type: u4

  pdu1_bcn_med:
    seq:
      - id: hk_8_4_4
        type: element_header
      - id: p60_cout
        type: s2
        repeat: expr
        repeat-expr: 13
      - id: p60_out_en
        type: u1
        repeat: expr
        repeat-expr: 13
      - id: p60_temp
        type: s2
        repeat: expr
        repeat-expr: 2
      - id: p60_bootcause
        type: u4
      - id: p60_uptime
        type: u4
      - id: p60_resetcause
        type: u2
      - id: p60_latchup
        type: u2
        repeat: expr
        repeat-expr: 13
      - id: p60_vcc_c
        type: s2
      - id: p60_batt_v
        type: u2
      - id: p60_dearm_status
        type: u1
      - id: p60_wdt_cnt_gnd
        type: u4
      - id: p60_wdt_cnt_can
        type: u4
      - id: p60_wdt_cnt_left
        type: u4
      - id: p60_batt_chrg
        type: s2
      - id: p60_batt_dchrg
        type: s2
      - id: ant6_depl
        type: s1
      - id: ar6_depl
        type: s1
      - id: hk_9_4_4
        type: element_header
      - id: pdu_x2_vout
        type: s2
        repeat: expr
        repeat-expr: 9
      - id: pdu_x2_temp
        type: s2
      - id: pdu_x2_out_en
        type: u1
        repeat: expr
        repeat-expr: 9
      - id: pdu_x2_bootcause
        type: u4
      - id: pdu_x2_boot_cnt
        type: u4
      - id: pdu_x2_uptime
        type: u4
      - id: pdu_x2_resetcause
        type: u2
      - id:  pdu_x2_latchup
        type: u2
        repeat: expr
        repeat-expr: 9

  pdu2_bcn_med:
    seq:
      - id: hk_10_4_5
        type: element_header
      - id: pdu_x3_vout
        type: s2
        repeat: expr
        repeat-expr: 9
      - id: pdu_x3_temp
        type: s2
      - id: pdu_x3_out_en
        type: u1
        repeat: expr
        repeat-expr: 9
      - id: pdu_x3_bootcause
        type: u4
      - id: pdu_x3_boot_cnt
        type: u4
      - id: pdu_x3_uptime
        type: u4
      - id: pdu_x3_resetcause
        type: u2
      - id:  pdu_x3_latchup
        type: u2
        repeat: expr
        repeat-expr: 9
      - id: hk_11_4_5
        type: element_header
      - id: acu_cin
        type: s2
        repeat: expr
        repeat-expr: 6
      - id: acu_vin
        type: u2
        repeat: expr
        repeat-expr: 6
      - id: acu_vbatt
        type: u2
      - id: acu_temp
        type: s2
        repeat: expr
        repeat-expr: 3
      - id: acu_mppt_mode
        type: u1
        enum: mppt_type
      - id: acu_vboost
        type: u2
        repeat: expr
        repeat-expr: 6
      - id: acu_bootcause
        type: u4
      - id: acu_boot_cnt
        type: u4
      - id: acu_uptime
        type: u4
      - id: acu_resetcause
        type: u2

  dep_bcn_low:
    seq:
      - id: hk_1_96_6
        type: element_header
      - id: ant_1_brn
        type: s2
      - id: ant_2_brn
        type: s2
      - id: ant_3_brn
        type: s2
      - id: ant_4_brn
        type: s2
      - id: ant_1_rel
        type: s1
      - id: ant_2_rel
        type: s1
      - id: ant_3_rel
        type: s1
      - id: ant_4_rel
        type: s1
      - id: dsp_1_brn
        type: s2
      - id: dsp_2_brn
        type: s2
      - id: dsp_1_rel
        type: s1
      - id: dsp_2_rel
        type: s1

  adcs1_bcn_low:
    seq:
      - id: hk_4_150_11
        type: element_header
      - id: extmag
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: extmag_temp
        type: f4
      - id: extmag_valid
        type: u1
      - id: suns
        type: f4
        repeat: expr
        repeat-expr: 6
      - id: suns_valid
        type: u1
      - id: suns_temp
        type: s2
        repeat: expr
        repeat-expr: 6
      - id: extgyro
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: extgyro_temp
        type: f4
      - id: extgyro_valid
        type: u1
      - id: fss
        type: f4
        repeat: expr
        repeat-expr: 16
      - id: fss_temp
        type: f4
      - id: fss_valid
        type: u1
        repeat: expr
        repeat-expr: 5
      - id: gps_pos
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: gps_vel
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: gps_epoch
        type: u4
      - id: gps_valid
        type: u1
      - id: gps_sat
        type: u1
      - id: gps_satsol
        type: u1
      - id: pps_unix
        type: u4

  adcs2_bcn_low:
    seq:
      - id: hk_4_150_12
        type: element_header
      - id: wheel_torque
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: wheel_momentum
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: wheel_speed
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: wheel_enable
        type: u1
        repeat: expr
        repeat-expr: 4
      - id: wheel_current
        type: u2
        repeat: expr
        repeat-expr: 4
      - id: wheel_temp
        type: s2
        repeat: expr
        repeat-expr: 4
      - id: torquer_duty
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: torquer_calib
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: hk_4_151_12
        type: element_header
      - id: acs_mode
        type: s1
      - id: acs_dmode
        type: s1
      - id: ads_mode
        type: s1
      - id: ads_dmode
        type: s1
      - id: ephem_mode
        type: s1
      - id: ephem_dmode
        type: s1
      - id: spin_mode
        type: s1
      - id: status_mag
        type: s1
      - id: status_extmag
        type: s1
      - id: status_css
        type: s1
      - id: status_fss
        type: s1
        repeat: expr
        repeat-expr: 5
      - id: status_gyro
        type: s1
      - id: status_extgyro
        type: s1
      - id: status_gps
        type: s1
      - id: status_bdot
        type: s1
      - id: status_ukf
        type: s1
      - id: status_etime
        type: s1
      - id: status_ephem
        type: s1
      - id: status_run
        type: s1
      - id: looptime
        type: s2
      - id: max_looptime
        type: s2
      - id: bdot_rate
        type: f4
        repeat: expr
        repeat-expr: 2
      - id: bdot_dmag
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: bdot_torquer
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: bdot_detumb
        type: u1

  adcs3_bcn_low:
    seq:
      - id: hk_4_152_13
        type: element_header
      - id: ukf_x
        type: f4
        repeat: expr
        repeat-expr: 13
      - id: ukf_q
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: ukf_w
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: ukf_xpred
        type: f4
        repeat: expr
        repeat-expr: 13
      - id: ukf_zpred
        type: f4
        repeat: expr
        repeat-expr: 12

  adcs4_bcn_low:
    seq:
      - id: hk_4_152_14
        type: element_header
      - id: ukf_z
        type: f4
        repeat: expr
        repeat-expr: 12
      - id: ukf_enable
        type: u1
        repeat: expr
        repeat-expr: 12
      - id: ukf_sunmax
        type: f4
        repeat: expr
        repeat-expr: 6
      - id: ukf_in_eclipse
        type: u1
      - id: ukf_choice
        type: u1
      - id: ukf_ctrl_t
        type: f4
        repeat: expr
        repeat-expr: 3
      - id:  ukf_ctrl_m
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: ukf_rate
        type: f4
        repeat: expr
        repeat-expr: 3

  adcs5_bcn_low:
    seq:
      - id: hk_4_153_15
        type: element_header
      - id: ephem_jdat
        type: f8
      - id: ephem_reci
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: ephem_veci
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: ephem_sun_eci
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: ephem_quat_ie
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: ephem_quat_io
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: ephem_quat_il
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: ephem_rate_io
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: ephem_rate_il
        type: f4
        repeat: expr
        repeat-expr: 3
      - id: ephem_t_eclipse
        type: s4
      - id: hk_4_156_15
        type: element_header
      - id: ephem_time
        type: u4
      - id: ads_time
        type: u4
      - id: acs_time
        type: u4
      - id: sens_time
        type: u4

  adcs6_bcn_low:
    seq:
      - id: hk_4_1_16
        type: element_header
      - id: adcs_swload_cnt1
        type: u2
      - id: hk_4_4_16
        type: element_header
      - id: adcs_fs_mounted
        type: u1
      - id: adcs_temp_mcu
        type: s2
      - id: adcs_temp_ram
        type: s2
      - id: adcs_resetcause
        type: u4
      - id: adcs_bootcause
        type: u4
      - id: adcs_boot_cnt
        type: u2
      - id: adcs_clock
        type: u4
      - id: adcs_uptime
        type: u4

  asdr1_bcn_low:
    seq:
      - id: hk_14_0_21
        type: element_header
      - id: core_loaded
        type: u1
        enum: core_type
      - id: hk_14_1_21
        type: element_header
      - id: sector_history
        type: u2
        repeat: expr
        repeat-expr: 16
      - id: mbytes_history
        type: u2
        repeat: expr
        repeat-expr: 16
      - id: exposure
        type: u4
      - id: gain
        type: f4
      - id: hk_14_12_21
        type: element_header
      - id: chan_ref_lock
        type: u1
      - id: hk_14_13_21
        type: element_header
      - id: chan_temp
        type: f4
      - id: hk_14_16_21
        type: element_header
      - id: chan_inited
        type: u1
      - id: hk_14_18_21
        type: element_header
      - id: chan_written
        type: f4
      - id: chan_rec_status
        type: u1
      - id: chan_req_mbytes
        type: s4
      - id: chan_time
        type: f4

  asdr2_bcn_low:
    seq:
      - id: hk_14_29_22
        type: element_header
      - id: chan_pps_present
        type: u1
      - id: chan_pps_count
        type: s4
      - id: hk_14_37_22
        type: element_header
      - id: rec_inited
        type: u1
      - id: hk_14_38_22
        type: element_header
      - id: rec_written
        type: f4
      - id: rec_rec_status
        type: u1
      - id: rec_req_mbytes
        type: s4
      - id: rec_time
        type: f4
      - id: hk_14_43_22
        type: element_header
      - id: rec_temp
        type: f4
      - id: hk_14_52_22
        type: element_header
      - id: trans_inited
        type: u1
      - id: trans_mbytes_sent
        type: f4
      - id: hk_14_53_22
        type: element_header
      - id: trans_system_time
        type: s8
      - id: hk_14_33_22
        type: element_header
      - id: mis1_temp
        type: f4
      - id: hk_14_34_22
        type: element_header
      - id: mis1_fsk_incr
        type: s4
      - id: hk_14_35_22
        type: element_header
      - id: mis1_system_time
        type: s8

  bcn_inf:
    seq:
      - id: hk_1_93_93
        type: element_header
      - id: inf_blob
        type: u1
        repeat: expr
        repeat-expr: 42

  header:
    seq:
      - id: csp_header
        type: csp_header
      - id: protocol_version
        type: u1
      - id: type
        type: u1
      - id: version
        type: u1
      - id: satid
        type: u2

  element_header:
    seq:
      - id: checksum
        type: u2
      - id: timestamp
        type: u4
      - id: source
        type: u2

  csp_header:
    seq:
      - id: csp_flags
        type: u1
        repeat: expr
        repeat-expr: 4
    instances:
      crc:
        value: >-
          (
          (csp_flags[0])
          ) & 0x1
      rdp:
        value: >-
          (
          (csp_flags[0]) >> 1
          ) & 0x1
      xtea:
        value: >-
          (
          (csp_flags[0]) >> 2
          ) & 0x1
      hmac:
        value: >-
          (
          (csp_flags[0]) >> 3
          ) & 0x1
      reserved:
        value: >-
          (
          (csp_flags[0])
          ) >> 4
      src_port:
        value: >-
          (
          (csp_flags[1])
          ) & 0x3F
      dst_port:
        value: >-
          (
          (csp_flags[1] >> 6) |
          (csp_flags[2] << 2)
          ) & 0x3F
      destination:
        value: >-
          (
          (csp_flags[2] >> 2) |
          (csp_flags[3] << 4)
          ) & 0x1F
      source:
        value: >-
          (
          (csp_flags[3]) >> 1
          ) & 0x1F
      priority:
        value: >-
          (
          (csp_flags[3])
          ) >> 6

enums:
  core_type:
    0: channelizer
    1: mission1_fsk
    2: recorder
    3: transmitter
    4: asdr_bsp
    127: failed
    255: none
  mppt_type:
    1: tracking
    2: fixed



