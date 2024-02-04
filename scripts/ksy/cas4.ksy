---
meta:
  id: cas4
  title: CAS-4 Telemetry Decoder
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field pwr_volt: ax25_frame.payload.ax25_info.telemetry.pwr_volt
  :field pwr_cur: ax25_frame.payload.ax25_info.telemetry.pwr_cur
  :field convert_volt: ax25_frame.payload.ax25_info.telemetry.convert_volt
  :field convert_cur: ax25_frame.payload.ax25_info.telemetry.convert_cur
  :field obc_temp: ax25_frame.payload.ax25_info.telemetry.obc_temp
  :field rf_amp_temp: ax25_frame.payload.ax25_info.telemetry.rf_amp_temp
  :field rcv_agc_volt: ax25_frame.payload.ax25_info.telemetry.rcv_agc_volt
  :field rf_fwd: ax25_frame.payload.ax25_info.telemetry.rf_fwd
  :field rf_ref: ax25_frame.payload.ax25_info.telemetry.rf_ref
  :field obc_volt: ax25_frame.payload.ax25_info.telemetry.obc_volt
  :field obc_reset: ax25_frame.payload.ax25_info.telemetry.obc_reset
  :field pkt_cnt: ax25_frame.payload.ax25_info.telemetry.pkt_cnt
  :field sat_num: ax25_frame.payload.ax25_info.telemetry.sat_num
  :field op_mode: ax25_frame.payload.ax25_info.telemetry.op_mode
  :field pwr_on_op_mode: ax25_frame.payload.ax25_info.telemetry.pwr_on_op_mode
  :field i2c_watchdog: ax25_frame.payload.ax25_info.telemetry.i2c_watchdog
  :field i2c_recon_cnt: ax25_frame.payload.ax25_info.telemetry.i2c_recon_cnt
  :field tc_watchdog: ax25_frame.payload.ax25_info.telemetry.tc_watchdog
  :field tc_reset_cnt: ax25_frame.payload.ax25_info.telemetry.tc_reset_cnt
  :field adc_watchdog: ax25_frame.payload.ax25_info.telemetry.adc_watchdog
  :field adc_reset_cnt: ax25_frame.payload.ax25_info.telemetry.adc_reset_cnt
  :field spi_watchdog: ax25_frame.payload.ax25_info.telemetry.spi_watchdog
  :field spi_init_cnt: ax25_frame.payload.ax25_info.telemetry.spi_init_cnt
  :field cpu_watchdog: ax25_frame.payload.ax25_info.telemetry.cpu_watchdog
  :field cpu_reset_cnt: ax25_frame.payload.ax25_info.telemetry.cpu_reset_cnt
  :field framecounter: ax25_frame.payload.ax25_info.framecounter

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
        type:
          switch-on: pid
          cases:
            0xF0: cas4_frame
        size-eos: true

  cas4_frame:
    seq:
      - id: syncpacket
        size: 2
        contents: [0xeb, 0x90]
      - id: telemetry
        size: 4
        type:
          switch-on: framecounter % 4
          cases:
            0: frame1
            1: frame2
            2: frame3
            3: frame4
      - id: reserved1
        size: 9
      - id: framecounterplaceholder
        type: u1
      - id: reserved2
        size: 112
    types:
      frame1:
        seq:
          - id: pwr_volt
            type: u1
          - id: pwr_cur
            type: u1
          - id: convert_volt
            type: u1
          - id: convert_cur
            type: u1
      frame2:
        seq:
          - id: obc_temp
            type: u1
          - id: rf_amp_temp
            type: u1
          - id: rcv_agc_volt
            type: u1
          - id: rf_fwd
            type: u1
      frame3:
        seq:
          - id: rf_ref
            type: u1
          - id: obc_volt
            type: u1
          - id: obc_reset
            type: u1
          - id: pkt_cnt
            type: b4
          - id: sat_num
            type: b4
      frame4:
        seq:
          - id: op_mode
            type: b4
          - id: pwr_on_op_mode
            type: b4
          - id: i2c_watchdog
            type: b1
          - id: i2c_recon_cnt
            type: b3
          - id: tc_watchdog
            type: b1
          - id: tc_reset_cnt
            type: b3
          - id: adc_watchdog
            type: b1
          - id: adc_reset_cnt
            type: b3
          - id: spi_watchdog
            type: b1
          - id: spi_init_cnt
            type: b3
          - id: cpu_watchdog
            type: b1
          - id: cpu_reset_cnt
            type: b3
    instances:
      framecounter:
        pos: 0x000000F
        type: u1
