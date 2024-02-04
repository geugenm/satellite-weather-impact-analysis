---
meta:
  id: gaspacs
  title: GASPACS telemetry decoder struct
  endian: be
doc-ref: 'https://smallsatgasteam.github.io/GASPACS-Comms-Info/'
doc: |
  :field dest_callsign: frame.payload.data_payload.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: frame.payload.data_payload.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: frame.payload.data_payload.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: frame.payload.data_payload.ax25_header.dest_ssid_raw.ssid
  :field ctl: frame.payload.data_payload.ax25_header.ctl
  :field pid: frame.payload.data_payload.payload.pid
  :field rf_message: frame.payload.data_payload.payload.ax25_info.rf_message
  :field length: frame.length
  :field packet_type: packet_type
  :field timestamp: frame.payload.data_payload.timestamp
  :field ss_1: frame.payload.data_payload.ss_1
  :field ss_2: frame.payload.data_payload.ss_2
  :field ss_3: frame.payload.data_payload.ss_3
  :field ss_4: frame.payload.data_payload.ss_4
  :field ss_5: frame.payload.data_payload.ss_5
  :field mf_x: frame.payload.data_payload.mf_x
  :field mf_y: frame.payload.data_payload.mf_y
  :field mf_z: frame.payload.data_payload.mf_z
  :field mission_mode: frame.payload.data_payload.mission_mode
  :field reboot_count: frame.payload.data_payload.reboot_count
  :field boombox_uv: frame.payload.data_payload.boombox_uv
  :field spx_pos_temp1: frame.payload.data_payload.spx_pos_temp1
  :field spx_pos_temp2: frame.payload.data_payload.spx_pos_temp2
  :field raspberrypi_temp: frame.payload.data_payload.raspberrypi_temp
  :field eps_mcu_temp: frame.payload.data_payload.eps_mcu_temp
  :field cell_1_battery_temp: frame.payload.data_payload.cell_1_battery_temp
  :field cell_2_battery_temp: frame.payload.data_payload.cell_2_battery_temp
  :field battery_voltage: frame.payload.data_payload.battery_voltage
  :field battery_current: frame.payload.data_payload.battery_current
  :field bcr_voltage: frame.payload.data_payload.bcr_voltage
  :field bcr_current: frame.payload.data_payload.bcr_current
  :field eps_3v3_current: frame.payload.data_payload.eps_3v3_current
  :field eps_5v_current: frame.payload.data_payload.eps_5v_current
  :field spx_voltage: frame.payload.data_payload.spx_voltage
  :field spx_pos_current: frame.payload.data_payload.spx_pos_current
  :field spx_neg_current: frame.payload.data_payload.spx_neg_current
  :field spy_voltage: frame.payload.data_payload.spy_voltage
  :field spy_pos_current: frame.payload.data_payload.spy_pos_current
  :field spy_neg_current: frame.payload.data_payload.spy_neg_current
  :field spz_voltage: frame.payload.data_payload.spz_voltage
  :field spz_pos_current: frame.payload.data_payload.spz_pos_current
  :field timestamp_ms: frame.payload.data_payload.timestamp_ms
  :field la_x: frame.payload.data_payload.la_x
  :field la_y: frame.payload.data_payload.la_y
  :field la_z: frame.payload.data_payload.la_z
  :field image_row: frame.payload.image_payload.ssdv_payload.image_row
  :field payload_size: frame.payload.payload_size
  :field framelength: framelength
  :field data_type: data_type

seq:
  - id: frame
    type: gaspacs_frame_t
instances:
  framelength:
    value: _io.size
  packet_type:
    pos: 8
    type: u1
  data_type:
    pos: 1
    type: u2
types:
  gaspacs_frame_t:
    seq:
      - id: length
        type: u1
      - id: payload
        type: telemetry_t
  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
        doc-ref: 'https://www.tapr.org/pub_ax25.html'
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
            - '"N7GAS "'
            - '"CQ    "'
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
      - id: rf_message
        type: str
        encoding: ASCII
        size-eos: true
  telemetry_t:
    seq:
      - id: data_payload
        type:
          switch-on: _root.packet_type
          cases:
            0: attitude_t
            1: ttc_t
            2: deployment_t
            _: ax25_frame

        if: (_root.data_type & 0xff00) >> 8 == 0x47
      - id: image_payload
        type: ssdv_t
        if: _root.data_type == 0x5566
    instances:
      payload_size:
        value: _io.size
  attitude_t:
    seq:
      - id: header
        size: 7
        contents: "GASPACS"
      - id: packet_type
        type: u1
        doc: |
          Type of packet
          0: Attitude Data
          1: TT & C Data
          2: Deployment Data
      - id: timestamp
        type: u4
        doc: |
          Timestamp
          Seconds since Epoch Time
      - id: ss_1
        type: f4
        doc: |
          Solar irradiance on Coarse Sun Sensor 1 (Voltage)
      - id: ss_2
        type: f4
        doc: |
          Solar irradiance on Coarse Sun Sensor 2 (Voltage)
      - id: ss_3
        type: f4
        doc: |
          Solar irradiance on Coarse Sun Sensor 3 (Voltage)
      - id: ss_4
        type: f4
        doc: |
          Solar irradiance on Coarse Sun Sensor 4 (Voltage)
      - id: ss_5
        type: f4
        doc: |
          Solar irradiance on Coarse Sun Sensor 5 (Voltage)
      - id: mf_x
        type: f4
        doc: |
          Magnetic Field flux density in X axis (µT)
      - id: mf_y
        type: f4
        doc: |
          Magnetic Field flux density in Y axis (µT)
      - id: mf_z
        type: f4
        doc: |
          Magnetic Field flux density in Z axis (µT)
      - id: footer
        size: 7
        contents: "GASPACS"
  ttc_t:
    seq:
      - id: header
        size: 7
        contents: "GASPACS"
      - id: packet_type
        type: u1
        doc: |
          Type of packet
          0: Attitude Data
          1: TT & C Data
          2: Deployment Data
      - id: timestamp
        type: u4
        doc: |
          Timestamp
          Seconds since Epoch Time
      - id: mission_mode
        type: u1
        doc: |
          Mission mode at time of data collection
      - id: reboot_count
        type: u2
        doc: |
          Number of reboots
      - id: boombox_uv
        type: f4
        doc: |
          UV Sensor Voltage
      - id: spx_pos_temp1
        type: f4
        doc: |
          Solar Panel Temperature Celsius
      - id: spx_pos_temp2
        type: f4
        doc: |
          Solar Panel Temperature Celsius
      - id: raspberrypi_temp
        type: f4
        doc: |
          Celsius
      - id: eps_mcu_temp
        type: f4
        doc: |
          Celsius
      - id: cell_1_battery_temp
        type: f4
        doc: |
          Celsius
      - id: cell_2_battery_temp
        type: f4
        doc: |
          Celsius
      - id: battery_voltage
        type: f4
        doc: |
          Batt. BUS Voltage
      - id: battery_current
        type: f4
        doc: |
          Batt. BUS Current
      - id: bcr_voltage
        type: f4
        doc: |
          Regulated Voltage from Solar Panels and Exterior Power Sources
      - id: bcr_current
        type: f4
        doc: |
          Regulated Current from Solar Panels and Exterior Power Sources
      - id: eps_3v3_current
        type: f4
        doc: |
          Amps
      - id: eps_5v_current
        type: f4
        doc: |
          Amps
      - id: spx_voltage
        type: f4
        doc: |
          Voltage
      - id: spx_pos_current
        type: f4
        doc: |
          Current
      - id: spx_neg_current
        type: f4
        doc: |
          Current
      - id: spy_voltage
        type: f4
        doc: |
          Voltage
      - id: spy_pos_current
        type: f4
        doc: |
          Current
      - id: spy_neg_current
        type: f4
        doc: |
          Current
      - id: spz_voltage
        type: f4
        doc: |
          Voltage
      - id: spz_pos_current
        type: f4
        doc: |
          Current
      - id: footer
        size: 7
        contents: "GASPACS"
  deployment_t:
    seq:
      - id: header
        size: 7
        contents: "GASPACS"
      - id: packet_type
        type: u1
        doc: |
          Type of packet
          0: Attitude Data
          1: TT & C Data
          2: Deployment Data
      - id: timestamp_ms
        type: u8
        doc: |
          Timestamp
          Milliseconds since Epoch Time
      - id: boombox_uv
        type: f4
        doc: |
          Voltage through UV sensor
      - id: la_x
        type: f4
        doc: |
          Linear Acceleration along X Axis (m/s^2 )
      - id: la_y
        type: f4
        doc: |
          Linear Acceleration along Y Axis (m/s^2 )
      - id: la_z
        type: f4
        doc: |
          Linear Acceleration along Z Axis (m/s^2 )
      - id: footer
        size: 7
        contents: "GASPACS"
  ssdv_t:
    seq:
      - id: ssdv_payload
        process: satnogsdecoders.process.hexl
        type: image_t
        size-eos: true
  image_t:
    seq:
      - id: image_row
        type: str
        size-eos: true
        encoding: ASCII
