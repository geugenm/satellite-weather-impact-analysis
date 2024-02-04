---
meta:
  id: geoscanedelveis
  title: GEOSCAN-EDELVEIS (RS20S) Decoder Struct
  endian: le

doc: |
  :field dest_callsign: data.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: data.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: data.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: data.ax25_header.dest_ssid_raw.ssid
  :field ctl: data.ax25_header.ctl
  :field pid: data.ax25_header.pid
  :field obc_timestamp: data.payload.obc_timestamp
  :field eps_cell_current: data.payload.eps_cell_current
  :field eps_system_current: data.payload.eps_system_current
  :field eps_cell_voltage_half: data.payload.eps_cell_voltage_half
  :field eps_cell_voltage_full: data.payload.eps_cell_voltage_full
  :field adc_temperature_pos_x: data.payload.adc_temperature_pos_x
  :field adc_temperature_neg_x: data.payload.adc_temperature_neg_x
  :field adc_temperature_pos_y: data.payload.adc_temperature_pos_y
  :field adc_temperature_neg_y: data.payload.adc_temperature_neg_y
  :field adc_temperature_pos_z: data.payload.adc_temperature_pos_z
  :field adc_temperature_neg_z: data.payload.adc_temperature_neg_z
  :field adc_temperature_cell1: data.payload.adc_temperature_cell1
  :field adc_temperature_cell2: data.payload.adc_temperature_cell2
  :field obc_cpu_load: data.payload.obc_cpu_load
  :field obc_boot_count: data.payload.obc_boot_count
  :field comm_boot_count: data.payload.comm_boot_count
  :field comm_rssi: data.payload.comm_rssi
  :field sat_id: data.geoscan_header.sat_id
  :field info: data.geoscan_header.info
  :field offset: data.geoscan_header.offset
  :field cmd: data.geoscan_data.cmd
  :field adc_timestamp: data.geoscan_data.payload.adc_timestamp
  :field sun_sensor_pos_x: data.geoscan_data.payload.sun_sensor_pos_x
  :field sun_sensor_neg_x: data.geoscan_data.payload.sun_sensor_neg_x
  :field sun_sensor_pos_y: data.geoscan_data.payload.sun_sensor_pos_y
  :field sun_sensor_neg_y: data.geoscan_data.payload.sun_sensor_neg_y
  :field sun_sensor_neg_z: data.geoscan_data.payload.sun_sensor_neg_z
  :field mag_sensor_pos_x: data.geoscan_data.payload.mag_sensor_pos_x
  :field mag_sensor_neg_x: data.geoscan_data.payload.mag_sensor_neg_x
  :field mag_sensor_pos_y: data.geoscan_data.payload.mag_sensor_pos_y
  :field mag_sensor_neg_y: data.geoscan_data.payload.mag_sensor_neg_y
  :field mag_sensor_pos_z: data.geoscan_data.payload.mag_sensor_pos_z
  :field mag_sensor_neg_z: data.geoscan_data.payload.mag_sensor_neg_z
  :field temperature_pos_x: data.geoscan_data.payload.temperature_pos_x
  :field temperature_neg_x: data.geoscan_data.payload.temperature_neg_x
  :field temperature_pos_y: data.geoscan_data.payload.temperature_pos_y
  :field temperature_neg_y: data.geoscan_data.payload.temperature_neg_y
  :field temperature_pos_z: data.geoscan_data.payload.temperature_pos_z
  :field temperature_neg_z: data.geoscan_data.payload.temperature_neg_z
  :field temperature_cell1: data.geoscan_data.payload.temperature_cell1
  :field temperature_cell2: data.geoscan_data.payload.temperature_cell2
  :field status: data.geoscan_data.payload.status
  :field eps_timestamp: data.geoscan_data.payload.eps_timestamp
  :field geoscan_data_eps_cell_current: data.geoscan_data.payload.eps_cell_current
  :field geoscan_data_eps_system_current: data.geoscan_data.payload.eps_system_current
  :field reserved0: data.geoscan_data.payload.reserved0
  :field reserved1: data.geoscan_data.payload.reserved1
  :field reserved2: data.geoscan_data.payload.reserved2
  :field reserved3: data.geoscan_data.payload.reserved3
  :field geoscan_data_eps_cell_voltage_half: data.geoscan_data.payload.eps_cell_voltage_half
  :field geoscan_data_eps_cell_voltage_full: data.geoscan_data.payload.eps_cell_voltage_full
  :field reserved4: data.geoscan_data.payload.reserved4
  :field reserved5: data.geoscan_data.payload.reserved5
  :field reserved6: data.geoscan_data.payload.reserved6
  :field gnss_timestamp: data.geoscan_data.payload.gnss_timestamp
  :field valid: data.geoscan_data.payload.valid
  :field year: data.geoscan_data.payload.year
  :field month: data.geoscan_data.payload.month
  :field day: data.geoscan_data.payload.day
  :field hour: data.geoscan_data.payload.hour
  :field minute: data.geoscan_data.payload.minute
  :field second: data.geoscan_data.payload.second
  :field dutc: data.geoscan_data.payload.dutc
  :field offset_gnss: data.geoscan_data.payload.offset_gnss
  :field x: data.geoscan_data.payload.x
  :field y: data.geoscan_data.payload.y
  :field z: data.geoscan_data.payload.z
  :field v_x: data.geoscan_data.payload.v_x
  :field v_y: data.geoscan_data.payload.v_y
  :field v_z: data.geoscan_data.payload.v_z
  :field vdop: data.geoscan_data.payload.vdop
  :field hdop: data.geoscan_data.payload.hdop
  :field pdop: data.geoscan_data.payload.pdop
  :field tdop: data.geoscan_data.payload.tdop
  :field fakel_timestamp: data.geoscan_data.payload.fakel_timestamp
  :field bitfield0: data.geoscan_data.payload.bitfield0
  :field bitfield1: data.geoscan_data.payload.bitfield1
  :field voltage_80v: data.geoscan_data.payload.voltage_80v
  :field voltage_13v: data.geoscan_data.payload.voltage_13v
  :field current_valve: data.geoscan_data.payload.current_valve
  :field voltage_valve: data.geoscan_data.payload.voltage_valve
  :field current_control_valve: data.geoscan_data.payload.current_control_valve
  :field voltage_control_valve: data.geoscan_data.payload.voltage_control_valve
  :field current_ek1: data.geoscan_data.payload.current_ek1
  :field voltage_ek1: data.geoscan_data.payload.voltage_ek1
  :field current_ek2: data.geoscan_data.payload.current_ek2
  :field voltage_ek2: data.geoscan_data.payload.voltage_ek2
  :field current_ek: data.geoscan_data.payload.current_ek
  :field voltage_ek: data.geoscan_data.payload.voltage_ek
  :field temperature_td1: data.geoscan_data.payload.temperature_td1
  :field reserved7: data.geoscan_data.payload.reserved7
  :field temperature_tp: data.geoscan_data.payload.temperature_tp
  :field pressure_cylinder: data.geoscan_data.payload.pressure_cylinder
  :field pressure_receiver: data.geoscan_data.payload.pressure_receiver
  :field switch_on_counter: data.geoscan_data.payload.switch_on_counter
  :field time_switched_on_counter: data.geoscan_data.payload.time_switched_on_counter
  :field bitfield3: data.geoscan_data.payload.bitfield3
  :field state: data.geoscan_data.payload.state
  :field reserved8: data.geoscan_data.payload.reserved8
  :field reserved9: data.geoscan_data.payload.reserved9
  :field pump_time: data.geoscan_data.payload.pump_time
  :field time_of_last_pump: data.geoscan_data.payload.time_of_last_pump
  :field reserved10: data.geoscan_data.payload.reserved10
  :field data_str: data.geoscan_data.payload.photo_data.data.data_str

seq:
  - id: data
    type:
      switch-on: type
      cases:
        0x848A8286: ax25_frame
        0x01003E01: geoscan_frame
        0x01003E05: geoscan_frame
instances:
  len:
    value: _io.size
  type:
    type: u4be
    pos: 0
types:
  geoscan_frame:
    seq:
      - id: geoscan_header
        type: geoscan_header
      - id: geoscan_data
        type: geoscan_tlm

  geoscan_header:
    seq:
      - id: sat_id
        type: u1
      - id: info
        type: u4
      - id: offset
        type: u2

  geoscan_tlm:
    seq:
      - id: cmd
        type: u1
      - id: payload
        type:
          switch-on: cmd
          cases:
            0x01: geoscan_adc
            0x02: geoscan_eps
            0x05: geoscan_fakel
            0x06: geoscan_fakel
            0x07: geoscan_gnss
            0x08: geoscan_gnss
            0x09: geoscan_gnss
            0x0A: geoscan_gnss
            0x0B: geoscan_photo

  geoscan_adc:
    seq:
      - id: adc_timestamp
        type: u4
        doc: |
          Time (Unix timestamp)
      - id: sun_sensor_pos_x
        type: u4
      - id: sun_sensor_neg_x
        type: u4
      - id: sun_sensor_pos_y
        type: u4
      - id: sun_sensor_neg_y
        type: u4
      - id: sun_sensor_neg_z
        type: u4
      - id: mag_sensor_pos_x
        type: s1
      - id: mag_sensor_neg_x
        type: s1
      - id: mag_sensor_pos_y
        type: s1
      - id: mag_sensor_neg_y
        type: s1
      - id: mag_sensor_pos_z
        type: s1
      - id: mag_sensor_neg_z
        type: s1
      - id: temperature_pos_x
        type: s1
        doc: |
          Temperature on panel X+ [°C]
      - id: temperature_neg_x
        type: s1
        doc: |
          Temperature on panel X- [°C]
      - id: temperature_pos_y
        type: s1
        doc: |
          Temperature on panel Y+ [°C]
      - id: temperature_neg_y
        type: s1
        doc: |
          Temperature on panel Y- [°C]
      - id: temperature_pos_z
        type: s1
        doc: |
          Temperature on panel Z+ [°C]
      - id: temperature_neg_z
        type: s1
        doc: |
          Temperature on panel Z- [°C]
      - id: temperature_cell1
        type: s1
        doc: |
          Temperature on battery cell 1 [°C]
      - id: temperature_cell2
        type: s1
        doc: |
          Temperature on battery cell 2 [°C]
      - id: status
        type: u4

  geoscan_eps:
    seq:
      - id: eps_timestamp
        type: u4
        doc: |
          Time (Unix timestamp)
      - id: eps_cell_current
        type: u4
        doc: |
          Current of consumption
          value = 0.0000766 * eps_cell_current [A]
      - id: eps_system_current
        type: u4
        doc: |
          Current from sun panels
          value = 0.00003076 * eps_system_current [A]
      - id: reserved0
        type: u4
      - id: reserved1
        type: u4
      - id: reserved2
        type: s2
      - id: reserved3
        type: u2
      - id: eps_cell_voltage_half
        type: u1
        doc: |
          Voltage of one battery
          value = 0.0176 * eps_cell_voltage_half [V]
      - id: eps_cell_voltage_full
        type: u1
        doc: |
          Voltage of both batteries
          value = 0.0352 * eps_cell_voltage_full [V]
      - id: reserved4
        type: s2
      - id: reserved5
        type: s1
      - id: reserved6
        type: u4

  geoscan_gnss:
    seq:
      - id: gnss_timestamp
        type: u4
        doc: |
          Time (Unix timestamp)
      - id: valid
        type: u1
        valid:
          any-of:
            - 0x01
      - id: year
        type: u2
      - id: month
        type: u1
      - id: day
        type: u1
      - id: hour
        type: u1
      - id: minute
        type: u1
      - id: second
        type: u2
        doc: |
          value = second*0.001
      - id: dutc
        type: u1
      - id: offset_gnss
        type: u2
        doc: |
          value = offset_gnss*0.001
      - id: x
        type: s4
      - id: y
        type: s4
      - id: z
        type: s4
      - id: v_x
        type: s4
      - id: v_y
        type: s4
      - id: v_z
        type: s4
      - id: vdop
        type: u2
        doc: |
          value = VDOP*0.1
      - id: hdop
        type: u2
        doc: |
          value = HDOP*0.1
      - id: pdop
        type: u2
        doc: |
          value = PDOP*0.1
      - id: tdop
        type: u2
        doc: |
          value = TDOP*0.1

  geoscan_fakel:
    seq:
      - id: fakel_timestamp
        type: u4
        doc: |
          Time (Unix timestamp)
      - id: bitfield0
        type: u1
      - id: bitfield1
        type: u1
      - id: voltage_80v
        type: u2
        doc: |
          value = voltage_80v * 0.00263 [V]
      - id: voltage_13v
        type: u2
        doc: |
          value = voltage_13v * 0.0003443 [V]
      - id: current_valve
        type: u2
        doc: |
          [mA]
      - id: voltage_valve
        type: u2
        doc: |
          value = voltage_valve * 0.0026 [V]
      - id: current_control_valve
        type: u2
        doc: |
          [mA]
      - id: voltage_control_valve
        type: u2
        doc: |
          value = voltage_control_valve * 0.0026 [V]
      - id: current_ek1
        type: u2
        doc: |
          [mA]
      - id: voltage_ek1
        type: u2
        doc: |
          value = voltage_ek1 * 0.00113 [V]
      - id: current_ek2
        type: u2
        doc: |
          [mA]
      - id: voltage_ek2
        type: u2
        doc: |
          value = voltage_ek2 * 0.00113 [V]
      - id: current_ek
        type: u2
        doc: |
          [mA]
      - id: voltage_ek
        type: u2
        doc: |
          value = voltage_ek * 0.00113 [V]
      - id: temperature_td1
        type: u2
        doc: |
          value = temperature_td1 * 0.00006 [C]
      - id: reserved7
        type: u2
        doc: |
          value = voltage_ek1 * 0.00113 [V]
      - id: temperature_tp
        type: u2
        doc: |
          [C]
      - id: pressure_cylinder
        type: u2
        doc: |
          value = pressure_cylinder * 0.00625 [Bar]
      - id: pressure_receiver
        type: u2
        doc: |
          value = pressure_receiver * 0.0001 [Bar]
      - id: switch_on_counter
        type: u2
      - id: time_switched_on_counter
        type: u2
        doc: |
          [ms]
      - id: bitfield3
        type: u1
      - id: state
        type: u1
      - id: reserved8
        type: u1
      - id: reserved9
        type: u1
      - id: pump_time
        type: u2
        doc: |
          [ms]
      - id: time_of_last_pump
        type: u2
        doc: |
          [ms]
      - id: reserved10
        type: u1

  geoscan_photo:
    seq:
      - id: photo_data
        type: data_b64_t
        size-eos: true
  data_b64_t:
    seq:
      - id: data
        process: satnogsdecoders.process.b64encode
        type: str_b64_t
        size-eos: true
  str_b64_t:
    seq:
      - id: data_str
        type: str
        encoding: ASCII
        size-eos: true

  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
      - id: payload
        type: geoscan_beacon_tlm

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
      - id: pid
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
            - '"BEACON"'
            - '"RS20S "'

  ssid_mask:
    seq:
      - id: ssid_mask
        type: u1
    instances:
      ssid:
        value: (ssid_mask & 0x0f) >> 1

  geoscan_beacon_tlm:
    seq:
      - id: obc_timestamp
        type: u4
        doc: |
          OBC Time (Unix timestamp)
      - id: eps_cell_current
        type: u2
        doc: |
          Current of consumption
          value = 0.0000766 * eps_cell_current [A]
      - id: eps_system_current
        type: u2
        doc: |
          Current from sun panels
          value = 0.00003076 * eps_system_current [A]
      - id: eps_cell_voltage_half
        type: u2
        doc: |
          Voltage of one battery
          value = 0.00006928 * eps_cell_voltage_half [V]
      - id: eps_cell_voltage_full
        type: u2
        doc: |
          Voltage of both batteries
          value = 0.00013856 * eps_cell_voltage_full [V]
      - id: adc_temperature_pos_x
        type: s1
        doc: |
          Temperature on panel X+ [°C]
      - id: adc_temperature_neg_x
        type: s1
        doc: |
          Temperature on panel X- [°C]
      - id: adc_temperature_pos_y
        type: s1
        doc: |
          Temperature on panel Y+ [°C]
      - id: adc_temperature_neg_y
        type: s1
        doc: |
          Temperature on panel Y- [°C]
      - id: adc_temperature_pos_z
        type: s1
        doc: |
          Temperature on panel Z+ [°C]
      - id: adc_temperature_neg_z
        type: s1
        doc: |
          Temperature on panel Z- [°C]
      - id: adc_temperature_cell1
        type: s1
        doc: |
          Temperature on battery cell 1 [°C]
      - id: adc_temperature_cell2
        type: s1
        doc: |
          Temperature on battery cell 2 [°C]
      - id: obc_cpu_load
        type: u1
        doc: |
          Procentage of CPU load
          value = 0.390625 * obc_cpu_load [%]
      - id: obc_boot_count
        type: u2
        doc: |
          Total number of OBC reboots
          value = obc_boot_count - 7476
      - id: comm_boot_count
        type: u2
        doc: |
          Total number of COMM reboots
          value = comm_boot_count - 1505
      - id: comm_rssi
        type: s1
        doc: |
          CC1125 received signal strength indicator
          value = -99 + comm_rssi [dBm]
