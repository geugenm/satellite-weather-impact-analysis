---
meta:
  id: grbalpha
  title: GRBAlpha beacon decoder
  endian: le
doc: |
  :field callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field ssid_mask: ax25_frame.ax25_header.dest_ssid_raw.ssid_mask
  :field ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign_raw_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid_raw_ssid_mask: ax25_frame.ax25_header.src_ssid_raw.ssid_mask
  :field src_ssid_raw_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field repeater_rpt_instance_rpt_callsign_raw_callsign: ax25_frame.ax25_header.repeater.rpt_instance.rpt_callsign_raw.callsign_ror.callsign
  :field repeater_rpt_instance_rpt_ssid_raw_ssid_mask: ax25_frame.ax25_header.repeater.rpt_instance.rpt_ssid_raw.ssid_mask
  :field repeater_rpt_instance_rpt_ssid_raw_ssid: ax25_frame.ax25_header.repeater.rpt_instance.rpt_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field pkt_type: ax25_frame.payload.ax25_info.body.pkt_type
  :field uptime_total: ax25_frame.payload.ax25_info.body.uptime_total
  :field uptime_since_last: ax25_frame.payload.ax25_info.body.uptime_since_last
  :field reset_count: ax25_frame.payload.ax25_info.body.reset_count
  :field mcu_10mv: ax25_frame.payload.ax25_info.body.mcu_10mv
  :field batt: ax25_frame.payload.ax25_info.body.batt
  :field temp_cpu: ax25_frame.payload.ax25_info.body.temp_cpu
  :field temp_pa_ntc: ax25_frame.payload.ax25_info.body.temp_pa_ntc
  :field sig_rx_immediate: ax25_frame.payload.ax25_info.body.sig_rx_immediate
  :field sig_rx_avg: ax25_frame.payload.ax25_info.body.sig_rx_avg
  :field sig_rx_max: ax25_frame.payload.ax25_info.body.sig_rx_max
  :field sig_background_avg: ax25_frame.payload.ax25_info.body.sig_background_avg
  :field sig_background_immediate: ax25_frame.payload.ax25_info.body.sig_background_immediate
  :field sig_background_max: ax25_frame.payload.ax25_info.body.sig_background_max
  :field rf_packets_received: ax25_frame.payload.ax25_info.body.rf_packets_received
  :field rf_packets_transmitted: ax25_frame.payload.ax25_info.body.rf_packets_transmitted
  :field ax25_packets_received: ax25_frame.payload.ax25_info.body.ax25_packets_received
  :field ax25_packets_transmitted: ax25_frame.payload.ax25_info.body.ax25_packets_transmitted
  :field digipeater_rx_count: ax25_frame.payload.ax25_info.body.digipeater_rx_count
  :field digipeater_tx_count: ax25_frame.payload.ax25_info.body.digipeater_tx_count
  :field csp_received: ax25_frame.payload.ax25_info.body.csp_received
  :field csp_transmitted: ax25_frame.payload.ax25_info.body.csp_transmitted
  :field i2c1_received: ax25_frame.payload.ax25_info.body.i2c1_received
  :field i2c1_transmitted: ax25_frame.payload.ax25_info.body.i2c1_transmitted
  :field i2c2_received: ax25_frame.payload.ax25_info.body.i2c2_received
  :field i2c2_transmitted: ax25_frame.payload.ax25_info.body.i2c2_transmitted
  :field rs485_received: ax25_frame.payload.ax25_info.body.rs485_received
  :field rs485_transmitted: ax25_frame.payload.ax25_info.body.rs485_transmitted
  :field csp_mcu_received: ax25_frame.payload.ax25_info.body.csp_mcu_received
  :field csp_mcu_transmitted: ax25_frame.payload.ax25_info.body.csp_mcu_transmitted
  :field obc_timestamp: ax25_frame.payload.ax25_info.body.bytes.obc_timestamp
  :field obc_temp: ax25_frame.payload.ax25_info.body.bytes.obc_temp
  :field obc_tmp112_xp: ax25_frame.payload.ax25_info.body.bytes.obc_tmp112_xp
  :field obc_tmp112_yp: ax25_frame.payload.ax25_info.body.bytes.obc_tmp112_yp
  :field obc_tmp112_xn: ax25_frame.payload.ax25_info.body.bytes.obc_tmp112_xn
  :field obc_tmp112_yn: ax25_frame.payload.ax25_info.body.bytes.obc_tmp112_yn
  :field obc_tmp112_zp: ax25_frame.payload.ax25_info.body.bytes.obc_tmp112_zp
  :field obc_mag_mmc_x: ax25_frame.payload.ax25_info.body.bytes.obc_mag_mmc_x
  :field obc_mag_mmc_y: ax25_frame.payload.ax25_info.body.bytes.obc_mag_mmc_y
  :field obc_mag_mmc_z: ax25_frame.payload.ax25_info.body.bytes.obc_mag_mmc_z
  :field obc_mag_mpu_x: ax25_frame.payload.ax25_info.body.bytes.obc_mag_mpu_x
  :field obc_mag_mpu_y: ax25_frame.payload.ax25_info.body.bytes.obc_mag_mpu_y
  :field obc_mag_mpu_z: ax25_frame.payload.ax25_info.body.bytes.obc_mag_mpu_z
  :field obc_mpu_temp: ax25_frame.payload.ax25_info.body.bytes.obc_mpu_temp
  :field obc_gyr_mpu_x: ax25_frame.payload.ax25_info.body.bytes.obc_gyr_mpu_x
  :field obc_gyr_mpu_y: ax25_frame.payload.ax25_info.body.bytes.obc_gyr_mpu_y
  :field obc_gyr_mpu_z: ax25_frame.payload.ax25_info.body.bytes.obc_gyr_mpu_z
  :field obc_acc_mpu_x: ax25_frame.payload.ax25_info.body.bytes.obc_acc_mpu_x
  :field obc_acc_mpu_y: ax25_frame.payload.ax25_info.body.bytes.obc_acc_mpu_y
  :field obc_acc_mpu_z: ax25_frame.payload.ax25_info.body.bytes.obc_acc_mpu_z
  :field obc_uptime_rst: ax25_frame.payload.ax25_info.body.bytes.obc_uptime_rst
  :field obc_uptime_total: ax25_frame.payload.ax25_info.body.bytes.obc_uptime_total
  :field obc_rst_cnt: ax25_frame.payload.ax25_info.body.bytes.obc_rst_cnt
  :field obc_packet_rec_cnt: ax25_frame.payload.ax25_info.body.bytes.obc_packet_rec_cnt
  :field obc_suns_temp_yn: ax25_frame.payload.ax25_info.body.bytes.obc_suns_temp_yn
  :field obc_suns_temp_yp: ax25_frame.payload.ax25_info.body.bytes.obc_suns_temp_yp
  :field obc_suns_temp_xp: ax25_frame.payload.ax25_info.body.bytes.obc_suns_temp_xp
  :field obc_suns_temp_xn: ax25_frame.payload.ax25_info.body.bytes.obc_suns_temp_xn
  :field obc_suns_temp_zn: ax25_frame.payload.ax25_info.body.bytes.obc_suns_temp_zn
  :field obc_suns_irad_yn: ax25_frame.payload.ax25_info.body.bytes.obc_suns_irad_yn
  :field obc_suns_irad_yp: ax25_frame.payload.ax25_info.body.bytes.obc_suns_irad_yp
  :field obc_suns_irad_xp: ax25_frame.payload.ax25_info.body.bytes.obc_suns_irad_xp
  :field obc_suns_irad_xn: ax25_frame.payload.ax25_info.body.bytes.obc_suns_irad_xn
  :field obc_suns_irad_zn: ax25_frame.payload.ax25_info.body.bytes.obc_suns_irad_zn
  :field gps_rst_cnt: ax25_frame.payload.ax25_info.body.bytes.gps_rst_cnt
  :field gps_fix_quality: ax25_frame.payload.ax25_info.body.bytes.gps_fix_quality
  :field gps_tracked: ax25_frame.payload.ax25_info.body.bytes.gps_tracked
  :field gps_temp: ax25_frame.payload.ax25_info.body.bytes.gps_temp
  :field obc_free_mem: ax25_frame.payload.ax25_info.body.bytes.obc_free_mem
  :field obc_crc: ax25_frame.payload.ax25_info.body.bytes.obc_crc
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
            0x2c: comd
            _: obc
    instances:
      packet_type_q:
        type: u1
        pos: 0

  obc:
    seq:
      - id: bytes
        process: satnogsdecoders.process.b64decode
        type: obc_bytes
        size: 124

  obc_bytes:
    seq:
      - id: obc_timestamp
        type: u4
      - id: obc_temp
        type: s2
      - id: obc_tmp112_xp
        type: s2
      - id: obc_tmp112_yp
        type: s2
      - id: obc_tmp112_xn
        type: s2
      - id: obc_tmp112_yn
        type: s2
      - id: obc_tmp112_zp
        type: s2
      - id: obc_mag_mmc_x
        type: s2
      - id: obc_mag_mmc_y
        type: s2
      - id: obc_mag_mmc_z
        type: s2
      - id: obc_mag_mpu_x
        type: s2
      - id: obc_mag_mpu_y
        type: s2
      - id: obc_mag_mpu_z
        type: s2
      - id: obc_mpu_temp
        type: f4
      - id: obc_gyr_mpu_x
        type: s2
      - id: obc_gyr_mpu_y
        type: s2
      - id: obc_gyr_mpu_z
        type: s2
      - id: obc_acc_mpu_x
        type: s2
      - id: obc_acc_mpu_y
        type: s2
      - id: obc_acc_mpu_z
        type: s2
      - id: obc_uptime_rst
        type: u4
      - id: obc_uptime_total
        type: u4
      - id: obc_rst_cnt
        type: u4
      - id: obc_packet_rec_cnt
        type: u4
      - id: obc_suns_temp_yn
        type: u2
      - id: obc_suns_temp_yp
        type: u2
      - id: obc_suns_temp_xp
        type: u2
      - id: obc_suns_temp_xn
        type: u2
      - id: obc_suns_temp_zn
        type: u2
      - id: obc_suns_irad_yn
        type: u2
      - id: obc_suns_irad_yp
        type: u2
      - id: obc_suns_irad_xp
        type: u2
      - id: obc_suns_irad_xn
        type: u2
      - id: obc_suns_irad_zn
        type: u2
      - id: gps_rst_cnt
        type: u4
      - id: gps_fix_quality
        type: u1
      - id: gps_tracked
        type: u1
      - id: gps_temp
        type: s2
      - id: obc_free_mem
        type: u2
      - id: obc_crc
        type: u2

  comd:
    doc-ref: "https://needronix.eu/products/cormorant/hamradio-user-guide/"
    seq:
      - id: skip_first_comma
        type: u1
      - id: pkt_type
        type: str
        terminator: 0x2c
        encoding: utf8
      - id: pass_uptime
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: uptime_total_raw
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uptime_total"
      - id: uptime_since_last_raw
        type: str
        terminator: 0x2C
        encoding: utf8
        doc: "uptime_since_last"
      - id: pass_resets
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: reset_count_raw
        doc: "reset_count"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_mcuv
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: mcu_10mv_raw
        doc: "mcu_10mv"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_battv
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: batt_raw
        doc: "batt"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_temp
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: temp_cpu_raw
        doc: "temp_cpu"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: temp_pa_ntc_raw
        doc: "temp_pa_ntc"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_sig
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: sig_rx_immediate_raw
        doc: "sig_rx_immediate"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: sig_rx_avg_raw
        doc: "sig_rx_avg"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: sig_rx_max_raw
        doc: "sig_rx_max"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: sig_background_immediate_raw
        doc: "sig_background_immediate"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: sig_background_avg_raw
        doc: "sig_background_avg"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: sig_background_max_raw
        doc: "sig_background_max"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_rf
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: rf_packets_received_raw
        doc: "rf_packets_received"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: rf_packets_transmitted_raw
        doc: "rf_packets_transmitted"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_ax25
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: ax25_packets_received_raw
        doc: "ax25_packets_received"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: ax25_packets_transmitted_raw
        doc: "ax25_packets_transmitted"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_digi
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: digipeater_rx_count_raw
        doc: "digipeater_rx_count"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: digipeater_tx_count_raw
        doc: "digipeater_tx_count"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_csp
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: csp_received_raw
        doc: "csp_received"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: csp_transmitted_raw
        doc: "csp_transmitted"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_i2c1
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: i2c1_received_raw
        doc: "i2c1_received"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: i2c1_transmitted_raw
        doc: "i2c1_transmitted"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_i2c2
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: i2c2_received_raw
        doc: "i2c2_received"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: i2c2_transmitted_raw
        doc: "i2c2_transmitted"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_rs485
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: rs485_received_raw
        doc: "rs485_received"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: rs485_transmitted_raw
        doc: "rs485_transmitted"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: pass_csp_mcu
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: csp_mcu_received_raw
        doc: "csp_mcu_received"
        type: str
        terminator: 0x2C
        encoding: utf8
      - id: csp_mcu_transmitted_raw
        doc: "csp_mcu_transmitted"
        type: str
        size-eos: true
        encoding: utf8

    instances:
      uptime_total:
        value: uptime_total_raw.to_i
      uptime_since_last:
        value: uptime_since_last_raw.to_i
      reset_count:
        value: reset_count_raw.to_i
      mcu_10mv:
        value: mcu_10mv_raw.to_i
      batt:
        value: batt_raw.to_i
      temp_cpu:
        value: temp_cpu_raw.to_i
      temp_pa_ntc:
        value: temp_pa_ntc_raw.to_i
      sig_rx_immediate:
        value: sig_rx_immediate_raw.to_i
      sig_rx_avg:
        value: sig_rx_avg_raw.to_i
      sig_rx_max:
        value: sig_rx_max_raw.to_i
      sig_background_avg:
        value: sig_background_avg_raw.to_i
      sig_background_immediate:
        value: sig_background_immediate_raw.to_i
      sig_background_max:
        value: sig_background_max_raw.to_i
      rf_packets_received:
        value: rf_packets_received_raw.to_i
      rf_packets_transmitted:
        value: rf_packets_transmitted_raw.to_i
      ax25_packets_received:
        value: ax25_packets_received_raw.to_i
      ax25_packets_transmitted:
        value: ax25_packets_transmitted_raw.to_i
      digipeater_rx_count:
        value: digipeater_rx_count_raw.to_i
      digipeater_tx_count:
        value: digipeater_tx_count_raw.to_i
      csp_received:
        value: csp_received_raw.to_i
      csp_transmitted:
        value: csp_transmitted_raw.to_i
      i2c1_received:
        value: i2c1_received_raw.to_i
      i2c1_transmitted:
        value: i2c1_transmitted_raw.to_i
      i2c2_received:
        value: i2c2_received_raw.to_i
      i2c2_transmitted:
        value: i2c2_transmitted_raw.to_i
      rs485_received:
        value: rs485_received_raw.to_i
      rs485_transmitted:
        value: rs485_transmitted_raw.to_i
      csp_mcu_received:
        value: csp_mcu_received_raw.to_i
      csp_mcu_transmitted:
        value: csp_mcu_transmitted_raw.to_i
