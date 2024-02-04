meta:
  id: pegasus
  title: PEGASUS decoder struct
  endian: le

doc-ref: 'https://spacedatacenter.at/pegasus/img/hamoperatormanual12.pdf'

doc: |
  :field pid: tt64_frame.pid
  :field call: tt64_frame.beacon.call
  :field trx_temp: tt64_frame.beacon.trx_temp
  :field antenna_deployment: tt64_frame.beacon.antenna_deployment
  :field stacie_op: tt64_frame.beacon.stacie_op
  :field temp_compensation: tt64_frame.beacon.temp_compensation
  :field reset_counter: tt64_frame.beacon.reset_counter
  :field uplink_error: tt64_frame.beacon.uplink_error
  :field obc_sent_packet_counter_between_s_beacons: tt64_frame.beacon.obc_sent_packet_counter_between_s_beacons
  :field beacon_interval: tt64_frame.beacon.beacon_interval
  :field sid_s: tt64_frame.beacon.sid_s
  :field tx_sel_reason: tt64_frame.beacon.tx_sel_reason
  :field reason_remote: tt64_frame.beacon.reason_remote
  :field gs_cmd_counter: tt64_frame.beacon.gs_cmd_counter
  :field beacon_count: tt64_frame.beacon.beacon_count
  :field prim_freq_start: tt64_frame.beacon.prim_freq_start
  :field sec_freq_start: tt64_frame.beacon.sec_freq_start
  :field usp: tt64_frame.beacon.usp
  :field rssi_idle: tt64_frame.beacon.rssi_idle
  :field rssi_rx: tt64_frame.beacon.rssi_rx
  :field primary_carrier: tt64_frame.beacon.primary_carrier
  :field secondary_carrier: tt64_frame.beacon.secondary_carrier
  :field used_carrier: tt64_frame.beacon.used_carrier
  :field temperature_compensation_carrier: tt64_frame.beacon.temperature_compensation_carrier
  :field s_time: tt64_frame.beacon.s_time
  :field temp_bat1sw: tt64_frame.beacon.temp_bat1sw
  :field temp_5v: tt64_frame.beacon.temp_5v
  :field eps_version: tt64_frame.beacon.eps_version
  :field sid_e: tt64_frame.beacon.sid_e
  :field temp_bat1: tt64_frame.beacon.temp_bat1
  :field temp_bat2: tt64_frame.beacon.temp_bat2
  :field status_1_3v3_1: tt64_frame.beacon.status_1_3v3_1
  :field status_1_3v3_2: tt64_frame.beacon.status_1_3v3_2
  :field status_1_3v3_3: tt64_frame.beacon.status_1_3v3_3
  :field status_1_3v3_bu: tt64_frame.beacon.status_1_3v3_bu
  :field status_1_5v_1: tt64_frame.beacon.status_1_5v_1
  :field status_1_5v_2: tt64_frame.beacon.status_1_5v_2
  :field status_1_5v_3: tt64_frame.beacon.status_1_5v_3
  :field status_1_5v_4: tt64_frame.beacon.status_1_5v_4
  :field status_2_power_low: tt64_frame.beacon.status_2_power_low
  :field status_2_bat1_pv1: tt64_frame.beacon.status_2_bat1_pv1
  :field status_2_bat2_pv2: tt64_frame.beacon.status_2_bat2_pv2
  :field status_2_3v3: tt64_frame.beacon.status_2_3v3
  :field status_2_5v: tt64_frame.beacon.status_2_5v
  :field status_2_mode: tt64_frame.beacon.status_2_mode
  :field status_3_3v3_burst: tt64_frame.beacon.status_3_3v3_burst
  :field status_3_5v_burst: tt64_frame.beacon.status_3_5v_burst
  :field status_3_bat1_pv2: tt64_frame.beacon.status_3_bat1_pv2
  :field status_3_bat2_pv1: tt64_frame.beacon.status_3_bat2_pv1
  :field status_3_temp_warning: tt64_frame.beacon.status_3_temp_warning
  :field status_3_cc1: tt64_frame.beacon.status_3_cc1
  :field status_3_cc2: tt64_frame.beacon.status_3_cc2
  :field status_3_rbf: tt64_frame.beacon.status_3_rbf
  :field s_beacon_count: tt64_frame.beacon.s_beacon_count
  :field reboot_mc: tt64_frame.beacon.reboot_mc
  :field reboot_cc1: tt64_frame.beacon.reboot_cc1
  :field reboot_cc2: tt64_frame.beacon.reboot_cc2
  :field temp_cc1: tt64_frame.beacon.temp_cc1
  :field temp_cc2: tt64_frame.beacon.temp_cc2
  :field status_cc1_mode: tt64_frame.beacon.status_cc1_mode
  :field status_cc1_mc_timeout: tt64_frame.beacon.status_cc1_mc_timeout
  :field status_cc1_tbd: tt64_frame.beacon.status_cc1_tbd
  :field status_cc1_en_i2c: tt64_frame.beacon.status_cc1_en_i2c
  :field status_cc1_bat1_pv1: tt64_frame.beacon.status_cc1_bat1_pv1
  :field status_cc1_bat2_pv2: tt64_frame.beacon.status_cc1_bat2_pv2
  :field status_cc1_3v3_backup: tt64_frame.beacon.status_cc1_3v3_backup
  :field status_cc2_mode: tt64_frame.beacon.status_cc2_mode
  :field status_cc2_mc_timeout: tt64_frame.beacon.status_cc2_mc_timeout
  :field status_cc2_tbd: tt64_frame.beacon.status_cc2_tbd
  :field status_cc2_en_i2c: tt64_frame.beacon.status_cc2_en_i2c
  :field status_cc2_bat1_pv1: tt64_frame.beacon.status_cc2_bat1_pv1
  :field status_cc2_bat2_pv2: tt64_frame.beacon.status_cc2_bat2_pv2
  :field status_cc2_3v3_backup: tt64_frame.beacon.status_cc2_3v3_backup
  :field v_pv2: tt64_frame.beacon.v_pv2
  :field v_5v_in: tt64_frame.beacon.v_5v_in
  :field v_pv1: tt64_frame.beacon.v_pv1
  :field v_3v3_in: tt64_frame.beacon.v_3v3_in
  :field v_3v3_out: tt64_frame.beacon.v_3v3_out
  :field v_hv: tt64_frame.beacon.v_hv
  :field v_5v_out: tt64_frame.beacon.v_5v_out
  :field v_bat1: tt64_frame.beacon.v_bat1
  :field v_bat2: tt64_frame.beacon.v_bat2
  :field vcc_cc2: tt64_frame.beacon.vcc_cc2
  :field vcc_cc1: tt64_frame.beacon.vcc_cc1
  :field i_pv1_5v: tt64_frame.beacon.i_pv1_5v
  :field i_pv2_5v: tt64_frame.beacon.i_pv2_5v
  :field i_pv1_3v3: tt64_frame.beacon.i_pv1_3v3
  :field i_pv2_3v3: tt64_frame.beacon.i_pv2_3v3
  :field i_pv1_bat1: tt64_frame.beacon.i_pv1_bat1
  :field i_pv2_bat1: tt64_frame.beacon.i_pv2_bat1
  :field i_pv1_bat2: tt64_frame.beacon.i_pv1_bat2
  :field i_pv2_bat2: tt64_frame.beacon.i_pv2_bat2
  :field ant_deploy_status_mb: tt64_frame.beacon.ant_deploy_status_mb
  :field ant_deploy_status_lb: tt64_frame.beacon.ant_deploy_status_lb
  :field temp_comp_hw: tt64_frame.beacon.temp_comp_hw
  :field rbf_state: tt64_frame.beacon.rbf_state
  :field sid_a: tt64_frame.beacon.sid_a
  :field stacie_version: tt64_frame.beacon.stacie_version
  :field ant_temp: tt64_frame.beacon.ant_temp
  :field temp_a: tt64_frame.beacon.temp_a
  :field temp_c: tt64_frame.beacon.temp_c
  :field state_machine_su_script: tt64_frame.beacon.state_machine_su_script
  :field state_machine_su_powered: tt64_frame.beacon.state_machine_su_powered
  :field state_machine_adcs: tt64_frame.beacon.state_machine_adcs
  :field state_machine_not_used: tt64_frame.beacon.state_machine_not_used
  :field state_machine_obc: tt64_frame.beacon.state_machine_obc
  :field mission_counter: tt64_frame.beacon.mission_counter
  :field mission_counter_2: tt64_frame.beacon.mission_counter_2
  :field rssi_a: tt64_frame.beacon.rssi_a
  :field rssi_b: tt64_frame.beacon.rssi_b
  :field stacie_mode_a: tt64_frame.beacon.stacie_mode_a
  :field stacie_mode_c: tt64_frame.beacon.stacie_mode_c
  :field status_task_sensors_running: tt64_frame.beacon.status_task_sensors_running
  :field status_obc_3v3_spa_enabled: tt64_frame.beacon.status_obc_3v3_spa_enabled
  :field status_obc_power_saving_mode: tt64_frame.beacon.status_obc_power_saving_mode
  :field status_eps_cc_used: tt64_frame.beacon.status_eps_cc_used
  :field status_last_reset_source: tt64_frame.beacon.status_last_reset_source
  :field status_power_source: tt64_frame.beacon.status_power_source
  :field status_crystal_osicallation_in_use: tt64_frame.beacon.status_crystal_osicallation_in_use
  :field status_ssp1_initialized: tt64_frame.beacon.status_ssp1_initialized
  :field status_ssp0_initialized: tt64_frame.beacon.status_ssp0_initialized
  :field status_i2c2_initialized: tt64_frame.beacon.status_i2c2_initialized
  :field status_i2c1_initialized: tt64_frame.beacon.status_i2c1_initialized
  :field status_i2c0_initialized: tt64_frame.beacon.status_i2c0_initialized
  :field status_rtc_synchronized: tt64_frame.beacon.status_rtc_synchronized
  :field status_statemachine_initialized: tt64_frame.beacon.status_statemachine_initialized
  :field status_task_maintenance_running: tt64_frame.beacon.status_task_maintenance_running
  :field status_uart_ttc1_initialized: tt64_frame.beacon.status_uart_ttc1_initialized
  :field status_uart_mnlp_initialized: tt64_frame.beacon.status_uart_mnlp_initialized
  :field status_uart_ttc2_initialized: tt64_frame.beacon.status_uart_ttc2_initialized
  :field status_uart_gps_initialized: tt64_frame.beacon.status_uart_gps_initialized
  :field status_adc_initialized: tt64_frame.beacon.status_adc_initialized
  :field status_rtc_initialized: tt64_frame.beacon.status_rtc_initialized
  :field status_i2c_switches_initialized: tt64_frame.beacon.status_i2c_switches_initialized
  :field status_supply_switches_initialized: tt64_frame.beacon.status_supply_switches_initialized
  :field status_eeprom3_initialized: tt64_frame.beacon.status_eeprom3_initialized
  :field status_eeprom2_initialized: tt64_frame.beacon.status_eeprom2_initialized
  :field status_eeprom1_initialized: tt64_frame.beacon.status_eeprom1_initialized
  :field status_eps_cc2_operational: tt64_frame.beacon.status_eps_cc2_operational
  :field status_eps_cc1_opeational: tt64_frame.beacon.status_eps_cc1_opeational
  :field status_timer1_initialized: tt64_frame.beacon.status_timer1_initialized
  :field status_watchdog_initialized: tt64_frame.beacon.status_watchdog_initialized
  :field status_timer0_initialized: tt64_frame.beacon.status_timer0_initialized
  :field status_mpu_initialized: tt64_frame.beacon.status_mpu_initialized
  :field status_onboard_tmp100_initialized: tt64_frame.beacon.status_onboard_tmp100_initialized
  :field status_onboard_mag_initialized: tt64_frame.beacon.status_onboard_mag_initialized
  :field status_msp_initialized: tt64_frame.beacon.status_msp_initialized
  :field status_gyro2_initialized: tt64_frame.beacon.status_gyro2_initialized
  :field status_gyro1_initialized: tt64_frame.beacon.status_gyro1_initialized
  :field status_mag_bp_boom_initialized: tt64_frame.beacon.status_mag_bp_boom_initialized
  :field status_mag_bp_initialized: tt64_frame.beacon.status_mag_bp_initialized
  :field status_bp_initialized: tt64_frame.beacon.status_bp_initialized
  :field status_sa_initailized: tt64_frame.beacon.status_sa_initailized
  :field status_spd_initialized: tt64_frame.beacon.status_spd_initialized
  :field status_spc_initialized: tt64_frame.beacon.status_spc_initialized
  :field status_spb_initialized: tt64_frame.beacon.status_spb_initialized
  :field status_spa_initialized: tt64_frame.beacon.status_spa_initialized
  :field status_flash2_initialized: tt64_frame.beacon.status_flash2_initialized
  :field status_flash1_initialized: tt64_frame.beacon.status_flash1_initialized
  :field status_spd_vcc_on: tt64_frame.beacon.status_spd_vcc_on
  :field status_spc_vcc_on: tt64_frame.beacon.status_spc_vcc_on
  :field status_spb_vcc_on: tt64_frame.beacon.status_spb_vcc_on
  :field status_spa_vcc_on: tt64_frame.beacon.status_spa_vcc_on
  :field status_science_module_initialized: tt64_frame.beacon.status_science_module_initialized
  :field status_ttc2_initialized: tt64_frame.beacon.status_ttc2_initialized
  :field status_ttc1_initialized: tt64_frame.beacon.status_ttc1_initialized
  :field status_gps_initialized: tt64_frame.beacon.status_gps_initialized
  :field status_onboard_mag_powersafe: tt64_frame.beacon.status_onboard_mag_powersafe
  :field status_i2c_sw_d_on: tt64_frame.beacon.status_i2c_sw_d_on
  :field status_i2c_sw_c_on: tt64_frame.beacon.status_i2c_sw_c_on
  :field status_i2c_sw_b_on: tt64_frame.beacon.status_i2c_sw_b_on
  :field status_i2c_sw_a_on: tt64_frame.beacon.status_i2c_sw_a_on
  :field status_sa_vcc_on: tt64_frame.beacon.status_sa_vcc_on
  :field status_bp2_vcc_on: tt64_frame.beacon.status_bp2_vcc_on
  :field status_bp1_vcc_on: tt64_frame.beacon.status_bp1_vcc_on
  :field status_eeprom_page_cycle_overflow: tt64_frame.beacon.status_eeprom_page_cycle_overflow
  :field status_rtc_oscillator_error: tt64_frame.beacon.status_rtc_oscillator_error
  :field status_mnlp_5v_enabled: tt64_frame.beacon.status_mnlp_5v_enabled
  :field status_mag_bp_boom_power_saving_mode: tt64_frame.beacon.status_mag_bp_boom_power_saving_mode
  :field status_mag_bp_power_saving_mode: tt64_frame.beacon.status_mag_bp_power_saving_mode
  :field status_tmp100_powersafe: tt64_frame.beacon.status_tmp100_powersafe
  :field status_mpu_powersafe: tt64_frame.beacon.status_mpu_powersafe
  :field status_gyro_powersafe: tt64_frame.beacon.status_gyro_powersafe
  :field status_default_config_used: tt64_frame.beacon.status_default_config_used
  :field status_timer1_running: tt64_frame.beacon.status_timer1_running
  :field status_timer0_running: tt64_frame.beacon.status_timer0_running
  :field status_i2c2_frequent_errors: tt64_frame.beacon.status_i2c2_frequent_errors
  :field status_i2c1_frequent_errors: tt64_frame.beacon.status_i2c1_frequent_errors
  :field status_i2c0_frequent_errors: tt64_frame.beacon.status_i2c0_frequent_errors
  :field status_ssp1_frequent_errors: tt64_frame.beacon.status_ssp1_frequent_errors
  :field status_ssp0_frequent_errors: tt64_frame.beacon.status_ssp0_frequent_errors
  :field error_code: tt64_frame.beacon.error_code
  :field error_code_before_reset: tt64_frame.beacon.error_code_before_reset
  :field resets_counter: tt64_frame.beacon.resets_counter
  :field script_slot_cs1: tt64_frame.beacon.script_slot_cs1
  :field script_slot_su7: tt64_frame.beacon.script_slot_su7
  :field script_slot_su6: tt64_frame.beacon.script_slot_su6
  :field script_slot_su5: tt64_frame.beacon.script_slot_su5
  :field script_slot_su4: tt64_frame.beacon.script_slot_su4
  :field script_slot_su3: tt64_frame.beacon.script_slot_su3
  :field script_slot_su2: tt64_frame.beacon.script_slot_su2
  :field script_slot_su1: tt64_frame.beacon.script_slot_su1
  :field script_slot_cs5: tt64_frame.beacon.script_slot_cs5
  :field script_slot_cs4: tt64_frame.beacon.script_slot_cs4
  :field script_slot_cs3: tt64_frame.beacon.script_slot_cs3
  :field script_slot_cs2: tt64_frame.beacon.script_slot_cs2
  :field temp_sp_x_minus: tt64_frame.beacon.temp_sp_x_minus
  :field temp_sp_x_plus: tt64_frame.beacon.temp_sp_x_plus
  :field temp_sp_y_minus: tt64_frame.beacon.temp_sp_y_minus
  :field temp_sp_y_plus: tt64_frame.beacon.temp_sp_y_plus

seq:
  # The beacon format is as follows:
  #  [ 1 byte | 6 bytes  | 39 bytes | 2 bytes (depending on deframer) | 16 bytes (depending on deframer)]
  #  [  PID   |   CALL   |   DATA   |               CRC               |               FEC               ]
  - id: tt64_frame
    type: tt64_frame
    
types:
  tt64_frame:
    seq:
      - id: pid
        type: u1
        doc: |
          Protocol Identifier:
          0xC0: STACIE Beacon
          0xC1: EPS Beacon
          0xC3: Antenna Beacon
          0x52: House Keeping Data Download
          0x53: OBC Beacon (1/2)
          0x56: OBC Beacon (2/2)
      - id: beacon
        type:
          switch-on: pid
          cases:
            0xC0: s_beacon
            0xC1: e_beacon
            0xC3: a_beacon
            0x52: hkd_download
            0x53: o1_beacon
            0x56: o2_beacon
  
  s_beacon:
  # The S-beacon format is as follows:
  #  [  1 byte   | 6 bytes | 39 bytes | 2 bytes (depending on deframer) | 16 bytes (depending on deframer)]
  #  [ PID 0xC0  |   CALL  |  STACIE  |               CRC               |               FEC               ]
    seq:
      - id: call
        type: str
        size: 6
        encoding: ASCII
        doc: Satellite Callsign
      - id: usp_raw
        type: u2
      - id: trx_temp
        type: s1
        doc: Temperature of STACIE Array [°C]
      - id: rssi_idle_raw
        type: u1
      - id: rssi_rx_raw
        type: u1
      - id: antenna_deployment
        type: b8
        doc: Deployment of antenna 1,2,3,4 (0 = not deployed, 1 = deployed)
      - id: stacie_op
        type: u1
        doc: |
          STACIE OP Mode:
          0: Normal
          1: Reserved
          2: Sleep
          3: Beacon
          4: Antenna Deployment
          5: Startup
          6: Spotting
          7: Inital Deplyment
          8: Shutdown
          9: Invalid
      - id: temp_compensation
        type: u1
        doc: | 
          Temperature compensation
          1 on, 0 off
      - id: reset_counter
        type: u2
        doc: STACIE Reset Counter after last mP-flash
      - id: uplink_error
        type: u1
        doc: Uplink error rate (increases by 1 if CRC check fails)
      - id: obc_sent_packet_counter_between_s_beacons
        type: u1
        doc: Number of O-beacons sent between S-beacons
      - id: beacon_interval
        type: u2
        doc: Beacon interval [s]
      - id: primary_carrier_raw
        type: u2
      - id: secondary_carrier_raw
        type: u2
      - id: used_carrier_raw
        type: u2
      - id: temperature_compensation_carrier_raw
        type: u2
      - id: sid_s
        type: u1
        doc: |
          Stacie ID:
          0: Beacon sent from STACIE-A
          1: Beacon sent from STACIE-C
      - id: tx_sel_reason
        type: u1
        doc: Weight why STACIE is master
      - id: reason_remote
        type: u1
        doc: Weight of partner STACIE (0 if now answer)
      - id: s_time_raw
        type: u4
      - id: gs_cmd_counter
        type: u1
        doc: Number of commands sent from ground station to STACIE
      - id: beacon_count
        type: u1
        doc: Number of beacons sent from STACIE
      - id: prim_freq_start
        type: u2
        doc: Second of primary frequency start [s]
      - id: sec_freq_start
        type: u2
        doc: Second of secondary frequency start [s]
    instances:
      usp:
        value: (((usp_raw & 0b0000000011111111)*256 + (usp_raw & 0b1111111100000000))/(1023*2*3.3))
        doc: Supply voltage of STACIE [V]
      rssi_idle: # UFix 7.1 - 132
        value: (((rssi_idle_raw & 0b10000000)/128)*64)
          + (((rssi_idle_raw & 0b01000000)/64)*32)
          + (((rssi_idle_raw & 0b00100000)/32)*16)
          + (((rssi_idle_raw & 0b00010000)/16)*8)
          + (((rssi_idle_raw & 0b00001000)/8)*4)
          + (((rssi_idle_raw & 0b00000100)/4)*2)
          + (((rssi_idle_raw & 0b00000010)/2)*1)
          + (((rssi_idle_raw & 0b00000001)/1)*0.5) - 132.0
        doc: Received Signal Strength Indication of TRX module without TX [dBm]
      rssi_rx:
        value: (((rssi_rx_raw & 0b10000000)/128)*64)
          + (((rssi_rx_raw & 0b01000000)/64)*32)
          + (((rssi_rx_raw & 0b00100000)/32)*16)
          + (((rssi_rx_raw & 0b00010000)/16)*8)
          + (((rssi_rx_raw & 0b00001000)/8)*4)
          + (((rssi_rx_raw & 0b00000100)/4)*2)
          + (((rssi_rx_raw & 0b00000010)/2)*1)
          + (((rssi_rx_raw & 0b00000001)/1)*0.5) - 132.0
        doc: Received Signal Strength Indication of TRX module during RX [dBm]
      primary_carrier:
        value: ((primary_carrier_raw * 156.25 / 1000) + 430000) * 100
        doc: Carrier Frequency of the primary RX frequency [Hz]
      secondary_carrier:
        value: ((secondary_carrier_raw * 156.25 / 1000) + 430000) * 100
        doc: Carrier Frequency of the secondary RX frequency [Hz]
      used_carrier:
        value: ((used_carrier_raw * 156.25 / 1000) + 430000) * 100
        doc: Used carrier frequency for this S-beacon [Hz]
      temperature_compensation_carrier:
        value: ((temperature_compensation_carrier_raw * 156.25 / 1000) + 430000) * 100
        doc: Frequency compensated carrier [Hz]
      s_time:
        value: s_time_raw / 1000
        doc: STACIE uptime since last reset [s]

  e_beacon:
  # The E-beacon format is as follows:
  #  [  1 byte   | 6 bytes | 39 bytes | 2 bytes (depending on deframer) | 16 bytes (depending on deframer)]
  #  [ PID 0xC1  |   CALL  |    EPS   |               CRC               |               FEC               ]
    seq:
      - id: call
        type: str
        size: 6
        encoding: ASCII
        doc: Satellite Callsign
      - id: i_pv2_5v_raw
        type: s1
      - id: i_pv1_5v_raw
        type: s1
      - id: v_pv2_raw
        type: u1
      - id: v_5v_in_raw
        type: u1
      - id: i_pv1_3v3_raw
        type: s1
      - id: i_pv2_3v3_raw
        type: s1
      - id: v_pv1_raw
        type: u1
      - id: v_3v3_in_raw
        type: u1
      - id: temp_bat1sw
        type: s1
      - id: temp_5v
        type: s1
      - id: i_pv1_hv_raw
        type: s1
      - id: i_pv2_hv_raw
        type: s1
      - id: v_3v3_out_raw
        type: u1
      - id: v_hv_raw
        type: u1
      - id: i_pv2_bat1_raw
        type: s1
      - id: i_pv1_bat1_raw
        type: s1
      - id: v_5v_out_raw
        type: u1
      - id: v_bat1_raw
        type: u1
      - id: i_pv2_bat2_raw
        type: s1
      - id: i_pv1_bat2_raw
        type: s1
      - id: eps_version
        type: u1
        doc: Version number of EPS
      - id: sid_e
        type: u1
        doc: |
          E-beacon send by:
          0: Beacon sent from STACIE-A
          1: Beacon sent from STACIE-C
      - id: v_bat2_raw
        type: u1
      - id: temp_bat1
        type: s1
      - id: temp_bat2
        type: s1
      - id: status_1_3v3_1
        type: b1
        doc: Status 3V3 side-panel 1
      - id: status_1_3v3_2
        type: b1
        doc: Status 3V3 side-panel 2
      - id: status_1_3v3_3
        type: b1
        doc: Status 3V3 side-panel 3
      - id: status_1_3v3_bu
        type: b1
        doc: Status 3V3 side-panel backup
      - id: status_1_5v_1
        type: b1
        doc: Status 5V side-panel 1
      - id: status_1_5v_2
        type: b1
        doc: Status 5v side-panel 2
      - id: status_1_5v_3
        type: b1
        doc: Status 5V side-panel 3
      - id: status_1_5v_4
        type: b1
        doc: Status 5V side-panel 4
      - id: status_2_power_low
        type: b1
        doc: Power low warning
      - id: status_2_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1 
      - id: status_2_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2 
      - id: status_2_3v3
        type: b1
        doc: Status 3V3
      - id: status_2_5v
        type: b1
        doc: Status 5V
      - id: status_2_mode
        type: b3
        doc: |
          Mode:
          000: Debug Mode
          001: Boot Mode
          010: Flight Mode
          011: Power Down Mode
          100: Safe Mode
      - id: status_3_3v3_burst
        type: b1
        doc: Status 3V3 burst mode
      - id: status_3_5v_burst
        type: b1
        doc: Status 5V burst mode
      - id: status_3_bat1_pv2
        type: b1
        doc: Status BAT1 connected to PV2 
      - id: status_3_bat2_pv1
        type: b1
        doc: Status BAT2 connected to PV1 
      - id: status_3_temp_warning
        type: b1
        doc: Temperature warning
      - id: status_3_cc1
        type: b1
        doc: Status CC1 connection
      - id: status_3_cc2
        type: b1
        doc: Status CC2 connection
      - id: status_3_rbf
        type: b1
        doc: Status RBF
      - id: padding_e1
        size: 1
        doc: Not in use
      - id: s_beacon_count
        type: u1
        doc: Beacon count of S-beacon
      - id: reboot_mc
        type: u1
        doc: Number of reboots since RBF of the main controller
      - id: reboot_cc1
        type: u1
        doc: Number of reboots since RBF of the first communication controller
      - id: reboot_cc2
        type: u1
        doc: Number of reboots since RBF of the second communication controller
      - id: vcc_cc1_raw
        type: u1
      - id: temp_cc1
        type: s1
        doc: Temperature of the internal sensor of CC1 [°C]
      - id: vcc_cc2_raw
        type: u1
      - id: temp_cc2
        type: s1
        doc: Temperature of the internal sensor of CC2 [°C]
      - id: status_cc1_mode
        type: b2
        doc: |
          CC Mode:
          00: Boot Mode
          01: Flight Mode
          10: Safe Mode
          11: CC1 unavailable
      - id: status_cc1_mc_timeout
        type: b1
        doc: Status MC timeout
      - id: status_cc1_tbd
        type: b1
        doc: TBD
      - id: status_cc1_en_i2c
        type: b1
        doc: Status EN_I2C
      - id: status_cc1_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1
      - id: status_cc1_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2
      - id: status_cc1_3v3_backup
        type: b1
        doc: Status 3V3 backup
      - id: status_cc2_mode
        type: b2
        doc: |
          CC Mode:
          00: Boot Mode
          01: Flight Mode
          10: Safe Mode
          11: CC2 unavailable
      - id: status_cc2_mc_timeout
        type: b1
        doc: Status MC timeout
      - id: status_cc2_tbd
        type: b1
        doc: TBD
      - id: status_cc2_en_i2c
        type: b1
        doc: Status EN_I2C
      - id: status_cc2_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1
      - id: status_cc2_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2
      - id: status_cc2_3v3_backup
        type: b1
        doc: Status 3V3 backup
    instances:
      v_pv2: # UFix 3.5
        value: (((v_pv2_raw & 0b10000000)/128)*4)
          + (((v_pv2_raw & 0b01000000)/64)*2)
          + (((v_pv2_raw & 0b00100000)/32)*1)
          + (((v_pv2_raw & 0b00010000)/16)*0.5)
          + (((v_pv2_raw & 0b00001000)/8)*0.25)
          + (((v_pv2_raw & 0b00000100)/4)*0.125)
          + (((v_pv2_raw & 0b00000010)/2)*0.0625)
          + (((v_pv2_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at PV2-bus (Solarbus 2) [V]
      v_5v_in: # UFix 3.5
        value: (((v_5v_in_raw & 0b10000000)/128)*4)
          + (((v_5v_in_raw & 0b01000000)/64)*2)
          + (((v_5v_in_raw & 0b00100000)/32)*1)
          + (((v_5v_in_raw & 0b00010000)/16)*0.5)
          + (((v_5v_in_raw & 0b00001000)/8)*0.25)
          + (((v_5v_in_raw & 0b00000100)/4)*0.125)
          + (((v_5v_in_raw & 0b00000010)/2)*0.0625)
          + (((v_5v_in_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at input 5V converter measured at FET3-1 [V]
      v_pv1: # UFix 3.5
        value: (((v_pv1_raw & 0b10000000)/128)*4)
          + (((v_pv1_raw & 0b01000000)/64)*2)
          + (((v_pv1_raw & 0b00100000)/32)*1)
          + (((v_pv1_raw & 0b00010000)/16)*0.5)
          + (((v_pv1_raw & 0b00001000)/8)*0.25)
          + (((v_pv1_raw & 0b00000100)/4)*0.125)
          + (((v_pv1_raw & 0b00000010)/2)*0.0625)
          + (((v_pv1_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at PV1-bus (Solarbus 1) [V]
      v_3v3_in: # UFix 3.5
        value: (((v_3v3_in_raw & 0b10000000)/128)*4)
          + (((v_3v3_in_raw & 0b01000000)/64)*2)
          + (((v_3v3_in_raw & 0b00100000)/32)*1)
          + (((v_3v3_in_raw & 0b00010000)/16)*0.5)
          + (((v_3v3_in_raw & 0b00001000)/8)*0.25)
          + (((v_3v3_in_raw & 0b00000100)/4)*0.125)
          + (((v_3v3_in_raw & 0b00000010)/2)*0.0625)
          + (((v_3v3_in_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the input of the 3V3 converter measured at FET5-2 [V]
      v_3v3_out: # UFix 3.5
        value: (((v_3v3_out_raw & 0b10000000)/128)*4)
          + (((v_3v3_out_raw & 0b01000000)/64)*2)
          + (((v_3v3_out_raw & 0b00100000)/32)*1)
          + (((v_3v3_out_raw & 0b00010000)/16)*0.5)
          + (((v_3v3_out_raw & 0b00001000)/8)*0.25)
          + (((v_3v3_out_raw & 0b00000100)/4)*0.125)
          + (((v_3v3_out_raw & 0b00000010)/2)*0.0625)
          + (((v_3v3_out_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the 3V3 converter [V]
      v_hv: # UFix 3.5
        value: (((v_hv_raw & 0b10000000)/128)*4)
          + (((v_hv_raw & 0b01000000)/64)*2)
          + (((v_hv_raw & 0b00100000)/32)*1)
          + (((v_hv_raw & 0b00010000)/16)*0.5)
          + (((v_hv_raw & 0b00001000)/8)*0.25)
          + (((v_hv_raw & 0b00000100)/4)*0.125)
          + (((v_hv_raw & 0b00000010)/2)*0.0625)
          + (((v_hv_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the HV supply to the PPTs measured at FET4-2 [V]
      v_5v_out: # UFix 3.5
        value: (((v_5v_out_raw & 0b10000000)/128)*4)
          + (((v_5v_out_raw & 0b01000000)/64)*2)
          + (((v_5v_out_raw & 0b00100000)/32)*1)
          + (((v_5v_out_raw & 0b00010000)/16)*0.5)
          + (((v_5v_out_raw & 0b00001000)/8)*0.25)
          + (((v_5v_out_raw & 0b00000100)/4)*0.125)
          + (((v_5v_out_raw & 0b00000010)/2)*0.0625)
          + (((v_5v_out_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the 5V converter [V]
      v_bat1: # UFix 3.5
        value: (((v_bat1_raw & 0b10000000)/128)*4)
          + (((v_bat1_raw & 0b01000000)/64)*2)
          + (((v_bat1_raw & 0b00100000)/32)*1)
          + (((v_bat1_raw & 0b00010000)/16)*0.5)
          + (((v_bat1_raw & 0b00001000)/8)*0.25)
          + (((v_bat1_raw & 0b00000100)/4)*0.125)
          + (((v_bat1_raw & 0b00000010)/2)*0.0625)
          + (((v_bat1_raw & 0b00000001)/1)*0.03125)
        doc: Voltage of the battery 1 [V]
      v_bat2: # UFix 3.5
        value: (((v_bat2_raw & 0b10000000)/128)*4)
          + (((v_bat2_raw & 0b01000000)/64)*2)
          + (((v_bat2_raw & 0b00100000)/32)*1)
          + (((v_bat2_raw & 0b00010000)/16)*0.5)
          + (((v_bat2_raw & 0b00001000)/8)*0.25)
          + (((v_bat2_raw & 0b00000100)/4)*0.125)
          + (((v_bat2_raw & 0b00000010)/2)*0.0625)
          + (((v_bat2_raw & 0b00000001)/1)*0.03125)
        doc: Voltage of the battery 2
      vcc_cc2: # UFix 3.5
        value: (((vcc_cc2_raw & 0b10000000)/128)*4)
          + (((vcc_cc2_raw & 0b01000000)/64)*2)
          + (((vcc_cc2_raw & 0b00100000)/32)*1)
          + (((vcc_cc2_raw & 0b00010000)/16)*0.5)
          + (((vcc_cc2_raw & 0b00001000)/8)*0.25)
          + (((vcc_cc2_raw & 0b00000100)/4)*0.125)
          + (((vcc_cc2_raw & 0b00000010)/2)*0.0625)
          + (((vcc_cc2_raw & 0b00000001)/1)*0.03125)
        doc: Supply voltage of CC (communication controller) [V]
      vcc_cc1: # UFix 3.5
        value: (((vcc_cc1_raw & 0b10000000)/128)*4)
          + (((vcc_cc1_raw & 0b01000000)/64)*2)
          + (((vcc_cc1_raw & 0b00100000)/32)*1)
          + (((vcc_cc1_raw & 0b00010000)/16)*0.5)
          + (((vcc_cc1_raw & 0b00001000)/8)*0.25)
          + (((vcc_cc1_raw & 0b00000100)/4)*0.125)
          + (((vcc_cc1_raw & 0b00000010)/2)*0.0625)
          + (((vcc_cc1_raw & 0b00000001)/1)*0.03125)
        doc: Supply voltage of CC1 (communication controller 1) [V]
      i_pv1_5v: # Fix 3.4
        value: (((i_pv1_5v_raw & 0b10000000)/128)*-8)
          + (((i_pv1_5v_raw & 0b01000000)/64)*4)
          + (((i_pv1_5v_raw & 0b00100000)/32)*2)
          + (((i_pv1_5v_raw & 0b00010000)/16)*1)
          + (((i_pv1_5v_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_5v_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_5v_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_5v_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET3-1 between PV1-bus and 5V converter
      i_pv2_5v: # Fix 3.4
        value: (((i_pv2_5v_raw & 0b10000000)/128)*-8)
          + (((i_pv2_5v_raw & 0b01000000)/64)*4)
          + (((i_pv2_5v_raw & 0b00100000)/32)*2)
          + (((i_pv2_5v_raw & 0b00010000)/16)*1)
          + (((i_pv2_5v_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_5v_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_5v_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_5v_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET3-2 between PV2-bus and 5V converter [A]
      i_pv1_3v3: # Fix 3.4
        value: (((i_pv1_3v3_raw & 0b10000000)/128)*-8)
          + (((i_pv1_3v3_raw & 0b01000000)/64)*4)
          + (((i_pv1_3v3_raw & 0b00100000)/32)*2)
          + (((i_pv1_3v3_raw & 0b00010000)/16)*1)
          + (((i_pv1_3v3_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_3v3_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_3v3_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_3v3_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET5-1 between PV1-bus and 3V3 converter [A]
      i_pv2_3v3: # Fix 3.4
        value: (((i_pv2_3v3_raw & 0b10000000)/128)*-8)
          + (((i_pv2_3v3_raw & 0b01000000)/64)*4)
          + (((i_pv2_3v3_raw & 0b00100000)/32)*2)
          + (((i_pv2_3v3_raw & 0b00010000)/16)*1)
          + (((i_pv2_3v3_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_3v3_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_3v3_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_3v3_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET5-2 between PV2-bus and 3V3 converter
      i_pv1_bat1: # Fix 3.4
        value: (((i_pv1_bat1_raw & 0b10000000)/128)*-8)
          + (((i_pv1_bat1_raw & 0b01000000)/64)*4)
          + (((i_pv1_bat1_raw & 0b00100000)/32)*2)
          + (((i_pv1_bat1_raw & 0b00010000)/16)*1)
          + (((i_pv1_bat1_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_bat1_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_bat1_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_bat1_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET1-1 between PV1-bus and battery 1 [A]
          + charging, - discharging
      i_pv2_bat1: # Fix 3.4
        value: (((i_pv2_bat1_raw & 0b10000000)/128)*-8)
          + (((i_pv2_bat1_raw & 0b01000000)/64)*4)
          + (((i_pv2_bat1_raw & 0b00100000)/32)*2)
          + (((i_pv2_bat1_raw & 0b00010000)/16)*1)
          + (((i_pv2_bat1_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_bat1_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_bat1_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_bat1_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET1-2 between PV2-bus and battery 1 [A]
          + charging, - discharging
      i_pv1_bat2: # Fix 3.4
        value: (((i_pv1_bat2_raw & 0b10000000)/128)*-8)
          + (((i_pv1_bat2_raw & 0b01000000)/64)*4)
          + (((i_pv1_bat2_raw & 0b00100000)/32)*2)
          + (((i_pv1_bat2_raw & 0b00010000)/16)*1)
          + (((i_pv1_bat2_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_bat2_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_bat2_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_bat2_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET2-1 between PV1-bus and battery 2 [A]
          + charging, - discharging
      i_pv2_bat2: # Fix 3.4
        value: (((i_pv2_bat2_raw & 0b10000000)/128)*-8)
          + (((i_pv2_bat2_raw & 0b01000000)/64)*4)
          + (((i_pv2_bat2_raw & 0b00100000)/32)*2)
          + (((i_pv2_bat2_raw & 0b00010000)/16)*1)
          + (((i_pv2_bat2_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_bat2_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_bat2_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_bat2_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET2-2 between PV2-bus and battery 2 [A]
          + charging, - discharging  
  
  a_beacon:
    seq:
      - id: call
        type: str
        size: 6
        encoding: ASCII
        doc: Satellite Callsign
      - id: ant_temp_raw
        type: u2
      - id: ant_deploy_status_mb
        type: u1
        doc: Antenna deploy status bits (MB)
      - id: ant_deploy_status_lb
        type: u1
        doc: Antenna deploy status bits (LB)
      - id: temp_comp_hw
        type: u1
        doc: STACIE temperature compensation hardware table
      - id: padding_a1
        size: 11
      - id: rbf_state
        type: u1
        doc: State of RBF
      - id: sid_a
        type: u1
        doc: |
          A-beacon send by:
          0: Beacon sent from STACIE-A
          1: Beacon sent from STACIE-C
      - id: stacie_version
        type: u1
        doc: Version number of STACIE
    instances:
      ant_temp:
        value: (3.3 / 1023 * ((ant_temp_raw & 0b0000000011111111) * 256 + (ant_temp_raw & 0b1111111100000000)) * 1000)
        doc: Antenna temperature [mA]
  
  hkd_download:
    seq:
      - id: padding_hkd1
        size: 10
      - id: v_pv1_raw
        type: u1
      - id: v_pv2_raw
        type: u1
      - id: v_5v_in_raw
        type: u1
      - id: v_3v3_in_raw
        type: u1
      - id: v_5v_out_raw
        type: u1
      - id: v_3v3_out_raw
        type: u1
      - id: i_pv1_5v_raw
        type: u1
      - id: i_pv2_5v_raw
        type: u1
      - id: i_pv1_3v3_raw
        type: u1
      - id: i_pv2_3v3_raw
        type: u1
      - id: temp_bat1sw
        type: s1
        doc: Deactivated by default!
      - id: temp_5v
        doc: Temperature near 5V converter [°C]
        type: s1
      - id: v_hv_raw
        type: u1
      - id: i_pv1_bat1_raw
        type: u1
      - id: i_pv2_bat1_raw
        type: u1
      - id: i_pv1_bat2_raw
        type: u1
      - id: i_pv2_bat2_raw
        type: u1
      - id: v_bat1_raw
        type: u1
      - id: v_bat2_raw
        type: u1
      - id: vcc_cc2_raw
        type: u1
      - id: vcc_cc1_raw
        type: u1
      - id: temp_bat1
        type: s1
        doc: Temperature of battery 1 on the battery holder [°C]
      - id: temp_bat2
        type: s1
        doc: Temperature of battery 2 on the battery holder [°C]
      - id: status_1_3v3_1
        type: b1
        doc: Status 3V3 side-panel 1
      - id: status_1_3v3_2
        type: b1
        doc: Status 3V3 side-panel 2
      - id: status_1_3v3_3
        type: b1
        doc: Status 3V3 side-panel 3
      - id: status_1_3v3_bu
        type: b1
        doc: Status 3V3 side-panel backup
      - id: status_1_5v_1
        type: b1
        doc: Status 5V side-panel 1 
      - id: status_1_5v_2
        type: b1
        doc: Status 5V side-panel 2
      - id: status_1_5v_3
        type: b1
        doc: Status 5V side-panel 3
      - id: status_1_5v_4
        type: b1
        doc: Status 5V side-panel 4
      - id: status_2_power_low
        type: b1
        doc: Power low warning
      - id: status_2_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1 
      - id: status_2_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2 
      - id: status_2_3v3
        type: b1
        doc: Status 3V3
      - id: status_2_5v
        type: b1
        doc: Status 5V
      - id: status_2_mode
        type: b3
        doc: |
          Mode:
          000: Debug Mode
          001: Boot Mode
          010: Flight Mode
          011: Power Down Mode
          100: Safe Mode
      - id: status_3_3v3_burst
        type: b1
        doc: Status 3V3 burst mode
      - id: status_3_5v_burst
        type: b1
        doc: Status 5V burst mode
      - id: status_3_bat1_pv2
        type: b1
        doc: Status BAT1 connected to PV2 
      - id: status_3_bat2_pv1
        type: b1
        doc: Status BAT2 connected to PV1 
      - id: status_3_temp_warning
        type: b1
        doc: Temperature warning
      - id: status_3_cc1
        type: b1
        doc: Status CC1 connection
      - id: status_3_cc2
        type: b1
        doc: Status CC2 connection
      - id: status_3_rbf
        type: b1
        doc: Status RBF
      - id: status_cc1_mode
        type: b2
        doc: |
          CC Mode:
          00: Boot Mode
          01: Flight Mode
          10: Safe Mode
          11: CC1 unavailable
      - id: status_cc1_mc_timeout
        type: b1
        doc: Status MC timeout
      - id: status_cc1_tbd
        type: b1
        doc: TBD
      - id: status_cc1_en_i2c
        type: b1
        doc: Status EN_I2C
      - id: status_cc1_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1
      - id: status_cc1_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2
      - id: status_cc1_3v3_backup
        type: b1
        doc: Status 3V3 backup
      - id: status_cc2_mode
        type: b2
        doc: |
          CC Mode:
          00: Boot Mode
          01: Flight Mode
          10: Safe Mode
          11: CC2 unavailable
      - id: status_cc2_mc_timeout
        type: b1
        doc: Status MC timeout
      - id: status_cc2_tbd
        type: b1
        doc: TBD
      - id: status_cc2_en_i2c
        type: b1
        doc: Status EN_I2C
      - id: status_cc2_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1
      - id: status_cc2_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2
      - id: status_cc2_3v3_backup
        type: b1
        doc: Status 3V3 backup
      - id: temp_a
        type: s1
        doc: Temperature of TRX module A of STACIE [°C]
      - id: temp_c
        type: s1
        doc: Temperature of TRX module C of STACIE [°C]
      - id: rssi_a_raw
        type: u1
      - id: rssi_b_raw
        type: u1
      - id: state_machine_su_script
        type: b1
        doc: SU Script active (1 if science script is running or waiting for next time table entry/next day)
      - id: state_machine_su_powered
        type: b1
        doc: SU Powered (1 if Science Unit is active and powered on)
      - id: state_machine_adcs
        type: b1
        doc: ADCS enabled (1 if enabled, 0 if disabled)
      - id: state_machine_not_used
        type: b1
        doc: Not in use!
      - id: state_machine_obc
        type: b4
        doc: OBC Mission State
      - id: mission_counter
        type: u1
        doc: OBC Mission Counter High byte
      - id: mission_counter_2
        type: u1
        doc: OBC Mission Counter Low Byte
    instances:
      v_pv1: # UFix 3.5
        value: (((v_pv1_raw & 0b10000000)/128)*4)
          + (((v_pv1_raw & 0b01000000)/64)*2)
          + (((v_pv1_raw & 0b00100000)/32)*1)
          + (((v_pv1_raw & 0b00010000)/16)*0.5)
          + (((v_pv1_raw & 0b00001000)/8)*0.25)
          + (((v_pv1_raw & 0b00000100)/4)*0.125)
          + (((v_pv1_raw & 0b00000010)/2)*0.0625)
          + (((v_pv1_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at PV1-bus (Solarbus 1) [V]
      v_pv2: # UFix 3.5
        value: (((v_pv2_raw & 0b10000000)/128)*4)
          + (((v_pv2_raw & 0b01000000)/64)*2)
          + (((v_pv2_raw & 0b00100000)/32)*1)
          + (((v_pv2_raw & 0b00010000)/16)*0.5)
          + (((v_pv2_raw & 0b00001000)/8)*0.25)
          + (((v_pv2_raw & 0b00000100)/4)*0.125)
          + (((v_pv2_raw & 0b00000010)/2)*0.0625)
          + (((v_pv2_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at PV2-bus (Solarbus 1) [V]
      v_5v_in: # UFix 3.5
        value: (((v_5v_in_raw & 0b10000000)/128)*4)
          + (((v_5v_in_raw & 0b01000000)/64)*2)
          + (((v_5v_in_raw & 0b00100000)/32)*1)
          + (((v_5v_in_raw & 0b00010000)/16)*0.5)
          + (((v_5v_in_raw & 0b00001000)/8)*0.25)
          + (((v_5v_in_raw & 0b00000100)/4)*0.125)
          + (((v_5v_in_raw & 0b00000010)/2)*0.0625)
          + (((v_5v_in_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the input of the 5V converter measured at FET3-1 [V]
      v_3v3_in: # UFix 3.5
        value: (((v_3v3_in_raw & 0b10000000)/128)*4)
          + (((v_3v3_in_raw & 0b01000000)/64)*2)
          + (((v_3v3_in_raw & 0b00100000)/32)*1)
          + (((v_3v3_in_raw & 0b00010000)/16)*0.5)
          + (((v_3v3_in_raw & 0b00001000)/8)*0.25)
          + (((v_3v3_in_raw & 0b00000100)/4)*0.125)
          + (((v_3v3_in_raw & 0b00000010)/2)*0.0625)
          + (((v_3v3_in_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the input of the 3V3 converter measured at FET5-2 [V]
      v_5v_out: # UFix 3.5
        value: (((v_5v_out_raw & 0b10000000)/128)*4)
          + (((v_5v_out_raw & 0b01000000)/64)*2)
          + (((v_5v_out_raw & 0b00100000)/32)*1)
          + (((v_5v_out_raw & 0b00010000)/16)*0.5)
          + (((v_5v_out_raw & 0b00001000)/8)*0.25)
          + (((v_5v_out_raw & 0b00000100)/4)*0.125)
          + (((v_5v_out_raw & 0b00000010)/2)*0.0625)
          + (((v_5v_out_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the 5V converter [V]
      v_3v3_out: # UFix 3.5
        value: (((v_3v3_out_raw & 0b10000000)/128)*4)
          + (((v_3v3_out_raw & 0b01000000)/64)*2)
          + (((v_3v3_out_raw & 0b00100000)/32)*1)
          + (((v_3v3_out_raw & 0b00010000)/16)*0.5)
          + (((v_3v3_out_raw & 0b00001000)/8)*0.25)
          + (((v_3v3_out_raw & 0b00000100)/4)*0.125)
          + (((v_3v3_out_raw & 0b00000010)/2)*0.0625)
          + (((v_3v3_out_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the 3V3 converter [V]
      i_pv1_5v: # Fix 3.4
        value: (((i_pv1_5v_raw & 0b10000000)/128)*-8)
          + (((i_pv1_5v_raw & 0b01000000)/64)*4)
          + (((i_pv1_5v_raw & 0b00100000)/32)*2)
          + (((i_pv1_5v_raw & 0b00010000)/16)*1)
          + (((i_pv1_5v_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_5v_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_5v_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_5v_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET3-1 between PV1-bus and 5V converter [A]
      i_pv2_5v: # Fix 3.4
        value: (((i_pv2_5v_raw & 0b10000000)/128)*-8)
          + (((i_pv2_5v_raw & 0b01000000)/64)*4)
          + (((i_pv2_5v_raw & 0b00100000)/32)*2)
          + (((i_pv2_5v_raw & 0b00010000)/16)*1)
          + (((i_pv2_5v_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_5v_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_5v_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_5v_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET3-2 between PV2-bus and 5V converter [A]
      i_pv1_3v3: # Fix 3.4
        value: (((i_pv1_3v3_raw & 0b10000000)/128)*-8)
          + (((i_pv1_3v3_raw & 0b01000000)/64)*4)
          + (((i_pv1_3v3_raw & 0b00100000)/32)*2)
          + (((i_pv1_3v3_raw & 0b00010000)/16)*1)
          + (((i_pv1_3v3_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_3v3_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_3v3_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_3v3_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET5-1 between PV1-bus and 3V3 converter [A]
      i_pv2_3v3: # Fix 3.4
        value: (((i_pv2_3v3_raw & 0b10000000)/128)*-8)
          + (((i_pv2_3v3_raw & 0b01000000)/64)*4)
          + (((i_pv2_3v3_raw & 0b00100000)/32)*2)
          + (((i_pv2_3v3_raw & 0b00010000)/16)*1)
          + (((i_pv2_3v3_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_3v3_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_3v3_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_3v3_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET5-2 between PV2-bus and 3V3 converter [A]
      v_hv: # UFix 3.5
        value: (((v_hv_raw & 0b10000000)/128)*4)
          + (((v_hv_raw & 0b01000000)/64)*2)
          + (((v_hv_raw & 0b00100000)/32)*1)
          + (((v_hv_raw & 0b00010000)/16)*0.5)
          + (((v_hv_raw & 0b00001000)/8)*0.25)
          + (((v_hv_raw & 0b00000100)/4)*0.125)
          + (((v_hv_raw & 0b00000010)/2)*0.0625)
          + (((v_hv_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the HV supply to the PPTs measured at FET4-2 [V]
      i_pv1_bat1: # Fix 3.4
        value: (((i_pv1_bat1_raw & 0b10000000)/128)*-8)
          + (((i_pv1_bat1_raw & 0b01000000)/64)*4)
          + (((i_pv1_bat1_raw & 0b00100000)/32)*2)
          + (((i_pv1_bat1_raw & 0b00010000)/16)*1)
          + (((i_pv1_bat1_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_bat1_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_bat1_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_bat1_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET1-1 between PV1-bus and battery 1 [A]
          + charging, - discharging
      i_pv2_bat1: # Fix 3.4
        value: (((i_pv2_bat1_raw & 0b10000000)/128)*-8)
          + (((i_pv2_bat1_raw & 0b01000000)/64)*4)
          + (((i_pv2_bat1_raw & 0b00100000)/32)*2)
          + (((i_pv2_bat1_raw & 0b00010000)/16)*1)
          + (((i_pv2_bat1_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_bat1_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_bat1_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_bat1_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET1-2 between PV2-bus and battery 1 [A]
          + charging, - discharging
      i_pv1_bat2: # Fix 3.4
        value: (((i_pv1_bat2_raw & 0b10000000)/128)*-8)
          + (((i_pv1_bat2_raw & 0b01000000)/64)*4)
          + (((i_pv1_bat2_raw & 0b00100000)/32)*2)
          + (((i_pv1_bat2_raw & 0b00010000)/16)*1)
          + (((i_pv1_bat2_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_bat2_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_bat2_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_bat2_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET2-1 between PV1-bus and battery 2 [A]
          + charging, - discharging
      i_pv2_bat2: # Fix 3.4
        value: (((i_pv2_bat2_raw & 0b10000000)/128)*-8)
          + (((i_pv2_bat2_raw & 0b01000000)/64)*4)
          + (((i_pv2_bat2_raw & 0b00100000)/32)*2)
          + (((i_pv2_bat2_raw & 0b00010000)/16)*1)
          + (((i_pv2_bat2_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_bat2_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_bat2_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_bat2_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET2-2 between PV2-bus and battery 2 [A]
          + charging, - discharging
      v_bat1: # UFix 3.5
        value: (((v_bat1_raw & 0b10000000)/128)*4)
          + (((v_bat1_raw & 0b01000000)/64)*2)
          + (((v_bat1_raw & 0b00100000)/32)*1)
          + (((v_bat1_raw & 0b00010000)/16)*0.5)
          + (((v_bat1_raw & 0b00001000)/8)*0.25)
          + (((v_bat1_raw & 0b00000100)/4)*0.125)
          + (((v_bat1_raw & 0b00000010)/2)*0.0625)
          + (((v_bat1_raw & 0b00000001)/1)*0.03125)
        doc: Voltage of the battery 1 [V]
      v_bat2: # UFix 3.5
        value: (((v_bat2_raw & 0b10000000)/128)*4)
          + (((v_bat2_raw & 0b01000000)/64)*2)
          + (((v_bat2_raw & 0b00100000)/32)*1)
          + (((v_bat2_raw & 0b00010000)/16)*0.5)
          + (((v_bat2_raw & 0b00001000)/8)*0.25)
          + (((v_bat2_raw & 0b00000100)/4)*0.125)
          + (((v_bat2_raw & 0b00000010)/2)*0.0625)
          + (((v_bat2_raw & 0b00000001)/1)*0.03125)
        doc: Voltage of the battery 2 [V]
      vcc_cc2: # UFix 3.5
        value: (((vcc_cc2_raw & 0b10000000)/128)*4)
          + (((vcc_cc2_raw & 0b01000000)/64)*2)
          + (((vcc_cc2_raw & 0b00100000)/32)*1)
          + (((vcc_cc2_raw & 0b00010000)/16)*0.5)
          + (((vcc_cc2_raw & 0b00001000)/8)*0.25)
          + (((vcc_cc2_raw & 0b00000100)/4)*0.125)
          + (((vcc_cc2_raw & 0b00000010)/2)*0.0625)
          + (((vcc_cc2_raw & 0b00000001)/1)*0.03125)
        doc: Supply voltage of CC2 (communication controller 2) [V]
      vcc_cc1: # UFix 3.5
        value: (((vcc_cc1_raw & 0b10000000)/128)*4)
          + (((vcc_cc1_raw & 0b01000000)/64)*2)
          + (((vcc_cc1_raw & 0b00100000)/32)*1)
          + (((vcc_cc1_raw & 0b00010000)/16)*0.5)
          + (((vcc_cc1_raw & 0b00001000)/8)*0.25)
          + (((vcc_cc1_raw & 0b00000100)/4)*0.125)
          + (((vcc_cc1_raw & 0b00000010)/2)*0.0625)
          + (((vcc_cc1_raw & 0b00000001)/1)*0.03125)
        doc: Supply voltage of CC1 (communication controller 1) [V]
      rssi_a:
        value: -132.0 + rssi_a_raw/2
        doc: Received Signal Strength Indication of TRX module A during the last uplink [dBm]
      rssi_b:
        value: -132.0 + rssi_b_raw/2
        doc: Received Signal Strength Indication of TRX module C during the last uplink [dBm]
  
  o1_beacon:
  # The O1-beacon format is as follows:
  #  [  1 byte   | 6 bytes  | 31 bytes | 5 bytes | 3 bytes | 2 bytes (depending on deframer) | 16 bytes (depending on deframer)]
  #  [ PID 0x53  |   CALL   |    EPS   | STACIE  |   OBC   |               CRC               |               FEC               ]
    seq:
      - id: call
        type: str
        size: 6
        encoding: ASCII
        doc: Satellite Callsign
      - id: v_pv1_raw
        type: u1
      - id: v_pv2_raw
        type: u1
      - id: v_5v_in_raw
        type: u1
      - id: v_3v3_in_raw
        type: u1
      - id: v_5v_out_raw
        type: u1
      - id: v_3v3_out_raw
        type: u1
      - id: i_pv1_5v_raw
        type: u1
      - id: i_pv2_5v_raw
        type: u1
      - id: i_pv1_3v3_raw
        type: u1
      - id: i_pv2_3v3_raw
        type: u1
      - id: temp_bat1sw
        type: s1
        doc: Deactivated by default!
      - id: temp_5v
        doc: Temperature near 5V converter [°C]
        type: s1
      - id: v_hv_raw
        type: u1
      - id: i_pv1_bat1_raw
        type: u1
      - id: i_pv2_bat1_raw
        type: u1
      - id: i_pv1_bat2_raw
        type: u1
      - id: i_pv2_bat2_raw
        type: u1
      - id: v_bat1_raw
        type: u1
      - id: v_bat2_raw
        type: u1
      - id: vcc_cc2_raw
        type: u1
      - id: vcc_cc1_raw
        type: u1
      - id: temp_bat1
        type: s1
        doc: Temperature of battery 1 on the battery holder [°C]
      - id: temp_bat2
        type: s1
        doc: Temperature of battery 2 on the battery holder [°C]
      - id: status_1_3v3_1
        type: b1
        doc: Status 3V3 side-panel 1
      - id: status_1_3v3_2
        type: b1
        doc: Status 3V3 side-panel 2
      - id: status_1_3v3_3
        type: b1
        doc: Status 3V3 side-panel 3
      - id: status_1_3v3_bu
        type: b1
        doc: Status 3V3 side-panel backup
      - id: status_1_5v_1
        type: b1
        doc: Status 5V side-panel 1 
      - id: status_1_5v_2
        type: b1
        doc: Status 5V side-panel 2
      - id: status_1_5v_3
        type: b1
        doc: Status 5V side-panel 3
      - id: status_1_5v_4
        type: b1
        doc: Status 5V side-panel 4
      - id: status_2_power_low
        type: b1
        doc: Power low warning
      - id: status_2_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1 
      - id: status_2_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2 
      - id: status_2_3v3
        type: b1
        doc: Status 3V3
      - id: status_2_5v
        type: b1
        doc: Status 5V
      - id: status_2_mode
        type: b3
        doc: |
          Mode:
          000: Debug Mode
          001: Boot Mode
          010: Flight Mode
          011: Power Down Mode
          100: Safe Mode
      - id: status_3_3v3_burst
        type: b1
        doc: Status 3V3 burst mode
      - id: status_3_5v_burst
        type: b1
        doc: Status 5V burst mode
      - id: status_3_bat1_pv2
        type: b1
        doc: Status BAT1 connected to PV2 
      - id: status_3_bat2_pv1
        type: b1
        doc: Status BAT2 connected to PV1 
      - id: status_3_temp_warning
        type: b1
        doc: Temperature warning
      - id: status_3_cc1
        type: b1
        doc: Status CC1 connection
      - id: status_3_cc2
        type: b1
        doc: Status CC2 connection
      - id: status_3_rbf
        type: b1
        doc: Status RBF
      - id: status_cc1_mode
        type: b2
        doc: |
          CC Mode:
          00: Boot Mode
          01: Flight Mode
          10: Safe Mode
          11: CC1 unavailable
      - id: status_cc1_mc_timeout
        type: b1
        doc: Status MC timeout
      - id: status_cc1_tbd
        type: b1
        doc: TBD
      - id: status_cc1_en_i2c
        type: b1
        doc: Status EN_I2C
      - id: status_cc1_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1
      - id: status_cc1_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2
      - id: status_cc1_3v3_backup
        type: b1
        doc: Status 3V3 backup
      - id: status_cc2_mode
        type: b2
        doc: |
          CC Mode:
          00: Boot Mode
          01: Flight Mode
          10: Safe Mode
          11: CC2 unavailable
      - id: status_cc2_mc_timeout
        type: b1
        doc: Status MC timeout
      - id: status_cc2_tbd
        type: b1
        doc: TBD
      - id: status_cc2_en_i2c
        type: b1
        doc: Status EN_I2C
      - id: status_cc2_bat1_pv1
        type: b1
        doc: Status BAT1 connected to PV1
      - id: status_cc2_bat2_pv2
        type: b1
        doc: Status BAT2 connected to PV2
      - id: status_cc2_3v3_backup
        type: b1
        doc: Status 3V3 backup
      - id: reboot_mc
        type: u1
        doc: Number of reboots since RBF of the main controller
      - id: reboot_cc1
        type: u1
        doc: Number of reboots since RBF of the first communication controller
      - id: reboot_cc2
        type: u1
        doc: Number of reboots since RBF of the second communication controller 
      - id: temp_a
        type: s1
        doc: Temperature of TRX module A of STACIE [°C]
      - id: temp_c
        type: s1
        doc: Temperature of TRX module C of STACIE [°C]
      - id: rssi_a_raw
        type: u1
      - id: rssi_b_raw
        type: u1
      - id: stacie_mode_a
        type: b4
        doc: Status of TRX module A of STACIE
      - id: stacie_mode_c
        type: b4
        doc: Status of TRX module C of STACIE
      - id: state_machine_su_script
        type: b1
        doc: SU Script active (1 if science script is running or waiting for next time table entry/next day)
      - id: state_machine_su_powered
        type: b1
        doc: SU Powered (1 if Science Unit is active and powered on)
      - id: state_machine_adcs
        type: b1
        doc: ADCS enabled (1 if enabled, 0 if disabled)
      - id: state_machine_not_used
        type: b1
        doc: Not in use!
      - id: state_machine_obc
        type: b4
        doc: OBC Mission State
      - id: mission_counter
        type: u1
        doc: OBC Mission Counter High byte
      - id: mission_counter_2
        type: u1
        doc: OBC Mission Counter Low Byte
    instances:
      v_pv1: # UFix 3.5
        value: (((v_pv1_raw & 0b10000000)/128)*4)
          + (((v_pv1_raw & 0b01000000)/64)*2)
          + (((v_pv1_raw & 0b00100000)/32)*1)
          + (((v_pv1_raw & 0b00010000)/16)*0.5)
          + (((v_pv1_raw & 0b00001000)/8)*0.25)
          + (((v_pv1_raw & 0b00000100)/4)*0.125)
          + (((v_pv1_raw & 0b00000010)/2)*0.0625)
          + (((v_pv1_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at PV1-bus (Solarbus 1) [V]
      v_pv2: # UFix 3.5
        value: (((v_pv2_raw & 0b10000000)/128)*4)
          + (((v_pv2_raw & 0b01000000)/64)*2)
          + (((v_pv2_raw & 0b00100000)/32)*1)
          + (((v_pv2_raw & 0b00010000)/16)*0.5)
          + (((v_pv2_raw & 0b00001000)/8)*0.25)
          + (((v_pv2_raw & 0b00000100)/4)*0.125)
          + (((v_pv2_raw & 0b00000010)/2)*0.0625)
          + (((v_pv2_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at PV2-bus (Solarbus 1) [V]
      v_5v_in: # UFix 3.5
        value: (((v_5v_in_raw & 0b10000000)/128)*4)
          + (((v_5v_in_raw & 0b01000000)/64)*2)
          + (((v_5v_in_raw & 0b00100000)/32)*1)
          + (((v_5v_in_raw & 0b00010000)/16)*0.5)
          + (((v_5v_in_raw & 0b00001000)/8)*0.25)
          + (((v_5v_in_raw & 0b00000100)/4)*0.125)
          + (((v_5v_in_raw & 0b00000010)/2)*0.0625)
          + (((v_5v_in_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the input of the 5V converter measured at FET3-1 [V]
      v_3v3_in: # UFix 3.5
        value: (((v_3v3_in_raw & 0b10000000)/128)*4)
          + (((v_3v3_in_raw & 0b01000000)/64)*2)
          + (((v_3v3_in_raw & 0b00100000)/32)*1)
          + (((v_3v3_in_raw & 0b00010000)/16)*0.5)
          + (((v_3v3_in_raw & 0b00001000)/8)*0.25)
          + (((v_3v3_in_raw & 0b00000100)/4)*0.125)
          + (((v_3v3_in_raw & 0b00000010)/2)*0.0625)
          + (((v_3v3_in_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the input of the 3V3 converter measured at FET5-2 [V]
      v_5v_out: # UFix 3.5
        value: (((v_5v_out_raw & 0b10000000)/128)*4)
          + (((v_5v_out_raw & 0b01000000)/64)*2)
          + (((v_5v_out_raw & 0b00100000)/32)*1)
          + (((v_5v_out_raw & 0b00010000)/16)*0.5)
          + (((v_5v_out_raw & 0b00001000)/8)*0.25)
          + (((v_5v_out_raw & 0b00000100)/4)*0.125)
          + (((v_5v_out_raw & 0b00000010)/2)*0.0625)
          + (((v_5v_out_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the 5V converter [V]
      v_3v3_out: # UFix 3.5
        value: (((v_3v3_out_raw & 0b10000000)/128)*4)
          + (((v_3v3_out_raw & 0b01000000)/64)*2)
          + (((v_3v3_out_raw & 0b00100000)/32)*1)
          + (((v_3v3_out_raw & 0b00010000)/16)*0.5)
          + (((v_3v3_out_raw & 0b00001000)/8)*0.25)
          + (((v_3v3_out_raw & 0b00000100)/4)*0.125)
          + (((v_3v3_out_raw & 0b00000010)/2)*0.0625)
          + (((v_3v3_out_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the 3V3 converter [V]
      i_pv1_5v: # Fix 3.4
        value: (((i_pv1_5v_raw & 0b10000000)/128)*-8)
          + (((i_pv1_5v_raw & 0b01000000)/64)*4)
          + (((i_pv1_5v_raw & 0b00100000)/32)*2)
          + (((i_pv1_5v_raw & 0b00010000)/16)*1)
          + (((i_pv1_5v_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_5v_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_5v_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_5v_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET3-1 between PV1-bus and 5V converter [A]
      i_pv2_5v: # Fix 3.4
        value: (((i_pv2_5v_raw & 0b10000000)/128)*-8)
          + (((i_pv2_5v_raw & 0b01000000)/64)*4)
          + (((i_pv2_5v_raw & 0b00100000)/32)*2)
          + (((i_pv2_5v_raw & 0b00010000)/16)*1)
          + (((i_pv2_5v_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_5v_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_5v_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_5v_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET3-2 between PV2-bus and 5V converter [A]
      i_pv1_3v3: # Fix 3.4
        value: (((i_pv1_3v3_raw & 0b10000000)/128)*-8)
          + (((i_pv1_3v3_raw & 0b01000000)/64)*4)
          + (((i_pv1_3v3_raw & 0b00100000)/32)*2)
          + (((i_pv1_3v3_raw & 0b00010000)/16)*1)
          + (((i_pv1_3v3_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_3v3_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_3v3_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_3v3_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET5-1 between PV1-bus and 3V3 converter [A]
      i_pv2_3v3: # Fix 3.4
        value: (((i_pv2_3v3_raw & 0b10000000)/128)*-8)
          + (((i_pv2_3v3_raw & 0b01000000)/64)*4)
          + (((i_pv2_3v3_raw & 0b00100000)/32)*2)
          + (((i_pv2_3v3_raw & 0b00010000)/16)*1)
          + (((i_pv2_3v3_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_3v3_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_3v3_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_3v3_raw & 0b00000001)/1)*0.0625)
        doc: Current through FET5-2 between PV2-bus and 3V3 converter [A]
      v_hv: # UFix 3.5
        value: (((v_hv_raw & 0b10000000)/128)*4)
          + (((v_hv_raw & 0b01000000)/64)*2)
          + (((v_hv_raw & 0b00100000)/32)*1)
          + (((v_hv_raw & 0b00010000)/16)*0.5)
          + (((v_hv_raw & 0b00001000)/8)*0.25)
          + (((v_hv_raw & 0b00000100)/4)*0.125)
          + (((v_hv_raw & 0b00000010)/2)*0.0625)
          + (((v_hv_raw & 0b00000001)/1)*0.03125)
        doc: Voltage at the output of the HV supply to the PPTs measured at FET4-2 [V]
      i_pv1_bat1: # Fix 3.4
        value: (((i_pv1_bat1_raw & 0b10000000)/128)*-8)
          + (((i_pv1_bat1_raw & 0b01000000)/64)*4)
          + (((i_pv1_bat1_raw & 0b00100000)/32)*2)
          + (((i_pv1_bat1_raw & 0b00010000)/16)*1)
          + (((i_pv1_bat1_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_bat1_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_bat1_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_bat1_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET1-1 between PV1-bus and battery 1 [A]
          + charging, - discharging
      i_pv2_bat1: # Fix 3.4
        value: (((i_pv2_bat1_raw & 0b10000000)/128)*-8)
          + (((i_pv2_bat1_raw & 0b01000000)/64)*4)
          + (((i_pv2_bat1_raw & 0b00100000)/32)*2)
          + (((i_pv2_bat1_raw & 0b00010000)/16)*1)
          + (((i_pv2_bat1_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_bat1_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_bat1_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_bat1_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET1-2 between PV2-bus and battery 1 [A]
          + charging, - discharging
      i_pv1_bat2: # Fix 3.4
        value: (((i_pv1_bat2_raw & 0b10000000)/128)*-8)
          + (((i_pv1_bat2_raw & 0b01000000)/64)*4)
          + (((i_pv1_bat2_raw & 0b00100000)/32)*2)
          + (((i_pv1_bat2_raw & 0b00010000)/16)*1)
          + (((i_pv1_bat2_raw & 0b00001000)/8)*0.5)
          + (((i_pv1_bat2_raw & 0b00000100)/4)*0.25)
          + (((i_pv1_bat2_raw & 0b00000010)/2)*0.125)
          + (((i_pv1_bat2_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET2-1 between PV1-bus and battery 2 [A]
          + charging, - discharging
      i_pv2_bat2: # Fix 3.4
        value: (((i_pv2_bat2_raw & 0b10000000)/128)*-8)
          + (((i_pv2_bat2_raw & 0b01000000)/64)*4)
          + (((i_pv2_bat2_raw & 0b00100000)/32)*2)
          + (((i_pv2_bat2_raw & 0b00010000)/16)*1)
          + (((i_pv2_bat2_raw & 0b00001000)/8)*0.5)
          + (((i_pv2_bat2_raw & 0b00000100)/4)*0.25)
          + (((i_pv2_bat2_raw & 0b00000010)/2)*0.125)
          + (((i_pv2_bat2_raw & 0b00000001)/1)*0.0625)
        doc: |
          Current through FET2-2 between PV2-bus and battery 2 [A]
          + charging, - discharging
      v_bat1: # UFix 3.5
        value: (((v_bat1_raw & 0b10000000)/128)*4)
          + (((v_bat1_raw & 0b01000000)/64)*2)
          + (((v_bat1_raw & 0b00100000)/32)*1)
          + (((v_bat1_raw & 0b00010000)/16)*0.5)
          + (((v_bat1_raw & 0b00001000)/8)*0.25)
          + (((v_bat1_raw & 0b00000100)/4)*0.125)
          + (((v_bat1_raw & 0b00000010)/2)*0.0625)
          + (((v_bat1_raw & 0b00000001)/1)*0.03125)
        doc: Voltage of the battery 1 [V]
      v_bat2: # UFix 3.5
        value: (((v_bat2_raw & 0b10000000)/128)*4)
          + (((v_bat2_raw & 0b01000000)/64)*2)
          + (((v_bat2_raw & 0b00100000)/32)*1)
          + (((v_bat2_raw & 0b00010000)/16)*0.5)
          + (((v_bat2_raw & 0b00001000)/8)*0.25)
          + (((v_bat2_raw & 0b00000100)/4)*0.125)
          + (((v_bat2_raw & 0b00000010)/2)*0.0625)
          + (((v_bat2_raw & 0b00000001)/1)*0.03125)
        doc: Voltage of the battery 2 [V]
      vcc_cc2: # UFix 3.5
        value: (((vcc_cc2_raw & 0b10000000)/128)*4)
          + (((vcc_cc2_raw & 0b01000000)/64)*2)
          + (((vcc_cc2_raw & 0b00100000)/32)*1)
          + (((vcc_cc2_raw & 0b00010000)/16)*0.5)
          + (((vcc_cc2_raw & 0b00001000)/8)*0.25)
          + (((vcc_cc2_raw & 0b00000100)/4)*0.125)
          + (((vcc_cc2_raw & 0b00000010)/2)*0.0625)
          + (((vcc_cc2_raw & 0b00000001)/1)*0.03125)
        doc: Supply voltage of CC2 (communication controller 2) [V]
      vcc_cc1: # UFix 3.5
        value: (((vcc_cc1_raw & 0b10000000)/128)*4)
          + (((vcc_cc1_raw & 0b01000000)/64)*2)
          + (((vcc_cc1_raw & 0b00100000)/32)*1)
          + (((vcc_cc1_raw & 0b00010000)/16)*0.5)
          + (((vcc_cc1_raw & 0b00001000)/8)*0.25)
          + (((vcc_cc1_raw & 0b00000100)/4)*0.125)
          + (((vcc_cc1_raw & 0b00000010)/2)*0.0625)
          + (((vcc_cc1_raw & 0b00000001)/1)*0.03125)
        doc: Supply voltage of CC1 (communication controller 1) [V]
      rssi_a:
        value: -132.0 + rssi_a_raw/2
        doc: Received Signal Strength Indication of TRX module A during the last uplink [dBm]
      rssi_b:
        value: -132.0 + rssi_b_raw/2
        doc: Received Signal Strength Indication of TRX module C during the last uplink [dBm]
  
  o2_beacon:
  # The O2-beacon format is as follows:
  # [  1 byte  | 6 bytes | 15 bytes | 2 bytes | 16 bytes |  4 bytes  | 2 bytes | 2 bytes (depending on deframer) | 16 bytes (depending on deframer)]
  # [ PID 0x53 |  CALL   |    GPS   |   ADCS  |    OBC   | SidePanel |   OBC   |               CRC               |               FEC               ]
    seq:
      - id: call
        type: str
        size: 6
        encoding: ASCII
        doc: Satellite Callsign
      - id: gps_time_padding
        size: 4
      - id: geo_location_padding
        size: 11
      - id: adcs_status_padding
        size: 1
      - id: adcs_angle_deviation_padding
        size: 1
      - id: status_task_sensors_running
        type: b1
        doc: Status main sensor task running
      - id: status_obc_3v3_spa_enabled
        type: b1
        doc: Status standard power supply rail of the OBC 
      - id: status_obc_power_saving_mode
        type: b1
        doc: Status OBC power saving mode
      - id: status_eps_cc_used
        type: b1
        doc: Status EPS CC (1 if CC1, 2 if CC2)
      - id: status_last_reset_source
        type: b2
        doc: |
          Status Last Reset Source:
          00: Power-on Reset (POR)
          01: External signal (EXTR)
          10: Watchdog timer (WDTR)
          11: Brown-out detector reset (BODR)
      - id: status_power_source
        type: b1
        doc: |
          Status Power Source:
          0: 3.3V SPA
          1: V Backup
      - id: status_crystal_osicallation_in_use
        type: b1
        doc: Status crystal oscilator operational
      - id: status_ssp1_initialized
        type: b1
        doc: SSP-1 interface is operational
      - id: status_ssp0_initialized
        type: b1
        doc: SSP-0 interface is operational
      - id: status_i2c2_initialized
        type: b1
        doc: I2C-2 interface is operational
      - id: status_i2c1_initialized
        type: b1
        doc: I2C-1 interface is operational
      - id: status_i2c0_initialized
        type: b1
        doc: I2C-0 interface is operational
      - id: status_rtc_synchronized
        type: b1
        doc: RTC time and date is up to date
      - id: status_statemachine_initialized
        type: b1
        doc: Status statemachine task is initialized
      - id: status_task_maintenance_running
        type: b1
        doc: Status mandatory maintenance task is running
      - id: status_uart_ttc1_initialized
        type: b1
        doc: Status UART TTC1 interface operational
      - id: status_uart_mnlp_initialized
        type: b1
        doc: Status UART MNLP interface operational
      - id: status_uart_ttc2_initialized
        type: b1
        doc: Status UART TTC2 interface operational
      - id: status_uart_gps_initialized
        type: b1
        doc: Status UART GPS interface operational
      - id: status_adc_initialized
        type: b1
        doc: Status ADC is operational
      - id: status_rtc_initialized
        type: b1
        doc: Status RTC (real time clock) is operational
      - id: status_i2c_switches_initialized
        type: b1
        doc: Status I2C switches are initialized
      - id: status_supply_switches_initialized
        type: b1
        doc: Status GPIOs for power supply switching are initialized
      - id: status_eeprom3_initialized
        type: b1
        doc: Status EEPROM3 initialized
      - id: status_eeprom2_initialized
        type: b1
        doc: Status EEPROM2 initialized
      - id: status_eeprom1_initialized
        type: b1
        doc: Status EEPROM1 initialized
      - id: status_eps_cc2_operational
        type: b1
        doc: Status EPS CC2 communicationn ok
      - id: status_eps_cc1_opeational
        type: b1
        doc: Status EPS CC1 communication ok
      - id: status_timer1_initialized
        type: b1
        doc: Status timer1 initialized
      - id: status_watchdog_initialized
        type: b1
        doc: Status Watchdog initialized
      - id: status_timer0_initialized
        type: b1
        doc: Status timer0 initialized
      - id: status_mpu_initialized
        type: b1
        doc: Status MPU gyro initialized
      - id: status_onboard_tmp100_initialized
        type: b1
        doc: Status onboard TMP100 temp sensor operational
      - id: status_onboard_mag_initialized
        type: b1
        doc: Status onboard magnetometer operational
      - id: status_msp_initialized
        type: b1
        doc: Status MSP JTAG programmer initialized
      - id: status_gyro2_initialized
        type: b1
        doc: Status low rate gyro2 initialized
      - id: status_gyro1_initialized
        type: b1
        doc: Status low rate gyro1 initialized
      - id: status_mag_bp_boom_initialized
        type: b1
        doc: Status magnetomenter on boom initialized
      - id: status_mag_bp_initialized
        type: b1
        doc: Status magnetometer to bottom panel communication ok
      - id: status_bp_initialized
        type: b1
        doc: Status bottom panel operational
      - id: status_sa_initailized
        type: b1
        doc: Status science adapter operational
      - id: status_spd_initialized
        type: b1
        doc: Status side panel D operational
      - id: status_spc_initialized
        type: b1
        doc: Status side panel C operational
      - id: status_spb_initialized
        type: b1
        doc: Status side panel B operational
      - id: status_spa_initialized
        type: b1
        doc: Status side panel A operational
      - id: status_flash2_initialized
        type: b1
        doc: Status external flash storage 2 initialized
      - id: status_flash1_initialized
        type: b1
        doc: Status external flash storage 1 initialized
      - id: status_spd_vcc_on
        type: b1
        doc: Status sidepanel D power supply enabled
      - id: status_spc_vcc_on
        type: b1
        doc: Status sidepanel C power supply enabled
      - id: status_spb_vcc_on
        type: b1
        doc: Status sidepanel B power supply enabled
      - id: status_spa_vcc_on
        type: b1
        doc: Status sidepanel A power supply enabled
      - id: status_science_module_initialized
        type: b1
        doc: Status science module communication operational
      - id: status_ttc2_initialized
        type: b1
        doc: Status TTC2 initialized
      - id: status_ttc1_initialized
        type: b1
        doc: Status TTC1 initialized
      - id: status_gps_initialized
        type: b1
        doc: Status GPS initialized
      - id: status_onboard_mag_powersafe
        type: b1
        doc: Status onboard magnetometer power saving mode
      - id: status_i2c_sw_d_on
        type: b1
        doc: Status I2C of sidepanel D is connected
      - id: status_i2c_sw_c_on
        type: b1
        doc: Status I2C of sidepanel C is connected
      - id: status_i2c_sw_b_on
        type: b1
        doc: Status I2C of sidepanel B is connected
      - id: status_i2c_sw_a_on
        type: b1
        doc: Status I2C of sid panel A is connected
      - id: status_sa_vcc_on
        type: b1
        doc: Status power supply science adapater enabled
      - id: status_bp2_vcc_on
        type: b1
        doc: Status power supply of bottom pannel 2 (boom) enabled
      - id: status_bp1_vcc_on
        type: b1
        doc: Status power supply of bottom panel 1 enabled
      - id: status_eeprom_page_cycle_overflow
        type: b1
        doc: |
          Status EEPROM Page Cycle Overflow:
          0: No EEPROM Page Cycle Overflow 
          1: EEPROM Page Cycle Overflow (at least one EEPROM page has >1e6 cycles)
      - id: status_rtc_oscillator_error
        type: b1
        doc: Status oscillator of RTC not operational
      - id: status_mnlp_5v_enabled
        type: b1
        doc: Status 5V power supply for MNLP enabled
      - id: status_mag_bp_boom_power_saving_mode
        type: b1
        doc: Status magnetometer on boom is in power saving mode
      - id: status_mag_bp_power_saving_mode
        type: b1
        doc: Status magnetometer on bottom panel is in power saving mode
      - id: status_tmp100_powersafe
        type: b1
        doc: Status TMP100 temp sensor is in power saving mode
      - id: status_mpu_powersafe
        type: b1
        doc: Status MPU is in power saving mode
      - id: status_gyro_powersafe
        type: b1
        doc: Status low rate gyro is in power saving mode
      - id: status_default_config_used
        type: b1
        doc: Status default config of OBC is used
      - id: status_timer1_running
        type: b1
        doc: Status timer1 is operational and running
      - id: status_timer0_running
        type: b1
        doc: Status timer0 is operational and running
      - id: status_i2c2_frequent_errors
        type: b1
        doc: Status I2C-2 interface produces errors frequently
      - id: status_i2c1_frequent_errors
        type: b1
        doc: Status I2C-1 interface produces errors frequently
      - id: status_i2c0_frequent_errors
        type: b1
        doc: Status I2C-0 interface produces errors frequently
      - id: status_ssp1_frequent_errors
        type: b1
        doc: Status SSP1 interface produces errors frequently
      - id: status_ssp0_frequent_errors
        type: b1
        doc: Status SSP0 interface produces errors frequently
      - id: error_code
        type: u1
        doc: Hardware error code
      - id: error_code_before_reset
        type: u1
        doc: Last hardware error code before reset
      - id: resets_counter
        type: u4
        doc: Reset counter since mission start
      - id: temp_sp_x_minus_raw
        type: u1
      - id: temp_sp_x_plus_raw
        type: u1
        doc: Temperature sidepanel X+
      - id: temp_sp_y_minus_raw
        type: u1
        doc: Temperature sidepanel Y-
      - id: temp_sp_y_plus_raw
        type: u1
        doc: Temperature sidepanel Y+
      - id: script_slot_cs1
        type: b1
        doc: Script Slot CS1
      - id: script_slot_su7
        type: b1
        doc: Script Slot SU7
      - id: script_slot_su6
        type: b1
        doc: Script Slot SU6
      - id: script_slot_su5
        type: b1
        doc: Script Slot SU5
      - id: script_slot_su4
        type: b1
        doc: Script Slot SU5
      - id: script_slot_su3
        type: b1
        doc: Script Slot SU3
      - id: script_slot_su2
        type: b1
        doc: Script Slot SU2
      - id: script_slot_su1
        type: b1
        doc: Script Slot SU1
      - id: script_slot_padding
        type: b4
      - id: script_slot_cs5
        type: b1
        doc: Script Slot CS5
      - id: script_slot_cs4
        type: b1
        doc: Script Slot CS4
      - id: script_slot_cs3
        type: b1
        doc: Script Slot CS3
      - id: script_slot_cs2
        type: b1
        doc: Script Slot CS2
    instances:
      temp_sp_x_minus:
        value: (temp_sp_x_minus_raw * 2.65 - 273.15)
        doc: Temperature sidepanel X- [°C]
      temp_sp_x_plus:
        value: (temp_sp_x_plus_raw * 2.65 - 273.15)
        doc: Temperature sidepanel X+ [°C]
      temp_sp_y_minus:
        value: (temp_sp_y_minus_raw * 2.65 - 273.15)
        doc: Temperature sidepanel Y- [°C]
      temp_sp_y_plus:
        value: (temp_sp_y_plus_raw * 2.65 - 273.15)
        doc: Temperature sidepanel Y+ [°C]

