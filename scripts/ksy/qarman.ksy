---
meta:
  id: qarman
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field ssid_mask: ax25_frame.ax25_header.dest_ssid_raw.ssid_mask
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field ssid_mask: ax25_frame.ax25_header.src_ssid_raw.ssid_mask
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field battery_voltage: ax25_frame.payload.data_payload.mode.eps_payload.battery_voltage
  :field temperature_obc: ax25_frame.payload.data_payload.mode.eps_payload.temperature_obc
  :field battery_current: ax25_frame.payload.data_payload.mode.eps_payload.battery_current
  :field reg_bus_3v3_current: ax25_frame.payload.data_payload.mode.eps_payload.reg_bus_3v3_current
  :field reg_bus_5v0_current: ax25_frame.payload.data_payload.mode.eps_payload.reg_bus_5v0_current
  :field temperature_uhf: ax25_frame.payload.data_payload.mode.eps_payload.temperature_uhf
  :field obc_mode: ax25_frame.payload.data_payload.mode.eps_payload.obc_mode
  :field reason_for_mode_change: ax25_frame.payload.data_payload.mode.eps_payload.reason_for_mode_change
  :field obc_uptime: ax25_frame.payload.data_payload.mode.eps_payload.obc_uptime
  :field obc_boot_counter: ax25_frame.payload.data_payload.mode.eps_payload.obc_boot_counter
  :field obc_packet_counter: ax25_frame.payload.data_payload.mode.eps_payload.obc_packet_counter
  :field obc_tc_frm_received: ax25_frame.payload.data_payload.mode.eps_payload.obc_tc_frm_received
  :field obc_tc_valid: ax25_frame.payload.data_payload.mode.eps_payload.obc_tc_valid
  :field systems_on: ax25_frame.payload.data_payload.mode.eps_payload.systems_on
  :field deployable_status: ax25_frame.payload.data_payload.mode.eps_payload.deployable_status
  :field solar_panel_current_posxi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posxi
  :field solar_panel_current_posxo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posxo
  :field solar_panel_current_negyi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negyi
  :field solar_panel_current_negyo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negyo
  :field solar_panel_current_negxi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negxi
  :field solar_panel_current_negxo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negxo
  :field solar_panel_current_posyi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posyi
  :field solar_panel_current_posyo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posyo
  :field solar_panel_voltage_posx: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_posx
  :field solar_panel_voltage_negy: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_negy
  :field solar_panel_voltage_negx: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_negx
  :field solar_panel_voltage_posy: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_posy
  :field battery_voltage: ax25_frame.payload.data_payload.mode.eps_payload.battery_voltage
  :field temperature_obc: ax25_frame.payload.data_payload.mode.eps_payload.temperature_obc
  :field battery_current: ax25_frame.payload.data_payload.mode.eps_payload.battery_current
  :field reg_bus_3v3_current: ax25_frame.payload.data_payload.mode.eps_payload.reg_bus_3v3_current
  :field reg_bus_5v0_current: ax25_frame.payload.data_payload.mode.eps_payload.reg_bus_5v0_current
  :field temperature_uhf: ax25_frame.payload.data_payload.mode.eps_payload.temperature_uhf
  :field obc_mode: ax25_frame.payload.data_payload.mode.eps_payload.obc_mode
  :field reason_for_mode_change: ax25_frame.payload.data_payload.mode.eps_payload.reason_for_mode_change
  :field obc_uptime: ax25_frame.payload.data_payload.mode.eps_payload.obc_uptime
  :field obc_boot_counter: ax25_frame.payload.data_payload.mode.eps_payload.obc_boot_counter
  :field obc_packet_counter: ax25_frame.payload.data_payload.mode.eps_payload.obc_packet_counter
  :field obc_tc_frm_received: ax25_frame.payload.data_payload.mode.eps_payload.obc_tc_frm_received
  :field obc_tc_valid: ax25_frame.payload.data_payload.mode.eps_payload.obc_tc_valid
  :field systems_on: ax25_frame.payload.data_payload.mode.eps_payload.systems_on
  :field deployable_status: ax25_frame.payload.data_payload.mode.eps_payload.deployable_status
  :field solar_panel_current_posxi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posxi
  :field solar_panel_current_posxo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posxo
  :field solar_panel_current_negyi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negyi
  :field solar_panel_current_negyo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negyo
  :field solar_panel_current_negxi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negxi
  :field solar_panel_current_negxo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_negxo
  :field solar_panel_current_posyi: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posyi
  :field solar_panel_current_posyo: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_current_posyo
  :field solar_panel_voltage_posx: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_posx
  :field solar_panel_voltage_negy: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_negy
  :field solar_panel_voltage_negx: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_negx
  :field solar_panel_voltage_posy: ax25_frame.payload.data_payload.mode.eps_payload.solar_panel_voltage_posy
  :field adcs_state: ax25_frame.payload.data_payload.mode.adcs_payload.adcs_state
  :field attitude_estimation_mode: ax25_frame.payload.data_payload.mode.adcs_payload.attitude_estimation_mode
  :field control_mode: ax25_frame.payload.data_payload.mode.adcs_payload.control_mode
  :field cube_control_3v3_current: ax25_frame.payload.data_payload.mode.adcs_payload.cube_control_3v3_current
  :field cube_control_5v_current: ax25_frame.payload.data_payload.mode.adcs_payload.cube_control_5v_current
  :field cube_control_vbat_current: ax25_frame.payload.data_payload.mode.adcs_payload.cube_control_vbat_current
  :field magnetorquer_current: ax25_frame.payload.data_payload.mode.adcs_payload.magnetorquer_current
  :field momentum_wheel_current: ax25_frame.payload.data_payload.mode.adcs_payload.momentum_wheel_current
  :field magnetic_field_x: ax25_frame.payload.data_payload.mode.adcs_payload.magnetic_field_x
  :field magnetic_field_y: ax25_frame.payload.data_payload.mode.adcs_payload.magnetic_field_y
  :field magnetic_field_z: ax25_frame.payload.data_payload.mode.adcs_payload.magnetic_field_z
  :field y_angular_rate: ax25_frame.payload.data_payload.mode.adcs_payload.y_angular_rate
  :field y_wheel_speed: ax25_frame.payload.data_payload.mode.adcs_payload.y_wheel_speed
  :field estimated_roll_angle: ax25_frame.payload.data_payload.mode.adcs_payload.estimated_roll_angle
  :field estimated_pitch_angle: ax25_frame.payload.data_payload.mode.adcs_payload.estimated_pitch_angle
  :field estimated_yaw_angle: ax25_frame.payload.data_payload.mode.adcs_payload.estimated_yaw_angle
  :field estimated_x_angular_rate: ax25_frame.payload.data_payload.mode.adcs_payload.estimated_x_angular_rate
  :field estimated_y_angular_rate: ax25_frame.payload.data_payload.mode.adcs_payload.estimated_y_angular_rate
  :field estimated_z_angular_rate: ax25_frame.payload.data_payload.mode.adcs_payload.estimated_z_angular_rate
  :field temperature_adcs_arm_cpu: ax25_frame.payload.data_payload.mode.adcs_payload.temperature_adcs_arm_cpu
  :field padding: ax25_frame.payload.data_payload.mode.adcs_payload.padding

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
instances:
  framelength:
    value: '_io.size'
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
            '"ON05BE"': qarman_payload_t  # QARMAN
  qarman_payload_t:
    seq:
      - id: mode
        type:
          switch-on: _root.framelength
          cases:
            55: lp_beacon_t
            90: full_beacon_t
  lp_beacon_t:
    seq:
      - id: eps_payload
        type: eps_payload_t
  full_beacon_t:
    seq:
      - id: eps_payload
        type: eps_payload_t
      - id: adcs_payload
        type: adcs_payload_t
  eps_payload_t:
    seq:
      - id: battery_voltage
        type: b12
        doc: "x = value / 4096 * 3.3 * 3.133 [V]"
      - id: temperature_obc
        type: b12
        doc: "x = (value - 2133) * 55 / 371 + 30 [degC]"
      - id: battery_current
        type: b10
        doc: 'x = value * 5.4311 + 4636.0085 [A]'
      - id: reg_bus_3v3_current
        type: b10
        doc: 'x = value * 5.4311 + 4636.0085 [A]'
      - id: reg_bus_5v0_current
        type: b10
        doc: 'x = value * 5.4311 + 4636.0085 [A]'
      - id: temperature_uhf
        type: b16
        doc: 'x = value  [degC]'
      - id: obc_mode
        type: b4
        doc: |
          0 = initialisation,
          1 = deployment,
          2 = Phase 0,
          3 = Phase 1,
          4 = Phase 2,
          5 = Low Power Mode,
          6 = Phase 3,
          7 = Phase 4,
          8 = safe mode
      - id: reason_for_mode_change
        type: b3
        doc: |
          0 = system reset,
          1 = command,
          2 = Timeout,
          3 = Under-voltage,
          4 = Accelerometer,
          5 = IMU,
          6 = GPS,
          7 = Thermocouple
      - id: obc_uptime
        type: b32
        doc: 'x = value [s]'
      - id: obc_boot_counter
        type: b8
        doc: 'x = value [#]'
      - id: obc_packet_counter
        type: b16
        doc: 'x = value [#]'
      - id: obc_tc_frm_received
        type: b8
        doc: 'x = value [#]'
      - id: obc_tc_valid
        type: b8
        doc: 'x = value [#]'
      - id: systems_on
        type: b26
        doc: |
          Bit  0: Platform I2C,
          Bit  1: Platform interfacing,
          Bit  2: UHF,
          Bit  3: GPS,
          Bit  4: ADCS,
          Bit  5: IMU,
          Bit  6: Pressure sensor,
          Bit  7: UHF communications,
          Bit  8: GPS communications,
          Bit  9: XPL,
          Bit 10: AeroSDS 3.3V,
          Bit 11: AeroSDS 5V,
          Bit 12: Iridium 3.3V,
          Bit 13: Iridium 27V,
          Bit 14: UlG,
          Bit 15: EGSE,
          Bit 16: EGSE 1 communications,
          Bit 17: EGSE 2 communications,
          Bit 18: XPL power good,
          Bit 19: AeroSDS 3.3V power good,
          Bit 20: AeroSDS 5V power good,
          Bit 21: UHF1,
          Bit 22: IMU data ready,
          Bit 23: Accelerometer data ready,
          Bit 24: Iridium CTS,
          Bit 25: Iridium DCD
      - id: deployable_status
        type: b13
        doc: |
          Bit  0: -Y antenna,
          Bit  1: -X antenna,
          Bit  2: +Y antenna,
          Bit  3: +X antenna,
          Bit  4: deployment enable,
          Bit  5: +X panel,
          Bit  6: +Y panel,
          Bit  7: -Y panel,
          Bit  8: -X panel,
          Bit  9: +X panel being released,
          Bit 10: +Y panel being released,
          Bit 11: -Y panel being released,
          Bit 12: -X panel being released
      - id: solar_panel_current_posxi
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_current_posxo
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_current_negyi
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_current_negyo
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_current_negxi
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_current_negxo
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_current_posyi
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_current_posyo
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [mA]'
      - id: solar_panel_voltage_posx
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [V]'
      - id: solar_panel_voltage_negy
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [V]'
      - id: solar_panel_voltage_negx
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [V]'
      - id: solar_panel_voltage_posy
        type: b10
        doc: 'x = value * 0.5431 + 528.5093 [V]'
  adcs_payload_t:
    seq:
      - id: adcs_state
        type: b2
        doc: |
          0 = disabled,
          1 = enabled,
          2 = triggered
      - id: attitude_estimation_mode
        type: b3
        doc: |
          0 = no attitude estimation,
          1 = MEMS rate sensing,
          2 = Magnetometer rate filter,
          3 = magnetometer rate filter with pitch estimation,
          4 = full-state EKF,
          5 = magnetometer and fine sun TRIAD algorithm
      - id: control_mode
        type: b3
        doc: |
          0 = no control,
          2 = detumbling control,
          3 = Y-momentum stabilized - Initial pitch acquisition,
          4 = Y-momentum stabilized - steady state
      - id: cube_control_3v3_current
        type: b16
        doc: 'x = value * 0.48828125 [mA]'
      - id: cube_control_5v_current
        type: b16
        doc: 'x = value * 0.48828125 [mA]'
      - id: cube_control_vbat_current
        type: b16
        doc: 'x = value * 0.48828125 [mA]'
      - id: magnetorquer_current
        type: b16
        doc: 'x = vlaue * 0.1 [mA]'
      - id: momentum_wheel_current
        type: b16
        doc: 'x = vlaue * 0.01 [mA]'
      - id: magnetic_field_x
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 10 / 1000 [nT]'
      - id: magnetic_field_y
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 10 / 1000 [nT]'
      - id: magnetic_field_z
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 10 / 1000 [nT]'
      - id: y_angular_rate
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 0.01 [deg/s]'
      - id: y_wheel_speed
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) [rpm]'
      - id: estimated_roll_angle
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 0.01 [deg]'
      - id: estimated_pitch_angle
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 0.01 [deg]'
      - id: estimated_yaw_angle
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 0.01 [deg]'
      - id: estimated_x_angular_rate
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 0.01 [deg/s]'
      - id: estimated_y_angular_rate
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 0.01 [deg/s]'
      - id: estimated_z_angular_rate
        type: b16
        doc: 'x = (MOD(value + 2^15, 2^16) - 2^15) * 0.01 [deg/s]'
      - id: temperature_adcs_arm_cpu
        type: b16
        doc: 'x = value [degC]'
      - id: padding
        type: b4
