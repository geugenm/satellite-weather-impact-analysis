---
meta:
  id: armadillo
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field time_since_epoch: ax25_frame.payload.data_payload.time_since_epoch
  :field uptime: ax25_frame.payload.data_payload.uptime
  :field avail_nvmem: ax25_frame.payload.data_payload.avail_nvmem
  :field pos_x: ax25_frame.payload.data_payload.pos_x
  :field pos_y: ax25_frame.payload.data_payload.pos_y
  :field pos_z: ax25_frame.payload.data_payload.pos_z
  :field vel_x: ax25_frame.payload.data_payload.vel_x
  :field vel_y: ax25_frame.payload.data_payload.vel_y
  :field vel_z: ax25_frame.payload.data_payload.vel_z
  :field pwr_states_reserved: ax25_frame.payload.data_payload.pwr_states_reserved
  :field gps_power: ax25_frame.payload.data_payload.gps_power
  :field adc_power: ax25_frame.payload.data_payload.adc_power
  :field antenna_power: ax25_frame.payload.data_payload.antenna_power
  :field pdd_power: ax25_frame.payload.data_payload.pdd_power
  :field spacecraft_mode: ax25_frame.payload.data_payload.spacecraft_mode
  :field vbatt: ax25_frame.payload.data_payload.vbatt
  :field input_current: ax25_frame.payload.data_payload.input_current
  :field output_current: ax25_frame.payload.data_payload.output_current
  :field boot_count: ax25_frame.payload.data_payload.boot_count
  :field boot_cause: ax25_frame.payload.data_payload.boot_cause
  :field eps_temp_1: ax25_frame.payload.data_payload.eps_temp_1
  :field eps_temp_2: ax25_frame.payload.data_payload.eps_temp_2
  :field eps_temp_3: ax25_frame.payload.data_payload.eps_temp_3
  :field eps_temp_4: ax25_frame.payload.data_payload.eps_temp_4
  :field eps_bp4a: ax25_frame.payload.data_payload.eps_bp4a
  :field eps_bp4b: ax25_frame.payload.data_payload.eps_bp4b
  :field eps_output_1_current: ax25_frame.payload.data_payload.eps_output_1_current
  :field eps_output_2_current: ax25_frame.payload.data_payload.eps_output_2_current
  :field eps_output_3_current: ax25_frame.payload.data_payload.eps_output_3_current
  :field eps_output_4_current: ax25_frame.payload.data_payload.eps_output_4_current
  :field eps_output_5_current: ax25_frame.payload.data_payload.eps_output_5_current
  :field eps_output_6_current: ax25_frame.payload.data_payload.eps_output_6_current
  :field rxwl_temp_x: ax25_frame.payload.data_payload.rxwl_temp_x
  :field rxwl_temp_y: ax25_frame.payload.data_payload.rxwl_temp_y
  :field rxwl_temp_z: ax25_frame.payload.data_payload.rxwl_temp_z
  :field gyro_temp_x: ax25_frame.payload.data_payload.gyro_temp_x
  :field gyro_temp_y: ax25_frame.payload.data_payload.gyro_temp_y
  :field gyro_temp_z: ax25_frame.payload.data_payload.gyro_temp_z
  :field desired_quaternion_a: ax25_frame.payload.data_payload.desired_quaternion_a
  :field desired_quaternion_b: ax25_frame.payload.data_payload.desired_quaternion_b
  :field desired_quaternion_c: ax25_frame.payload.data_payload.desired_quaternion_c
  :field desired_quaternion_d: ax25_frame.payload.data_payload.desired_quaternion_d
  :field estimated_quaternion_a: ax25_frame.payload.data_payload.estimated_quaternion_a
  :field estimated_quaternion_b: ax25_frame.payload.data_payload.estimated_quaternion_b
  :field estimated_quaternion_c: ax25_frame.payload.data_payload.estimated_quaternion_c
  :field estimated_quaternion_d: ax25_frame.payload.data_payload.estimated_quaternion_d
  :field rotation_rate_x: ax25_frame.payload.data_payload.rotation_rate_x
  :field rotation_rate_y: ax25_frame.payload.data_payload.rotation_rate_y
  :field rotation_rate_z: ax25_frame.payload.data_payload.rotation_rate_z
  :field sun_sensor_address: ax25_frame.payload.data_payload.sun_sensor_address
  :field message: ax25_frame.payload.data_payload.message


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
      - id: data_payload
        type:
          switch-on: _parent.ax25_header.src_callsign_raw.callsign_ror.callsign
          cases:
            '"KE5DTW"': armadillo_payload  # ARMADILLO
  armadillo_payload:
    seq:
      - id: pb_magic
        size: 5
      - id: time_since_epoch
        type: u4
        doc: 'Spacecraft time of day'
      - id: uptime
        type: u4
        doc: 'Time since last reboot'
      - id: avail_nvmem
        type: u4
        doc: 'Available free non-volatile memory, in bytes'
      - id: pos_x
        type: f4
        doc: 'Spacecraft position X-coordinate'
      - id: pos_y
        type: f4
        doc: 'Spacecraft position Y-coordinate'
      - id: pos_z
        type: f4
        doc: 'Spacecraft position Z-coordinate'
      - id: vel_x
        type: f4
        doc: 'Spacecraft velocity X-coordinate'
      - id: vel_y
        type: f4
        doc: 'Spacecraft velocity Y-coordinate'
      - id: vel_z
        type: f4
        doc: 'Spacecraft velocity Z-coordinate'
      - id: pwr_states_reserved
        type: b3
        doc: 'Reserved bits'
      - id: gps_power
        type: b1
        doc: 'GPS power state'
      - id: adc_power
        type: b1
        doc: 'Attitude determination and control module power state'
      - id: antenna_power
        type: b1
        doc: 'Antenna power state'
      - id: pdd_power
        type: b1
        doc: 'Piezo-dust detector instrument power state'
      - id: spacecraft_mode
        type: b1
        doc: 'Spacecraft power mode 0-nominal 1-low-power'
      - id: vbatt
        type: u2
        doc: 'Spacecraft battery voltage in millivolts'
      - id: input_current
        type: u2
        doc: 'Spacecraft Input Current in milliamps'
      - id: output_current
        type: u2
        doc: 'Spacecraft Output Current in milliamps'
      - id: boot_count
        type: u4
        doc: 'Spacecraft boot count'
      - id: boot_cause
        type: u1
        doc: 'Cause of last reset'
      - id: eps_temp_1
        type: s2
        doc: 'EPS Temperature sensor 1'
      - id: eps_temp_2
        type: s2
        doc: 'EPS Temperature sensor 2'
      - id: eps_temp_3
        type: s2
        doc: 'EPS Temperature sensor 3'
      - id: eps_temp_4
        type: s2
        doc: 'EPS Temperature sensor 4'
      - id: eps_bp4a
        type: s2
        doc: 'EPS Temperature sensor BP4a'
      - id: eps_bp4b
        type: s2
        doc: 'EPS Temperature sensor BP4b'
      - id: eps_output_1_current
        type: u2
        doc: 'EPS Output 1 current in milliamps'
      - id: eps_output_2_current
        type: u2
        doc: 'EPS Output 2 current in milliamps'
      - id: eps_output_3_current
        type: u2
        doc: 'EPS Output 3 current in milliamps'
      - id: eps_output_4_current
        type: u2
        doc: 'EPS Output 4 current in milliamps'
      - id: eps_output_5_current
        type: u2
        doc: 'EPS Output 5 current in milliamps'
      - id: eps_output_6_current
        type: u2
        doc: 'EPS Output 6 current in milliamps'
      - id: rxwl_temp_x
        type: f4
        doc: 'Reaction wheel X temperature'
      - id: rxwl_temp_y
        type: f4
        doc: 'Reaction wheel Y temperature'
      - id: rxwl_temp_z
        type: f4
        doc: 'Reaction wheel Z temperature'
      - id: gyro_temp_x
        type: f4
        doc: 'Gyroscope X temperature'
      - id: gyro_temp_y
        type: f4
        doc: 'Gyroscope Y temperature'
      - id: gyro_temp_z
        type: f4
        doc: 'Gyroscope Z temperature'
      - id: desired_quaternion_a
        type: f4
        doc: 'Desired quaternion A'
      - id: desired_quaternion_b
        type: f4
        doc: 'Desired quaternion B'
      - id: desired_quaternion_c
        type: f4
        doc: 'Desired quaternion C'
      - id: desired_quaternion_d
        type: f4
        doc: 'Desired quaternion D'
      - id: estimated_quaternion_a
        type: f4
        doc: 'Estimated quaternion A'
      - id: estimated_quaternion_b
        type: f4
        doc: 'Estimated quaternion B'
      - id: estimated_quaternion_c
        type: f4
        doc: 'Estimated quaternion C'
      - id: estimated_quaternion_d
        type: f4
        doc: 'Estimated quaternion D'
      - id: rotation_rate_x
        type: f4
        doc: 'Rotation rate X, in radians per second'
      - id: rotation_rate_y
        type: f4
        doc: 'Rotation rate Y, in radians per second'
      - id: rotation_rate_z
        type: f4
        doc: 'Rotation rate Z, in radians per second'
      - id: sun_sensor_address
        type: u1
        doc: 'Sun sensor that last sensed the sun'
      - id: message
        type: strz
        size: 110
        encoding: ASCII
enums:
  boot_causes:
    0: unknown_reset
    1: dedicated_wdt_reset
    2: i2c_wdt_reset
    3: hard_reset
    4: soft_reset
    5: stack_overflow
    6: timer_overflow
    7: brownout_or_power_on_reset
    8: internal_wdt_reset
