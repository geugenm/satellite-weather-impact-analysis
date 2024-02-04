---
meta:
  id: bugsat1
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field uptime_s: ax25_frame.payload.ax25_info.beacon_type.uptime_s
  :field rtc_s: ax25_frame.payload.ax25_info.beacon_type.rtc_s
  :field reset_count: ax25_frame.payload.ax25_info.beacon_type.reset_count_be
  :field current_mode: ax25_frame.payload.ax25_info.beacon_type.current_mode
  :field last_boot_reason: ax25_frame.payload.ax25_info.beacon_type.last_boot_reason
  :field free: ax25_frame.payload.ax25_info.beacon_type.free
  :field last_seen_sequence_number: ax25_frame.payload.ax25_info.beacon_type.last_seen_sequence_number
  :field antenna_deploy_status: ax25_frame.payload.ax25_info.beacon_type.antenna_deploy_status
  :field low_voltage_counter: ax25_frame.payload.ax25_info.beacon_type.low_voltage_counter
  :field nice_battery_mv: ax25_frame.payload.ax25_info.beacon_type.nice_battery_mv
  :field raw_battery_mv: ax25_frame.payload.ax25_info.beacon_type.raw_battery_mv
  :field battery_amps: ax25_frame.payload.ax25_info.beacon_type.battery_amps
  :field pcm_3v3_v: ax25_frame.payload.ax25_info.beacon_type.pcm_3v3_v
  :field pcm_3v3_a: ax25_frame.payload.ax25_info.beacon_type.pcm_3v3_a
  :field pcm_5v_v: ax25_frame.payload.ax25_info.beacon_type.pcm_5v_v
  :field pcm_5v_a: ax25_frame.payload.ax25_info.beacon_type.pcm_5v_a
  :field cpu_c: ax25_frame.payload.ax25_info.beacon_type.cpu_c
  :field mirror_cell_c: ax25_frame.payload.ax25_info.beacon_type.mirror_cell_c
  :field mode: ax25_frame.payload.ax25_info.beacon_type.mode
  :field sun_vector_x: ax25_frame.payload.ax25_info.beacon_type.sun_vector_x
  :field sun_vector_y: ax25_frame.payload.ax25_info.beacon_type.sun_vector_y
  :field sun_vector_z: ax25_frame.payload.ax25_info.beacon_type.sun_vector_z
  :field magnetometer_x_mg: ax25_frame.payload.ax25_info.beacon_type.magnetometer_x_mg
  :field magnetometer_y_mg: ax25_frame.payload.ax25_info.beacon_type.magnetometer_y_mg
  :field magnetometer_z_mg: ax25_frame.payload.ax25_info.beacon_type.magnetometer_z_mg
  :field gyro_x_dps: ax25_frame.payload.ax25_info.beacon_type.gyro_x_dps
  :field gyro_y_dps: ax25_frame.payload.ax25_info.beacon_type.gyro_y_dps
  :field gyro_z_dps: ax25_frame.payload.ax25_info.beacon_type.gyro_z_dps
  :field temperature_imu_c: ax25_frame.payload.ax25_info.beacon_type.temperature_imu_c
  :field fine_gyro_x_dps: ax25_frame.payload.ax25_info.beacon_type.fine_gyro_x_dps
  :field fine_gyro_y_dps: ax25_frame.payload.ax25_info.beacon_type.fine_gyro_y_dps
  :field fine_gyro_z_dps: ax25_frame.payload.ax25_info.beacon_type.fine_gyro_z_dps
  :field wheel_1_radsec: ax25_frame.payload.ax25_info.beacon_type.wheel_1_radsec
  :field wheel_2_radsec: ax25_frame.payload.ax25_info.beacon_type.wheel_2_radsec
  :field wheel_3_radsec: ax25_frame.payload.ax25_info.beacon_type.wheel_3_radsec
  :field wheel_4_radsec: ax25_frame.payload.ax25_info.beacon_type.wheel_4_radsec
  :field experiments_run: ax25_frame.payload.ax25_info.beacon_type.experiments_run
  :field experiments_failed: ax25_frame.payload.ax25_info.beacon_type.experiments_failed
  :field last_experiment_run: ax25_frame.payload.ax25_info.beacon_type.last_experiment_run
  :field current_state: ax25_frame.payload.ax25_info.beacon_type.current_state
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
      - id: beacon_id0
        type: u1
      - id: beacon_id1
        contents: [0xff]
        if: beacon_id0 == 0xff
      - id: beacon_id2
        contents: [0xf0]
        if: beacon_id0 == 0xff
        doc: 'always 0xfffff0 for telemetry beacon, ":" is a message'
      - id: beacon_type
        type:
          switch-on: beacon_id0
          cases:
            0x3A: message
            _: telemetry

  telemetry:
    seq:
      - id: platform_id
        contents: [0x00, 0x01]
        doc: '0x0001 == PLATFORM telemetry identification'
      - id: uptime_s
        type: u4
        doc: 'uptime [s]'
      - id: rtc_s
        type: u4
        doc: 'seconds since 00:00 1/1/1970 UTC'
      - id: rstcnt_b
        type: u1
        repeat: expr
        repeat-expr: 3
      - id: current_mode
        type: u1
        doc: |
          current_mode & 0x7f is mode,
          current_mode & 0xb0 is computer (0 == B, 1 == A)'
      - id: last_boot_reason
        type: u4
      - id: mem_tlm_id
        contents: [0x01, 0x01]
        doc: '0x0101 == MEMORY telemetry identification'
      - id: free
        type: u4
        doc: 'heap free bytes'
      - id: cdh_id
        contents: [0x02, 0x01]
        doc: '0x0201 == CDH telemetry identification'
      - id: last_seen_sequence_number
        type: u4
      - id: antenna_deploy_status
        type: u1
      - id: pwr_tlm_id
        contents: [0x03, 0x01]
        doc: '0x0301 == POWER telemetry identification'
      - id: low_voltage_counter
        type: u2
      - id: nice_battery_mv
        type: u2
      - id: raw_battery_mv
        type: u2
      - id: battery_amps
        type: u2
        doc: 'value = battery_amps * 0.005237 [A]'
      - id: pcm_3v3_v
        type: u2
        doc: 'value = pcm_3v3_v * 0.003988 [V]'
      - id: pcm_3v3_a
        type: u2
        doc: 'value = pcm_3v3_a * 0.005237 [A]'
      - id: pcm_5v_v
        type: u2
        doc: 'value = pcm_5v_v * 0.005865 [V]'
      - id: pcm_5v_a
        type: u2
        doc: 'value = pcm_5v_a * 0.005237 [A]'
      - id: thermal_tlm_id
        contents: [0x04, 0x01]
        doc: '0x0401 == THERMAL telemetry identification'
      - id: cpu_c
        type: s2
        doc: 'value = cpu_c / 100.0 [degC]'
      - id: mirror_cell_c
        type: s2
        doc: 'value = mirror_cell_c / 100.0 [degC]'
      - id: aocs_tlm_id
        contents: [0x05, 0x01]
        doc: '0x0501 == AOCS telemetry identification'
      - id: mode
        type: u4
      - id: sun_vector_x
        type: s2
        doc: 'value = sun_vector_x / 16384.0 [#]'
      - id: sun_vector_y
        type: s2
        doc: 'value = sun_vector_y / 16384.0 [#]'
      - id: sun_vector_z
        type: s2
        doc: 'value = sun_vector_z / 16384.0 [#]'
      - id: magnetometer_x_mg
        type: s2
        doc: 'value = magnetometer_x_mg * 0.5 [mG]'
      - id: magnetometer_y_mg
        type: s2
        doc: 'value = magnetometer_y_mg * 0.5 [mG]'
      - id: magnetometer_z_mg
        type: s2
        doc: 'value = magnetometer_z_mg * 0.5 [mG]'
      - id: gyro_x_dps
        type: s2
        doc: 'value = gyro_x_dps * 0.0125 [#]'
      - id: gyro_y_dps
        type: s2
        doc: 'value = gyro_y_dps * 0.0125 [#]'
      - id: gyro_z_dps
        type: s2
        doc: 'value = gyro_z_dps * 0.0125 [#]'
      - id: temperature_imu_c
        type: s2
        doc: 'value = temperature_imu_c * 0.14 + 25 [degC]'
      - id: fine_gyro_x_dps
        type: s4
        doc: 'value = fine_gyro_x_dps * (256 / 6300.0) / 65536 [#]'
      - id: fine_gyro_y_dps
        type: s4
        doc: 'value = fine_gyro_y_dps * (256 / 6300.0) / 65536 [#]'
      - id: fine_gyro_z_dps
        type: s4
        doc: 'value = fine_gyro_z_dps * (256 / 6300.0) / 65536 [#]'
      - id: wheel_1_radsec
        type: s2
        doc: 'value = wheel_1_radsec * 0.3 [radsec]'
      - id: wheel_2_radsec
        type: s2
        doc: 'value = wheel_2_radsec * 0.3 [radsec]'
      - id: wheel_3_radsec
        type: s2
        doc: 'value = wheel_3_radsec * 0.3 [radsec]'
      - id: wheel_4_radsec
        type: s2
        doc: 'value = wheel_4_radsec * 0.3 [radsec]'
      - id: payload_tlm_id
        contents: [0x06, 0x01]
        doc: '0x0601 == PAYLOAD telemetry identification'
      - id: experiments_run
        type: u2
      - id: experiments_failed
        type: u2
      - id: last_experiment_run
        type: s2
      - id: current_state
        type: u1
    instances:
      reset_count_be:
        value: '(rstcnt_b[0] << 16) | (rstcnt_b[1] << 8) | rstcnt_b[2]'

  message:
    seq:
      - id: message
        type: str
        encoding: utf-8
        size-eos: true
