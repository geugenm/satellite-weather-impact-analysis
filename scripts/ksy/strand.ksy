---
meta:
  id: strand
doc-ref: |
  https://ukamsat.files.wordpress.com/2013/03/amsat-strand-1-20130327.xlsx
  https://amsat-uk.org/satellites/telemetry/strand-1/strand-1-telemetry/
doc: |
  :field seq_no: seq_no
  :field length: length
  :field packet_type: packet_type
  :field channel: body.channel
  :field time_since_last_obc_i2c_message: body.data.time_since_last_obc_i2c_message
  :field packets_up_count: body.data.packets_up_count
  :field packets_down_count: body.data.packets_down_count
  :field packets_up_dropped_count: body.data.packets_up_dropped_count
  :field packets_down_dropped_count: body.data.packets_down_dropped_count
  :field i2c_node_address: body.i2c_node_address
  :field i2c_node_address: body.node.i2c_node_address
  :field battery_0_current_direction: body.node.node.battery_0_current_direction
  :field battery_0_current_ma: body.node.node.battery_0_current_ma
  :field battery_0_voltage_v: body.node.node.battery_0_voltage_v
  :field battery_0_temperature_deg_c: body.node.node.battery_0_temperature_deg_c
  :field battery_1_current_direction: body.node.node.battery_1_current_direction
  :field battery_1_current_ma: body.node.node.battery_1_current_ma
  :field battery_1_voltage_v: body.node.node.battery_1_voltage_v
  :field battery_1_temperature_deg_c: body.node.node.battery_1_temperature_deg_c
  :field adc1_py_array_current: body.node.node.adc1_py_array_current
  :field adc2_py_array_temperature: body.node.node.adc2_py_array_temperature
  :field adc3_array_pair_y_voltage: body.node.node.adc3_array_pair_y_voltage
  :field adc4_my_array_current: body.node.node.adc4_my_array_current
  :field adc5_my_array_temperature: body.node.node.adc5_my_array_temperature
  :field adc6_array_pair_x_voltage: body.node.node.adc6_array_pair_x_voltage
  :field adc7_mx_array_current: body.node.node.adc7_mx_array_current
  :field adc8_mx_array_temperature: body.node.node.adc8_mx_array_temperature
  :field adc9_array_pair_z_voltage: body.node.node.adc9_array_pair_z_voltage
  :field adc10_pz_array_current: body.node.node.adc10_pz_array_current
  :field adc11_pz_array_temperature: body.node.node.adc11_pz_array_temperature
  :field adc13_px_array_current: body.node.node.adc13_px_array_current
  :field adc14_px_array_temperature: body.node.node.adc14_px_array_temperature
  :field adc17_battery_bus_current: body.node.node.adc17_battery_bus_current
  :field adc26_5v_bus_current: body.node.node.adc26_5v_bus_current
  :field adc27_33v_bus_current: body.node.node.adc27_33v_bus_current
  :field adc30_mz_array_temperature: body.node.node.adc30_mz_array_temperature
  :field adc31_mz_array_current: body.node.node.adc31_mz_array_current
  :field switch_0_ppt_power_supply_status: body.node.node.switch_0_ppt_power_supply_status
  :field switch_1_ppt_1_2_status: body.node.node.switch_1_ppt_1_2_status
  :field switch_2_phone_5v_webcam: body.node.node.switch_2_phone_5v_webcam
  :field switch_3_warp_valve_status: body.node.node.switch_3_warp_valve_status
  :field switch_4_warp_heater_status: body.node.node.switch_4_warp_heater_status
  :field switch_5_digi_wi9c_status: body.node.node.switch_5_digi_wi9c_status
  :field switch_6_sgr05_status: body.node.node.switch_6_sgr05_status
  :field switch_7_reaction_wheels: body.node.node.switch_7_reaction_wheels
  :field switch_8_solar_panel_deploy_arm: body.node.node.switch_8_solar_panel_deploy_arm
  :field switch_9_solar_panel_deploy_fire: body.node.node.switch_9_solar_panel_deploy_fire
  :field unix_time_little_endian: body.node.node.unix_time_little_endian
  :field magnetometer_set_1: body.node.node.magnetometer_set_1
  :field magnetometer_set_2: body.node.node.magnetometer_set_2

seq:
  - id: hdlc_flag
    contents: [0xc0, 0x80]
  - id: seq_no
    type: u1
  - id: length
    type: u1
  - id: packet_type
    type: u1
  - id: body
    type:
      switch-on: packet_type
      cases:
        0x01: modem_beacon_tlm
        0x02: obc_beacon_tlm
  - id: crc_16_ccit
    size: 2
types:
  # ---------------Modem Beacon TLM--------------------------------
  modem_beacon_tlm:
    seq:
      - id: channel
        type: u1
      - id: data
        type:
          switch-on: channel
          cases:
            0xE0: ch_time_since_last_obc_i2c_message
            0xE1: ch_packets_up_count
            0xE2: ch_packets_down_count
            0xE3: ch_packets_up_dropped_count
            0xE4: ch_packets_down_dropped_count
  ############ Modem Channel fields ##############
  ch_time_since_last_obc_i2c_message:
    seq:
      - id: time_since_last_obc_i2c_message
        type: u1
  ch_packets_up_count:
    seq:
      - id: packets_up_count
        type: u1
  ch_packets_down_count:
    seq:
      - id: packets_down_count
        type: u1
  ch_packets_up_dropped_count:
    seq:
      - id: packets_up_dropped_count
        type: u1
  ch_packets_down_dropped_count:
    seq:
      - id: packets_down_dropped_count
        type: u1
  # ---------------OBC beacon TLM ---------------------------------
  obc_beacon_tlm:
    seq:
      - id: i2c_node_address
        type: u1
      - id: node
        type:
          switch-on: i2c_node_address
          cases:
            0x2C: cs_eps
            0x2D: cs_battery
            0x66: switch_board
            0x80: obc_data
            0x89: magnetometers
  ################## Node fields ##################
  cs_eps:
    seq:
      - id: i2c_node_address
        type: u1
      - id: node
        type:
          switch-on: i2c_node_address
          cases:
            0x00: ch_battery_0_current_direction
            0x01: ch_battery_0_current_ma
            0x03: ch_battery_0_voltage_v
            0x04: ch_battery_0_temperature_deg_c
            0x05: ch_battery_1_current_direction
            0x06: ch_battery_1_current_ma
            0x08: ch_battery_1_voltage_v
            0x09: ch_battery_1_temperature_deg_c
  cs_battery:
    seq:
      - id: i2c_node_address
        type: u1
      - id: node
        type:
          switch-on: i2c_node_address
          cases:
            0x01: ch_adc1_py_array_current
            0x02: ch_adc2_py_array_temperature
            0x03: ch_adc3_array_pair_y_voltage
            0x04: ch_adc4_my_array_current
            0x05: ch_adc5_my_array_temperature
            0x06: ch_adc6_array_pair_x_voltage
            0x07: ch_adc7_mx_array_current
            0x08: ch_adc8_mx_array_temperature
            0x09: ch_adc9_array_pair_z_voltage
            0x0A: ch_adc10_pz_array_current
            0x0B: ch_adc11_pz_array_temperature
            0x0D: ch_adc13_px_array_current
            0x0E: ch_adc14_px_array_temperature
            0x11: ch_adc17_battery_bus_current
            0x1A: ch_adc26_5v_bus_current
            0x1B: ch_adc27_33v_bus_current
            0x1E: ch_adc30_mz_array_temperature
            0x1F: ch_adc31_mz_array_current
  switch_board:
    seq:
      - id: i2c_node_address
        type: u1
      - id: node
        type:
          switch-on: i2c_node_address
          cases:
            0x81: ch_switch_0_ppt_power_supply_status
            0x86: ch_switch_1_ppt_1_2_status
            0x8B: ch_switch_2_phone_5v_webcam
            0x90: ch_switch_3_warp_valve_status
            0x95: ch_switch_4_warp_heater_status
            0x9A: ch_switch_5_digi_wi9c_status
            0x9F: ch_switch_6_sgr05_status
            0xA4: ch_switch_7_reaction_wheels
            0xA9: ch_switch_8_solar_panel_deploy_arm
            0xAC: ch_switch_9_solar_panel_deploy_fire
  obc_data:
    seq:
      - id: i2c_node_address
        type: u1
      - id: node
        type:
          switch-on: i2c_node_address
          cases:
            0x0C: ch_unix_time_little_endian
  magnetometers:
    seq:
      - id: i2c_node_address
        type: u1
      - id: node
        type:
          switch-on: i2c_node_address
          cases:
            0x03: ch_magnetometer_set_1
            0x05: ch_magnetometer_set_2
  ############### Channel fields #################
  #### I2C address 0x2C: C/S EPS              ####
  ch_battery_0_current_direction:
    seq:
      - id: battery_0_current_direction
        type: u1
  ch_battery_0_current_ma:
    seq:
      - id: battery_0_current_ma
        type: u1
  ch_battery_0_voltage_v:
    seq:
      - id: battery_0_voltage_v
        type: u1
  ch_battery_0_temperature_deg_c:
    seq:
      - id: battery_0_temperature_deg_c
        type: u1
  ch_battery_1_current_direction:
    seq:
      - id: battery_1_current_direction
        type: u1
  ch_battery_1_current_ma:
    seq:
      - id: battery_1_current_ma
        type: u1
  ch_battery_1_voltage_v:
    seq:
      - id: battery_1_voltage_v
        type: u1
  ch_battery_1_temperature_deg_c:
    seq:
      - id: battery_1_temperature_deg_c
        type: u1
  #### I2C address 0x2D: C/S BATTERY          ####
  ch_adc1_py_array_current:
    seq:
      - id: adc1_py_array_current
        type: u1
  ch_adc2_py_array_temperature:
    seq:
      - id: adc2_py_array_temperature
        type: u1
  ch_adc3_array_pair_y_voltage:
    seq:
      - id: adc3_array_pair_y_voltage
        type: u1
  ch_adc4_my_array_current:
    seq:
      - id: adc4_my_array_current
        type: u1
  ch_adc5_my_array_temperature:
    seq:
      - id: adc5_my_array_temperature
        type: u1
  ch_adc6_array_pair_x_voltage:
    seq:
      - id: adc6_array_pair_x_voltage
        type: u1
  ch_adc7_mx_array_current:
    seq:
      - id: adc7_mx_array_current
        type: u1
  ch_adc8_mx_array_temperature:
    seq:
      - id: adc8_mx_array_temperature
        type: u1
  ch_adc9_array_pair_z_voltage:
    seq:
      - id: adc9_array_pair_z_voltage
        type: u1
  ch_adc10_pz_array_current:
    seq:
      - id: adc10_pz_array_current
        type: u1
  ch_adc11_pz_array_temperature:
    seq:
      - id: adc11_pz_array_temperature
        type: u1
  ch_adc13_px_array_current:
    seq:
      - id: adc13_px_array_current
        type: u1
  ch_adc14_px_array_temperature:
    seq:
      - id: adc14_px_array_temperature
        type: u1
  ch_adc17_battery_bus_current:
    seq:
      - id: adc17_battery_bus_current
        type: u1
  ch_adc26_5v_bus_current:
    seq:
      - id: adc26_5v_bus_current
        type: u1
  ch_adc27_33v_bus_current:
    seq:
      - id: adc27_33v_bus_current
        type: u1
  ch_adc30_mz_array_temperature:
    seq:
      - id: adc30_mz_array_temperature
        type: u1
  ch_adc31_mz_array_current:
    seq:
      - id: adc31_mz_array_current
        type: u1
  #### I2C address 0x66: SWITCH BOARD         ####
  ch_switch_0_ppt_power_supply_status:
    seq:
      - id: switch_0_ppt_power_supply_status
        type: u1
  ch_switch_1_ppt_1_2_status:
    seq:
      - id: switch_1_ppt_1_2_status
        type: u1
  ch_switch_2_phone_5v_webcam:
    seq:
      - id: switch_2_phone_5v_webcam
        type: u1
  ch_switch_3_warp_valve_status:
    seq:
      - id: switch_3_warp_valve_status
        type: u1
  ch_switch_4_warp_heater_status:
    seq:
      - id: switch_4_warp_heater_status
        type: u1
  ch_switch_5_digi_wi9c_status:
    seq:
      - id: switch_5_digi_wi9c_status
        type: u1
  ch_switch_6_sgr05_status:
    seq:
      - id: switch_6_sgr05_status
        type: u1
  ch_switch_7_reaction_wheels:
    seq:
      - id: switch_7_reaction_wheels
        type: u1
  ch_switch_8_solar_panel_deploy_arm:
    seq:
      - id: switch_8_solar_panel_deploy_arm
        type: u1
  ch_switch_9_solar_panel_deploy_fire:
    seq:
      - id: switch_9_solar_panel_deploy_fire
        type: u1
  #### I2C address 0x80: OBC DATA             ####
  ch_unix_time_little_endian:
    seq:
      - id: unix_time_little_endian
        type: u1
  #### I2C address 0x89: MAGNETOMETERS        ####
  ch_magnetometer_set_1:
    seq:
      - id: magnetometer_set_1
        type: u1
  ch_magnetometer_set_2:
    seq:
      - id: magnetometer_set_2
        type: u1
