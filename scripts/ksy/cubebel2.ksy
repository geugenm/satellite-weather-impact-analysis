---
meta:
  id: cubebel2
  title: CubeBel-2 telemetry decoder struct
  endian: le

doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field beacon_trx_id: ax25_frame.payload.ax25_info.trx_beacon.beacon_id
  :field beacon_uptime: ax25_frame.payload.ax25_info.trx_beacon.beacon_uptime
  :field beacon_vbus: ax25_frame.payload.ax25_info.trx_beacon.beacon_vbus
  :field beacon_reset_total_cnt: ax25_frame.payload.ax25_info.trx_beacon.beacon_reset_total_cnt
  :field beacon_reset_iwdg_cnt: ax25_frame.payload.ax25_info.trx_beacon.beacon_reset_iwdg_cnt
  :field beacon_reset_iwdg_time: ax25_frame.payload.ax25_info.trx_beacon.beacon_reset_iwdg_time
  :field beacon_pamp_temp: ax25_frame.payload.ax25_info.trx_beacon.beacon_pamp_temp
  :field beacon_rx_settings: ax25_frame.payload.ax25_info.trx_beacon.beacon_rx_settings
  :field beacon_rx_period_on: ax25_frame.payload.ax25_info.trx_beacon.beacon_rx_period_on
  :field beacon_rx_seqnum: ax25_frame.payload.ax25_info.trx_beacon.beacon_rx_seqnum
  :field beacon_rx_cnt_total: ax25_frame.payload.ax25_info.trx_beacon.beacon_rx_cnt_total
  :field beacon_rx_cnt_valid: ax25_frame.payload.ax25_info.trx_beacon.beacon_rx_cnt_valid
  :field beacon_tx_settings: ax25_frame.payload.ax25_info.trx_beacon.beacon_tx_settings
  :field beacon_tx_pwr: ax25_frame.payload.ax25_info.trx_beacon.beacon_tx_pwr
  :field beacon_tx_cnt: ax25_frame.payload.ax25_info.trx_beacon.beacon_tx_cnt
  :field cdm_id: ax25_frame.payload.ax25_info.cdm_header.cdm_id
  :field cdm_addr_src: ax25_frame.payload.ax25_info.cdm_header.cdm_addr_src
  :field config_mb_1: ax25_frame.payload.ax25_info.cdm_payload.record_mb.0.value
  :field config_mb_2: ax25_frame.payload.ax25_info.cdm_payload.record_mb.1.value
  :field config_mb_3: ax25_frame.payload.ax25_info.cdm_payload.record_mb.2.value
  :field config_mb_4: ax25_frame.payload.ax25_info.cdm_payload.record_mb.3.value
  :field config_mb_5: ax25_frame.payload.ax25_info.cdm_payload.record_mb.4.value
  :field config_mb_6: ax25_frame.payload.ax25_info.cdm_payload.record_mb.5.value
  :field config_mb_7: ax25_frame.payload.ax25_info.cdm_payload.record_mb.6.value
  :field config_mb_8: ax25_frame.payload.ax25_info.cdm_payload.record_mb.7.value
  :field config_mb_9: ax25_frame.payload.ax25_info.cdm_payload.record_mb.8.value
  :field config_mb_10: ax25_frame.payload.ax25_info.cdm_payload.record_mb.9.value
  :field config_mb_11: ax25_frame.payload.ax25_info.cdm_payload.record_mb.10.value
  :field config_mb_12: ax25_frame.payload.ax25_info.cdm_payload.record_mb.11.value
  :field config_mb_13: ax25_frame.payload.ax25_info.cdm_payload.record_mb.12.value
  :field config_mb_14: ax25_frame.payload.ax25_info.cdm_payload.record_mb.13.value
  :field config_mb_15: ax25_frame.payload.ax25_info.cdm_payload.record_mb.14.value
  :field config_mb_16: ax25_frame.payload.ax25_info.cdm_payload.record_mb.15.value
  :field config_mb_17: ax25_frame.payload.ax25_info.cdm_payload.record_mb.16.value
  :field config_mb_18: ax25_frame.payload.ax25_info.cdm_payload.record_mb.17.value
  :field config_mb_19: ax25_frame.payload.ax25_info.cdm_payload.record_mb.18.value
  :field config_trx_1: ax25_frame.payload.ax25_info.cdm_payload.record_trx.0.value
  :field config_trx_2: ax25_frame.payload.ax25_info.cdm_payload.record_trx.1.value
  :field config_trx_3: ax25_frame.payload.ax25_info.cdm_payload.record_trx.2.value
  :field config_trx_4: ax25_frame.payload.ax25_info.cdm_payload.record_trx.3.value
  :field config_trx_5: ax25_frame.payload.ax25_info.cdm_payload.record_trx.4.value
  :field config_trx_6: ax25_frame.payload.ax25_info.cdm_payload.record_trx.5.value
  :field config_trx_7: ax25_frame.payload.ax25_info.cdm_payload.record_trx.6.value
  :field config_trx_8: ax25_frame.payload.ax25_info.cdm_payload.record_trx.7.value
  :field config_trx_9: ax25_frame.payload.ax25_info.cdm_payload.record_trx.8.value
  :field config_trx_10: ax25_frame.payload.ax25_info.cdm_payload.record_trx.9.value
  :field config_trx_11: ax25_frame.payload.ax25_info.cdm_payload.record_trx.10.value
  :field config_trx_12: ax25_frame.payload.ax25_info.cdm_payload.record_trx.11.value
  :field config_trx_13: ax25_frame.payload.ax25_info.cdm_payload.record_trx.12.value
  :field config_trx_14: ax25_frame.payload.ax25_info.cdm_payload.record_trx.13.value
  :field config_trx_15: ax25_frame.payload.ax25_info.cdm_payload.record_trx.14.value
  :field config_trx_16: ax25_frame.payload.ax25_info.cdm_payload.record_trx.15.value
  :field config_trx_17: ax25_frame.payload.ax25_info.cdm_payload.record_trx.16.value
  :field config_trx_18: ax25_frame.payload.ax25_info.cdm_payload.record_trx.17.value
  :field config_trx_19: ax25_frame.payload.ax25_info.cdm_payload.record_trx.18.value
  :field config_trx_20: ax25_frame.payload.ax25_info.cdm_payload.record_trx.19.value
  :field config_trx_21: ax25_frame.payload.ax25_info.cdm_payload.record_trx.20.value
  :field config_trx_22: ax25_frame.payload.ax25_info.cdm_payload.record_trx.21.value
  :field config_trx_23: ax25_frame.payload.ax25_info.cdm_payload.record_trx.22.value
  :field config_trx_24: ax25_frame.payload.ax25_info.cdm_payload.record_trx.23.value
  :field config_trx_25: ax25_frame.payload.ax25_info.cdm_payload.record_trx.24.value
  :field config_trx_26: ax25_frame.payload.ax25_info.cdm_payload.record_trx.25.value
  :field fwver_githash: ax25_frame.payload.ax25_info.cdm_payload.version_githash
  :field rfreply_rssi: ax25_frame.payload.ax25_info.cdm_payload.ax5043_rssi
  :field rfreply_agc: ax25_frame.payload.ax25_info.cdm_payload.ax5043_agc
  :field rfreply_seq_enabled: ax25_frame.payload.ax25_info.cdm_payload.command_seq_enabled
  :field rfreply_seq_valid: ax25_frame.payload.ax25_info.cdm_payload.command_seq_valid
  :field rfreply_seq_num: ax25_frame.payload.ax25_info.cdm_payload.command_seq_num
  :field tlm_mb_time: ax25_frame.payload.ax25_info.cdm_payload.time
  :field tlm_mb_mcusr: ax25_frame.payload.ax25_info.cdm_payload.mcusr
  :field tlm_mb_rst_cnt_total: ax25_frame.payload.ax25_info.cdm_payload.rst_cnt_total
  :field tlm_mb_rst_cnt_iwdg: ax25_frame.payload.ax25_info.cdm_payload.rst_cnt_iwdg
  :field tlm_mb_adc_status: ax25_frame.payload.ax25_info.cdm_payload.adc_status
  :field tlm_mb_adc_temp_1: ax25_frame.payload.ax25_info.cdm_payload.adc_temp_1
  :field tlm_mb_adc_temp_2: ax25_frame.payload.ax25_info.cdm_payload.adc_temp_2
  :field tlm_mb_ant_1_v: ax25_frame.payload.ax25_info.cdm_payload.ant_1_v
  :field tlm_mb_ant_2_v: ax25_frame.payload.ax25_info.cdm_payload.ant_2_v
  :field tlm_mb_solar_common_v: ax25_frame.payload.ax25_info.cdm_payload.solar_common_v
  :field tlm_mb_sat_bus_v: ax25_frame.payload.ax25_info.cdm_payload.sat_bus_v
  :field tlm_mb_sat_bus_c: ax25_frame.payload.ax25_info.cdm_payload.sat_bus_c
  :field tlm_mb_uc_v: ax25_frame.payload.ax25_info.cdm_payload.uc_v
  :field tlm_mb_uc_c: ax25_frame.payload.ax25_info.cdm_payload.uc_c
  :field tlm_mb_battpack_0_voltage: ax25_frame.payload.ax25_info.cdm_payload.battery_back.0.voltage
  :field tlm_mb_battpack_0_element_0_current: ax25_frame.payload.ax25_info.cdm_payload.battery_back.0.element.0.current
  :field tlm_mb_battpack_0_element_0_temp: ax25_frame.payload.ax25_info.cdm_payload.battery_back.0.element.0.temp
  :field tlm_mb_battpack_0_element_1_current: ax25_frame.payload.ax25_info.cdm_payload.battery_back.0.element.1.current
  :field tlm_mb_battpack_0_element_1_temp: ax25_frame.payload.ax25_info.cdm_payload.battery_back.0.element.1.temp
  :field tlm_mb_battpack_1_voltage: ax25_frame.payload.ax25_info.cdm_payload.battery_back.1.voltage
  :field tlm_mb_battpack_1_element_0_current: ax25_frame.payload.ax25_info.cdm_payload.battery_back.1.element.0.current
  :field tlm_mb_battpack_1_element_0_temp: ax25_frame.payload.ax25_info.cdm_payload.battery_back.1.element.0.temp
  :field tlm_mb_battpack_1_element_1_current: ax25_frame.payload.ax25_info.cdm_payload.battery_back.1.element.1.current
  :field tlm_mb_battpack_1_element_1_temp: ax25_frame.payload.ax25_info.cdm_payload.battery_back.1.element.1.temp
  :field tlm_mb_solarpanel_0_current: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.0.current
  :field tlm_mb_solarpanel_0_volt_pos: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.0.volt_pos
  :field tlm_mb_solarpanel_0_volt_neg: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.0.volt_neg
  :field tlm_mb_solarpanel_1_current: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.1.current
  :field tlm_mb_solarpanel_1_volt_pos: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.1.volt_pos
  :field tlm_mb_solarpanel_1_volt_neg: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.1.volt_neg
  :field tlm_mb_solarpanel_2_current: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.2.current
  :field tlm_mb_solarpanel_2_volt_pos: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.2.volt_pos
  :field tlm_mb_solarpanel_2_volt_neg: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.2.volt_neg
  :field tlm_mb_solarpanel_3_current: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.3.current
  :field tlm_mb_solarpanel_3_volt_pos: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.3.volt_pos
  :field tlm_mb_solarpanel_3_volt_neg: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.3.volt_neg
  :field tlm_mb_solarpanel_4_current: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.4.current
  :field tlm_mb_solarpanel_4_volt_pos: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.4.volt_pos
  :field tlm_mb_solarpanel_4_volt_neg: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.4.volt_neg
  :field tlm_mb_solarpanel_5_current: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.5.current
  :field tlm_mb_solarpanel_5_volt_pos: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.5.volt_pos
  :field tlm_mb_solarpanel_5_volt_neg: ax25_frame.payload.ax25_info.cdm_payload.solarpanel.5.volt_neg
  :field tlm_mb_slot_0_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.0.voltage
  :field tlm_mb_slot_0_current: ax25_frame.payload.ax25_info.cdm_payload.slot.0.current
  :field tlm_mb_slot_1_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.1.voltage
  :field tlm_mb_slot_1_current: ax25_frame.payload.ax25_info.cdm_payload.slot.1.current
  :field tlm_mb_slot_2_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.2.voltage
  :field tlm_mb_slot_2_current: ax25_frame.payload.ax25_info.cdm_payload.slot.2.current
  :field tlm_mb_slot_3_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.3.voltage
  :field tlm_mb_slot_3_current: ax25_frame.payload.ax25_info.cdm_payload.slot.3.current
  :field tlm_mb_slot_4_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.4.voltage
  :field tlm_mb_slot_4_current: ax25_frame.payload.ax25_info.cdm_payload.slot.4.current
  :field tlm_mb_slot_5_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.5.voltage
  :field tlm_mb_slot_5_current: ax25_frame.payload.ax25_info.cdm_payload.slot.5.current
  :field tlm_mb_slot_6_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.6.voltage
  :field tlm_mb_slot_6_current: ax25_frame.payload.ax25_info.cdm_payload.slot.6.current
  :field tlm_mb_slot_7_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.7.voltage
  :field tlm_mb_slot_7_current: ax25_frame.payload.ax25_info.cdm_payload.slot.7.current
  :field tlm_mb_slot_8_voltage: ax25_frame.payload.ax25_info.cdm_payload.slot.8.voltage
  :field tlm_mb_slot_8_current: ax25_frame.payload.ax25_info.cdm_payload.slot.8.current
  :field tlm_mb_solartemp_0_temp_0: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.0.temp.0
  :field tlm_mb_solartemp_0_temp_1: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.0.temp.1
  :field tlm_mb_solartemp_0_temp_2: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.0.temp.2
  :field tlm_mb_solartemp_0_temp_3: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.0.temp.3
  :field tlm_mb_solartemp_1_temp_0: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.1.temp.0
  :field tlm_mb_solartemp_1_temp_1: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.1.temp.1
  :field tlm_mb_solartemp_1_temp_2: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.1.temp.2
  :field tlm_mb_solartemp_1_temp_3: ax25_frame.payload.ax25_info.cdm_payload.solar_temp.1.temp.3
  :field tlm_mb_oc_cnt_solar: ax25_frame.payload.ax25_info.cdm_payload.solar_bus_oc_cnt
  :field tlm_mb_oc_cnt_batt_0: ax25_frame.payload.ax25_info.cdm_payload.batt_pack_oc_cnt.0
  :field tlm_mb_oc_cnt_batt_1: ax25_frame.payload.ax25_info.cdm_payload.batt_pack_oc_cnt.1
  :field tlm_mb_powerswitch_trx: ax25_frame.payload.ax25_info.cdm_payload.power_switch_trx
  :field tlm_mb_powerswitch_0: ax25_frame.payload.ax25_info.cdm_payload.power_switch_state.raw.0
  :field tlm_mb_powerswitch_1: ax25_frame.payload.ax25_info.cdm_payload.power_switch_state.raw.1
  :field tlm_mb_powerswitch_2: ax25_frame.payload.ax25_info.cdm_payload.power_switch_state.raw.2
  :field tlm_trx_cmn_boardid: ax25_frame.payload.ax25_info.cdm_payload.common_trx.board_id_cdm
  :field tlm_trx_cmn_reset_cnt: ax25_frame.payload.ax25_info.cdm_payload.common_trx.board_rst_total_cnt
  :field tlm_trx_cmn_reset_iwdg_cnt: ax25_frame.payload.ax25_info.cdm_payload.common_trx.board_rst_iwdg_cnt
  :field tlm_trx_cmn_reset_iwdg_timestamp: ax25_frame.payload.ax25_info.cdm_payload.common_trx.board_rst_iwdg_timestamp
  :field tlm_trx_cmn_mcu_csr: ax25_frame.payload.ax25_info.cdm_payload.common_trx.mcu_rcc_csr
  :field tlm_trx_cmn_mcu_uptime: ax25_frame.payload.ax25_info.cdm_payload.common_trx.mcu_uptime
  :field tlm_trx_cmn_mcu_temp: ax25_frame.payload.ax25_info.cdm_payload.common_trx.mcu_temp
  :field tlm_trx_cmn_rtc_unixtime: ax25_frame.payload.ax25_info.cdm_payload.common_trx.rtc_unixtime
  :field tlm_trx_cmn_rtc_vbat: ax25_frame.payload.ax25_info.cdm_payload.common_trx.rtc_bat
  :field tlm_trx_boardid: ax25_frame.payload.ax25_info.cdm_payload.board_id_modem
  :field tlm_trx_vbus: ax25_frame.payload.ax25_info.cdm_payload.board_vbus
  :field tlm_trx_startup_previous: ax25_frame.payload.ax25_info.cdm_payload.startup_unixtime_previous
  :field tlm_trx_startup_current: ax25_frame.payload.ax25_info.cdm_payload.startup_unixtime_current
  :field tlm_trx_ds600_temp: ax25_frame.payload.ax25_info.cdm_payload.ds600_temp
  :field tlm_trx_tmp75_temp: ax25_frame.payload.ax25_info.cdm_payload.tmp75_temp
  :field tlm_trx_pamp_current_tx: ax25_frame.payload.ax25_info.cdm_payload.ina226_temp_current_tx
  :field tlm_trx_pamp_voltage_tx: ax25_frame.payload.ax25_info.cdm_payload.ina226_temp_voltage_tx
  :field tlm_trx_ax5043_enabled: ax25_frame.payload.ax25_info.cdm_payload.tps2042_ch1_enabled
  :field tlm_trx_ax5043_oc: ax25_frame.payload.ax25_info.cdm_payload.tps2042_ch1_oc
  :field tlm_trx_lna_enabled: ax25_frame.payload.ax25_info.cdm_payload.tps2042_ch2_enabled
  :field tlm_trx_lna_oc: ax25_frame.payload.ax25_info.cdm_payload.tps2042_ch2_oc
  :field tlm_trx_pamp_oc: ax25_frame.payload.ax25_info.cdm_payload.tps2032_oc
  :field tlm_trx_pamp_enabled: ax25_frame.payload.ax25_info.cdm_payload.tps61078_enabled
  :field tlm_trx_modem_state: ax25_frame.payload.ax25_info.cdm_payload.modem_state
  :field tlm_trx_modem_pwr_fwd: ax25_frame.payload.ax25_info.cdm_payload.modem_pwr_fwd
  :field tlm_trx_modem_pwr_rev: ax25_frame.payload.ax25_info.cdm_payload.modem_pwr_rev
  :field tlm_trx_modem_rx_freq: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_freq
  :field tlm_trx_modem_rx_datarate: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_datarate
  :field tlm_trx_modem_rx_mode: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_mode
  :field tlm_trx_modem_rx_period_on: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_period_on
  :field tlm_trx_modem_rx_period_off: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_period_off
  :field tlm_trx_modem_rx_cnt_all: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_cnt_all
  :field tlm_trx_modem_rx_cnt_valid: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_cnt_valid
  :field tlm_trx_modem_rx_seqnum: ax25_frame.payload.ax25_info.cdm_payload.modem_rx_seqnum
  :field tlm_trx_modem_tx_freq: ax25_frame.payload.ax25_info.cdm_payload.modem_tx_freq
  :field tlm_trx_modem_tx_datarate: ax25_frame.payload.ax25_info.cdm_payload.modem_tx_datarate
  :field tlm_trx_modem_tx_pwr: ax25_frame.payload.ax25_info.cdm_payload.modem_tx_pwr
  :field tlm_trx_modem_tx_cnt_all: ax25_frame.payload.ax25_info.cdm_payload.modem_tx_cnt_all
  :field tlm_trx_modem_cnt_digipeater_ax25: ax25_frame.payload.ax25_info.cdm_payload.modem_cnt_digipeater_ax25
  :field tlm_trx_modem_cnt_digipeater_greencube_rx: ax25_frame.payload.ax25_info.cdm_payload.modem_cnt_digipeater_greencube_rx
  :field tlm_trx_modem_cnt_digipeater_greencube_tx: ax25_frame.payload.ax25_info.cdm_payload.modem_cnt_digipeater_greencube_tx
  :field tlm_trx_message: ax25_frame.payload.ax25_info.cdm_payload.text_msg


seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'


types:

  #
  # AX25
  #

  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
      - id: payload
        type:
          switch-on: ax25_header.ctl & 0x13
          cases:
            0x03: ui_frame

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
            - '"EU11S "'
            - '"EU1XX "'

  ssid_mask:
    seq:
      - id: ssid_mask
        type: u1
    instances:
      ssid:
        value: (ssid_mask & 0x0f) >> 1

  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type: frame
        size-eos: true


  #
  # Frame
  #

  frame:
    seq:
      - id: trx_beacon
        type: trx_beacon
      - id: cdm_datalen
        type: u1
      - id: cdm_header
        type: cdm_header
      - id: cdm_payload
        type:
          switch-on: cdm_header.cdm_id
          cases:
            32770: cdm_version_get_ans
            33169: cdm_telemetry_get_ans_motherboard
            33172: cdm_telemetry_get_ans_trx
            33179: cdm_config_motherboard_ans
            33272: cdm_config_trx_ans
            33369: cdm_config_motherboard_ans
            33372: cdm_config_trx_ans
            36770: cdm_trx_rfreply_ans


  #
  # Beacon
  #

  trx_beacon:
    seq:
      - id: beacon_id
        type: u1
      - id: beacon_uptime
        type: u4
      - id: beacon_vbus
        type: u2
      - id: beacon_reset_total_cnt
        type: u1
      - id: beacon_reset_iwdg_cnt
        type: u1
      - id: beacon_reset_iwdg_time
        type: u4
      - id: beacon_pamp_temp
        type: u2
      - id: beacon_rx_settings
        type: u1
      - id: beacon_rx_period_on
        type: u2
      - id: beacon_rx_seqnum
        type: u2
      - id: beacon_rx_cnt_total
        type: u1
      - id: beacon_rx_cnt_valid
        type: u1
      - id: beacon_tx_settings
        type: u1
      - id: beacon_tx_pwr
        type: s1
      - id: beacon_tx_cnt
        type: u1


  #
  # CDM/Header
  #

  cdm_header:
    seq:
      - id: cdm_id
        type: u2
      - id: cdm_addr_src
        type: u1
      - id: cdm_addr_dst
        type: u1
      - id: cdm_priority
        type: u1
      - id: cdm_delay
        type: u2
      - id: cdm_datalen
        type: u1


  #
  # CDM/Common
  #

  cdm_version_get_ans:
    seq:
      - id: version_githash
        type: str
        encoding: ASCII
        size-eos: true


  #
  # CDM/Telemetry
  #

  cdm_telemetry_get_ans_motherboard:
    seq:
      - id: time
        type: u2
      - id: mcusr
        type: u1
      - id: rst_cnt_total
        type: u1
      - id: rst_cnt_iwdg
        type: u1
      - id: adc_status
        type: u1
      - id: adc_temp_1
        type: u2
      - id: adc_temp_2
        type: u2
      - id: ant_1_v
        type: u2
      - id: ant_2_v
        type: u2
      - id: solar_common_v
        type: u2
      - id: sat_bus_v
        type: u2
      - id: sat_bus_c
        type: u2
      - id: uc_v
        type: u2
      - id: uc_c
        type: u2
      - id: battery_back
        type: mb_batt_telemetry
        repeat: expr
        repeat-expr: 2
      - id: solarpanel
        type: mb_solarpanel_telemetry
        repeat: expr
        repeat-expr: 6
      - id: slot
        type: mb_slot_telemetry
        repeat: expr
        repeat-expr: 9
      - id: solar_temp
        type: mb_solarpanel_temp_telemetry
        repeat: expr
        repeat-expr: 2
      - id: solar_bus_oc_cnt
        type: u1
      - id: batt_pack_oc_cnt
        type: u1
        repeat: expr
        repeat-expr: 2
      - id: power_switch_trx
        type: u2
      - id: power_switch_state
        type: mb_power_switch_state

  cdm_telemetry_get_ans_common_trx:
    seq:
      - id: board_id_cdm
        type: u1
      - id: board_rst_total_cnt
        type: u1
      - id: board_rst_iwdg_cnt
        type: u1
      - id: board_rst_iwdg_timestamp
        type: u4
      - id: mcu_rcc_csr
        type: u1
      - id: mcu_uptime
        type: u4
      - id: rtc_unixtime
        type: s8
      - id: rtc_bat
        type: f4
      - id: mcu_temp
        type: f4

  cdm_telemetry_get_ans_trx:
    seq:
      - id: common_trx
        type: cdm_telemetry_get_ans_common_trx
      - id: board_id_modem
        type: u1
      - id: board_vbus
        type: f4
      - id: startup_unixtime_previous
        type: u4
      - id: startup_unixtime_current
        type: u4
      - id: ds600_inited
        type: u1
      - id: ds600_enabled
        type: u1
      - id: ds600_temp
        type: f4
      - id: tmp75_inited
        type: u1
      - id: tmp75_temp
        type: f4
      - id: ina226_pamp_inited
        type: u1
      - id: ina226_pamp_current
        type: f4
      - id: ina226_temp_current_tx
        type: f4
      - id: ina226_pamp_voltage
        type: f4
      - id: ina226_temp_voltage_tx
        type: f4
      - id: tps2042_inited
        type: u1
      - id: tps2042_ch1_enabled
        type: u1
      - id: tps2042_ch1_oc
        type: u1
      - id: tps2042_ch2_enabled
        type: u1
      - id: tps2042_ch2_oc
        type: u1
      - id: tps2032_inited
        type: u1
      - id: tps2032_oc
        type: u1
      - id: tps61078_inited
        type: u1
      - id: tps61078_enabled
        type: u1
      - id: modem_inited
        type: u1
      - id: modem_state
        type: u1
      - id: modem_pwr_fwd
        type: f4
      - id: modem_pwr_rev
        type: f4
      - id: modem_rx_freq
        type: u4
      - id: modem_rx_datarate
        type: u4
      - id: modem_rx_mode
        type: u1
      - id: modem_rx_period_on
        type: u4
      - id: modem_rx_period_off
        type: u4
      - id: modem_rx_cnt_all
        type: u4
      - id: modem_rx_cnt_valid
        type: u4
      - id: modem_rx_seqnum
        type: u4
      - id: modem_tx_freq
        type: u4
      - id: modem_tx_datarate
        type: u4
      - id: modem_tx_pwr
        type: s1
      - id: modem_tx_cnt_all
        type: u4
      - id: modem_cnt_digipeater_ax25
        type: u4
      - id: modem_cnt_digipeater_greencube_rx
        type: u4
      - id: modem_cnt_digipeater_greencube_tx
        type: u4
      - id: text_msg
        type: str
        encoding: ASCII
        size-eos: true


  #
  # CDM/Config
  #

  cdm_config_motherboard_record:
    seq:
      - id: id
        type: u1
      - id: value
        type: u2

  cdm_config_stm32l4_record:
    seq:
      - id: id
        type: u1
      - id: value
        type: u4

  cdm_config_motherboard_ans:
    seq:
      - id: record_mb
        type: cdm_config_motherboard_record
        repeat: eos

  cdm_config_trx_ans:
    seq:
      - id: record_trx
        type: cdm_config_stm32l4_record
        repeat: eos


  #
  # CDM/TRX
  #

  cdm_trx_rfreply_ans:
    seq:
      - id: ax5043_timer
        type: u4
      - id: ax5043_track_rf_freq
        type: u4
      - id: ax5043_datarate
        type: u4
      - id: ax5043_track_freq
        type: s2
      - id: ax5043_rssi
        type: u1
      - id: ax5043_agc
        type: u1
      - id: ax5043_background_noise
        type: u1
      - id: command_hash
        type: u1
        repeat: expr
        repeat-expr: 28
      - id: command_key_idx
        type: u4
      - id: command_seq_enabled
        type: u1
      - id: command_seq_valid
        type: u1
      - id: command_seq_num
        type: u2


  #
  # Motherboard specific
  #

  mb_batt_element_telemetry:
    seq:
      - id: voltage
        type: u2
      - id: current
        type: u2
      - id: temp
        type: u2

  mb_batt_telemetry:
    seq:
      - id: element
        type: mb_batt_element_telemetry
        repeat: expr
        repeat-expr: 2
      - id: voltage
        type: u2

  mb_solarpanel_telemetry:
    seq:
      - id: current
        type: u2
      - id: volt_pos
        type: u2
      - id: volt_neg
        type: u2

  mb_solarpanel_temp_telemetry:
    seq:
      - id: temp
        type: u2
        repeat: expr
        repeat-expr: 4

  mb_slot_telemetry:
    seq:
      - id: voltage
        type: u2
      - id: current
        type: u2
      - id: oc_cnt
        type: u1

  mb_power_switch_state:
    seq:
      - id: raw
        type: u1
        repeat: expr
        repeat-expr: 3
