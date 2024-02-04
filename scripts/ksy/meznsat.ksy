---
meta:
  id: meznsat
  title: MeznSat decoder struct
  endian: le
doc-ref: ''
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field frame_length: frame_length
  :field callsign: ax25_frame.payload.ax25_info.beacon_type.callsign
  :field satellite_mode: ax25_frame.payload.ax25_info.beacon_type.satellite_mode
  :field day_of_month: ax25_frame.payload.ax25_info.beacon_type.day_of_month
  :field day_of_week: ax25_frame.payload.ax25_info.beacon_type.day_of_week
  :field hour: ax25_frame.payload.ax25_info.beacon_type.hour
  :field minute: ax25_frame.payload.ax25_info.beacon_type.minute
  :field sec: ax25_frame.payload.ax25_info.beacon_type.sec
  :field obc_reset_count: ax25_frame.payload.ax25_info.beacon_type.obc_reset_count
  :field obc_temp: ax25_frame.payload.ax25_info.beacon_type.obc_temp
  :field vbatt: ax25_frame.payload.ax25_info.beacon_type.vbatt
  :field sys_current: ax25_frame.payload.ax25_info.beacon_type.sys_current
  :field batt_temp: ax25_frame.payload.ax25_info.beacon_type.batt_temp
  :field ext_batt1_temp: ax25_frame.payload.ax25_info.beacon_type.ext_batt1_temp
  :field ext_batt2_temp: ax25_frame.payload.ax25_info.beacon_type.ext_batt2_temp
  :field eps_reboots: ax25_frame.payload.ax25_info.beacon_type.eps_reboots
  :field receiver_current: ax25_frame.payload.ax25_info.beacon_type.receiver_current
  :field transmitter_current: ax25_frame.payload.ax25_info.beacon_type.transmitter_current
  :field pa_temp: ax25_frame.payload.ax25_info.beacon_type.pa_temp
  :field pa_current: ax25_frame.payload.ax25_info.beacon_type.pa_current
  :field adcs_run_mode: ax25_frame.payload.ax25_info.beacon_type.adcs_run_mode
  :field estimated_x_angular_rate: ax25_frame.payload.ax25_info.beacon_type.estimated_x_angular_rate
  :field estimated_y_angular_rate: ax25_frame.payload.ax25_info.beacon_type.estimated_y_angular_rate
  :field estimated_z_angular_rate: ax25_frame.payload.ax25_info.beacon_type.estimated_z_angular_rate
  :field estimated_q1: ax25_frame.payload.ax25_info.beacon_type.estimated_q1
  :field estimated_q2: ax25_frame.payload.ax25_info.beacon_type.estimated_q2
  :field estimated_q3: ax25_frame.payload.ax25_info.beacon_type.estimated_q3
  :field ant_temp: ax25_frame.payload.ax25_info.beacon_type.ant_temp
  :field minus_z_temp: ax25_frame.payload.ax25_info.beacon_type.minus_z_temp
  :field plus_z_temp: ax25_frame.payload.ax25_info.beacon_type.plus_z_temp
  :field minus_y_temp: ax25_frame.payload.ax25_info.beacon_type.minus_y_temp
  :field plus_y_temp: ax25_frame.payload.ax25_info.beacon_type.plus_y_temp
  :field minus_x_temp: ax25_frame.payload.ax25_info.beacon_type.minus_x_temp
  :field plus_x_temp: ax25_frame.payload.ax25_info.beacon_type.plus_x_temp
  :field message: ax25_frame.payload.ax25_info.beacon_type.message

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
          switch-on: _parent.ax25_header.src_callsign_raw.callsign_ror.callsign
          cases:
            '"A68MZ "': meznsat_payload
        size-eos: true
  meznsat_payload:
    seq:
      - id: beacon_type
        type:
          switch-on: _io.size
          cases:
            78: meznsat_tlm
            _: meznsat_generic_packet
  meznsat_tlm:
    seq:
      - id: callsign
        -orig-id: Callsign
        type: str
        encoding: utf-8
        size: 7
      - id: satellite_mode
        -orig-id: Satellite mode
        type: u1
        doc: |
          value = satellite_mode [n]
          1: Initial checkout mode
          2: Normal mode
          3: Ground contact mode
          4: Payload mode
          5: Safe mode
      - id: day_of_month
        -orig-id: Day of month
        type: u1
        doc: 'value = day_of_month'
      - id: day_of_week
        -orig-id: Day of week
        type: u1
        doc: |
          value = day_of_week [n]
          1: Sunday
          2: Monday
          3: Tuesday
          4: Wednesday
          5: Thursday
          6: Friday
          7: Saturday
      - id: hour
        -orig-id: Hour
        type: u1
        doc: 'value = hour'
      - id: minute
        -orig-id: Minute
        type: u1
        doc: 'value = minute'
      - id: sec
        -orig-id: Second
        type: u1
        doc: 'value = sec [sec]'
      - id: obc_reset_count
        -orig-id: OBC reset count
        type: u4
        doc: 'value = obc_reset_count [n]'
      - id: obc_temp
        -orig-id: OBC temperature
        type: s2
        doc: 'value = obc_temp [oC]'
      - id: vbatt
        -orig-id: Battery voltage
        type: u2
        doc: 'value = vbatt [mV]'
      - id: sys_current
        -orig-id: Total system current
        type: u2
        doc: 'value = sys_current [mA]'
      - id: batt_temp
        -orig-id: Temperature of EPS battery
        type: s2
        doc: 'value = batt_temp [oC]'
      - id: ext_batt1_temp
        -orig-id: External board battery 1 temperature
        type: s2
        doc: 'value = ext_batt1_temp [oC]'
      - id: ext_batt2_temp
        -orig-id: External board battery 2 temperature
        type: s2
        doc: 'value = ext_batt2_temp [oC]'
      - id: eps_reboots
        -orig-id: Number of EPS reboots
        type: u2
        doc: 'value = eps_reboots [n]'
      - id: receiver_current
        -orig-id: Receiver current
        type: u2
        doc: 'value = receiver_current * 0.16643964 [mA]'
      - id: transmitter_current
        -orig-id: Transmitter current
        type: u2
        doc: 'value = transmitter_current * 0.16643964 [mA]'
      - id: pa_temp
        -orig-id: PA temperature
        type: s2
        doc: 'value = (pa_temp * -0.07669) + 195.6037 [oC]'
      - id: pa_current
        -orig-id: PA current
        type: u2
        doc: 'value = pa_current * 0.16643964 [mA]'
      - id: adcs_run_mode
        -orig-id: ADCS Run mode
        type: u1
        doc: |
          value = adcs_run_mode [n]
          0: Disabled
          1: Enabled
          _: N/A
      - id: estimated_x_angular_rate
        -orig-id: Estimated X Angular Rate
        type: s2
        doc: 'value = estimated_x_angular_rate * 0.01  [deg/s]'
      - id: estimated_y_angular_rate
        -orig-id: Estimated Y Angular Rate
        type: s2
        doc: 'value = estimated_y_angular_rate * 0.01  [deg/s]'
      - id: estimated_z_angular_rate
        -orig-id: Estimated Z Angular Rate
        type: s2
        doc: 'value = estimated_z_angular_rate * 0.01  [deg/s]'
      - id: estimated_q1
        -orig-id: Estimated Quaternion 1
        type: u2
        doc: 'value = estimated_q1'
      - id: estimated_q2
        -orig-id: Estimated Quaternion 2
        type: u2
        doc: 'value = estimated_q2'
      - id: estimated_q3
        -orig-id: Estimated Quaternion 3
        type: u2
        doc: 'value = estimated_q3'
      - id: ant_temp
        -orig-id: Antenna temperature
        type: s2
        doc: 'value = (ant_temp * -0.2922) + 190.65 [oC]'
      - id: minus_z_temp
        -orig-id: -Z Solar panel temperature
        type: s4
        doc: 'value = minus_z_temp / 1024 [oC]'
      - id: plus_z_temp
        -orig-id: +Z Solar panel temperature
        type: s4
        doc: 'value = plus_z_temp / 1024 [oC]'
      - id: minus_y_temp
        -orig-id: -Y Solar panel temperature
        type: s4
        doc: 'value = minus_y_temp / 1024 [oC]'
      - id: plus_y_temp
        -orig-id: +Y Solar panel temperature
        type: s4
        doc: 'value = plus_y_temp / 1024 [oC]'
      - id: minus_x_temp
        -orig-id: -X Solar panel temperature
        type: s4
        doc: 'value = minus_x_temp / 1024 [oC]'
      - id: plus_x_temp
        -orig-id: +X Solar panel temperature
        type: s4
        doc: 'value = plus_x_temp / 1024 [oC]'
  meznsat_generic_packet:
    seq:
      - id: message
        type: str
        encoding: utf-8
        size-eos: true
instances:
  frame_length:
    value: _io.size
