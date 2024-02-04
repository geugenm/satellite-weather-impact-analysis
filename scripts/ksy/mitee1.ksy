---
meta:
  id: mitee1
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field mitee_hdr_pyld_len: ax25_frame.payload.ax25_info.mitee_hdr.pyld_len
  :field mitee_hdr_pkt_no: ax25_frame.payload.ax25_info.mitee_hdr.pkt_no
  :field mitee_hdr_pkt_cnt: ax25_frame.payload.ax25_info.mitee_hdr.pkt_cnt
  :field mitee_hdr_grp_no: ax25_frame.payload.ax25_info.mitee_hdr.grp_no
  :field mitee_hdr_grp_size: ax25_frame.payload.ax25_info.mitee_hdr.grp_size
  :field mitee_hdr_status: ax25_frame.payload.ax25_info.mitee_hdr.status
  :field mitee_hdr_chksm: ax25_frame.payload.ax25_info.mitee_hdr.hdr_chksm
  :field mitee_stats_bcn_tx: ax25_frame.payload.ax25_info.comms.mitee_stats.bcn_tx
  :field mitee_stats_pkts_tx: ax25_frame.payload.ax25_info.comms.mitee_stats.pkts_tx
  :field mitee_stats_pkts_rx: ax25_frame.payload.ax25_info.comms.mitee_stats.pkts_rx
  :field mitee_stats_bytes_tx: ax25_frame.payload.ax25_info.comms.mitee_stats.bytes_tx
  :field mitee_stats_bytes_rx: ax25_frame.payload.ax25_info.comms.mitee_stats.bytes_rx
  :field mitee_stats_sync_errs: ax25_frame.payload.ax25_info.comms.mitee_stats.sync_errs
  :field mitee_stats_hdr_chksm_errs: ax25_frame.payload.ax25_info.comms.mitee_stats.hdr_chksm_errs
  :field mitee_stats_pyld_chksm_errs: ax25_frame.payload.ax25_info.comms.mitee_stats.pyld_chksm_errs
  :field mitee_stats_pyld_avail_errs: ax25_frame.payload.ax25_info.comms.mitee_stats.pyld_avail_errs
  :field mitee_stats_exec_cmds: ax25_frame.payload.ax25_info.comms.mitee_stats.exec_cmds
  :field radio_stats_pkts_tx: ax25_frame.payload.ax25_info.comms.radio_stats.pkts_tx
  :field radio_stats_pkts_rx: ax25_frame.payload.ax25_info.comms.radio_stats.pkts_rx
  :field radio_stats_bytes_tx: ax25_frame.payload.ax25_info.comms.radio_stats.bytes_tx
  :field radio_stats_bytes_rx: ax25_frame.payload.ax25_info.comms.radio_stats.bytes_rx
  :field radio_stats_hdr_chksm_errs: ax25_frame.payload.ax25_info.comms.radio_stats.hdr_chksm_errs
  :field radio_stats_pyld_chksm_errs: ax25_frame.payload.ax25_info.comms.radio_stats.pyld_chksm_errs
  :field radio_stats_pyld_len_errs: ax25_frame.payload.ax25_info.comms.radio_stats.pyld_len_errs
  :field radio_stats_uart_errs: ax25_frame.payload.ax25_info.comms.radio_stats.uart_errs
  :field radio_stats_fail_timeouts: ax25_frame.payload.ax25_info.comms.radio_stats.fail_timeouts
  :field sdep_stats_cmds_tx: ax25_frame.payload.ax25_info.comms.sdep_stats.cmds_tx
  :field sdep_stats_resps_rx: ax25_frame.payload.ax25_info.comms.sdep_stats.resps_rx
  :field sdep_stats_trx_tx: ax25_frame.payload.ax25_info.comms.sdep_stats.trx_tx
  :field sdep_stats_sdep_stats_bytes_tx: ax25_frame.payload.ax25_info.comms.sdep_stats.bytes_tx
  :field sdep_stats_sdep_stats_bytes_rx: ax25_frame.payload.ax25_info.comms.sdep_stats.bytes_rx
  :field sdep_stats_sdep_stats_fail_timeouts: ax25_frame.payload.ax25_info.comms.sdep_stats.fail_timeouts
  :field rst_stats_sat: ax25_frame.payload.ax25_info.comms.rst_stats.sat
  :field rst_stats_comms: ax25_frame.payload.ax25_info.comms.rst_stats.comms
  :field rst_stats_main: ax25_frame.payload.ax25_info.comms.rst_stats.main
  :field radio_cfg_interface_baud_rate: ax25_frame.payload.ax25_info.comms.radio_cfg.interface_baud_rate
  :field radio_cfg_tx_power_amp_level: ax25_frame.payload.ax25_info.comms.radio_cfg.tx_power_amp_level
  :field radio_cfg_rx_rf_baud_rate: ax25_frame.payload.ax25_info.comms.radio_cfg.rx_rf_baud_rate
  :field radio_cfg_tx_rf_baud_rate: ax25_frame.payload.ax25_info.comms.radio_cfg.tx_rf_baud_rate
  :field radio_cfg_rx_modulation: ax25_frame.payload.ax25_info.comms.radio_cfg.rx_modulation
  :field radio_cfg_tx_modulation: ax25_frame.payload.ax25_info.comms.radio_cfg.tx_modulation
  :field radio_cfg_rx_freq: ax25_frame.payload.ax25_info.comms.radio_cfg.rx_freq
  :field radio_cfg_tx_freq: ax25_frame.payload.ax25_info.comms.radio_cfg.tx_freq
  :field radio_cfg_src: ax25_frame.payload.ax25_info.comms.radio_cfg.src
  :field radio_cfg_dst: ax25_frame.payload.ax25_info.comms.radio_cfg.dst
  :field radio_cfg_tx_preamble: ax25_frame.payload.ax25_info.comms.radio_cfg.tx_preamble
  :field radio_cfg_tx_postamble: ax25_frame.payload.ax25_info.comms.radio_cfg.tx_postamble
  :field radio_cfg_function_cfg1: ax25_frame.payload.ax25_info.comms.radio_cfg.function_cfg1
  :field radio_cfg_function_cfg2: ax25_frame.payload.ax25_info.comms.radio_cfg.function_cfg2
  :field radio_bcn_interval: ax25_frame.payload.ax25_info.comms.radio_bcn_interval
  :field radio_tlm_data_op_counter: ax25_frame.payload.ax25_info.comms.radio_tlm_data.op_counter
  :field radio_tlm_data_msp430_temp: ax25_frame.payload.ax25_info.comms.radio_tlm_data.msp430_temp
  :field radio_tlm_data_timecount1: ax25_frame.payload.ax25_info.comms.radio_tlm_data.timecount1
  :field radio_tlm_data_timecount2: ax25_frame.payload.ax25_info.comms.radio_tlm_data.timecount2
  :field radio_tlm_data_timecount3: ax25_frame.payload.ax25_info.comms.radio_tlm_data.timecount3
  :field radio_tlm_data_rssi: ax25_frame.payload.ax25_info.comms.radio_tlm_data.rssi
  :field radio_tlm_data_bytes_rx: ax25_frame.payload.ax25_info.comms.radio_tlm_data.bytes_rx
  :field radio_tlm_data_bytes_tx: ax25_frame.payload.ax25_info.comms.radio_tlm_data.bytes_tx
  :field radio_fw_rev_num: ax25_frame.payload.ax25_info.comms.radio_fw_rev_num
  :field mission_cnt: ax25_frame.payload.ax25_info.comms.mission_cnt
  :field ps_temp: ax25_frame.payload.ax25_info.comms.ps_temp
  :field second: ax25_frame.payload.ax25_info.cdh.datetime.second
  :field minute: ax25_frame.payload.ax25_info.cdh.datetime.minute
  :field hour: ax25_frame.payload.ax25_info.cdh.datetime.hour
  :field day_of_week: ax25_frame.payload.ax25_info.cdh.datetime.day_of_week
  :field day_of_month: ax25_frame.payload.ax25_info.cdh.datetime.day_of_month
  :field month: ax25_frame.payload.ax25_info.cdh.datetime.month
  :field year: ax25_frame.payload.ax25_info.cdh.datetime.year
  :field boot_count: ax25_frame.payload.ax25_info.cdh.boot_count
  :field error_count: ax25_frame.payload.ax25_info.cdh.error_count
  :field error_last: ax25_frame.payload.ax25_info.cdh.error_last
  :field ttc_state: ax25_frame.payload.ax25_info.cdh.ttc_state
  :field ttc_remaining: ax25_frame.payload.ax25_info.cdh.ttc_remaining
  :field ttc_queue_0: ax25_frame.payload.ax25_info.cdh.ttc_queue_0
  :field ttc_queue_1: ax25_frame.payload.ax25_info.cdh.ttc_queue_1
  :field ttc_queue_2: ax25_frame.payload.ax25_info.cdh.ttc_queue_2
  :field ttc_queue_3: ax25_frame.payload.ax25_info.cdh.ttc_queue_3
  :field ttc_queue_4: ax25_frame.payload.ax25_info.cdh.ttc_queue_4
  :field ttc_queue_5: ax25_frame.payload.ax25_info.cdh.ttc_queue_5
  :field ttc_queue_6: ax25_frame.payload.ax25_info.cdh.ttc_queue_6
  :field ttc_queue_7: ax25_frame.payload.ax25_info.cdh.ttc_queue_7
  :field bat_tmp: ax25_frame.payload.ax25_info.eps.bat_tmp
  :field reg_temp_5v: ax25_frame.payload.ax25_info.eps.reg_temp_5v
  :field volt_5v: ax25_frame.payload.ax25_info.eps.volt_5v
  :field volt_digital: ax25_frame.payload.ax25_info.eps.volt_digital
  :field volt_analog: ax25_frame.payload.ax25_info.eps.volt_analog
  :field batt_charge: ax25_frame.payload.ax25_info.eps.batt_charge
  :field batt_load: ax25_frame.payload.ax25_info.eps.batt_load
  :field curr_5v: ax25_frame.payload.ax25_info.eps.curr_5v
  :field curr_digital: ax25_frame.payload.ax25_info.eps.curr_digital
  :field curr_analog: ax25_frame.payload.ax25_info.eps.curr_analog
  :field volt_solar: ax25_frame.payload.ax25_info.eps.volt_solar
  :field volt_batt: ax25_frame.payload.ax25_info.eps.volt_batt
  :field batt_heater: ax25_frame.payload.ax25_info.eps.batt_heater
  :field bdot_on: ax25_frame.payload.ax25_info.adcs.bdot_on
  :field magtorq_x: ax25_frame.payload.ax25_info.adcs.magtorq.force_x
  :field magtorq_y: ax25_frame.payload.ax25_info.adcs.magtorq.force_y
  :field magtorq_z: ax25_frame.payload.ax25_info.adcs.magtorq.force_z
  :field gyro_x: ax25_frame.payload.ax25_info.adcs.imu.gyro_x
  :field gyro_y: ax25_frame.payload.ax25_info.adcs.imu.gyro_y
  :field gyro_z: ax25_frame.payload.ax25_info.adcs.imu.gyro_z
  :field accel_x: ax25_frame.payload.ax25_info.adcs.imu.accel_x
  :field accel_y: ax25_frame.payload.ax25_info.adcs.imu.accel_y
  :field accel_z: ax25_frame.payload.ax25_info.adcs.imu.accel_z
  :field imu_temp: ax25_frame.payload.ax25_info.adcs.imu.temp
  :field pd_top: ax25_frame.payload.ax25_info.adcs.photodiode.pd_top
  :field pd_left: ax25_frame.payload.ax25_info.adcs.photodiode.pd_left
  :field pd_bottom: ax25_frame.payload.ax25_info.adcs.photodiode.pd_bottom
  :field pd_right: ax25_frame.payload.ax25_info.adcs.photodiode.pd_right
  :field magtom_0_x: ax25_frame.payload.ax25_info.adcs.magtom_0.x
  :field magtom_0_y: ax25_frame.payload.ax25_info.adcs.magtom_0.y
  :field magtom_0_z: ax25_frame.payload.ax25_info.adcs.magtom_0.z
  :field magtom_1_x: ax25_frame.payload.ax25_info.adcs.magtom_1.x
  :field magtom_1_y: ax25_frame.payload.ax25_info.adcs.magtom_1.y
  :field magtom_1_z: ax25_frame.payload.ax25_info.adcs.magtom_1.z
  :field magtom_2_x: ax25_frame.payload.ax25_info.adcs.magtom_2.x
  :field magtom_2_y: ax25_frame.payload.ax25_info.adcs.magtom_2.y
  :field magtom_2_z: ax25_frame.payload.ax25_info.adcs.magtom_2.z
  :field pyld_chksm: ax25_frame.payload.ax25_info.pyld_chksm
seq:
  - id: ax25_frame
    type: ax25_frame
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
        type: ax25_info
        size-eos: true
  ax25_info:
    seq:
      - id: mitee_hdr
        type: mitee_hdr
      - id: comms
        type: comms
      - id: cdh
        type: cdh
      - id: eps
        type: eps
      - id: adcs
        type: adcs
      - id: pyld_chksm
        type: u2
  mitee_hdr:
    doc: "Currently only considers beacon packets"
    seq:
      - id: sync
        contents: ['M', 'i']
      - id: cmd_id
        contents: [0xA0, 0x00]
      - id: pyld_len
        type: u1
      - id: pkt_no
        type: u1
      - id: pkt_cnt
        type: u1
      - id: grp_no
        type: u1
      - id: grp_size
        type: u1
      - id: status
        type: u1
      - id: hdr_chksm
        type: u2
  comms_mitee_stats:
    seq:
      - id: bcn_tx
        type: u4
      - id: pkts_tx
        type: u4
      - id: pkts_rx
        type: u4
      - id: bytes_tx
        type: u4
      - id: bytes_rx
        type: u4
      - id: sync_errs
        type: u2
      - id: hdr_chksm_errs
        type: u2
      - id: pyld_chksm_errs
        type: u2
      - id: pyld_avail_errs
        type: u2
      - id: exec_cmds
        type: u2
  comms_radio_stats:
    seq:
      - id: pkts_tx
        type: u4
      - id: pkts_rx
        type: u4
      - id: bytes_tx
        type: u4
      - id: bytes_rx
        type: u4
      - id: hdr_chksm_errs
        type: u2
      - id: pyld_chksm_errs
        type: u2
      - id: pyld_len_errs
        type: u2
      - id: uart_errs
        type: u2
      - id: fail_timeouts
        type: u2
  comms_sdep_stats:
    seq:
      - id: cmds_tx
        type: u4
      - id: resps_rx
        type: u4
      - id: trx_tx
        type: u4
      - id: bytes_tx
        type: u4
      - id: bytes_rx
        type: u4
      - id: fail_timeouts
        type: u2
  comms_rst_stats:
    seq:
      - id: sat
        type: u2
        doc: "Number of times satellite has been reset"
      - id: comms
        type: u2
        doc: "Number of times COMMS cpu has been reset"
      - id: main
        type: u2
        doc: "Number of times MAIN cpu has been reset"
  comms_radio_cfg:
    doc: "Lithium2 radio config"
    seq:
      - id: interface_baud_rate
        type: u1
      - id: tx_power_amp_level
        type: u1
      - id: rx_rf_baud_rate
        type: u1
      - id: tx_rf_baud_rate
        type: u1
      - id: rx_modulation
        type: u1
      - id: tx_modulation
        type: u1
      - id: rx_freq
        type: u4
      - id: tx_freq
        type: u4
      - id: src
        type: str
        size: 6
        encoding: ASCII
        doc: "Callsign (source)"
      - id: dst
        type: str
        size: 6
        encoding: ASCII
        doc: "Callsign (destination)"
      - id: tx_preamble
        type: u2
      - id: tx_postamble
        type: u2
      - id: function_cfg1
        type: u2
      - id: function_cfg2
        type: u2
  comms_radio_tlm_data:
    seq:
      - id: op_counter
        type: u2
      - id: msp430_temp
        type: s2
      - id: timecount1
        type: u1
      - id: timecount2
        type: u1
      - id: timecount3
        type: u1
      - id: rssi
        type: u1
      - id: bytes_rx
        type: u4
      - id: bytes_tx
        type: u4
  comms:
    seq:
      - id: mitee_stats
        type: comms_mitee_stats
      - id: radio_stats
        type: comms_radio_stats
      - id: sdep_stats
        type: comms_sdep_stats
      - id: rst_stats
        type: comms_rst_stats
      - id: radio_cfg
        type: comms_radio_cfg
      - id: radio_bcn_interval
        type: u1
      - id: radio_tlm_data
        type: comms_radio_tlm_data
      - id: radio_fw_rev_num
        type: u4
      - id: mission_cnt
        type: u4
        doc: "Time until radio shutdown, in minutes"
      - id: ps_temp
        type: u2
        doc: "Power splitter temperature"
  cdh_datetime:
    doc: 'Current date and time (0000-01-01 00:00:00 = mission start)'
    seq:
      - id: second
        type: u1
      - id: minute
        type: u1
      - id: hour
        type: u1
      - id: day_of_week
        type: u1
      - id: day_of_month
        type: u1
      - id: month
        type: u1
      - id: year
        type: u2
  cdh:
    seq:
      - id: datetime
        type: cdh_datetime
      - id: boot_count
        type: u2
        doc: "Number of times CDH/MAIN cpu has been reset"
      - id: error_count
        type: u4
        doc: "Number of data aquisition or other operational errors"
      - id: error_last
        type: u1
        doc: "Last error code reported"
      - id: ttc_state
        type: u1
        doc: "Status of time-tagged command system"
      - id: ttc_remaining
        type: u1
        doc: "Number of TTCs remaining in queue"
      - id: ttc_queue_0
        type: u1
      - id: ttc_queue_1
        type: u1
      - id: ttc_queue_2
        type: u1
      - id: ttc_queue_3
        type: u1
      - id: ttc_queue_4
        type: u1
      - id: ttc_queue_5
        type: u1
      - id: ttc_queue_6
        type: u1
      - id: ttc_queue_7
        type: u1
      - id: padding
        size: 1
  adcs_imu:
    seq:
      - id: gyro_x
        type: s2
        doc: "Rotation on X axis (1 = 0.05°/sec)"
      - id: gyro_y
        type: s2
        doc: "Rotation on Y axis (1 = 0.05°/sec)"
      - id: gyro_z
        type: s2
        doc: "Rotation on Z axis (1 = 0.05°/sec)"
      - id: accel_x
        type: s2
        doc: "Acceleration on X axis (1 = 9.81/1000 g)"
      - id: accel_y
        type: s2
        doc: "Acceleration on Y axis (1 = 9.81/1000 g)"
      - id: accel_z
        type: s2
        doc: "Acceleration on Z axis (1 = 9.81/1000 g)"
      - id: temp
        type: s2
        doc: "IMU temperature (0 +- 0.06785°C, 25°C = 0x0000)"
  adcs_pd:
    doc: "Under-antenna photodiode raw values"
    seq:
      - id: pd_top
        type: u2
        doc: "Top face"
      - id: pd_left
        type: u2
        doc: "Left face"
      - id: pd_bottom
        type: u2
        doc: "Bottom face"
      - id: pd_right
        type: u2
        doc: "Right face"
  adcs_magtorq:
    seq:
      - id: force_x
        type: s1
        doc: "Magnetorquer force on X axis (-100% to 100%)"
      - id: force_y
        type: s1
        doc: "Magnetorquer force on Y axis (-100% to 100%)"
      - id: force_z
        type: s1
        doc: "Magnetorquer force on Z axis (-100% to 100%)"
  adcs_magtom:
    doc: "Magentometer axes (1 = 0.92 mGa)"
    seq:
      - id: x
        type: s2
      - id: y
        type: s2
      - id: z
        type: s2
  adcs:
    seq:
      - id: bdot_on
        type: u1
        doc: "BDot status (0 = off, 1 = on)"
      - id: magtorq
        type: adcs_magtorq
      - id: imu
        type: adcs_imu
      - id: photodiode
        type: adcs_pd
      - id: magtom_0
        type: adcs_magtom
      - id: magtom_1
        type: adcs_magtom
      - id: magtom_2
        type: adcs_magtom
  eps:
    doc: "EPS readings. 5V = 2048; 1V/A for current readings unless otherwise specified"
    seq:
      - id: bat_tmp
        type: s2
        doc: "Battery temperature"
      - id: reg_temp_5v
        type: s2
        doc: "Regulator temperature"
      - id: volt_5v
        type: s2
        doc: "Reference voltage (should be 2048)"
      - id: volt_digital
        type: s2
        doc: "Digital rail voltage"
      - id: volt_analog
        type: s2
        doc: "Analog rail voltage"
      - id: batt_charge
        type: s2
        doc: "Battery charge level (V)"
      - id: batt_load
        type: s2
        doc: "Battery load (0.5V / A)"
      - id: curr_5v
        type: s2
        doc: "Reference voltage current"
      - id: curr_digital
        type: s2
        doc: "Digital rail current"
      - id: curr_analog
        type: s2
        doc: "Analog rail current"
      - id: volt_solar
        type: s2
        doc: "Solar panel voltage"
      - id: volt_batt
        type: s2
        doc: "Battery voltage"
      - id: batt_heater
        type: u2
        doc: "Battery heater status"
