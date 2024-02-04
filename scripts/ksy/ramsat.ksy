---
meta:
  id: ramsat
  endian: be
  encoding: ASCII
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field prefix: ax25_frame.payload.payload.prefix
  :field beacon_timestamp: ax25_frame.payload.payload.beacon_timestamp
  :field battery_voltage: ax25_frame.payload.payload.battery_voltage
  :field battery_current_magnitude: ax25_frame.payload.payload.battery_current_magnitude
  :field battery_is_charging: ax25_frame.payload.payload.battery_is_charging
  :field voltage_feeding_bcr1_x: ax25_frame.payload.payload.voltage_feeding_bcr1_x
  :field current_bcr1_neg_x: ax25_frame.payload.payload.current_bcr1_neg_x
  :field current_bcr1_pos_x: ax25_frame.payload.payload.current_bcr1_pos_x
  :field voltage_feeding_bcr2_y: ax25_frame.payload.payload.voltage_feeding_bcr2_y
  :field current_bcr1_neg_y: ax25_frame.payload.payload.current_bcr1_neg_y
  :field current_bcr1_pos_y: ax25_frame.payload.payload.current_bcr1_pos_y
  :field voltage_feeding_bcr3_z: ax25_frame.payload.payload.voltage_feeding_bcr3_z
  :field current_bcr1_neg_z: ax25_frame.payload.payload.current_bcr1_neg_z
  :field bcr_output_voltage: ax25_frame.payload.payload.bcr_output_voltage
  :field bcr_output_current: ax25_frame.payload.payload.bcr_output_current
  :field battery_bus_voltage: ax25_frame.payload.payload.battery_bus_voltage
  :field battery_bus_current: ax25_frame.payload.payload.battery_bus_current
  :field low_v_bus_voltage: ax25_frame.payload.payload.low_v_bus_voltage
  :field low_v_bus_current: ax25_frame.payload.payload.low_v_bus_current
  :field high_v_bus_voltage: ax25_frame.payload.payload.high_v_bus_voltage
  :field high_v_bus_current: ax25_frame.payload.payload.high_v_bus_current
  :field temperature_eps: ax25_frame.payload.payload.temperature_eps
  :field temperature_battery_motherboard: ax25_frame.payload.payload.temperature_battery_motherboard
  :field temperature_battery_daughterboard: ax25_frame.payload.payload.temperature_battery_daughterboard
  :field temperature_pos_x_array: ax25_frame.payload.payload.temperature_pos_x_array
  :field temperature_neg_x_array: ax25_frame.payload.payload.temperature_neg_x_array
  :field temperature_pos_y_array: ax25_frame.payload.payload.temperature_pos_y_array
  :field temperature_neg_y_array: ax25_frame.payload.payload.temperature_neg_y_array
  :field sunsensor_pos_xa: ax25_frame.payload.payload.sunsensor_pos_xa
  :field sunsensor_pos_xb: ax25_frame.payload.payload.sunsensor_pos_xb
  :field sunsensor_neg_xa: ax25_frame.payload.payload.sunsensor_neg_xa
  :field sunsensor_neg_xb: ax25_frame.payload.payload.sunsensor_neg_xb
  :field sunsensor_pos_ya: ax25_frame.payload.payload.sunsensor_pos_ya
  :field sunsensor_pos_yb: ax25_frame.payload.payload.sunsensor_pos_yb
  :field sunsensor_neg_ya: ax25_frame.payload.payload.sunsensor_neg_ya
  :field sunsensor_net_yb: ax25_frame.payload.payload.sunsensor_net_yb
  :field imtq_cal_mag_x: ax25_frame.payload.payload.imtq_cal_mag_x
  :field imtq_cal_mag_y: ax25_frame.payload.payload.imtq_cal_mag_y
  :field imtq_cal_mag_z: ax25_frame.payload.payload.imtq_cal_mag_z
  :field antenna_deployment_status: ax25_frame.payload.payload.antenna_deployment_status
  :field longitude: ax25_frame.payload.payload.longitude
  :field latitude: ax25_frame.payload.payload.latitude
  :field elevation: ax25_frame.payload.payload.elevation

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
        valid:
          any-of:
            - '"CQ    "'
            - '"W4SKH "'
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
      - id: payload
        type: rs_packet
  rs_packet:
    seq:
      - id: prefix
        type: str
        valid: '"RSBeac:"'
        terminator: 0x2c
      - id: beacon_timestamp
        type: str
        terminator: 0x2c
      - id: battery_voltage_str
        type: str
        terminator: 0x2c
      - id: battery_current_magnitude_str
        type: str
        terminator: 0x2c
      - id: battery_is_charging_str
        type: str
        terminator: 0x2c
      - id: voltage_feeding_bcr1_x_str
        type: str
        terminator: 0x2c
      - id: current_bcr1_neg_x_str
        type: str
        terminator: 0x2c
      - id: current_bcr1_pos_x_str
        type: str
        terminator: 0x2c
      - id: voltage_feeding_bcr2_y_str
        type: str
        terminator: 0x2c
      - id: current_bcr1_neg_y_str
        type: str
        terminator: 0x2c
      - id: current_bcr1_pos_y_str
        type: str
        terminator: 0x2c
      - id: voltage_feeding_bcr3_z_str
        type: str
        terminator: 0x2c
      - id: current_bcr1_neg_z_str
        type: str
        terminator: 0x2c
      - id: bcr_output_voltage_str
        type: str
        terminator: 0x2c
      - id: bcr_output_current_str
        type: str
        terminator: 0x2c
      - id: battery_bus_voltage_str
        type: str
        terminator: 0x2c
      - id: battery_bus_current_str
        type: str
        terminator: 0x2c
      - id: low_v_bus_voltage_str
        type: str
        terminator: 0x2c
      - id: low_v_bus_current_str
        type: str
        terminator: 0x2c
      - id: high_v_bus_voltage_str
        type: str
        terminator: 0x2c
      - id: high_v_bus_current_str
        type: str
        terminator: 0x2c
      - id: temperature_eps_str
        type: str
        terminator: 0x2c
      - id: temperature_battery_motherboard_str
        type: str
        terminator: 0x2c
      - id: temperature_battery_daughterboard_str
        type: str
        terminator: 0x2c
      - id: temperature_pos_x_array_str
        type: str
        terminator: 0x2c
      - id: temperature_neg_x_array_str
        type: str
        terminator: 0x2c
      - id: temperature_pos_y_array_str
        type: str
        terminator: 0x2c
      - id: temperature_neg_y_array_str
        type: str
        terminator: 0x2c
      - id: sunsensor_pos_xa_str
        type: str
        terminator: 0x2c
      - id: sunsensor_pos_xb_str
        type: str
        terminator: 0x2c
      - id: sunsensor_neg_xa_str
        type: str
        terminator: 0x2c
      - id: sunsensor_neg_xb_str
        type: str
        terminator: 0x2c
      - id: sunsensor_pos_ya_str
        type: str
        terminator: 0x2c
      - id: sunsensor_pos_yb_str
        type: str
        terminator: 0x2c
      - id: sunsensor_neg_ya_str
        type: str
        terminator: 0x2c
      - id: sunsensor_net_yb_str
        type: str
        terminator: 0x2c
      - id: imtq_cal_mag_x_str
        type: str
        terminator: 0x2c
      - id: imtq_cal_mag_y_str
        type: str
        terminator: 0x2c
      - id: imtq_cal_mag_z_str
        type: str
        terminator: 0x2c
      - id: antenna_deployment_status_str
        type: str
        terminator: 0x2c
      - id: longitude_str
        type: str
        terminator: 0x2c
      - id: latitude_str
        type: str
        terminator: 0x2c
      - id: elevation_str
        type: str
        size: 4
    instances:
      battery_voltage:
        value: battery_voltage_str.to_i
      battery_current_magnitude:
        value: battery_current_magnitude_str.to_i
      battery_is_charging:
        value: battery_is_charging_str.to_i
      voltage_feeding_bcr1_x:
        value: voltage_feeding_bcr1_x_str.to_i
      current_bcr1_neg_x:
        value: current_bcr1_neg_x_str.to_i
      current_bcr1_pos_x:
        value: current_bcr1_pos_x_str.to_i
      voltage_feeding_bcr2_y:
        value: voltage_feeding_bcr2_y_str.to_i
      current_bcr1_neg_y:
        value: current_bcr1_neg_y_str.to_i
      current_bcr1_pos_y:
        value: current_bcr1_pos_y_str.to_i
      voltage_feeding_bcr3_z:
        value: voltage_feeding_bcr3_z_str.to_i
      current_bcr1_neg_z:
        value: current_bcr1_neg_z_str.to_i
      bcr_output_voltage:
        value: bcr_output_voltage_str.to_i
      bcr_output_current:
        value: bcr_output_current_str.to_i
      battery_bus_voltage:
        value: battery_bus_voltage_str.to_i
      battery_bus_current:
        value: battery_bus_current_str.to_i
      low_v_bus_voltage:
        value: low_v_bus_voltage_str.to_i
      low_v_bus_current:
        value: low_v_bus_current_str.to_i
      high_v_bus_voltage:
        value: high_v_bus_voltage_str.to_i
      high_v_bus_current:
        value: high_v_bus_current_str.to_i
      temperature_eps:
        value: temperature_eps_str.to_i
      temperature_battery_motherboard:
        value: temperature_battery_motherboard_str.to_i
      temperature_battery_daughterboard:
        value: temperature_battery_daughterboard_str.to_i
      temperature_pos_x_array:
        value: temperature_pos_x_array_str.to_i
      temperature_neg_x_array:
        value: temperature_neg_x_array_str.to_i
      temperature_pos_y_array:
        value: temperature_pos_y_array_str.to_i
      temperature_neg_y_array:
        value: temperature_neg_y_array_str.to_i
      sunsensor_pos_xa:
        value: sunsensor_pos_xa_str.to_i
      sunsensor_pos_xb:
        value: sunsensor_pos_xb_str.to_i
      sunsensor_neg_xa:
        value: sunsensor_neg_xa_str.to_i
      sunsensor_neg_xb:
        value: sunsensor_neg_xb_str.to_i
      sunsensor_pos_ya:
        value: sunsensor_pos_ya_str.to_i
      sunsensor_pos_yb:
        value: sunsensor_pos_yb_str.to_i
      sunsensor_neg_ya:
        value: sunsensor_neg_ya_str.to_i
      sunsensor_net_yb:
        value: sunsensor_net_yb_str.to_i
      imtq_cal_mag_x:
        value: imtq_cal_mag_x_str.to_i
      imtq_cal_mag_y:
        value: imtq_cal_mag_y_str.to_i
      imtq_cal_mag_z:
        value: imtq_cal_mag_z_str.to_i
      antenna_deployment_status:
        value: antenna_deployment_status_str.to_i
      longitude:
        value: longitude_str.to_i
      latitude:
        value: latitude_str.to_i
      elevation:
        value: elevation_str.to_i
