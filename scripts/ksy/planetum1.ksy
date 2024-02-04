---
meta:
  id: planetum1
  title: Planetum1 beacon decoder www.planetum.cz/druzice-planetum1/
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field obc_pass_packet_type: ax25_frame.payload.ax25_info.body.obc_pass_packet_type
  :field obc_reset_cnt: ax25_frame.payload.ax25_info.body.obc_reset_cnt
  :field obc_uptime: ax25_frame.payload.ax25_info.body.obc_uptime
  :field obc_uptime_tot: ax25_frame.payload.ax25_info.body.obc_uptime_tot
  :field obc_bat: ax25_frame.payload.ax25_info.body.obc_bat
  :field obc_temp_mcu: ax25_frame.payload.ax25_info.body.obc_temp_mcu
  :field obc_temp_brd: ax25_frame.payload.ax25_info.body.obc_temp_brd
  :field obc_temp_zn: ax25_frame.payload.ax25_info.body.obc_temp_zn
  :field obc_temp_xp: ax25_frame.payload.ax25_info.body.obc_temp_xp
  :field obc_temp_yp: ax25_frame.payload.ax25_info.body.obc_temp_yp
  :field obc_temp_yn: ax25_frame.payload.ax25_info.body.obc_temp_yn
  :field obc_temp_xn: ax25_frame.payload.ax25_info.body.obc_temp_xn
  :field obc_temp_zp: ax25_frame.payload.ax25_info.body.obc_temp_zp
  :field obc_freemem: ax25_frame.payload.ax25_info.body.obc_freemem
  :field psu_reset_cnt: ax25_frame.payload.ax25_info.body.psu_reset_cnt
  :field psu_uptime: ax25_frame.payload.ax25_info.body.psu_uptime
  :field psu_uptime_tot: ax25_frame.payload.ax25_info.body.psu_uptime_tot
  :field psu_battery: ax25_frame.payload.ax25_info.body.psu_battery
  :field psu_temp_sys: ax25_frame.payload.ax25_info.body.psu_temp_sys
  :field psu_temp_bat: ax25_frame.payload.ax25_info.body.psu_temp_bat
  :field psu_cur_in: ax25_frame.payload.ax25_info.body.psu_cur_in
  :field psu_cur_out: ax25_frame.payload.ax25_info.body.psu_cur_out
  :field psu_ch_state_num: ax25_frame.payload.ax25_info.body.psu_ch_state_num
  :field psu_ch0_state: ax25_frame.payload.ax25_info.body.psu_ch0_state
  :field psu_ch1_state: ax25_frame.payload.ax25_info.body.psu_ch1_state
  :field psu_ch2_state: ax25_frame.payload.ax25_info.body.psu_ch2_state
  :field psu_ch3_state: ax25_frame.payload.ax25_info.body.psu_ch3_state
  :field psu_ch4_state: ax25_frame.payload.ax25_info.body.psu_ch4_state
  :field psu_ch5_state: ax25_frame.payload.ax25_info.body.psu_ch5_state
  :field psu_ch6_state: ax25_frame.payload.ax25_info.body.psu_ch6_state
  :field psu_sys_state: ax25_frame.payload.ax25_info.body.psu_sys_state
  :field uhf_uptime: ax25_frame.payload.ax25_info.body.uhf_uptime
  :field uhf_uptime_tot: ax25_frame.payload.ax25_info.body.uhf_uptime_tot
  :field uhf_reset_cnt: ax25_frame.payload.ax25_info.body.uhf_reset_cnt
  :field uhf_trx_temp: ax25_frame.payload.ax25_info.body.uhf_trx_temp
  :field uhf_rf_temp: ax25_frame.payload.ax25_info.body.uhf_rf_temp
  :field uhf_pa_temp: ax25_frame.payload.ax25_info.body.uhf_pa_temp
  :field uhf_digipeater_cnt: ax25_frame.payload.ax25_info.body.uhf_digipeater_cnt
  :field uhf_last_digipeater: ax25_frame.payload.ax25_info.body.uhf_last_digipeater
  :field uhf_rx_cnt: ax25_frame.payload.ax25_info.body.uhf_rx_cnt
  :field uhf_tx_cnt: ax25_frame.payload.ax25_info.body.uhf_tx_cnt
  :field uhf_act_rssi_raw: ax25_frame.payload.ax25_info.body.uhf_act_rssi_raw
  :field uhf_dcd_rssi_raw: ax25_frame.payload.ax25_info.body.uhf_dcd_rssi_raw
  :field vhf_uptime: ax25_frame.payload.ax25_info.body.vhf_uptime
  :field vhf_uptime_tot: ax25_frame.payload.ax25_info.body.vhf_uptime_tot
  :field vhf_reset_cnt: ax25_frame.payload.ax25_info.body.vhf_reset_cnt
  :field vhf_trx_temp: ax25_frame.payload.ax25_info.body.vhf_trx_temp
  :field vhf_rf_temp: ax25_frame.payload.ax25_info.body.vhf_rf_temp
  :field vhf_pa_temp: ax25_frame.payload.ax25_info.body.vhf_pa_temp
  :field vhf_digipeater_cnt: ax25_frame.payload.ax25_info.body.vhf_digipeater_cnt
  :field vhf_last_digipeater: ax25_frame.payload.ax25_info.body.vhf_last_digipeater
  :field vhf_rx_cnt: ax25_frame.payload.ax25_info.body.vhf_rx_cnt
  :field vhf_tx_cnt: ax25_frame.payload.ax25_info.body.vhf_tx_cnt
  :field vhf_act_rssi_raw: ax25_frame.payload.ax25_info.body.vhf_act_rssi_raw
  :field vhf_dcd_rssi_raw: ax25_frame.payload.ax25_info.body.vhf_dcd_rssi_raw
  :field monitor: ax25_frame.payload.ax25_info.monitor
  :field packet_type_q: ax25_frame.payload.ax25_info.packet_type_q
seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: "https://www.tapr.org/pub_ax25.html"

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
      - id: repeater
        type: repeater
        if: (src_ssid_raw.ssid_mask & 0x01) == 0
        doc: "Repeater flag is set!"
      - id: ctl
        type: u1

  repeater:
    seq:
      - id: rpt_instance
        type: repeaters
        repeat: until
        repeat-until: ((_.rpt_ssid_raw.ssid_mask & 0x1) == 0x1)
        doc: "Repeat until no repeater flag is set!"
  repeaters:
    seq:
      - id: rpt_callsign_raw
        type: callsign_raw
      - id: rpt_ssid_raw
        type: ssid_mask
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
        type: tlm
        size-eos: true
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type: tlm
        size-eos: true
  tlm:
    seq:
      - id: body
        type:
          switch-on: packet_type_q
          cases:
            0x4f: obc
            0x50: psu
            0x55: uhf
            0x56: vhf
    instances:
      monitor:
        type: str
        encoding: utf8
        size-eos: true
        pos: 0
      packet_type_q:
        type: u1
        pos: 0

  uhf:
    seq:
      - id: uhf_packet_id_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_packet_id_str"
      - id: uhf_uptime_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_uptime"
      - id: uhf_uptime_tot_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_uptime_tot"
      - id: uhf_reset_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_reset_count"
      - id: uhf_trx_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_trx_temp"
      - id: uhf_rf_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_rf_temp"
      - id: uhf_pa_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_pa_temp"
      - id: uhf_digipeater_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_digipeater_cnt"
      - id: uhf_last_digipeater_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_last_degipeater"
      - id: uhf_rx_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_rx_cnt"
      - id: uhf_tx_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uhf_tx_cnt"
      - id: uhf_act_rssi_raw_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "act_rssi_raw"
      - id: uhf_dcd_rssi_raw_str
        type: str
        terminator: 0x00
        encoding: utf8
        doc: "uhf_dcd_rssi_raw"

    instances:
      uhf_uptime:
        value: uhf_uptime_str.to_i
      uhf_uptime_tot:
        value: uhf_uptime_tot_str.to_i
      uhf_reset_cnt:
        value: uhf_reset_cnt_str.to_i
      uhf_trx_temp:
        value: uhf_trx_temp_str.to_i
      uhf_rf_temp:
        value: uhf_rf_temp_str.to_i
      uhf_pa_temp:
        value: uhf_pa_temp_str.to_i
      uhf_digipeater_cnt:
        value: uhf_digipeater_cnt_str.to_i
      uhf_last_digipeater:
        value: uhf_last_digipeater_str
      uhf_rx_cnt:
        value: uhf_rx_cnt_str.to_i
      uhf_tx_cnt:
        value: uhf_tx_cnt_str.to_i
      uhf_act_rssi_raw:
        value: uhf_act_rssi_raw_str.to_i
      uhf_dcd_rssi_raw:
        value: uhf_dcd_rssi_raw_str.to_i

  vhf:
    seq:
      - id: vhf_packet_id_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_packet_id_str"
      - id: vhf_uptime_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_uptime"
      - id: vhf_uptime_tot_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_uptime_tot"
      - id: vhf_reset_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_reset_count"
      - id: vhf_trx_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_trx_temp"
      - id: vhf_rf_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_rf_temp"
      - id: vhf_pa_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_pa_temp"
      - id: vhf_digipeater_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_digipeater_cnt"
      - id: vhf_last_digipeater_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_last_degipeater"
      - id: vhf_rx_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_rx_cnt"
      - id: vhf_tx_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "vhf_tx_cnt"
      - id: vhf_act_rssi_raw_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "act_rssi_raw"
      - id: vhf_dcd_rssi_raw_str
        type: str
        terminator: 0x00
        encoding: utf8
        doc: "vhf_dcd_rssi_raw"

    instances:
      vhf_uptime:
        value: vhf_uptime_str.to_i
      vhf_uptime_tot:
        value: vhf_uptime_tot_str.to_i
      vhf_reset_cnt:
        value: vhf_reset_cnt_str.to_i
      vhf_trx_temp:
        value: vhf_trx_temp_str.to_i
      vhf_rf_temp:
        value: vhf_rf_temp_str.to_i
      vhf_pa_temp:
        value: vhf_pa_temp_str.to_i
      vhf_digipeater_cnt:
        value: vhf_digipeater_cnt_str.to_i
      vhf_last_digipeater:
        value: vhf_last_digipeater_str
      vhf_rx_cnt:
        value: vhf_rx_cnt_str.to_i
      vhf_tx_cnt:
        value: vhf_tx_cnt_str.to_i
      vhf_act_rssi_raw:
        value: vhf_act_rssi_raw_str.to_i
      vhf_dcd_rssi_raw:
        value: vhf_dcd_rssi_raw_str.to_i

  obc:
    seq:
      - id: obc_pass_packet_type
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: obc_rst_cnt_str
        type: str
        terminator: 0x2c
        encoding: utf8
        doc: "obc_reset_cnt"
      - id: obc_uptime_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_uptime"
      - id: obc_uptime_tot_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_uptime_tot"
      - id: obc_bat_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_battery"
      - id: obc_temp_mcu_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_mcu"
      - id: obc_temp_brd_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_brd_obc"
      - id: obc_temp_zn_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_zn"
      - id: obc_temp_xp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_xp"
      - id: obc_temp_yp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_yp"
      - id: obc_temp_yn_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_yn"
      - id: obc_temp_xn_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_xn"
      - id: obc_temp_zp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_zp"
      - id: obc_freemem_str
        type: str
        terminator: 0x00
        encoding: utf8
        doc: "obc_freemem"

    instances:
      obc_reset_cnt:
        value: obc_rst_cnt_str.to_i
      obc_uptime:
        value: obc_uptime_str.to_i
      obc_uptime_tot:
        value: obc_uptime_tot_str.to_i
      obc_bat:
        value: obc_bat_str.to_i
      obc_temp_mcu:
        value: obc_temp_mcu_str.to_i
      obc_temp_brd:
        value: obc_temp_brd_str.to_i
      obc_temp_zn:
        value: obc_temp_zn_str.to_i
      obc_temp_xp:
        value: obc_temp_xp_str.to_i
      obc_temp_yp:
        value: obc_temp_yp_str.to_i
      obc_temp_yn:
        value: obc_temp_yn_str.to_i
      obc_temp_xn:
        value: obc_temp_xn_str.to_i
      obc_temp_zp:
        value: obc_temp_zp_str.to_i
      obc_freemem:
        value: obc_freemem_str.to_i

  psu:
    seq:
      - id: psu_pass_packet_type
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: psu_rst_cnt_str
        type: str
        terminator: 0x2c
        encoding: utf8
        doc: "psu_reset_cnt"
      - id: psu_uptime_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_uptime"
      - id: psu_uptime_tot_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_uptime_tot"
      - id: psu_bat_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_battery"
      - id: psu_temp_sys_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_temp_sys"
      - id: psu_temp_bat_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_temp_bat"
      - id: psu_cur_in_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_cur_in"
      - id: psu_cur_out_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_cur_out"
      - id: psu_ch_state_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "psu_ch_state"
      - id: psu_sys_state_str
        type: str
        terminator: 0x00
        encoding: utf8
        doc: "psu_sys_state"

    instances:
      psu_reset_cnt:
        value: psu_rst_cnt_str.to_i
      psu_uptime:
        value: psu_uptime_str.to_i
      psu_uptime_tot:
        value: psu_uptime_tot_str.to_i
      psu_battery:
        value: psu_bat_str.to_i
      psu_temp_sys:
        value: psu_temp_sys_str.to_i
      psu_temp_bat:
        value: psu_temp_bat_str.to_i
      psu_cur_in:
        value: psu_cur_in_str.to_i
      psu_cur_out:
        value: psu_cur_out_str.to_i
      psu_ch_state_num:
        value: psu_ch_state_str.to_i(16)
      psu_ch0_state:
        value: (psu_ch_state_num >> 0 ) & 0x01
      psu_ch1_state:
        value: (psu_ch_state_num >> 1 ) & 0x01
      psu_ch2_state:
        value: (psu_ch_state_num >> 2 ) & 0x01
      psu_ch3_state:
        value: (psu_ch_state_num >> 3 ) & 0x01
      psu_ch4_state:
        value: (psu_ch_state_num >> 4 ) & 0x01
      psu_ch5_state:
        value: (psu_ch_state_num >> 5 ) & 0x01
      psu_ch6_state:
        value: (psu_ch_state_num >> 6 ) & 0x01
      psu_sys_state:
        value: psu_sys_state_str.to_i
