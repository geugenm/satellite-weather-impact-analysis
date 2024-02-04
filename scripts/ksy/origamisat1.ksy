---
meta:
  id: origamisat1
doc-ref: |
  'http://www.origami.titech.ac.jp/wp/wp-content/uploads/2019/01/OP-S1-0115_FMDownLinkDataFormat_20190118.pdf'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field last_exec_obc_id: ax25_frame.payload.ax25_info.hk_data.chunk.last_exec_obc_id
  :field obc_cmd_status: ax25_frame.payload.ax25_info.hk_data.chunk.obc_cmd_status
  :field data_obtained_time_year: ax25_frame.payload.ax25_info.hk_data.chunk.data_obtained_time_year
  :field data_obtained_time_month: ax25_frame.payload.ax25_info.hk_data.chunk.data_obtained_time_month
  :field data_obtained_time_day: ax25_frame.payload.ax25_info.hk_data.chunk.data_obtained_time_day
  :field data_obtained_time_hour: ax25_frame.payload.ax25_info.hk_data.chunk.data_obtained_time_hour
  :field data_obtained_time_minute: ax25_frame.payload.ax25_info.hk_data.chunk.data_obtained_time_minute
  :field data_obtained_time_second: ax25_frame.payload.ax25_info.hk_data.chunk.data_obtained_time_second
  :field battery_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.battery_voltage
  :field battery_current: ax25_frame.payload.ax25_info.hk_data.chunk.battery_current
  :field bat_status: ax25_frame.payload.ax25_info.hk_data.chunk.bat_status
  :field eps_sw_status: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_status
  :field eps_bus_status: ax25_frame.payload.ax25_info.hk_data.chunk.eps_bus_status
  :field satellite_mode: ax25_frame.payload.ax25_info.hk_data.chunk.satellite_mode
  :field sap_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.sap_voltage
  :field sap_current: ax25_frame.payload.ax25_info.hk_data.chunk.sap_current
  :field sap_1_gen_pwr: ax25_frame.payload.ax25_info.hk_data.chunk.sap_1_gen_pwr
  :field sap_2_gen_pwr: ax25_frame.payload.ax25_info.hk_data.chunk.sap_2_gen_pwr
  :field sap_3_gen_pwr: ax25_frame.payload.ax25_info.hk_data.chunk.sap_3_gen_pwr
  :field sap_4_gen_pwr: ax25_frame.payload.ax25_info.hk_data.chunk.sap_4_gen_pwr
  :field sap_5_gen_pwr: ax25_frame.payload.ax25_info.hk_data.chunk.sap_5_gen_pwr
  :field sap_2_current: ax25_frame.payload.ax25_info.hk_data.chunk.sap_2_current
  :field sap_3_current: ax25_frame.payload.ax25_info.hk_data.chunk.sap_3_current
  :field sap_4_current: ax25_frame.payload.ax25_info.hk_data.chunk.sap_4_current
  :field sap_5_current: ax25_frame.payload.ax25_info.hk_data.chunk.sap_5_current
  :field eps_temp: ax25_frame.payload.ax25_info.hk_data.chunk.eps_temp
  :field obc_cmd_status: ax25_frame.payload.ax25_info.hk_data.chunk.
  :field obc_temp_0: ax25_frame.payload.ax25_info.hk_data.chunk.obc_temp_0
  :field obc_temp_1: ax25_frame.payload.ax25_info.hk_data.chunk.obc_temp_1
  :field amp_5g8hz_temp: ax25_frame.payload.ax25_info.hk_data.chunk.amp_5g8hz_temp
  :field rad_plate_5g8hz_temp: ax25_frame.payload.ax25_info.hk_data.chunk.rad_plate_5g8hz_temp
  :field tx_temp: ax25_frame.payload.ax25_info.hk_data.chunk.tx_temp
  :field rx_temp: ax25_frame.payload.ax25_info.hk_data.chunk.rx_temp
  :field bat_mbrd_temp: ax25_frame.payload.ax25_info.hk_data.chunk.bat_mbrd_temp
  :field ci_brd_temp: ax25_frame.payload.ax25_info.hk_data.chunk.ci_brd_temp
  :field panel_pos_y: ax25_frame.payload.ax25_info.hk_data.chunk.panel_pos_y
  :field panel_pos_x: ax25_frame.payload.ax25_info.hk_data.chunk.panel_pos_x
  :field panel_neg_x: ax25_frame.payload.ax25_info.hk_data.chunk.panel_neg_x
  :field obc_gpu_temp: ax25_frame.payload.ax25_info.hk_data.chunk.obc_gpu_temp
  :field panel_neg_y: ax25_frame.payload.ax25_info.hk_data.chunk.panel_neg_y
  :field accel_x: ax25_frame.payload.ax25_info.hk_data.chunk.accel_x
  :field accel_y: ax25_frame.payload.ax25_info.hk_data.chunk.accel_y
  :field accel_z: ax25_frame.payload.ax25_info.hk_data.chunk.accel_z
  :field ang_vcty_x: ax25_frame.payload.ax25_info.hk_data.chunk.ang_vcty_x
  :field ang_vcty_z: ax25_frame.payload.ax25_info.hk_data.chunk.ang_vcty_z
  :field raspi_last_exec: ax25_frame.payload.ax25_info.hk_data.chunk.raspi_last_exec
  :field raspi_mode: ax25_frame.payload.ax25_info.hk_data.chunk.raspi_mode
  :field eps_sw_1_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_1_volt
  :field eps_sw_1_curr: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_1_curr
  :field eps_sw_2_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_2_volt
  :field eps_sw_2_curr: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_2_curr
  :field eps_sw_5_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_5_volt
  :field eps_sw_5_curr: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_5_curr
  :field eps_sw_6_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_6_volt
  :field eps_sw_6_curr: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_6_curr
  :field eps_sw_7_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_7_volt
  :field eps_sw_7_curr: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_7_curr
  :field eps_sw_8_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_8_volt
  :field eps_sw_8_curr: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_8_curr
  :field eps_sw_9_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_9_volt
  :field eps_sw_10_volt: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_10_volt
  :field eps_sw_10_curr: ax25_frame.payload.ax25_info.hk_data.chunk.eps_sw_10_curr
  :field eps_3v3_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.eps_3v3_voltage
  :field eps_3v3_current: ax25_frame.payload.ax25_info.hk_data.chunk.eps_3v3_current
  :field eps_5v_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.eps_5v_voltage
  :field eps_5v_current: ax25_frame.payload.ax25_info.hk_data.chunk.eps_5v_current
  :field eps_12v_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.eps_12v_voltage
  :field eps_12v_current: ax25_frame.payload.ax25_info.hk_data.chunk.eps_12v_current
  :field bcr_1_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.bcr_1_voltage
  :field bcr_2_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.bcr_2_voltage
  :field bcr_3_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.bcr_3_voltage
  :field pwr5g8hz_12v_voltage: ax25_frame.payload.ax25_info.hk_data.chunk.pwr5g8hz_12v_voltage

  Attention: `rpt_callsign` cannot be accessed because `rpt_instance` is an
  array of unknown size at the beginning of the parsing process! Left an
  example in here.

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
      - id: repeater
        type: repeater
        if: (src_ssid_raw.ssid_mask & 0x01) == 0
        doc: 'Repeater flag is set!'
      - id: ctl
        type: u1

  repeater:
    seq:
      - id: rpt_instance
        type: repeaters
        repeat: until
        repeat-until: ((_.rpt_ssid_raw.ssid_mask & 0x1) == 0x1)
        doc: 'Repeat until no repeater flag is set!'

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
        size-eos: true

  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type:
          switch-on: _io.size
          cases:
            48: echo_back
            51: hk_or_mission_data

  echo_back:
    seq:
      - id: response_data
        size: 32
        doc: |
          field tree:
          echo_back: ax25_frame.payload.ax25_info.response_data

  hk_or_mission_data:
    seq:
      - id: pkt_num
        type: u1
        repeat: expr
        repeat-expr: 3
      - id: hk_data
        type: hk_data
        if: (pkt_num[0] == pkt_num[1]) and (pkt_num[1] == pkt_num[2])
      - id: mission_data
        type: mission_data
        if: (pkt_num[0] != pkt_num[1])
        size: 32
    instances:
      packet_number:
        value: >-
          (
          (pkt_num[0]) |
          (pkt_num[1]) |
          (pkt_num[2])
          )

  hk_data:
    seq:
      - id: chunk
        type:
          switch-on: _parent.packet_number % 4
          cases:
            1: hk_data_chunk_1
            2: hk_data_chunk_2
            3: hk_data_chunk_3
            0: hk_data_chunk_4
        size-eos: true

  hk_data_chunk_1:
    meta:
      endian: be
    seq:
      - id: last_exec_obc_id
        -orig-id: Latest executed ID(OBC)
        type: u1
        doc: 'byte #0'
      - id: obc_cmd_status
        -orig-id: OBC command status
        type: u1
        doc: 'byte #1'
      - id: data_obtained_time_year
        -orig-id: Data obtained time
        type: u1
        doc: 'byte #2'
      - id: data_obtained_time_month
        -orig-id: Data obtained time
        type: u1
        doc: 'byte #3'
      - id: data_obtained_time_day
        -orig-id: Data obtained time
        type: u1
        doc: 'byte #4'
      - id: data_obtained_time_hour
        -orig-id: Data obtained time
        type: u1
        doc: 'byte #5'
      - id: data_obtained_time_minute
        -orig-id: Data obtained time
        type: u1
        doc: 'byte #6'
      - id: data_obtained_time_second
        -orig-id: Data obtained time
        type: u1
        doc: 'byte #7'
      - id: battery_voltage
        -orig-id: Battery voltage and current
        type: u2
        doc: 'byte #8 to #9'
      - id: battery_current
        -orig-id: Battery voltage and current
        type: u2
        doc: 'byte #10 to #11'
      - id: bat_status
        -orig-id: Battery status
        type: u1
        doc: 'byte #12'
      - id: eps_sw_status
        -orig-id: EPS switch status
        type: u2
        doc: 'byte #13 to #14'
      - id: eps_bus_status
        -orig-id: EPS bus status
        type: u1
        doc: 'byte #15'
      - id: satellite_mode
        -orig-id: Satellite mode
        type: u1
        doc: 'byte #16'
      - id: sap_voltage
        -orig-id: SAP voltage and current
        type: u2
        doc: 'byte #17 to #18'
      - id: sap_current
        -orig-id: SAP voltage and current
        type: u2
        doc: 'byte #19 to #20'
      - id: sap_1_gen_pwr
        -orig-id: SAP 1-5 generated power
        type: u2
        doc: 'byte #21 to #22'
      - id: sap_2_gen_pwr
        -orig-id: SAP 1-5 generated power
        type: u2
        doc: 'byte #23 to #24'
      - id: sap_3_gen_pwr
        -orig-id: SAP 1-5 generated power
        type: u2
        doc: 'byte #25 to #26'
      - id: sap_4_gen_pwr
        -orig-id: SAP 1-5 generated power
        type: u2
        doc: 'byte #27 to #28'
      - id: sap_5_gen_pwr
        -orig-id: SAP 1-5 generated power
        type: u2
        doc: 'byte #29 to #30'
      - id: sap_1_current_b0
        -orig-id: SAP 1~4 current
        type: u1
        doc: 'byte #31 to #32'
  # --- end of chunk 1 (32 bytes) ---
  hk_data_chunk_2:
    meta:
      endian: be
    seq:
      - id: sap_1_current_b1
        -orig-id: SAP 1~4 current
        type: u1
        doc: 'byte #31 to #32'
      - id: sap_2_current
        -orig-id: SAP 1~4 current
        type: u2
        doc: 'byte #33 to #34'
      - id: sap_3_current
        -orig-id: SAP 1~4 current
        type: u2
        doc: 'byte #35 to #36'
      - id: sap_4_current
        -orig-id: SAP 1~4 current
        type: u2
        doc: 'byte #37 to #38'
      - id: eps_temp
        -orig-id: Temperature
        type: u2
        doc: 'byte #39 to #40'
      - id: obc_temp_0
        -orig-id: Temperature
        type: u1
        doc: 'byte #41'
      - id: obc_temp_1
        -orig-id: Temperature
        type: u1
        doc: 'byte #42'
      - id: amp_5g8hz_temp
        -orig-id: Temperature
        type: u1
        doc: 'byte #43'
      - id: rad_plate_5g8hz_temp
        -orig-id: Temperature
        type: u1
        doc: 'byte #44'
      - id: tx_temp
        -orig-id: Temperature
        type: u1
        doc: 'byte #45'
      - id: rx_temp
        -orig-id: Temperature
        type: u1
        doc: 'byte #46'
      - id: bat_mbrd_temp
        -orig-id: Temperature
        type: u2
        doc: 'byte #47 to #48'
      - id: ci_brd_temp
        -orig-id: Temperature
        type: u1
        doc: 'byte #49'
      - id: panel_pos_y
        -orig-id: Side panel +Y
        type: u1
        doc: 'byte #50'
      - id: panel_pos_x
        -orig-id: Side panel +X
        type: u1
        doc: 'byte #51'
      - id: panel_neg_x
        -orig-id: Side panel -X
        type: u1
        doc: 'byte #52'
      - id: obc_gpu_temp
        -orig-id: OBC (GPU) temperature
        type: u1
        doc: 'byte #53'
      - id: panel_neg_y
        -orig-id: Side panel -Y
        type: u1
        doc: 'byte #54'
      - id: accel_x
        -orig-id: Acceleration X
        type: u2
        doc: 'byte #55 to #56'
      - id: accel_y
        -orig-id: Acceleration Y
        type: u2
        doc: 'byte #57 to #58'
      - id: accel_z
        -orig-id: Acceleration Z
        type: u2
        doc: 'byte #59 to #60'
      - id: ang_vcty_x
        -orig-id: Angular velocity X
        type: u2
        doc: 'byte #61 to #62'
      - id: ang_vcty_y_b0
        -orig-id: Angular velocity Y
        type: u1
        doc: 'byte #63 to #64'
  # --- end of chunk 2 (32 bytes) ---
  hk_data_chunk_3:
    meta:
      endian: be
    seq:
      - id: ang_vcty_y_b1
        -orig-id: Angular velocity Y
        type: u1
        doc: 'byte #63 to #64'
      - id: ang_vcty_z
        -orig-id: Angular velocity Z
        type: u2
        doc: 'byte #65 to #66'
      - id: raspi_last_exec
        -orig-id: Raspberry Pi latest executed
        type: u1
        doc: 'byte #67'
      - id: raspi_mode
        -orig-id: Raspberry Pi's mode, command execution status, LED status
        type: u1
        doc: 'byte #68'
      - id: eps_sw_1_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #69 to #70'
      - id: eps_sw_1_curr
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #71 to #72'
      - id: eps_sw_2_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #73 to #74'
      - id: eps_sw_2_curr
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #75 to #76'
      - id: eps_sw_5_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #77 to #78'
      - id: eps_sw_5_curr
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #79 to #80'
      - id: eps_sw_6_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #81 to #82'
      - id: eps_sw_6_curr
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #83 to #84'
      - id: eps_sw_7_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #85 to #86'
      - id: eps_sw_7_curr
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #87 to #88'
      - id: eps_sw_8_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #89 to #90'
      - id: eps_sw_8_curr
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #91 to #92'
      - id: eps_sw_9_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #93 to #94'
      - id: eps_sw_9_curr_b0
        -orig-id: EPS switch 1-10 voltage, current
        type: u1
        doc: 'byte #95'
  # ---end of chunk 3 (32 bytes) ---
  hk_data_chunk_4:
    meta:
      endian: be
    seq:
      - id: eps_sw_9_curr_b1
        -orig-id: EPS switch 1-10 voltage, current
        type: u1
        doc: 'byte #96'
      - id: eps_sw_10_volt
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #97 to #98'
      - id: eps_sw_10_curr
        -orig-id: EPS switch 1-10 voltage, current
        type: u2
        doc: 'byte #99 to #100'
      - id: eps_3v3_voltage
        -orig-id: EPS 3.3V BUS voltage, current
        type: u2
        doc: 'byte #101 to #102'
      - id: eps_3v3_current
        -orig-id: EPS 3.3V BUS voltage, current
        type: u2
        doc: 'byte #103 to #104'
      - id: eps_5v_voltage
        -orig-id: EPS 5V BUS voltage, current
        type: u2
        doc: 'byte #105 to #106'
      - id: eps_5v_current
        -orig-id: EPS 5V BUS voltage, current
        type: u2
        doc: 'byte #107 to #108'
      - id: eps_12v_voltage
        -orig-id: EPS 12V BUS voltage, current
        type: u2
        doc: 'byte #109 to #110'
      - id: eps_12v_current
        -orig-id: EPS 12V BUS voltage, current
        type: u2
        doc: 'byte #111 to #112'
      - id: bcr_1_voltage
        -orig-id: BCR 1-3 voltage
        type: u2
        doc: 'byte #113 to #114'
      - id: bcr_2_voltage
        -orig-id: BCR 1-3 voltage
        type: u2
        doc: 'byte #115 to #116'
      - id: bcr_3_voltage
        -orig-id: BCR 1-3 voltage
        type: u2
        doc: 'byte #117 to #118'
      - id: sap_5_current
        -orig-id: SAP 5 current
        type: u2
        doc: 'byte #119 to #120'
      - id: pwr5g8hz_12v_voltage
        -orig-id: 5.8GHz 12 V voltage
        type: u1
        doc: 'byte #121'
  # --- end of chunk 4 (26 bytes) ---
  mission_data:
    seq:
      - id: unparsed
        size-eos: true
