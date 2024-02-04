---
meta:
  id: bisonsat
  endian: le

doc-ref: 'http://cubesat.skc.edu/beacon-decoding-information/'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field rtc_time_year: ax25_frame.payload.ax25_info.rtc_time_year
  :field rtc_time_month: ax25_frame.payload.ax25_info.rtc_time_month
  :field rtc_time_day: ax25_frame.payload.ax25_info.rtc_time_day
  :field rtc_time_hour: ax25_frame.payload.ax25_info.rtc_time_hour
  :field rtc_time_minutes: ax25_frame.payload.ax25_info.rtc_time_minutes
  :field rtc_time_seconds: ax25_frame.payload.ax25_info.rtc_time_seconds
  :field rtc_time_th: ax25_frame.payload.ax25_info.rtc_time_th
  :field os_ticks: ax25_frame.payload.ax25_info.os_ticks
  :field last_cmd_1: ax25_frame.payload.ax25_info.last_cmd_1
  :field last_cmd_2: ax25_frame.payload.ax25_info.last_cmd_2
  :field cmd_queue_length: ax25_frame.payload.ax25_info.cmd_queue_length
  :field filename_jpeg: ax25_frame.payload.ax25_info.filename_jpeg
  :field filename_raw: ax25_frame.payload.ax25_info.filename_raw
  :field cdh_reset_events: ax25_frame.payload.ax25_info.cdh_reset_events
  :field y_plus_current: ax25_frame.payload.ax25_info.y_plus_current
  :field y_plus_temperature: ax25_frame.payload.ax25_info.y_plus_temperature
  :field y_pair_voltage: ax25_frame.payload.ax25_info.y_pair_voltage
  :field x_minus_current: ax25_frame.payload.ax25_info.x_minus_current
  :field x_minus_temperature: ax25_frame.payload.ax25_info.x_minus_temperature
  :field x_pair_voltage: ax25_frame.payload.ax25_info.x_pair_voltage
  :field x_plus_current: ax25_frame.payload.ax25_info.x_plus_current
  :field x_plus_temperature: ax25_frame.payload.ax25_info.x_plus_temperature
  :field z_pair_voltage: ax25_frame.payload.ax25_info.z_pair_voltage
  :field z_plus__current: ax25_frame.payload.ax25_info.z_plus__current
  :field z_plus_temperature: ax25_frame.payload.ax25_info.z_plus_temperature
  :field y_minus_current: ax25_frame.payload.ax25_info.y_minus_current
  :field y_minus_temperature: ax25_frame.payload.ax25_info.y_minus_temperature
  :field battery_current: ax25_frame.payload.ax25_info.battery_current
  :field battery1_temperature: ax25_frame.payload.ax25_info.battery1_temperature
  :field battery1_full_voltage: ax25_frame.payload.ax25_info.battery1_full_voltage
  :field battery1_current_direction: ax25_frame.payload.ax25_info.battery1_current_direction
  :field battery1_current: ax25_frame.payload.ax25_info.battery1_current
  :field battery0_temperature: ax25_frame.payload.ax25_info.battery0_temperature
  :field battery0_full_voltage: ax25_frame.payload.ax25_info.battery0_full_voltage
  :field bus_current_5v: ax25_frame.payload.ax25_info.bus_current_5v
  :field bus_current_3v3: ax25_frame.payload.ax25_info.bus_current_3v3
  :field battery0_current_direction: ax25_frame.payload.ax25_info.battery0_current_direction
  :field battery0_current: ax25_frame.payload.ax25_info.battery0_current
  :field z_minus_temperature: ax25_frame.payload.ax25_info.z_minus_temperature
  :field z_minus_current: ax25_frame.payload.ax25_info.z_minus_current
  :field hmb_accelx: ax25_frame.payload.ax25_info.hmb_accelx
  :field hmb_accely: ax25_frame.payload.ax25_info.hmb_accely
  :field hmb_accelz: ax25_frame.payload.ax25_info.hmb_accelz
  :field hmb_temperature: ax25_frame.payload.ax25_info.hmb_temperature
  :field hmb_gyrox: ax25_frame.payload.ax25_info.hmb_gyrox
  :field hmb_gyroy: ax25_frame.payload.ax25_info.hmb_gyroy
  :field hmb_gyroz: ax25_frame.payload.ax25_info.hmb_gyroz
  :field hmb_magx: ax25_frame.payload.ax25_info.hmb_magx
  :field hmb_magy: ax25_frame.payload.ax25_info.hmb_magy
  :field hmb_magz: ax25_frame.payload.ax25_info.hmb_magz
  :field task_rst_status: ax25_frame.payload.ax25_info.task_rst_status
  :field task_antenna_deploy_status: ax25_frame.payload.ax25_info.task_antenna_deploy_status
  :field task_telemetry_gather_status: ax25_frame.payload.ax25_info.task_telemetry_gather_status
  :field task_image_capture_status: ax25_frame.payload.ax25_info.task_image_capture_status
  :field task_jpeg_status: ax25_frame.payload.ax25_info.task_jpeg_status
  :field task_com_receive_status: ax25_frame.payload.ax25_info.task_com_receive_status
  :field task_cmd_decoder_status: ax25_frame.payload.ax25_info.task_cmd_decoder_status
  :field task_bisonsat_cmd_decoder_status: ax25_frame.payload.ax25_info.task_bisonsat_cmd_decoder_status
  :field task_tranmit_image_status: ax25_frame.payload.ax25_info.task_tranmit_image_status
  :field cdh_wdt_events: ax25_frame.payload.ax25_info.cdh_wdt_events
  :field eps_status: ax25_frame.payload.ax25_info.eps_status

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
      - id: offset
        type: str
        encoding: ASCII
        size: 7
        doc: "Offset"

      - id: preamble
        type: str
        encoding: ASCII
        size: 3
        -orig-id: Preamble

      - id: call_sign
        type: str
        encoding: ASCII
        size: 6
        -orig-id: Call Sign

      - id: rtc_time_year
        type: u1
        -orig-id: RTC Time
        doc: "year"

      - id: rtc_time_month
        type: u1
        -orig-id: RTC Time
        doc: "month"

      - id: rtc_time_day
        type: u1
        -orig-id: RTC Time
        doc: "week"

      - id: rtc_time_hour
        type: u1
        -orig-id: RTC Time
        doc: "hour"

      - id: rtc_time_minutes
        type: u1
        -orig-id: RTC Time
        doc: "minutes"

      - id: rtc_time_seconds
        type: u1
        -orig-id: RTC Time
        doc: "seconds"

      - id: rtc_time_th
        type: u1
        -orig-id: RTC Time
        doc: "?"

      - id: os_ticks
        type: u4
        -orig-id: OSTicks

      - id: last_cmd_1
        type: u1
        -orig-id: Last Command Executed to Last Command Execute

      - id: last_cmd_2
        type: u1
        -orig-id: Last Command Executed to Last Command Execute

      - id: cmd_queue_length
        type: u1
        -orig-id: Command Queue Length

      - id: filename_jpeg
        type: str
        encoding: ASCII
        size: 8
        -orig-id: Filename of Last JPEG Image Written

      - id: filename_raw
        type: str
        encoding: ASCII
        size: 8
        -orig-id: Filename of Last RAW Image Written

      - id: cdh_reset_events
        type: u1
        -orig-id: cdhResetEvents

      - id: y_plus_current
        type: u2
        -orig-id: +Y Current
        doc: "-2.654438173 * value + 2122.714212"

      - id: y_plus_temperature
        type: u2
        -orig-id: +Y Temperature
        doc: "-0.163 * value + 110.338"

      - id: y_pair_voltage
        type: u2
        -orig-id: Y pair Voltage
        doc: "-0.02180794 * value + 25.20339005"

      - id: x_minus_current
        type: u2
        -orig-id: -X Current
        doc: "-2.622765877 * value + 2094.034732"

      - id: x_minus_temperature
        type: u2
        -orig-id: -X Temperature
        doc: "-0.163 * value + 110.338"

      - id: x_pair_voltage
        type: u2
        -orig-id: X pair Voltage
        doc: "-0.021605725 * value + 25.09558713"

      - id: x_plus_current
        type: u2
        -orig-id: +X Current
        doc: "-2.697517539 * value + 2153.457906"

      - id: x_plus_temperature
        type: u2
        -orig-id: +X Temperature
        doc: "-0.163 * value + 110.338"

      - id: z_pair_voltage
        type: u2
        -orig-id: Z pair Voltage
        doc: "-0.021569775 * value + 25.04472586"

      - id: z_plus__current
        type: u2
        -orig-id: +Z Current
        doc: "-2.393681523 * value + 1924.208701"

      - id: z_plus_temperature
        type: u2
        -orig-id: +Z Temperature
        doc: "-0.163 * value + 110.338"

      - id: y_minus_current
        type: u2
        -orig-id: -Y Current
        doc: "-2.704162537 * value + 2151.8444"

      - id: y_minus_temperature
        type: u2
        -orig-id: -Y Temperature
        doc: "-0.163 * valuet + 110.338"

      - id: battery_current
        type: u2
        -orig-id: Battery Current
        doc: "-5.439926976 * value + 4339.741671"

      - id: battery1_temperature
        type: u2
        -orig-id: BAT1 Temperature
        doc: "-0.325847181 * value + 131.6688244"

      - id: battery1_full_voltage
        type: u2
        -orig-id: BAT1 Full Voltage
        doc: "-0.013973418 * value + 10.53968"

      - id: battery1_current_direction
        type: u2
        -orig-id: BAT1 Current Direction
        doc: "High = Bat Charge"

      - id: battery1_current
        type: u2
        -orig-id: BAT1 Current
        doc: "-3.556289641 * value + 3057.8955"

      - id: battery0_temperature
        type: u2
        -orig-id: BAT0 Temperature
        doc: "-0.325847181 * value + 131.6688244"

      - id: battery0_full_voltage
        type: u2
        -orig-id: BAT0 Full Voltage
        doc: "-0.013623206 * value + 10.49099522"

      - id: bus_current_5v
        type: u2
        -orig-id: 5V Bus Current
        doc: "-7.088176451 * value + 5655.60727"

      - id: bus_current_3v3
        type: u2
        -orig-id: 3.3V Bus Current
        doc: "-5.636993603 * value + 4496.055437"

      - id: battery0_current_direction
        type: u2
        -orig-id: BAT0 Current Direction
        doc: "High = Bat Charge"

      - id: battery0_current
        type: u2
        -orig-id: BAT0 Current
        doc: "-3.70517192 * value + 3154.522264"

      - id: z_minus_temperature
        type: u2
        -orig-id: -Z Temperature
        doc: "-0.163 * value + 110.338"

      - id: z_minus_current
        type: u2
        -orig-id: -Z Current
        doc: "-2.514684983 * value + 1999.765277"

      - id: hmb_accelx
        type: u2
        -orig-id: hmb_accelxyz

      - id: hmb_accely
        type: u2
        -orig-id: hmb_accelxyz

      - id: hmb_accelz
        type: u2
        -orig-id: hmb_accelxyz

      - id: hmb_temperature
        type: u2
        -orig-id: hmb_temperature

      - id: hmb_gyrox
        type: u2
        -orig-id: hmb_gyroxyz

      - id: hmb_gyroy
        type: u2
        -orig-id: hmb_gyroxyz

      - id: hmb_gyroz
        type: u2
        -orig-id: hmb_gyroxyz

      - id: hmb_magx
        type: u2
        -orig-id: hmb_magxyz

      - id: hmb_magy
        type: u2
        -orig-id: hmb_magxyz

      - id: hmb_magz
        type: u2
        -orig-id: hmb_magxyz

      - id: task_rst_status
        type: u1
        -orig-id: task_Reset Status

      - id: task_antenna_deploy_status
        type: u1
        -orig-id: task_AntennaDeploy Status

      - id: task_telemetry_gather_status
        type: u1
        -orig-id: task_TelemetryGather Status

      - id: task_image_capture_status
        type: u1
        -orig-id: task_ImageCapture Status

      - id: task_jpeg_status
        type: u1
        -orig-id: task_jpeg Status

      - id: task_com_receive_status
        type: u1
        -orig-id: task_com_receive Status

      - id: task_cmd_decoder_status
        type: u1
        -orig-id: task_cmd_decoder Status

      - id: task_bisonsat_cmd_decoder_status
        type: u1
        -orig-id: task_bisonsat_cmd_decoder Status

      - id: task_tranmit_image_status
        type: u1
        -orig-id: task_transmit_image Status

      - id: cdh_wdt_events
        type: u1
        -orig-id: cdhWDTEvents

      - id: eps_status
        type: u2
        -orig-id: eps_status
        doc: "see ClydeSpace EPS User Manual table 11-2"
