---
meta:
  id: bdsat
  title: BDSAT beacon decoder www.bdsat.cz
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
  :field obc_rst_cnt_str: ax25_frame.payload.ax25_info.body.obc_rst_cnt_str
  :field obc_uptime_str: ax25_frame.payload.ax25_info.body.obc_uptime_str
  :field obc_bat_str: ax25_frame.payload.ax25_info.body.obc_bat_str
  :field obc_temp_obc_str: ax25_frame.payload.ax25_info.body.obc_temp_obc_str
  :field obc_temp_zn_str: ax25_frame.payload.ax25_info.body.obc_temp_zn_str
  :field obc_temp_xp_str: ax25_frame.payload.ax25_info.body.obc_temp_xp_str
  :field obc_temp_yp_str: ax25_frame.payload.ax25_info.body.obc_temp_yp_str
  :field obc_temp_yn_str: ax25_frame.payload.ax25_info.body.obc_temp_yn_str
  :field obc_temp_xn_str: ax25_frame.payload.ax25_info.body.obc_temp_xn_str
  :field obc_freemem_str: ax25_frame.payload.ax25_info.body.obc_freemem_str
  :field obc_pld_state_str: ax25_frame.payload.ax25_info.body.obc_pld_state_str
  :field obc_pld_prog_str: ax25_frame.payload.ax25_info.body.obc_pld_prog_str
  :field obc_pld_hw_state_str: ax25_frame.payload.ax25_info.body.obc_pld_hw_state_str
  :field obc_psu_uptime_str: ax25_frame.payload.ax25_info.body.obc_psu_uptime_str
  :field obc_crc_str: ax25_frame.payload.ax25_info.body.obc_crc_str
  :field obc_reset_cnt: ax25_frame.payload.ax25_info.body.obc_reset_cnt
  :field obc_uptime: ax25_frame.payload.ax25_info.body.obc_uptime
  :field obc_bat: ax25_frame.payload.ax25_info.body.obc_bat
  :field obc_temp_obc: ax25_frame.payload.ax25_info.body.obc_temp_obc
  :field obc_temp_zn: ax25_frame.payload.ax25_info.body.obc_temp_zn
  :field obc_temp_xp: ax25_frame.payload.ax25_info.body.obc_temp_xp
  :field obc_temp_yp: ax25_frame.payload.ax25_info.body.obc_temp_yp
  :field obc_temp_yn: ax25_frame.payload.ax25_info.body.obc_temp_yn
  :field obc_temp_xn: ax25_frame.payload.ax25_info.body.obc_temp_xn
  :field obc_freemem: ax25_frame.payload.ax25_info.body.obc_freemem
  :field obc_pld_state: ax25_frame.payload.ax25_info.body.obc_pld_state
  :field obc_pld_prog: ax25_frame.payload.ax25_info.body.obc_pld_prog
  :field obc_pld_hw_state: ax25_frame.payload.ax25_info.body.obc_pld_hw_state
  :field obc_psu_uptime: ax25_frame.payload.ax25_info.body.obc_psu_uptime
  :field trx_uptime_str: ax25_frame.payload.ax25_info.body.trx_uptime_str
  :field trx_uptime_total_str: ax25_frame.payload.ax25_info.body.trx_uptime_total_str
  :field trx_reset_cnt_str: ax25_frame.payload.ax25_info.body.trx_reset_cnt_str
  :field trx_trx_temp_str: ax25_frame.payload.ax25_info.body.trx_trx_temp_str
  :field trx_rf_temp_str: ax25_frame.payload.ax25_info.body.trx_rf_temp_str
  :field trx_pa_temp_str: ax25_frame.payload.ax25_info.body.trx_pa_temp_str
  :field trx_digipeater_cnt_str: ax25_frame.payload.ax25_info.body.trx_digipeater_cnt_str
  :field trx_last_digipeater_str: ax25_frame.payload.ax25_info.body.trx_last_digipeater_str
  :field trx_rx_cnt_str: ax25_frame.payload.ax25_info.body.trx_rx_cnt_str
  :field trx_tx_cnt_str: ax25_frame.payload.ax25_info.body.trx_tx_cnt_str
  :field trx_act_rssi_raw_str: ax25_frame.payload.ax25_info.body.trx_act_rssi_raw_str
  :field trx_dcd_rssi_raw_str: ax25_frame.payload.ax25_info.body.trx_dcd_rssi_raw_str
  :field trx_uptime: ax25_frame.payload.ax25_info.body.trx_uptime
  :field trx_uptime_total: ax25_frame.payload.ax25_info.body.trx_uptime_total
  :field trx_reset_cnt: ax25_frame.payload.ax25_info.body.trx_reset_cnt
  :field trx_trx_temp: ax25_frame.payload.ax25_info.body.trx_trx_temp
  :field trx_rf_temp: ax25_frame.payload.ax25_info.body.trx_rf_temp
  :field trx_pa_temp: ax25_frame.payload.ax25_info.body.trx_pa_temp
  :field trx_digipeater_cnt: ax25_frame.payload.ax25_info.body.trx_digipeater_cnt
  :field trx_last_digipeater: ax25_frame.payload.ax25_info.body.trx_last_digipeater
  :field trx_rx_cnt: ax25_frame.payload.ax25_info.body.trx_rx_cnt
  :field trx_tx_cnt: ax25_frame.payload.ax25_info.body.trx_tx_cnt
  :field trx_act_rssi_raw: ax25_frame.payload.ax25_info.body.trx_act_rssi_raw
  :field trx_dcd_rssi_raw: ax25_frame.payload.ax25_info.body.trx_dcd_rssi_raw
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
            _: trx
    instances:
      monitor:
        type: str
        encoding: ASCII
        size-eos: true
        pos: 0
      packet_type_q:
        type: u1
        pos: 0

  trx:
    seq:
      - id: trx_uptime_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_uptime"
      - id: trx_uptime_total_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_uptime_total"
      - id: trx_reset_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_reset_count"
      - id: trx_trx_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_trx_temp"
      - id: trx_rf_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_rf_temp"
      - id: trx_pa_temp_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_pa_temp"
      - id: trx_digipeater_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_digipeater_cnt"
      - id: trx_last_digipeater_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_last_degipeater"
      - id: trx_rx_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_rx_cnt"
      - id: trx_tx_cnt_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "trx_tx_cnt"
      - id: trx_act_rssi_raw_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "act_rssi_raw"
      - id: trx_dcd_rssi_raw_str
        type: str
        terminator: 0x00
        encoding: utf8
        doc: "trx_dcd_rssi_raw"

    instances:
      trx_uptime:
        value: trx_uptime_str.to_i
      trx_uptime_total:
        value: trx_uptime_total_str.to_i
      trx_reset_cnt:
        value: trx_reset_cnt_str.to_i
      trx_trx_temp:
        value: trx_trx_temp_str.to_i
      trx_rf_temp:
        value: trx_rf_temp_str.to_i
      trx_pa_temp:
        value: trx_pa_temp_str.to_i
      trx_digipeater_cnt:
        value: trx_digipeater_cnt_str.to_i
      trx_last_digipeater:
        value: trx_last_digipeater_str
      trx_rx_cnt:
        value: trx_rx_cnt_str.to_i
      trx_tx_cnt:
        value: trx_tx_cnt_str.to_i
      trx_act_rssi_raw:
        value: trx_act_rssi_raw_str.to_i
      trx_dcd_rssi_raw:
        value: trx_dcd_rssi_raw_str.to_i

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
      - id: obc_bat_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_battery"
      - id: obc_temp_obc_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_temp_obc"
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
      - id: obc_freemem_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_freemem"
      - id: obc_pld_state_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_pld_state"
      - id: obc_pld_prog_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_pld_prog"
      - id: obc_pld_hw_state_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_pld_hw_state"
      - id: obc_psu_uptime_str
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "obc_psu_uptime_str"
      - id: obc_crc_str
        type: str
        terminator: 0x00
        encoding: utf8
        doc: "obc_crc"

    instances:
      obc_reset_cnt:
        value: obc_rst_cnt_str.to_i
      obc_uptime:
        value: obc_uptime_str.to_i
      obc_bat:
        value: obc_bat_str.to_i
      obc_temp_obc:
        value: obc_temp_obc_str.to_i
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
      obc_freemem:
        value: obc_freemem_str.to_i
      obc_pld_state:
        value: obc_pld_state_str.to_i
      obc_pld_prog:
        value: obc_pld_prog_str.to_i
      obc_pld_hw_state:
        value: obc_pld_hw_state_str.to_i
      obc_psu_uptime:
        value: obc_psu_uptime_str.to_i
