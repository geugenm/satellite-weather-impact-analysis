---
meta:
  id: estcube2
  title: ESTCube-2
doc: |
  :field timestamp: icp_data.eps.common.unix_time
  :field eps_uptime: icp_data.eps.common.uptime
  :field eps_cpu_temperature: icp_data.eps.common.cpu_temperature
  :field eps_bus_voltage: icp_data.eps.bus_voltage
  :field eps_avg_power_balance: icp_data.eps.avg_power_balance
  :field eps_enable_st: icp_data.eps.enable_st
  :field eps_enable_obc: icp_data.eps.enable_obc
  :field eps_enable_com3v3: icp_data.eps.enable_com_3v3
  :field eps_enable_comdcdc: icp_data.eps.enable_com_dcdc
  :field eps_enable_com_pa: icp_data.eps.enable_com_pa
  :field eps_enable_eps_dcdc1: icp_data.eps.enable_eps_dcdc1
  :field eps_enable_eps_dcdc2: icp_data.eps.enable_eps_dcdc2
  :field eps_enable_sp: icp_data.eps.enable_sp
  :field eps_enable_cgp: icp_data.eps.enable_cgp
  :field eps_enable_hscom: icp_data.eps.enable_hscom
  :field eps_enable_eop1: icp_data.eps.enable_eop1
  :field eps_enable_eop2: icp_data.eps.enable_eop2
  :field eps_enable_esail: icp_data.eps.enable_esail
  :field eps_enable_rw: icp_data.eps.enable_obc_rw

  :field eps_battery_current_a: icp_data.eps.battery_current_a
  :field eps_battery_current_b: icp_data.eps.battery_current_b
  :field eps_battery_voltage_a: icp_data.eps.battery_voltage_a
  :field eps_battery_voltage_b: icp_data.eps.battery_voltage_b
  :field eps_battery_voltage_c: icp_data.eps.battery_voltage_c
  :field eps_battery_voltage_d: icp_data.eps.battery_voltage_d
  :field eps_battery_temperature_a: icp_data.eps.battery_temperature_a
  :field eps_battery_temperature_b: icp_data.eps.battery_temperature_b
  :field eps_battery_temperature_c: icp_data.eps.battery_temperature_c
  :field eps_battery_temperature_d: icp_data.eps.battery_temperature_d

  :field eps_st_voltage: icp_data.eps.st_voltage
  :field eps_st_current: icp_data.eps.st_current
  :field eps_obc_voltage: icp_data.eps.obc_voltage
  :field eps_obc_current: icp_data.eps.obc_current
  :field eps_com_3v3_voltage: icp_data.eps.com_3v3_voltage
  :field eps_com_pa_voltage: icp_data.eps.com_pa_voltage
  :field eps_com_3v3_current: icp_data.eps.com_3v3_current
  :field eps_com_pa_current: icp_data.eps.com_pa_current
  :field eps_eps_voltage: icp_data.eps.eps_voltage
  :field eps_eps_dcdc_3v3_voltage: icp_data.eps.eps_dcdc_3v3_voltage
  :field eps_eps_current: icp_data.eps.eps_current
  :field eps_eps_dcdc1_current: icp_data.eps.eps_dcdc1_current
  :field eps_eps_dcdc2_current: icp_data.eps.eps_dcdc2_current
  :field eps_sp_voltage: icp_data.eps.sp_voltage
  :field eps_sp_current: icp_data.eps.sp_current
  :field eps_cpd_voltage: icp_data.eps.cpd_voltage
  :field eps_cpd_current: icp_data.eps.cpd_current
  :field eps_cam1_voltage: icp_data.eps.cam1_voltage
  :field eps_cam1_current: icp_data.eps.cam1_current
  :field eps_cam2_voltage: icp_data.eps.cam2_voltage
  :field eps_cam2_current: icp_data.eps.cam2_current
  :field eps_hsom_voltage: icp_data.eps.hsom_voltage
  :field eps_hsom_current: icp_data.eps.hsom_current
  :field eps_cgp_5v_voltage: icp_data.eps.cgp_5v_voltage
  :field eps_cgp_mpb_voltage: icp_data.eps.cgp_mpb_voltage
  :field eps_cgp_current: icp_data.eps.cgp_current

  :field timestamp: icp_data.obc.common.unix_time
  :field obc_uptime: icp_data.obc.common.uptime
  :field obc_cpu_temperature: icp_data.obc.common.cpu_temperature
  :field obc_fmc_mram_temperature: icp_data.obc.fmc_mram_temperature
  :field obc_qspi_fram_temperature: icp_data.obc.qspi_fram_temperature
  :field obc_io_expander_temperature: icp_data.obc.io_expander_temperature

  :field aocs_gyroscope_x: icp_data.aocs.bmg160_gyroscope_x
  :field aocs_gyroscope_y: icp_data.aocs.bmg160_gyroscope_y
  :field aocs_gyroscope_z: icp_data.aocs.bmg160_gyroscope_z
  :field aocs_magnetometer_x: icp_data.aocs.lis3mdl_magnetometer_x
  :field aocs_magnetometer_y: icp_data.aocs.lis3mdl_magnetometer_y
  :field aocs_magnetometer_z: icp_data.aocs.lis3mdl_magnetometer_z
  :field aocs_sun_x_intensity1: icp_data.aocs.sun_x_intensity1
  :field aocs_sun_x_intensity2: icp_data.aocs.sun_x_intensity2
  :field aocs_sun_x_intensity3: icp_data.aocs.sun_x_intensity3
  :field aocs_sun_x_intensity4: icp_data.aocs.sun_x_intensity4
  :field aocs_sun_x_intensity5: icp_data.aocs.sun_x_intensity5
  :field aocs_sun_x_intensity6: icp_data.aocs.sun_x_intensity6
  :field aocs_sun_x_intensity_location1: icp_data.aocs.sun_x_intensity_location1
  :field aocs_sun_x_intensity_location2: icp_data.aocs.sun_x_intensity_location2
  :field aocs_sun_x_intensity_location3: icp_data.aocs.sun_x_intensity_location3
  :field aocs_sun_x_intensity_location4: icp_data.aocs.sun_x_intensity_location4
  :field aocs_sun_x_intensity_location5: icp_data.aocs.sun_x_intensity_location5
  :field aocs_sun_x_intensity_location6: icp_data.aocs.sun_x_intensity_location6
  :field aocs_sun_y_intensity1: icp_data.aocs.sun_y_intensity1
  :field aocs_sun_y_intensity2: icp_data.aocs.sun_y_intensity2
  :field aocs_sun_y_intensity3: icp_data.aocs.sun_y_intensity3
  :field aocs_sun_y_intensity4: icp_data.aocs.sun_y_intensity4
  :field aocs_sun_y_intensity5: icp_data.aocs.sun_y_intensity5
  :field aocs_sun_y_intensity6: icp_data.aocs.sun_y_intensity6
  :field aocs_sun_y_intensity_location1: icp_data.aocs.sun_y_intensity_location1
  :field aocs_sun_y_intensity_location2: icp_data.aocs.sun_y_intensity_location2
  :field aocs_sun_y_intensity_location3: icp_data.aocs.sun_y_intensity_location3
  :field aocs_sun_y_intensity_location4: icp_data.aocs.sun_y_intensity_location4
  :field aocs_sun_y_intensity_location5: icp_data.aocs.sun_y_intensity_location5
  :field aocs_sun_y_intensity_location6: icp_data.aocs.sun_y_intensity_location6
  :field aocs_temperature1: icp_data.aocs.mcp9808_temperature1
  :field aocs_temperature2: icp_data.aocs.mcp9808_temperature2
  :field aocs_mode_pointing: icp_data.aocs.pointing
  :field aocs_mode_detumbling: icp_data.aocs.detumbling
  :field aocs_mode_spin_up: icp_data.aocs.spin_up
  :field aocs_mode_diagnostics: icp_data.aocs.diagnostics
  :field aocs_mode_custom: icp_data.aocs.custom
  :field aocs_mode_low_precision: icp_data.aocs.low_precision
  :field aocs_mode_high_precision: icp_data.aocs.high_precision
  :field aocs_reaction_wheel1: icp_data.aocs.reaction_wheel1_rpm
  :field aocs_reaction_wheel2: icp_data.aocs.reaction_wheel2_rpm
  :field aocs_reaction_wheel3: icp_data.aocs.reaction_wheel3_rpm

  :field timestamp: icp_data.pcom.common.unix_time
  :field com_uptime: icp_data.pcom.common.uptime
  :field com_cpu_temperature: icp_data.pcom.common.cpu_temperature

  :field pcom_rssi: icp_data.pcom.rssi
  :field pcom_last_packet_time: icp_data.pcom.last_packet_time
  :field pcom_dropped_packets: icp_data.pcom.dropped_packets
  :field pcom_gs_packets: icp_data.pcom.gs_packets
  :field pcom_sent_packets: icp_data.pcom.sent_packets
  :field pcom_power_amplifier_temperature: icp_data.pcom.power_amplifier_temperature
  :field pcom_forward_rf_power: icp_data.pcom.forward_rf_power
  :field pcom_reflected_rf_power: icp_data.pcom.reflected_rf_power

  :field timestamp: icp_data.scom.common.unix_time
  :field scom_rssi: icp_data.scom.rssi
  :field scom_last_packet_time: icp_data.scom.last_packet_time
  :field scom_dropped_packets: icp_data.scom.dropped_packets
  :field scom_gs_packets: icp_data.scom.gs_packets
  :field scom_sent_packets: icp_data.scom.sent_packets
  :field scom_digipeated_packets: icp_data.scom.digipeated_packets
  :field scom_power_amplifier_temperature: icp_data.scom.power_amplifier_temperature
  :field scom_forward_rf_power: icp_data.scom.forward_rf_power
  :field scom_reflected_rf_power: icp_data.scom.reflected_rf_power

  :field timestamp: icp_data.sp_xplus.common.unix_time
  :field sp_xplus_uptime: icp_data.sp_xplus.common.uptime
  :field sp_xplus_cpu_temperature: icp_data.sp_xplus.common.cpu_temperature
  :field sp_xplus_temperature: icp_data.sp_xplus.temperature

  :field timestamp: icp_data.sp_xminus.common.unix_time
  :field sp_xminus_uptime: icp_data.sp_xminus.common.uptime
  :field sp_xminus_cpu_temperature: icp_data.sp_xminus.common.cpu_temperature
  :field sp_xminus_temperature: icp_data.sp_xminus.temperature
  :field sp_xminus_mppt_current: icp_data.sp_xminus.mppt_current
  :field sp_xminus_coil_current: icp_data.sp_xminus.coil_current

  :field timestamp: icp_data.sp_yplus.common.unix_time
  :field sp_yplus_uptime: icp_data.sp_yplus.common.uptime
  :field sp_yplus_cpu_temperature: icp_data.sp_yplus.common.cpu_temperature
  :field sp_yplus_temperature: icp_data.sp_yplus.temperature
  :field sp_yplus_mppt_current: icp_data.sp_yplus.mppt_current
  :field sp_yplus_coil_current: icp_data.sp_yplus.coil_current

  :field timestamp: icp_data.sp_yminus.common.unix_time
  :field sp_yminus_uptime: icp_data.sp_yminus.common.uptime
  :field sp_yminus_cpu_temperature: icp_data.sp_yminus.common.cpu_temperature
  :field sp_yminus_temperature: icp_data.sp_yminus.temperature
  :field sp_yminus_mppt_current: icp_data.sp_yminus.mppt_current

  :field timestamp: icp_data.sp_zplus.common.unix_time
  :field sp_zplus_uptime: icp_data.sp_zplus.common.uptime
  :field sp_zplus_cpu_temperature: icp_data.sp_zplus.common.cpu_temperature
  :field sp_zplus_temperature: icp_data.sp_zplus.temperature

  :field timestamp: icp_data.sp_zminus.common.unix_time
  :field sp_zminus_uptime: icp_data.sp_zminus.common.uptime
  :field sp_zminus_cpu_temperature: icp_data.sp_zminus.common.cpu_temperature
  :field sp_zminus_temperature: icp_data.sp_zminus.temperature
  :field sp_zminus_coil_current: icp_data.sp_zminus.coil_current

  :field timestamp: icp_data.st.common.unix_time
  :field st_uptime: icp_data.st.common.uptime
  :field st_cpu_temperature: icp_data.st.common.cpu_temperature
  :field st_fpga_temperature: icp_data.st.fpga_temperature
  :field st_sensor_temperature: icp_data.st.sensor_temperature


seq:
  - id: ax25_header
    type: ax25_header
  - id: icp_header
    type: icp_header
  - id: icp_data
    size: icp_header.len
    type: icp_data
  - id: icp_crc
    type: u2be

types:
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
      - id: control
        type: u1
      - id: pid
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


  icp_header:
    seq:
      - id: dst
        type: u1
      - id: src
        type: u1
      - id: len
        type: u1
      - id: cmd
        type: u1
      - id: uuid
        type: b24be
      - id: mode
        type: u1

  icp_data:
    instances:
      src:
        value: _parent.icp_header.src
      cmd:
        value: _parent.icp_header.cmd

    seq:
      - id: pcom
        if: src == 2 and cmd == 131
        type: pcom_housekeeping
      - id: scom
        if: src == 2 and cmd == 131
        type: scom_housekeeping

      - id: eps
        if: src == 3 and cmd == 131
        type: eps_housekeeping

      - id: obc
        if: src == 4 and cmd == 131
        type: obc_housekeeping
      - id: aocs
        if: src == 4 and cmd == 131
        type: aocs_housekeeping

      - id: st
        if: src == 5 and cmd == 131
        type: star_tracker_housekeeping

      - id: sp_xplus
        if: src == 6 and cmd == 131
        type: side_panel_housekeeping

      - id: sp_xminus
        if: src == 7 and cmd == 131
        type: side_panel_housekeeping

      - id: sp_yplus
        if: src == 8 and cmd == 131
        type: side_panel_housekeeping

      - id: sp_yminus
        if: src == 9 and cmd == 131
        type: side_panel_housekeeping

      - id: sp_zplus
        if: src == 10 and cmd == 131
        type: side_panel_housekeeping

      - id: sp_zminus
        if: src == 11 and cmd == 131
        type: side_panel_housekeeping

  common_housekeeping:
    meta:
      endian: le
    seq:
      - id: info_validity
        type: b1
      - id: hk_mode
        type: b2
      - id: flags
        type: b5
      - id: unix_time
        type: u4
      - id: commands_queued
        type: u1
      - id: commands_handled
        type: u4
      - id: commands_mcs
        type: u2
      - id: resets
        type: u2
      - id: last_reset_reason
        type: u4
      - id: uptime
        type: u4
      - id: errors
        type: u4
      - id: last_error_time
        type: u4
      - id: free_heap
        type: u4
      - id: active_tasks
        type: u1
      - id: cpu_temperature
        type: u1
        doc: 'value = raw * 0.25'
      - id: current_firmware_slot
        type: u1
      - id: slot1_firmware_version
        type: u2
      - id: slot2_firmware_version
        type: u2
      - id: slot3_firmware_version
        type: u2
      - id: slot4_firmware_version
        type: u2
      - id: slot1_crc_ok
        type: b1
      - id: slot2_crc_ok
        type: b1
      - id: slot3_crc_ok
        type: b1
      - id: slot4_crc_ok
        type: b1
      - id: reserved
        type: b4

  aocs_housekeeping:
    meta:
      endian: le
    seq:
      - id: bmg160_gyroscope_x
        type: s2
      - id: bmg160_gyroscope_y
        type: s2
      - id: bmg160_gyroscope_z
        type: s2
      - id: lis3mdl_magnetometer_x
        type: s2
      - id: lis3mdl_magnetometer_y
        type: s2
      - id: lis3mdl_magnetometer_z
        type: s2
      - id: sun_x_intensity1
        type: u2
      - id: sun_x_intensity2
        type: u2
      - id: sun_x_intensity3
        type: u2
      - id: sun_x_intensity4
        type: u2
      - id: sun_x_intensity5
        type: u2
      - id: sun_x_intensity6
        type: u2
      - id: sun_x_intensity_location1
        type: u2
      - id: sun_x_intensity_location2
        type: u2
      - id: sun_x_intensity_location3
        type: u2
      - id: sun_x_intensity_location4
        type: u2
      - id: sun_x_intensity_location5
        type: u2
      - id: sun_x_intensity_location6
        type: u2
      - id: sun_y_intensity1
        type: u2
      - id: sun_y_intensity2
        type: u2
      - id: sun_y_intensity3
        type: u2
      - id: sun_y_intensity4
        type: u2
      - id: sun_y_intensity5
        type: u2
      - id: sun_y_intensity6
        type: u2
      - id: sun_y_intensity_location1
        type: u2
      - id: sun_y_intensity_location2
        type: u2
      - id: sun_y_intensity_location3
        type: u2
      - id: sun_y_intensity_location4
        type: u2
      - id: sun_y_intensity_location5
        type: u2
      - id: sun_y_intensity_location6
        type: u2
      - id: mcp9808_temperature1
        type: u1
      - id: mcp9808_temperature2
        type: u1
      - id: pointing
        type: b1
      - id: detumbling
        type: b1
      - id: spin_up
        type: b1
      - id: diagnostics
        type: b1
      - id: custom_mode
        type: b1
      - id: reserved
        type: b1
      - id: low_precision
        type: b1
      - id: high_precision
        type: b1
      - id: reaction_wheel1_rpm
        type: s2
      - id: reaction_wheel2_rpm
        type: s2
      - id: reaction_wheel3_rpm
        type: s2

  eps_housekeeping:
    meta:
      endian: le
    seq:
      - id: common
        type: common_housekeeping
      - id: enable_reserved0
        type: b1
      - id: enable_internal_flash
        type: b1
      - id: enable_internal_sram
        type: b1
      - id: enable_adc1
        type: b1
      - id: enable_adc2
        type: b1
      - id: enable_adc3
        type: b1
      - id: enable_fram1
        type: b1
      - id: enable_fram2
        type: b1
      - id: enable_rtc
        type: b1
      - id: enable_icp0
        type: b1
      - id: enable_icp1
        type: b1
      - id: enable_st
        type: b1
      - id: enable_obc
        type: b1
      - id: enable_com_3v3
        type: b1
      - id: enable_com_dcdc
        type: b1
      - id: enable_com_pa
        type: b1
      - id: enable_eps_dcdc1
        type: b1
      - id: enable_eps_dcdc2
        type: b1
      - id: enable_sp
        type: b1
      - id: enable_cgp
        type: b1
      - id: enable_hscom
        type: b1
      - id: enable_eop1
        type: b1
      - id: enable_eop2
        type: b1
      - id: enable_esail
        type: b1
      - id: enable_obc_rw
        type: b1
      - id: enable_reserved25
        type: b1
      - id: enable_reserved26
        type: b1
      - id: enable_reserved27
        type: b1
      - id: enable_reserved28
        type: b1
      - id: enable_reserved29
        type: b1
      - id: enable_reserved30
        type: b1
      - id: enable_reserved31
        type: b1

      - id: error_reserved0
        type: b1
      - id: error_internal_flash
        type: b1
      - id: error_internal_sram
        type: b1
      - id: error_adc1
        type: b1
      - id: error_adc2
        type: b1
      - id: error_adc3
        type: b1
      - id: error_fram1
        type: b1
      - id: error_fram2
        type: b1
      - id: error_rtc
        type: b1
      - id: error_icp0
        type: b1
      - id: error_icp1
        type: b1
      - id: error_st
        type: b1
      - id: error_dcdc1
        type: b1
      - id: error_dcdc2
        type: b1
      - id: error_chg1
        type: b1
      - id: error_chg2
        type: b1
      - id: error_dchg1
        type: b1
      - id: error_dchg2
        type: b1
      - id: error_reserved17
        type: b1
      - id: error_reserved18
        type: b1
      - id: error_reserved19
        type: b1
      - id: error_reserved20
        type: b1
      - id: error_reserved21
        type: b1
      - id: error_reserved22
        type: b1
      - id: error_reserved23
        type: b1
      - id: error_reserved24
        type: b1
      - id: error_reserved25
        type: b1
      - id: error_reserved26
        type: b1
      - id: error_reserved27
        type: b1
      - id: error_reserved28
        type: b1
      - id: error_reserved29
        type: b1
      - id: error_reserved30
        type: b1
      - id: error_reserved31
        type: b1

      - id: bus_voltage
        type: u2
        doc: 'mV'
      - id: avg_power_balance
        type: s2
        doc: 'mW'
      - id: battery_status_a
        type: b1
      - id: battery_status_b
        type: b1
      - id: battery_status_c
        type: b1
      - id: battery_status_d
        type: b1
      - id: battery_reserved4
        type: b1
      - id: battery_reserved5
        type: b1
      - id: battery_reserved6
        type: b1
      - id: battery_reserved7
        type: b1
      - id: battery_current_a
        type: u2
      - id: battery_current_b
        type: u2
      - id: battery_voltage_a
        type: u2
      - id: battery_voltage_b
        type: u2
      - id: battery_voltage_c
        type: u2
      - id: battery_voltage_d
        type: u2
      - id: battery_temperature_a
        type: u2
      - id: battery_temperature_b
        type: u2
      - id: battery_temperature_c
        type: u2
      - id: battery_temperature_d
        type: u2

      - id: st_voltage
        type: u2
      - id: st_current
        type: u2
      - id: obc_voltage
        type: u2
      - id: obc_current
        type: u2
      - id: com_3v3_voltage
        type: u2
      - id: com_pa_voltage
        type: u2
      - id: com_3v3_current
        type: u2
      - id: com_pa_current
        type: u2
      - id: eps_voltage
        type: u2
      - id: eps_dcdc_3v3_voltage
        type: u2
      - id: eps_current
        type: u2
      - id: eps_dcdc1_current
        type: u2
      - id: eps_dcdc2_current
        type: u2
      - id: sp_voltage
        type: u2
      - id: sp_current
        type: u2
      - id: cpd_voltage
        type: u2
      - id: cpd_current
        type: u2
      - id: cam1_voltage
        type: u2
      - id: cam1_current
        type: u2
      - id: cam2_voltage
        type: u2
      - id: cam2_current
        type: u2
      - id: hsom_voltage
        type: u2
      - id: hsom_current
        type: u2
      - id: cgp_5v_voltage
        type: u2
      - id: cgp_mpb_voltage
        type: u2
      - id: cgp_current
        type: u2


  obc_housekeeping:
    meta:
      endian: le
    seq:
      - id: common
        type: common_housekeeping
      - id: enable_reserved
        type: b1
      - id: enable_internal_flash
        type: b1
      - id: enable_internal_sram
        type: b1
      - id: enable_qspi_flash1
        type: b1
      - id: enable_qspi_flash2
        type: b1
      - id: enable_fmc_mram
        type: b1
      - id: enable_spi_fram1_obc
        type: b1
      - id: enable_spi_fram2_aocs1
        type: b1
      - id: enable_spi_fram3_aocs2
        type: b1
      - id: enable_io_expander
        type: b1
      - id: enable_fmc_mram_temp_sensor
        type: b1
      - id: enable_qspi_flash_temp_sensor
        type: b1
      - id: enable_io_expander_temp_sensor
        type: b1
      - id: enable_rtc
        type: b1
      - id: enable_current_adc
        type: b1
      - id: enable_aocs1_gyroscope1
        type: b1
      - id: enable_aocs1_gyroscope2
        type: b1
      - id: enable_aocs1_magnetometer
        type: b1
      - id: enable_aocs1_accelerometer
        type: b1
      - id: enable_aocs1_temperature_sensor
        type: b1
      - id: enable_aocs2_gyroscope1
        type: b1
      - id: enable_aocs2_gyroscope2
        type: b1
      - id: enable_aocs2_magnetometer
        type: b1
      - id: enable_aocs2_accelerometer
        type: b1
      - id: enable_aocs2_temperature_sensor
        type: b1
      - id: enable_payload_bus
        type: b1
      - id: enable_icp1_bus
        type: b1
      - id: enable_icp2_bus
        type: b1
      - id: enable_reaction_wheel1
        type: b1
      - id: enable_reaction_wheel2
        type: b1
      - id: enable_reaction_wheel3
        type: b1
      - id: enable_oscillator
        type: b1
      - id: error_mcu
        type: b1
      - id: error_internal_flash
        type: b1
      - id: error_internal_sram
        type: b1
      - id: error_qspi_flash1
        type: b1
      - id: error_qspi_flash2
        type: b1
      - id: error_fmc_mram
        type: b1
      - id: error_spi_fram1_obc
        type: b1
      - id: error_spi_fram2_aocs1
        type: b1
      - id: error_spi_fram3_aocs2
        type: b1
      - id: error_io_expander
        type: b1
      - id: error_mram_temperature_sensor
        type: b1
      - id: error_qspi_flash_temperature_sensor
        type: b1
      - id: error_io_expander_temperature_sensor
        type: b1
      - id: error_rtc
        type: b1
      - id: error_current_adc
        type: b1
      - id: error_aocs1_gyro1
        type: b1
      - id: error_aocs1_gyro2
        type: b1
      - id: error_aocs1_magnet
        type: b1
      - id: error_aocs1_accelerometer
        type: b1
      - id: error_aocs1_temperature_sensor
        type: b1
      - id: error_aocs2_gyro1
        type: b1
      - id: error_aocs2_gyro2
        type: b1
      - id: error_aocs2_magnet
        type: b1
      - id: error_aocs2_accelerometer
        type: b1
      - id: error_aocs2_temperature_sensor
        type: b1
      - id: error_payload_bus
        type: b1
      - id: error_icp1_bus
        type: b1
      - id: error_icp2_bus
        type: b1
      - id: error_reaction_wheel1
        type: b1
      - id: error_reaction_wheel2
        type: b1
      - id: error_reaction_wheel3
        type: b1
      - id: error_oscillator
        type: b1
      - id: fmc_mram_temperature
        type: u1
      - id: qspi_fram_temperature
        type: u1
      - id: io_expander_temperature
        type: u1

  pcom_housekeeping:
    meta:
      endian: le
    seq:
      - id: common
        type: common_housekeeping
      - id: enable_reserved0
        type: b1
      - id: enable_internal_flash
        type: b1
      - id: enable_internal_sram
        type: b1
      - id: enable_qspi_fram
        type: b1
      - id: enable_spi_fram
        type: b1
      - id: enable_transceiver
        type: b1
      - id: enable_dac
        type: b1
      - id: enable_icp0
        type: b1
      - id: enable_icp1
        type: b1
      - id: enable_icp2
        type: b1
      - id: enable_oscillator
        type: b1
      - id: enable_temperature_sensor1
        type: b1
      - id: enable_temperature_sensor2
        type: b1
      - id: enable_reserved2
        type: b1
      - id: enable_reserved3
        type: b1
      - id: enable_reserved4
        type: b1
      - id: error_mcu
        type: b1
      - id: error_internal_flash
        type: b1
      - id: error_internal_sram
        type: b1
      - id: error_qspi_fram
        type: b1
      - id: error_spi_fram
        type: b1
      - id: error_transceiver
        type: b1
      - id: error_dac
        type: b1
      - id: error_icp0
        type: b1
      - id: error_icp1
        type: b1
      - id: error_icp2
        type: b1
      - id: error_oscillator
        type: b1
      - id: error_temperature_sensor1
        type: b1
      - id: error_temperature_sensor2
        type: b1
      - id: error_reserved1
        type: b1
      - id: error_reserved2
        type: b1
      - id: error_reserved3
        type: b1
      - id: rssi
        type: u1
      - id: last_packet_time
        type: b31
        doc: 'Time from last packet in 100ms ticks'
      - id: last_packet_time_invalid
        type: b1
      - id: dropped_packets
        type: u4
      - id: gs_packets
        type: u4
      - id: sent_packets
        type: u4
      - id: transceiver_gain
        type: u1
      - id: power_amplifier_temperature
        type: u1
        doc: 'value = raw * 0.25'
      - id: forward_rf_power
        type: s1
      - id: reflected_rf_power
        type: s1

  scom_housekeeping:
    meta:
      endian: le
    seq:
      - id: enable_reserved1
        type: b1
      - id: enable_internal_flash
        type: b1
      - id: enable_internal_sram
        type: b1
      - id: enable_qspi_fram
        type: b1
      - id: enable_spi_fram
        type: b1
      - id: enable_transceiver
        type: b1
      - id: enable_dac
        type: b1
      - id: enable_icp2
        type: b1
      - id: enable_oscillator
        type: b1
      - id: enable_temperature_sensor1
        type: b1
      - id: enable_temperature_sensor2
        type: b1
      - id: enable_reserved2
        type: b1
      - id: enable_reserved3
        type: b1
      - id: enable_reserved4
        type: b1
      - id: enable_reserved5
        type: b1
      - id: enable_reserved6
        type: b1
      - id: error_mcu
        type: b1
      - id: error_internal_flash
        type: b1
      - id: error_internal_sram
        type: b1
      - id: error_qspi_fram
        type: b1
      - id: error_spi_fram
        type: b1
      - id: error_transceiver
        type: b1
      - id: error_dac
        type: b1
      - id: error_icp2
        type: b1
      - id: error_oscillator
        type: b1
      - id: error_temperature_sensor1
        type: b1
      - id: error_temperature_sensor2
        type: b1
      - id: error_reserved1
        type: b1
      - id: error_reserved2
        type: b1
      - id: error_reserved3
        type: b1
      - id: error_reserved4
        type: b1
      - id: error_reserved5
        type: b1
      - id: rssi
        type: u1
      - id: last_packet_time
        type: b31
        doc: 'Time from last packet in 100ms ticks'
      - id: last_packet_time_invalid
        type: b1
      - id: dropped_packets
        type: u4
      - id: gs_packets
        type: u4
      - id: sent_packets
        type: u4
      - id: digipeated_packets
        type: u4
      - id: power_amplifier_temperature
        type: u1
        doc: 'value = raw * 0.25 - 10'
      - id: forward_rf_power
        type: s1
      - id: reflected_rf_power
        type: s1

  side_panel_housekeeping:
    meta:
      endian: le
    seq:
      - id: common
        type: common_housekeeping
      - id: enable_reserved0
        type: b1
      - id: enable_internal_flash
        type: b1
      - id: enable_internal_sram
        type: b1
      - id: enable_sunsensor
        type: b1
      - id: enable_fram1
        type: b1
      - id: enable_fram2
        type: b1
      - id: enable_icp0
        type: b1
      - id: enable_mag
        type: b1
      - id: enable_temp
        type: b1
      - id: enable_mppt
        type: b1
      - id: enable_coil
        type: b1
      - id: enable_reserved11
        type: b1
      - id: enable_reserved12
        type: b1
      - id: enable_reserved13
        type: b1
      - id: enable_reserved14
        type: b1
      - id: enable_reserved15
        type: b1

      - id: error_mcu
        type: b1
      - id: error_internal_flash
        type: b1
      - id: error_internal_sram
        type: b1
      - id: error_sunsensor
        type: b1
      - id: error_fram1
        type: b1
      - id: error_fram2
        type: b1
      - id: error_icp0
        type: b1
      - id: error_mag
        type: b1
      - id: error_temp
        type: b1
      - id: error_mppt
        type: b1
      - id: error_coil
        type: b1
      - id: error_reserved11
        type: b1
      - id: error_reserved12
        type: b1
      - id: error_reserved13
        type: b1
      - id: error_reserved14
        type: b1
      - id: error_reserved15
        type: b1

      - id: temperature
        type: u1
        doc: 'value = raw * 0.25 - 10'
      - id: mppt_current
        type: u2
      - id: coil_current
        type: u2

  star_tracker_housekeeping:
    meta:
      endian: le
    seq:
      - id: common
        type: common_housekeeping
      - id: enable_reserved0
        type: b1
      - id: enable_internal_flash
        type: b1
      - id: enable_internal_sram
        type: b1
      - id: enable_camera
        type: b1
      - id: enable_fpga
        type: b1
      - id: enable_spi_fram
        type: b1
      - id: enable_spi_flash
        type: b1
      - id: enable_sdram
        type: b1
      - id: enable_temperature_sensor
        type: b1
      - id: enable_reserved8
        type: b1
      - id: enable_reserved9
        type: b1
      - id: enable_reserved10
        type: b1
      - id: enable_reserved11
        type: b1
      - id: enable_reserved12
        type: b1
      - id: enable_reserved13
        type: b1
      - id: enable_reserved14
        type: b1
      - id: enable_reserved15
        type: b1

      - id: error_mcu
        type: b1
      - id: error_internal_flash
        type: b1
      - id: error_internal_sram
        type: b1
      - id: error_camera
        type: b1
      - id: error_fpga
        type: b1
      - id: error_spi_fram
        type: b1
      - id: error_spi_flash
        type: b1
      - id: error_sdram
        type: b1
      - id: error_temperature_sensor
        type: b1
      - id: error_reserved8
        type: b1
      - id: error_reserved9
        type: b1
      - id: error_reserved10
        type: b1
      - id: error_reserved11
        type: b1
      - id: error_reserved12
        type: b1
      - id: error_reserved13
        type: b1
      - id: error_reserved14
        type: b1
      - id: error_reserved15
        type: b1

      - id: number_of_images_taken
        type: u4
      - id: number_of_successfull
        type: u4
      - id: number_of_fails
        type: u4
      - id: center_coordinate_x
        type: f8
      - id: center_coordinate_y
        type: f8
      - id: timestamp
        type: u4
      - id: database_version
        type: u1

      - id: fpga_temperature
        type: u2
      - id: sensor_temperature
        type: u2
