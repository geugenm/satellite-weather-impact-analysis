---
meta:
  id: qubik
  endian: be
doc: |
  :field channel_id: osdlp_tm_frame.tm_tf_primary_header.channel_id
  :field master_channel_frame_count: osdlp_tm_frame.tm_tf_primary_header.master_channel_frame_count
  :field virtual_channel_frame_count: osdlp_tm_frame.tm_tf_primary_header.virtual_channel_frame_count
  :field transfer_frame_data_field_status: osdlp_tm_frame.tm_tf_primary_header.transfer_frame_data_field_status
  :field master_channel_id: osdlp_tm_frame.tm_tf_primary_header.master_channel_id
  :field tf_version_number: osdlp_tm_frame.tm_tf_primary_header.tf_version_number
  :field spacecraft_id: osdlp_tm_frame.tm_tf_primary_header.spacecraft_id
  :field virtual_channel_id: osdlp_tm_frame.tm_tf_primary_header.virtual_channel_id
  :field ocf_flag: osdlp_tm_frame.tm_tf_primary_header.ocf_flag
  :field tf_secondary_header_flag: osdlp_tm_frame.tm_tf_primary_header.tf_secondary_header_flag
  :field synch_flag: osdlp_tm_frame.tm_tf_primary_header.synch_flag
  :field packet_order_flag: osdlp_tm_frame.tm_tf_primary_header.packet_order_flag
  :field segment_length_id: osdlp_tm_frame.tm_tf_primary_header.segment_length_id
  :field first_header_pointer: osdlp_tm_frame.tm_tf_primary_header.first_header_pointer
  :field length: osdlp_tm_frame.tm_tf_data_field.payload.length
  :field curr_ins: osdlp_tm_frame.tm_tf_data_field.payload.curr_ins
  :field volt_ins: osdlp_tm_frame.tm_tf_data_field.payload.volt_ins
  :field temp_die: osdlp_tm_frame.tm_tf_data_field.payload.temp_die
  :field temp_bat: osdlp_tm_frame.tm_tf_data_field.payload.temp_bat
  :field curr_min: osdlp_tm_frame.tm_tf_data_field.payload.curr_min
  :field volt_min: osdlp_tm_frame.tm_tf_data_field.payload.volt_min
  :field temp_bat_min: osdlp_tm_frame.tm_tf_data_field.payload.temp_bat_min
  :field curr_max: osdlp_tm_frame.tm_tf_data_field.payload.curr_max
  :field volt_max: osdlp_tm_frame.tm_tf_data_field.payload.volt_max
  :field temp_bat_max: osdlp_tm_frame.tm_tf_data_field.payload.temp_bat_max
  :field curr_av: osdlp_tm_frame.tm_tf_data_field.payload.curr_av
  :field volt_av: osdlp_tm_frame.tm_tf_data_field.payload.volt_av
  :field temp_bat_av: osdlp_tm_frame.tm_tf_data_field.payload.temp_bat_av
  :field time_empty: osdlp_tm_frame.tm_tf_data_field.payload.time_empty
  :field cap_remain: osdlp_tm_frame.tm_tf_data_field.payload.cap_remain
  :field cap_full: osdlp_tm_frame.tm_tf_data_field.payload.cap_full
  :field charge_state: osdlp_tm_frame.tm_tf_data_field.payload.charge_state
  :field ant_test_volt: osdlp_tm_frame.tm_tf_data_field.payload.ant_test_volt
  :field ant_test_curr: osdlp_tm_frame.tm_tf_data_field.payload.ant_test_curr
  :field ant_test_res: osdlp_tm_frame.tm_tf_data_field.payload.ant_test_res
  :field ant_avg_volt: osdlp_tm_frame.tm_tf_data_field.payload.ant_avg_volt
  :field ant_avg_curr: osdlp_tm_frame.tm_tf_data_field.payload.ant_avg_curr
  :field ant_dep_duration: osdlp_tm_frame.tm_tf_data_field.payload.ant_dep_duration
  :field ant_dep_status: osdlp_tm_frame.tm_tf_data_field.payload.ant_dep_status
  :field ant_dep_retries: osdlp_tm_frame.tm_tf_data_field.payload.ant_dep_retries
  :field uptime: osdlp_tm_frame.tm_tf_data_field.payload.uptime
  :field temp_internal: osdlp_tm_frame.tm_tf_data_field.payload.temp_internal
  :field rtc_bat_volt: osdlp_tm_frame.tm_tf_data_field.payload.rtc_bat_volt
  :field deploy_first: osdlp_tm_frame.tm_tf_data_field.payload.deploy_first
  :field deploy_first_ant: osdlp_tm_frame.tm_tf_data_field.payload.deploy_first_ant
  :field ror_unknown: osdlp_tm_frame.tm_tf_data_field.payload.ror_unknown
  :field ror_low_power: osdlp_tm_frame.tm_tf_data_field.payload.ror_low_power
  :field ror_window_watchdog: osdlp_tm_frame.tm_tf_data_field.payload.ror_window_watchdog
  :field ror_independent_watchdog_reset: osdlp_tm_frame.tm_tf_data_field.payload.ror_independent_watchdog_reset
  :field ror_software: osdlp_tm_frame.tm_tf_data_field.payload.ror_software
  :field ror_power_on_power_down: osdlp_tm_frame.tm_tf_data_field.payload.ror_power_on_power_down
  :field ror_external_reset_pin: osdlp_tm_frame.tm_tf_data_field.payload.ror_external_reset_pin
  :field ror_brownout: osdlp_tm_frame.tm_tf_data_field.payload.ror_brownout
  :field dropped_frames: osdlp_tm_frame.tm_tf_data_field.payload.dropped_frames
  :field rorc_low_power: osdlp_tm_frame.tm_tf_data_field.payload.rorc_low_power
  :field rorc_ind_wdg: osdlp_tm_frame.tm_tf_data_field.payload.rorc_ind_wdg
  :field rorc_software: osdlp_tm_frame.tm_tf_data_field.payload.rorc_software
  :field rorc_brownout: osdlp_tm_frame.tm_tf_data_field.payload.rorc_brownout
  :field power_save: osdlp_tm_frame.tm_tf_data_field.payload.power_save
  :field power_monitor_fail: osdlp_tm_frame.tm_tf_data_field.payload.power_monitor_fail
  :field clcw_0_cw_type: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.cw_type
  :field clcw_0_clcw_ver: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.clcw_ver
  :field clcw_0_status_field: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.status_field
  :field clcw_0_cop: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.cop
  :field clcw_0_vcid: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.vcid
  :field clcw_0_rsvd_a: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.rsvd_a
  :field clcw_0_flag_norf: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.flag_norf
  :field clcw_0_flag_nobitlock: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.flag_nobitlock
  :field clcw_0_flag_lockout: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.flag_lockout
  :field clcw_0_flag_wait: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.flag_wait
  :field clcw_0_flag_retransmit: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.flag_retransmit
  :field clcw_0_farm_b_counter: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.farm_b_counter
  :field clcw_0_rsvd_b: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.rsvd_b
  :field clcw_0_report_value: osdlp_tm_frame.tm_tf_data_field.payload.clcw_0.report_value
  :field clcw_1_cw_type: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.cw_type
  :field clcw_1_clcw_ver: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.clcw_ver
  :field clcw_1_status_field: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.status_field
  :field clcw_1_cop: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.cop
  :field clcw_1_vcid: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.vcid
  :field clcw_1_rsvd_a: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.rsvd_a
  :field clcw_1_flag_norf: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.flag_norf
  :field clcw_1_flag_nobitlock: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.flag_nobitlock
  :field clcw_1_flag_lockout: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.flag_lockout
  :field clcw_1_flag_wait: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.flag_wait
  :field clcw_1_flag_retransmit: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.flag_retransmit
  :field clcw_1_farm_b_counter: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.farm_b_counter
  :field clcw_1_rsvd_b: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.rsvd_b
  :field clcw_1_report_value: osdlp_tm_frame.tm_tf_data_field.payload.clcw_1.report_value
  :field clcw_2_cw_type: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.cw_type
  :field clcw_2_clcw_ver: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.clcw_ver
  :field clcw_2_status_field: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.status_field
  :field clcw_2_cop: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.cop
  :field clcw_2_vcid: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.vcid
  :field clcw_2_rsvd_a: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.rsvd_a
  :field clcw_2_flag_norf: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.flag_norf
  :field clcw_2_flag_nobitlock: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.flag_nobitlock
  :field clcw_2_flag_lockout: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.flag_lockout
  :field clcw_2_flag_wait: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.flag_wait
  :field clcw_2_flag_retransmit: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.flag_retransmit
  :field clcw_2_farm_b_counter: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.farm_b_counter
  :field clcw_2_rsvd_b: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.rsvd_b
  :field clcw_2_report_value: osdlp_tm_frame.tm_tf_data_field.payload.clcw_2.report_value
  :field clcw_3_cw_type: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.cw_type
  :field clcw_3_clcw_ver: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.clcw_ver
  :field clcw_3_status_field: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.status_field
  :field clcw_3_cop: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.cop
  :field clcw_3_vcid: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.vcid
  :field clcw_3_rsvd_a: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.rsvd_a
  :field clcw_3_flag_norf: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.flag_norf
  :field clcw_3_flag_nobitlock: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.flag_nobitlock
  :field clcw_3_flag_lockout: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.flag_lockout
  :field clcw_3_flag_wait: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.flag_wait
  :field clcw_3_flag_retransmit: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.flag_retransmit
  :field clcw_3_farm_b_counter: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.farm_b_counter
  :field clcw_3_rsvd_b: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.rsvd_b
  :field clcw_3_report_value: osdlp_tm_frame.tm_tf_data_field.payload.clcw_3.report_value
  :field clcw_4_cw_type: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.cw_type
  :field clcw_4_clcw_ver: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.clcw_ver
  :field clcw_4_status_field: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.status_field
  :field clcw_4_cop: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.cop
  :field clcw_4_vcid: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.vcid
  :field clcw_4_rsvd_a: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.rsvd_a
  :field clcw_4_flag_norf: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.flag_norf
  :field clcw_4_flag_nobitlock: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.flag_nobitlock
  :field clcw_4_flag_lockout: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.flag_lockout
  :field clcw_4_flag_wait: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.flag_wait
  :field clcw_4_flag_retransmit: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.flag_retransmit
  :field clcw_4_farm_b_counter: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.farm_b_counter
  :field clcw_4_rsvd_b: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.rsvd_b
  :field clcw_4_report_value: osdlp_tm_frame.tm_tf_data_field.payload.clcw_4.report_value
  :field tx_frames: osdlp_tm_frame.tm_tf_data_field.payload.tx_frames
  :field rx_frames: osdlp_tm_frame.tm_tf_data_field.payload.rx_frames
  :field rx_corrected_bits: osdlp_tm_frame.tm_tf_data_field.payload.rx_corrected_bits
  :field rssi: osdlp_tm_frame.tm_tf_data_field.payload.rssi
  :field freq_tracking: osdlp_tm_frame.tm_tf_data_field.payload.freq_tracking
  :field agc: osdlp_tm_frame.tm_tf_data_field.payload.agc
  :field datarate_tracking: osdlp_tm_frame.tm_tf_data_field.payload.datarate_tracking
  :field phase_tracking: osdlp_tm_frame.tm_tf_data_field.payload.phase_tracking
  :field rf_freq_tracking: osdlp_tm_frame.tm_tf_data_field.payload.rf_freq_tracking
  :field trx_delay_ms: osdlp_tm_frame.tm_tf_data_field.payload.trx_delay_ms

seq:
  - id: osdlp_tm_frame
    type: tm_transfer_frame_t
    doc-ref: 'https://gitlab.com/librespacefoundation/osdlp'

types:
  tm_transfer_frame_t:
    seq:
      - id: tm_tf_primary_header
        type: primary_header_t
        size: 6
      - id: tf_secondary_header
        type:
          switch-on: tm_tf_primary_header.tf_secondary_header_flag
          cases:
            1: u2
      - id: tm_tf_data_field
        type: tm_tf_data_field_t
      - id: tm_tf_trailer
        size: 6
      - id: unparsed
        size-eos: true
  primary_header_t:
    seq:
      - id: channel_id
        type: u2
      - id: master_channel_frame_count
        type: u1
      - id: virtual_channel_frame_count
        type: u1
      - id: transfer_frame_data_field_status
        type: u2
    instances:
      master_channel_id:
        value: '(channel_id & 0xfff0) >> 4'
      tf_version_number:
        value: '(master_channel_id & 0xc00) >> 2'
      spacecraft_id:
        value: '(master_channel_id & 0x0ff)'
      virtual_channel_id:
        value: '(channel_id & 0x000e) >> 1'
      ocf_flag:
        value: '(channel_id & 0x0001)'
      tf_secondary_header_flag:
        value: '(transfer_frame_data_field_status & 0x8000) >> 15'
      synch_flag:
        value: '(transfer_frame_data_field_status & 0x4000) >> 14'
      packet_order_flag:
        value: '(transfer_frame_data_field_status & 0x2000) >> 13'
      segment_length_id:
        value: '(transfer_frame_data_field_status & 0x1800) >> 12'
      first_header_pointer:
        value: '(transfer_frame_data_field_status & 0x7ff)'
  tm_tf_data_field_t:
    seq:
      - id: payload
        type:
          switch-on: _parent.tm_tf_primary_header.virtual_channel_id
          cases:
            0: vcid_management_t
            1: vcid_tm_t
            2: vcid_ext_tm_t
            3: vcid_experiment_t
            4: vcid_contact_t
        size: 116
        doc: |
          from conf.h:
          #define VCID_MANAGEMENT                0
          #define VCID_TM                        1
          #define VCID_EXT_TM                    2
          #define VCID_EXPERIMENT                3
          #define VCID_CONTACT                   4
  vcid_management_t:
    seq:
      - id: unparsed
        size-eos: true
  vcid_tm_t:
    meta:
      endian: be
    seq:
      - id: length
        type: u2
      - id: curr_ins
        type: s2
        doc: 'value = Current (Ins) [mA]'
      - id: volt_ins
        type: u2
        doc: 'value = Voltage (Ins) [mV]'
      - id: temp_die
        type: s1
        doc: 'value = Die Temperature (Ins) [degC]'
      - id: temp_bat
        type: s1
      - id: curr_min
        type: s2
      - id: volt_min
        type: u2
      - id: temp_bat_min
        type: s1
      - id: curr_max
        type: s2
      - id: volt_max
        type: u2
      - id: temp_bat_max
        type: s1
      - id: curr_av
        type: s2
      - id: volt_av
        type: u2
      - id: temp_bat_av
        type: s1
      - id: time_empty
        type: u2
      - id: cap_remain
        type: s2
      - id: cap_full
        type: s2
      - id: charge_state
        type: s1
      - id: ant_test_volt
        type: s2
      - id: ant_test_curr
        type: s2
      - id: ant_test_res
        type: u1
      - id: ant_avg_volt
        type: s2
      - id: ant_avg_curr
        type: s2
      - id: ant_dep_duration
        type: u1
      - id: ant_dep_status
        type: u1
      - id: ant_dep_retries
        type: u1
      - id: uptime
        type: u4
      - id: temp_internal
        type: s1
      - id: rtc_bat_volt
        type: u2
      - id: deploy_first
        type: u1
      - id: deploy_first_ant
        type: u1
      - id: ror_unknown
        type: b1
      - id: ror_low_power
        type: b1
      - id: ror_window_watchdog
        type: b1
      - id: ror_independent_watchdog_reset
        type: b1
      - id: ror_software
        type: b1
      - id: ror_power_on_power_down
        type: b1
      - id: ror_external_reset_pin
        type: b1
      - id: ror_brownout
        type: b1
      - id: dropped_frames
        type: u2
      - id: rorc_low_power
        type: u2
      - id: rorc_ind_wdg
        type: u2
      - id: rorc_software
        type: u2
      - id: rorc_brownout
        type: u2
      - id: power_save
        type: u1
      - id: power_monitor_fail
        type: u1
      - id: clcw_0
        type: clcw
      - id: clcw_1
        type: clcw
      - id: clcw_2
        type: clcw
      - id: clcw_3
        type: clcw
      - id: clcw_4
        type: clcw
      - id: tx_frames
        type: u2
      - id: rx_frames
        type: u2
      - id: rx_corrected_bits
        type: u4
      - id: rssi
        type: s1
      - id: freq_tracking
        type: s2
      - id: agc
        type: s1
      - id: datarate_tracking
        type: s4
      - id: phase_tracking
        type: s2
      - id: rf_freq_tracking
        type: s4
      - id: trx_delay_ms
        type: u2
  vcid_ext_tm_t:
    seq:
      - id: unparsed
        size-eos: true
  vcid_experiment_t:
    seq:
      - id: unparsed
        size-eos: true
  vcid_contact_t:
    seq:
      - id: unparsed
        size-eos: true
  clcw:
    seq:
      - id: cw_type
        type: b1
      - id: clcw_ver
        type: b2
      - id: status_field
        type: b3
      - id: cop
        type: b2
      - id: vcid
        type: b6
      - id: rsvd_a
        type: b2
      - id: flag_norf
        type: b1
      - id: flag_nobitlock
        type: b1
      - id: flag_lockout
        type: b1
      - id: flag_wait
        type: b1
      - id: flag_retransmit
        type: b1
      - id: farm_b_counter
        type: b2
      - id: rsvd_b
        type: b1
      - id: report_value
        type: b8
