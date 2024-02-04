---
meta:
  id: inspiresat1
  title: INSPIRESat-1 70cm telemetry decoder
  endian: le
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
  :field application_process_id: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.application_process_id
  :field sequence_flags: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.sequence_flags
  :field sequence_count: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.sequence_count
  :field packet_length: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.packet_length
  :field sh_coarse: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.sh_coarse
  :field sh_fine: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.sh_fine
  :field cmd_recv_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cmd_recv_count
  :field cmd_fail_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cmd_fail_count
  :field cmd_succ_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cmd_succ_count
  :field cmd_succ_op: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cmd_succ_op
  :field cmd_fail_op: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cmd_fail_op
  :field cmd_fail_code: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cmd_fail_code
  :field eclipse_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.eclipse_state
  :field pwr_status_sd1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pwr_status_sd1
  :field pwr_status_sd0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pwr_status_sd0
  :field pwr_status_htr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pwr_status_htr
  :field pwr_status_sband: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pwr_status_sband
  :field pwr_status_adcs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pwr_status_adcs
  :field pwr_status_cip: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pwr_status_cip
  :field pwr_status_daxss: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pwr_status_daxss
  :field sd_read_misc: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_read_misc
  :field sd_read_scic: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_read_scic
  :field sd_read_scid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_read_scid
  :field sd_read_adcs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_read_adcs
  :field sd_read_beacon: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_read_beacon
  :field sd_read_log: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_read_log
  :field sd_write_misc: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_write_misc
  :field sd_write_scic: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_write_scic
  :field sd_write_scid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_write_scid
  :field sd_write_adcs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_write_adcs
  :field sd_write_beacon: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_write_beacon
  :field sd_write_log: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sd_write_log
  :field cmd_loss_timer: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cmd_loss_timer
  :field clt_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.clt_state
  :field alive_daxss: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.alive_daxss
  :field alive_cip: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.alive_cip
  :field alive_adcs: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.alive_adcs
  :field alive_sband: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.alive_sband
  :field alive_uhf: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.alive_uhf
  :field alive_sd1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.alive_sd1
  :field alive_sd0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.alive_sd0
  :field cip_comstat: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cip_comstat
  :field cip_temp1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cip_temp1
  :field cip_temp2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cip_temp2
  :field cip_temp3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cip_temp3
  :field uhf_temp_buff: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_temp_buff
  :field uhf_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_temp
  :field uhf_locked: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_locked
  :field uhf_readback: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_readback
  :field uhf_swd: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_swd
  :field uhf_afc: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_afc
  :field uhf_echo: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_echo
  :field uhf_channel: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_channel
  :field sband_pa_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_pa_curr
  :field sband_pa_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_pa_volt
  :field sband_rf_pwr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_rf_pwr
  :field sband_pa_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_pa_temp
  :field sband_top_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_top_temp
  :field sband_bottom_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_bottom_temp
  :field adcs_cmd_acpt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_cmd_acpt
  :field adcs_cmd_fail: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_cmd_fail
  :field adcs_time: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_time
  :field adcs_att_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_att_valid
  :field adcs_refs_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_refs_valid
  :field adcs_time_valid: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_time_valid
  :field adcs_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_mode
  :field adcs_recom_sun_pt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_recom_sun_pt
  :field adcs_sun_pt_state: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_sun_pt_state
  :field adcs_star_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_star_temp
  :field adcs_wheel_temp1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_wheel_temp1
  :field adcs_wheel_temp2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_wheel_temp2
  :field adcs_wheel_temp3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_wheel_temp3
  :field adcs_digi_bus_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_digi_bus_volt
  :field adcs_sun_vec1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_sun_vec1
  :field adcs_sun_vec2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_sun_vec2
  :field adcs_sun_vec3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_sun_vec3
  :field adcs_wheel_sp1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_wheel_sp1
  :field adcs_wheel_sp2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_wheel_sp2
  :field adcs_wheel_sp3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_wheel_sp3
  :field adcs_body_rt1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_body_rt1
  :field adcs_body_rt2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_body_rt2
  :field adcs_body_rt3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_body_rt3
  :field daxss_time_sec: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_time_sec
  :field daxss_cmd_op: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_cmd_op
  :field daxss_cmd_succ: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_cmd_succ
  :field daxss_cmd_fail: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_cmd_fail
  :field daxss_cdh_enables: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_cdh_enables
  :field daxss_cdh_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_cdh_temp
  :field daxss_sps_rate: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_sps_rate
  :field daxss_sps_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_sps_x
  :field daxss_sps_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_sps_y
  :field daxss_slow_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_slow_count
  :field bat_fg1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat_fg1
  :field daxss_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_curr
  :field daxss_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.daxss_volt
  :field cdh_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cdh_curr
  :field cdh_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cdh_volt
  :field sband_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_curr
  :field sband_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sband_volt
  :field uhf_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_curr
  :field uhf_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uhf_volt
  :field heater_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.heater_curr
  :field heater_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.heater_volt
  :field sp2_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp2_curr
  :field sp2_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp2_volt
  :field sp1_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp1_curr
  :field sp1_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp1_volt
  :field sp0_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp0_curr
  :field sp0_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp0_volt
  :field bat_vcell: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat_vcell
  :field gps_12v_2_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.gps_12v_2_curr
  :field gps_12v_2_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.gps_12v_2_volt
  :field gps_12v_1_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.gps_12v_1_curr
  :field gps_12v_1_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.gps_12v_1_volt
  :field bat_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat_curr
  :field bat_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat_volt
  :field adcs_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_curr
  :field adcs_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_volt
  :field v3p3_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.v3p3_curr
  :field v3p3_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.v3p3_volt
  :field cip_curr: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cip_curr
  :field cip_volt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.cip_volt
  :field obc_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.obc_temp
  :field eps_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.eps_temp
  :field int_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.int_temp
  :field sp0_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp0_temp
  :field bat0_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat0_temp
  :field sp1_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp1_temp
  :field bat1_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat1_temp
  :field sp2_temp: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.sp2_temp
  :field bat_fg3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat_fg3
  :field bat0_temp_conv: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat0_temp_conv
  :field bat1_temp_conv: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.bat1_temp_conv
  :field mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.mode

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
            - '"IS-1  "'
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
      - id: application_process_id
        type: b11
      - id: sequence_flags
        type: b2
      - id: sequence_count
        type: b14
      - id: packet_length
        type: u2be
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
            0x01: is1_beacon_t
  secondary_header_t:
    doc: |
      The Secondary Header is a feature of the Space Packet which allows
      additional types of information that may be useful to the user
      application (e.g., a time code) to be included.
      See: 4.1.3.2 in CCSDS 133.0-B-1
    seq:
      - id: sh_coarse
        type: u4
      - id: sh_fine
        type: u2
  is1_beacon_t:
    seq:
      - id: cmd_recv_count
        type: u1
        doc: |
          Command receive count
      - id: cmd_fail_count
        type: u1
        doc: |
          Command reject count
      - id: cmd_succ_count
        type: u1
        doc: |
          Command success count
      - id: cmd_succ_op
        type: u1
        doc: |
          Command successful opcode
          Enumeration values: 0/CMD_OPCODE_NOOP 1/CMD_OPCODE_ARM
          2/CMD_OPCODE_RESET_STATS 16/CMD_OPCODE_FP_RESET
          17/CMD_OPCODE_FP_RESET_RESULTS 18/CMD_OPCODE_FP_VALIDATE
          19/CMD_OPCODE_FP_SET_TASK_STATE 20/CMD_OPCODE_FP_SET_WATCH_STATE
          21/CMD_OPCODE_FP_DUMP_WATCH 22/CMD_OPCODE_FP_DUMP_RESULTS
          23/CMD_OPCODE_FP_SET_WATCH_VALUES 24/CMD_OPCODE_FP_SET_WATCH_THRESH
          25/CMD_OPCODE_FP_SET_WATCH_RESP 32/CMD_OPCODE_SET_PERF_MON_STATE
          33/CMD_OPCODE_DES_RESET_STATS 34/CMD_OPCODE_DES_ADD_TASK
          35/CMD_OPCODE_DES_SUB_TASK 36/CMD_OPCODE_DES_ADD_BACK
          37/CMD_OPCODE_DES_SUB_BACK 38/CMD_OPCODE_DES_SET_TIME
          48/CMD_OPCODE_SET_EVT_GROUP 49/CMD_OPCODE_SET_EVT_LOG
          50/CMD_OPCODE_LOG_RESET_STATS 51/CMD_OPCODE_LOG_SET_MASK_STATE
          52/CMD_OPCODE_LOG_RESET_LOG 53/CMD_OPCODE_LOG_ISSUE_LOG
          64/CMD_OPCODE_LOAD_SEQUENCE 65/CMD_OPCODE_INIT_SEQUENCE
          66/CMD_OPCODE_SET_SEQUENCE_STATE 67/CMD_OPCODE_VERIFY_SEQUENCE
          68/CMD_OPCODE_STOP_SEQUENCE 69/CMD_OPCODE_FIND_SEQUENCE
          70/CMD_OPCODE_INFO_SEQUENCE 71/CMD_OPCODE_DUMP_SEQUENCE 80/MEM_DUMP
          81/MEM_LOAD 82/MEM_ERASE 83/MEM_XSUM 84/MEM_ABORT 85/MEM_RESET
          86/MEM_LOAD_DWORD 87/MEM_LOAD_WORD 88/MEM_LOAD_BYTE
          96/CMD_OPCODE_ISSUE_TLM_PKT 97/CMD_OPCODE_SET_TLM_RATE
          98/CMD_OPCODE_SET_STREAM_STATE 99/CMD_OPCODE_PKT_SET_PRIORITY
          128/CMD_OPCODE_UHF_PASS 129/CMD_OPCODE_UHF_INIT
          130/CMD_OPCODE_UHF_RESP_STATE 131/CMD_OPCODE_UHF_SET_TX_GAP
          144/CMD_OPCODE_ADCS_PASS 145/CMD_OPCODE_ADCS_RESET
          146/CMD_OPCODE_ADCS_READ 147/CMD_OPCODE_ADCS_COARSE_POINT
          148/CMD_OPCODE_ADCS_FINE_POINT 149/CMD_OPCODE_ADCS_RAM_POINT
          150/CMD_OPCODE_ADCS_FINE_UPDATE 151/CMD_OPCODE_ADCS_RAM_UPDATE
          152/CMD_OPCODE_ADCS_ECLIPSE_CHECK 160/CMD_OPCODE_EPS_PWR_ON
          161/CMD_OPCODE_EPS_PWR_OFF 162/CMD_OPCODE_EPS_PWR_CYCLE
          163/CMD_OPCODE_EPS_DEPLOY 164/CMD_OPCODE_EPS_HEATER_SETPOINT
          165/CMD_OPCODE_EPS_HEATER_THRESH 166/CMD_OPCODE_EPS_ECLIPSE_THRESH
          176/CMD_OPCODE_SD_WRITE_STATE 177/CMD_OPCODE_SD_READ
          178/CMD_OPCODE_SD_READ_HALT 179/CMD_OPCODE_SD_PLAYBACK
          181/CMD_OPCODE_SD_SELECT 182/CMD_OPCODE_SD_INIT
          183/CMD_OPCODE_SD_SET_PARTITION 184/CMD_OPCODE_SD_UPDATE_PARTITION
          185/CMD_OPCODE_SD_PWR_OFF 186/CMD_OPCODE_SD_RESET_FDRI
          187/CMD_OPCODE_SD_SET_FDRI_LIMT 188/CMD_OPCODE_SD_TABLE_DEFAULT
          208/CMD_OPCODE_CIP_SCI_MODE 226/CMD_OPCODE_SBAND_SET_PA
          227/CMD_OPCODE_SBAND_SET_MODE 228/CMD_OPCODE_SBAND_SET_PA_LEVEL
          229/CMD_OPCODE_SBAND_SET_SYNTH 230/CMD_OPCODE_SBAND_RESET
          231/CMD_OPCODE_SBAND_DEBUG 232/CMD_OPCODE_SBAND_SET_ENCODER
          233/CMD_OPCODE_SBAND_SYNC_ON 234/CMD_OPCODE_SBAND_SYNC_OFF
          240/CMD_OPCODE_MODE_SET 241/CMD_OPCODE_MODE_AVOID
          242/CMD_OPCODE_MODE_SET_THRESHOLD 243/CMD_OPCODE_MODE_CLEAR_CLT
          244/CMD_OPCODE_MODE_SET_CLT_THRESHOLD
          245/CMD_OPCODE_MODE_SET_LAUNCH_DELAY
          246/CMD_OPCODE_MODE_SET_LAUNCH_DELAY_STATE
          247/CMD_OPCODE_MODE_SET_DEPLOY_INT
          248/CMD_OPCODE_MODE_SET_DEPLOY_FLAG 249/CMD_OPCODE_MODE_RESET_SC
          250/CMD_OPCODE_MODE_AVOID_CLEAR 251/CMD_OPCODE_MODE_ECLIPSE_METHOD
          252/CMD_OPCODE_MODE_AUTO_DIS 253/CMD_OPCODE_MODE_AUTO_ENA
      - id: cmd_fail_op
        type: u1
        doc: |
          Command failed opcode
          Enumeration values: 0/CMD_OPCODE_NOOP 1/CMD_OPCODE_ARM
          2/CMD_OPCODE_RESET_STATS 16/CMD_OPCODE_FP_RESET
          17/CMD_OPCODE_FP_RESET_RESULTS 18/CMD_OPCODE_FP_VALIDATE
          19/CMD_OPCODE_FP_SET_TASK_STATE 20/CMD_OPCODE_FP_SET_WATCH_STATE
          21/CMD_OPCODE_FP_DUMP_WATCH 22/CMD_OPCODE_FP_DUMP_RESULTS
          23/CMD_OPCODE_FP_SET_WATCH_VALUES 24/CMD_OPCODE_FP_SET_WATCH_THRESH
          25/CMD_OPCODE_FP_SET_WATCH_RESP 32/CMD_OPCODE_SET_PERF_MON_STATE
          33/CMD_OPCODE_DES_RESET_STATS 34/CMD_OPCODE_DES_ADD_TASK
          35/CMD_OPCODE_DES_SUB_TASK 36/CMD_OPCODE_DES_ADD_BACK
          37/CMD_OPCODE_DES_SUB_BACK 38/CMD_OPCODE_DES_SET_TIME
          48/CMD_OPCODE_SET_EVT_GROUP 49/CMD_OPCODE_SET_EVT_LOG
          50/CMD_OPCODE_LOG_RESET_STATS 51/CMD_OPCODE_LOG_SET_MASK_STATE
          52/CMD_OPCODE_LOG_RESET_LOG 53/CMD_OPCODE_LOG_ISSUE_LOG
          64/CMD_OPCODE_LOAD_SEQUENCE 65/CMD_OPCODE_INIT_SEQUENCE
          66/CMD_OPCODE_SET_SEQUENCE_STATE 67/CMD_OPCODE_VERIFY_SEQUENCE
          68/CMD_OPCODE_STOP_SEQUENCE 69/CMD_OPCODE_FIND_SEQUENCE
          70/CMD_OPCODE_INFO_SEQUENCE 71/CMD_OPCODE_DUMP_SEQUENCE 80/MEM_DUMP
          81/MEM_LOAD 82/MEM_ERASE 83/MEM_XSUM 84/MEM_ABORT 85/MEM_RESET
          86/MEM_LOAD_DWORD 87/MEM_LOAD_WORD 88/MEM_LOAD_BYTE
          96/CMD_OPCODE_ISSUE_TLM_PKT 97/CMD_OPCODE_SET_TLM_RATE
          98/CMD_OPCODE_SET_STREAM_STATE 99/CMD_OPCODE_PKT_SET_PRIORITY
          128/CMD_OPCODE_UHF_PASS 129/CMD_OPCODE_UHF_INIT
          130/CMD_OPCODE_UHF_RESP_STATE 131/CMD_OPCODE_UHF_SET_TX_GAP
          144/CMD_OPCODE_ADCS_PASS 145/CMD_OPCODE_ADCS_RESET
          146/CMD_OPCODE_ADCS_READ 147/CMD_OPCODE_ADCS_COARSE_POINT
          148/CMD_OPCODE_ADCS_FINE_POINT 149/CMD_OPCODE_ADCS_RAM_POINT
          150/CMD_OPCODE_ADCS_FINE_UPDATE 151/CMD_OPCODE_ADCS_RAM_UPDATE
          152/CMD_OPCODE_ADCS_ECLIPSE_CHECK 160/CMD_OPCODE_EPS_PWR_ON
          161/CMD_OPCODE_EPS_PWR_OFF 162/CMD_OPCODE_EPS_PWR_CYCLE
          163/CMD_OPCODE_EPS_DEPLOY 164/CMD_OPCODE_EPS_HEATER_SETPOINT
          165/CMD_OPCODE_EPS_HEATER_THRESH 166/CMD_OPCODE_EPS_ECLIPSE_THRESH
          176/CMD_OPCODE_SD_WRITE_STATE 177/CMD_OPCODE_SD_READ
          178/CMD_OPCODE_SD_READ_HALT 179/CMD_OPCODE_SD_PLAYBACK
          181/CMD_OPCODE_SD_SELECT 182/CMD_OPCODE_SD_INIT
          183/CMD_OPCODE_SD_SET_PARTITION 184/CMD_OPCODE_SD_UPDATE_PARTITION
          185/CMD_OPCODE_SD_PWR_OFF 186/CMD_OPCODE_SD_RESET_FDRI
          187/CMD_OPCODE_SD_SET_FDRI_LIMT 188/CMD_OPCODE_SD_TABLE_DEFAULT
          208/CMD_OPCODE_CIP_SCI_MODE 226/CMD_OPCODE_SBAND_SET_PA
          227/CMD_OPCODE_SBAND_SET_MODE 228/CMD_OPCODE_SBAND_SET_PA_LEVEL
          229/CMD_OPCODE_SBAND_SET_SYNTH 230/CMD_OPCODE_SBAND_RESET
          231/CMD_OPCODE_SBAND_DEBUG 232/CMD_OPCODE_SBAND_SET_ENCODER
          233/CMD_OPCODE_SBAND_SYNC_ON 234/CMD_OPCODE_SBAND_SYNC_OFF
          240/CMD_OPCODE_MODE_SET 241/CMD_OPCODE_MODE_AVOID
          242/CMD_OPCODE_MODE_SET_THRESHOLD 243/CMD_OPCODE_MODE_CLEAR_CLT
          244/CMD_OPCODE_MODE_SET_CLT_THRESHOLD
          245/CMD_OPCODE_MODE_SET_LAUNCH_DELAY
          246/CMD_OPCODE_MODE_SET_LAUNCH_DELAY_STATE
          247/CMD_OPCODE_MODE_SET_DEPLOY_INT
          248/CMD_OPCODE_MODE_SET_DEPLOY_FLAG 249/CMD_OPCODE_MODE_RESET_SC
          250/CMD_OPCODE_MODE_AVOID_CLEAR 251/CMD_OPCODE_MODE_ECLIPSE_METHOD
          252/CMD_OPCODE_MODE_AUTO_DIS 253/CMD_OPCODE_MODE_AUTO_ENA
      - id: cmd_fail_code
        type: u1
        doc: |
          Command fail code
          Enumeration values: 0/SUCCESS 1/MODE 2/ARM 3/SOURCE 4/OPCODE 5/METHOD
          6/LENGTH 7/RANGE
      - id: eclipse_state
        type: b1
        doc: |
          Eclipse State of ADCS
          Enumeration values: 0/SUN 1/ECLIPSE
      - id: pwr_status_sd1
        type: b1
        doc: |
          SD Card 1 Power State
          Enumeration values: 0/OFF 1/ON
      - id: pwr_status_sd0
        type: b1
        doc: |
          SD Card 0 Power State
          Enumeration values: 0/OFF 1/ON
      - id: pwr_status_htr
        type: b1
        doc: |
          Battery Heater Power State
          Enumeration values: 0/OFF 1/ON
      - id: pwr_status_sband
        type: b1
        doc: |
          SBAND Power State
          Enumeration values: 0/OFF 1/ON
      - id: pwr_status_adcs
        type: b1
        doc: |
          ADCS Power State
          Enumeration values: 0/OFF 1/ON
      - id: pwr_status_cip
        type: b1
        doc: |
          CIP Power State
          Enumeration values: 0/OFF 1/ON
      - id: pwr_status_daxss
        type: b1
        doc: |
          DAXSS Power State
          Enumeration values: 0/OFF 1/ON
      - id: sd_read_misc
        type: u4
        doc: |
          Partition read pointer - misc
      - id: sd_read_scic
        type: u4
        doc: |
          Partition read pointer - scic
      - id: sd_read_scid
        type: u4
        doc: |
          Partition read pointer - scid
      - id: sd_read_adcs
        type: u4
        doc: |
          Partition read pointer - adcs
      - id: sd_read_beacon
        type: u4
        doc: |
          Partition read pointer - beacon
      - id: sd_read_log
        type: u4
        doc: |
          Partition read pointer - log
      - id: sd_write_misc
        type: u4
        doc: |
          Partition write pointer - misc
      - id: sd_write_scic
        type: u4
        doc: |
          Partition write pointer - scic
      - id: sd_write_scid
        type: u4
        doc: |
          Partition write pointer - scid
      - id: sd_write_adcs
        type: u4
        doc: |
          Partition write pointer - adcs
      - id: sd_write_beacon
        type: u4
        doc: |
          Partition write pointer - beacon
      - id: sd_write_log
        type: u4
        doc: |
          Partition write pointer - log
      - id: cmd_loss_timer
        type: u4
        doc: |
          Seconds until command loss timer
      - id: clt_state
        type: b1
        doc: |
          State of CLT Fault
          Enumeration values: 0/OFF 1/ON
      - id: alive_daxss
        type: b1
        doc: |
          DAXSS Aliveness State
          Enumeration values: 0/DEAD 1/ALIVE
      - id: alive_cip
        type: b1
        doc: |
          CIP Aliveness State
          Enumeration values: 0/DEAD 1/ALIVE
      - id: alive_adcs
        type: b1
        doc: |
          ADCS Aliveness State
          Enumeration values: 0/DEAD 1/ALIVE
      - id: alive_sband
        type: b1
        doc: |
          SBAND Aliveness State
          Enumeration values: 0/DEAD 1/ALIVE
      - id: alive_uhf
        type: b1
        doc: |
          UHF Aliveness State
          Enumeration values: 0/DEAD 1/ALIVE
      - id: alive_sd1
        type: b1
        doc: |
          SD Card 1 Aliveness State
          Enumeration values: 0/DEAD 1/ALIVE
      - id: alive_sd0
        type: b1
        doc: |
          SD Card 0 Aliveness State
          Enumeration values: 0/DEAD 1/ALIVE
      - id: cip_comstat
        type: u4
        doc: |
          CIP com stat field
      - id: cip_temp1
        type: s2
        doc: |
          CIP temp 1
          Conversion coefficients: C0=0.0, C1=0.007813
      - id: cip_temp2
        type: s2
        doc: |
          CIP temp 2
          Conversion coefficients: C0=0.0, C1=0.007813
      - id: cip_temp3
        type: s2
        doc: |
          CIP temp 3
          Conversion coefficients: C0=0.0, C1=0.007813
      - id: uhf_temp_buff
        type: b2
        doc: |
          UHF Temp
      - id: uhf_temp
        type: b6
        doc: |
          UHF Temp
      - id: uhf_locked
        type: b1
        doc: |
          UHF Locked Mode
          Enumeration values: 0/OFF 1/ON
      - id: uhf_readback
        type: b2
        doc: |
          UHF Readback Mode
          Enumeration values: 0/N 1/B 2/T
      - id: uhf_swd
        type: b1
        doc: |
          UHF SWD Mode
          Enumeration values: 0/OFF 1/ON
      - id: uhf_afc
        type: b1
        doc: |
          UHF AFC Mode
          Enumeration values: 0/OFF 1/ON
      - id: uhf_echo
        type: b1
        doc: |
          UHF Echo Mode
          Enumeration values: 0/OFF 1/ON
      - id: uhf_channel
        type: b2
        doc: |
          UHF Channel
          Enumeration values: 0/A 1/B 2/D
      - id: sband_pa_curr
        type: u2
        doc: |
          SBand Power Amplifier Current
          Conversion coefficients: C0=0.0, C1=4e-05
      - id: sband_pa_volt
        type: u2
        doc: |
          SBand Power Amplifier Voltage
          Conversion coefficients: C0=0.0, C1=0.004
      - id: sband_rf_pwr
        type: u2
        doc: |
          SBand RF Power
          Conversion coefficients: C0=0.0, C1=0.001139
      - id: sband_pa_temp
        type: u2
        doc: |
          SBand Power Amplifier Temp
          Conversion coefficients: C0=-50.0, C1=0.073242
      - id: sband_top_temp
        type: u2
        doc: |
          SBAND Board Top Temperature
          Conversion coefficients: C0=0.0, C1=0.0625
      - id: sband_bottom_temp
        type: u2
        doc: |
          SBAND Board Bottom Temperature
          Conversion coefficients: C0=0.0, C1=0.0625
      - id: adcs_cmd_acpt
        type: u1
        doc: |
          ADCS Command Accept Count
      - id: adcs_cmd_fail
        type: u1
        doc: |
          ADCS Command Reject Count
      - id: adcs_time
        type: s4
        doc: |
          ADCS GPS Time
      - id: adcs_att_valid
        type: b1
        doc: |
          ADCS Attitude Valid
      - id: adcs_refs_valid
        type: b1
        doc: |
          ADCS Refs Valid
      - id: adcs_time_valid
        type: b1
        doc: |
          ADCS Time Valid
      - id: adcs_mode
        type: b1
        doc: |
          ADCS Mode
          Enumeration values: 0/SUN 1/FINE
      - id: adcs_recom_sun_pt
        type: b1
        doc: |
          ADCS Recommed Sun Point
          Enumeration values: 0/NO 1/YES
      - id: adcs_sun_pt_state
        type: b3
        doc: |
          ADCS Sun Point State
          Enumeration values: 0/UNDEF 1/UNDEF 2/SEARCH_INIT 3/SEARCHING
          4/WAITING 5/CONVERGING 6/ON_SUN 7/NOT_ACTIVE
      - id: adcs_star_temp
        type: s1
        doc: |
          ADCS Star Track Temp
          Conversion coefficients: C0=0.0, C1=0.8
      - id: adcs_wheel_temp1
        type: s2
        doc: |
          ADCS Wheel Temp 1
          Conversion coefficients: C0=0.0, C1=0.005
      - id: adcs_wheel_temp2
        type: s2
        doc: |
          ADCS Wheel Temp 2
          Conversion coefficients: C0=0.0, C1=0.005
      - id: adcs_wheel_temp3
        type: s2
        doc: |
          ADCS Wheel Temp 3
          Conversion coefficients: C0=0.0, C1=0.005
      - id: adcs_digi_bus_volt
        type: s2
        doc: |
          ADCS Digi Bus Voltage
          Conversion coefficients: C0=0.0, C1=0.00125
      - id: adcs_sun_vec1
        type: s2
        doc: |
          ADCS Sun Vector 1
          Conversion coefficients: C0=0.0, C1=0.0001
      - id: adcs_sun_vec2
        type: s2
        doc: |
          ADCS Sun Vector 2
          Conversion coefficients: C0=0.0, C1=0.0001
      - id: adcs_sun_vec3
        type: s2
        doc: |
          ADCS Sun Vector 3
          Conversion coefficients: C0=0.0, C1=0.0001
      - id: adcs_wheel_sp1
        type: s2
        doc: |
          ADCS Wheel Speed 1
          Conversion coefficients: C0=0.0, C1=0.4
      - id: adcs_wheel_sp2
        type: s2
        doc: |
          ADCS Wheel Speed 2
          Conversion coefficients: C0=0.0, C1=0.4
      - id: adcs_wheel_sp3
        type: s2
        doc: |
          ADCS Wheel Speed 3
          Conversion coefficients: C0=0.0, C1=0.4
      - id: adcs_body_rt1
        type: s4
        doc: |
          ADCS Body Frame Rate 1
          Conversion coefficients: C0=0, C1=5e-9
      - id: adcs_body_rt2
        type: s4
        doc: |
          ADCS Body Frame Rate 2
          Conversion coefficients: C0=0, C1=5e-9
      - id: adcs_body_rt3
        type: s4
        doc: |
          ADCS Body Frame Rate 3
          Conversion coefficients: C0=0, C1=5e-9
      - id: pad1
        type: u4
      - id: pad2
        type: u4
      - id: pad3
        type: u4
      - id: daxss_time_sec
        type: u4
        doc: |
          DAXSS Time Stamp (seconds)
      - id: daxss_cmd_op
        type: u1
        doc: |
          DAXSS Command Last opcode
      - id: daxss_cmd_succ
        type: u1
        doc: |
          DAXSS Command Accept Count
      - id: daxss_cmd_fail
        type: u1
        doc: |
          DAXSS Command Reject Count
      - id: daxss_cdh_enables
        type: u2
        doc: |
          DAXSS CDH Enables
      - id: daxss_cdh_temp
        type: s2
        doc: |
          DAXSS CDH Temp
          Conversion coefficients: C0=0.0, C1=0.003906
      - id: daxss_sps_rate
        type: u4
        doc: |
          DAXSS SPS Sum Rate
      - id: daxss_sps_x
        type: u2
        doc: |
          DAXSS SPS X
      - id: daxss_sps_y
        type: u2
        doc: |
          DAXSS SPS Y
      - id: daxss_slow_count
        type: u2
        doc: |
          DAXSS X Slow Count Rate
      - id: bat_fg1
        type: u2
        doc: |
          Battery Gauge
          Conversion coefficients: C0=0.0, C1=0.003906
      - id: daxss_curr
        type: u2
        doc: |
          DAXSS Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: daxss_volt
        type: u2
        doc: |
          DAXSS Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: cdh_curr
        type: u2
        doc: |
          CDH Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: cdh_volt
        type: u2
        doc: |
          CDH Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: sband_curr
        type: u2
        doc: |
          SBand Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: sband_volt
        type: u2
        doc: |
          SBand Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: uhf_curr
        type: u2
        doc: |
          UHF Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: uhf_volt
        type: u2
        doc: |
          UHF Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: heater_curr
        type: u2
        doc: |
          Battery Heater Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: heater_volt
        type: u2
        doc: |
          Battery Heater Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: sp2_curr
        type: u2
        doc: |
          SP2 Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: sp2_volt
        type: u2
        doc: |
          SP2 Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: sp1_curr
        type: u2
        doc: |
          SP1 Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: sp1_volt
        type: u2
        doc: |
          SP1 Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: sp0_curr
        type: u2
        doc: |
          SP0 Current
          Conversion coefficients: C0=0.0, C1=0.00125
      - id: sp0_volt
        type: u2
        doc: |
          SP0 Voltage
          Conversion coefficients: C0=0.0, C1=0.00125
      - id: bat_vcell
        type: u2
        doc: |
          Battery FG Voltage
      - id: gps_12v_2_curr
        type: u2
        doc: |
          GPS 12V_2 Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: gps_12v_2_volt
        type: u2
        doc: |
          GPS 12V_2 Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: gps_12v_1_curr
        type: u2
        doc: |
          GPS 12V_1 Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: gps_12v_1_volt
        type: u2
        doc: |
          GPS 12V_1 Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: bat_curr
        type: u2
        doc: |
          Battery Sense Curr
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: bat_volt
        type: u2
        doc: |
          Battery Sense Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: adcs_curr
        type: u2
        doc: |
          ADCS Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: adcs_volt
        type: u2
        doc: |
          ADCS Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: v3p3_curr
        type: u2
        doc: |
          3.3 Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: v3p3_volt
        type: u2
        doc: |
          3.3 Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: cip_curr
        type: u2
        doc: |
          CIP Current
          Conversion coefficients: C0=0.0, C1=0.0005
      - id: cip_volt
        type: u2
        doc: |
          CIP Voltage
          Conversion coefficients: C0=0.0, C1=0.001
      - id: obc_temp
        type: u2
        doc: |
          OBC Temperature 1
          Conversion coefficients: C0=91.394, C1=-0.089493, C2=3.55e-05, -6.26e-9, 1.89e-13
      - id: eps_temp
        type: u2
        doc: |
          EPS Temperature
          Conversion coefficients: C0=91.394, C1=-0.089493, C2=3.55e-05, -6.26e-9, 1.89e-13
      - id: int_temp
        type: u2
        doc: |
          Interface Temperature
          Conversion coefficients: C0=91.394, C1=-0.089493, C2=3.55e-05, -6.26e-9, 1.89e-13
      - id: sp0_temp
        type: u2
        doc: |
          SP0 Temperature
          Conversion coefficients: C0=91.394, C1=-0.089493, C2=3.55e-05, -6.26e-9, 1.89e-13
      - id: bat0_temp
        type: u2
        doc: |
          Battery 0 Temperature
          Conversion coefficients: C0=-259.74, C1=1.471182747, C2=3.59e-4, C3=8.77e-8, C4=2.14e-11
      - id: sp1_temp
        type: u2
        doc: |
          SP1 Temperature
          Conversion coefficients: C0=91.394, C1=-0.089493, C2=3.55e-05, -6.26e-9, 1.89e-13
      - id: bat1_temp
        type: u2
        doc: |
          Battery 1 Temperature
          Conversion coefficients: C0=-259.74, C1=1.471182747, C2=3.59e-4, C3=8.77e-8, C4=2.14e-11
      - id: sp2_temp
        type: u2
        doc: |
          SP2 Temperature
          Conversion coefficients: C0=91.394, C1=-0.089493, C2=3.55e-05, -6.26e-9, 1.89e-13
      - id: bat_fg3
        type: u2
        doc: |
          Battery Gauge
          Conversion coefficients: C0=0.0, C1=0.003906
      - id: bat0_temp_conv
        type: f4
        doc: |
          Battery Temp 0 Converted
      - id: bat1_temp_conv
        type: f4
        doc: |
          Battery Temp 1 Converted
      - id: mode
        type: u1
        doc: |
          Current system mode
          Enumeration values: 0/PHOENIX 1/SAFE 2/SCID 3/SCIC
