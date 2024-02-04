---
meta:
  id: stratosattk1
  title: STRATOSAT TK-1 (RS52S) Decoder Struct
  endian: le

doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.ax25_header.pid
  :field obc_timestamp: ax25_frame.payload.obc_timestamp
  :field eps_cell_current: ax25_frame.payload.eps_cell_current
  :field eps_system_current: ax25_frame.payload.eps_system_current
  :field eps_cell_voltage_half: ax25_frame.payload.eps_cell_voltage_half
  :field eps_cell_voltage_full: ax25_frame.payload.eps_cell_voltage_full
  :field eps_integral_cell_current: ax25_frame.payload.eps_integral_cell_current
  :field eps_integral_system_current: ax25_frame.payload.eps_integral_system_current
  :field adc_temperature_pos_x: ax25_frame.payload.adc_temperature_pos_x
  :field adc_temperature_neg_x: ax25_frame.payload.adc_temperature_neg_x
  :field adc_temperature_pos_y: ax25_frame.payload.adc_temperature_pos_y
  :field adc_temperature_neg_y: ax25_frame.payload.adc_temperature_neg_y
  :field adc_temperature_pos_z: ax25_frame.payload.adc_temperature_pos_z
  :field adc_temperature_neg_z: ax25_frame.payload.adc_temperature_neg_z
  :field adc_temperature_cell1: ax25_frame.payload.adc_temperature_cell1
  :field adc_temperature_cell2: ax25_frame.payload.adc_temperature_cell2
  :field attitude_control: ax25_frame.payload.attitude_control
  :field obc_cpu_load: ax25_frame.payload.obc_cpu_load
  :field obc_boot_count: ax25_frame.payload.obc_boot_count
  :field comm_boot_count: ax25_frame.payload.comm_boot_count
  :field comm_rssi: ax25_frame.payload.comm_rssi
  :field comm_received_packets: ax25_frame.payload.comm_received_packets
  :field comm_sent_packets: ax25_frame.payload.comm_sent_packets

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pdf/AX25.2.2.pdf'
types:
  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
      - id: payload
        type: stratosat_beacon_tlm

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
            - '"RS52S "'

  ssid_mask:
    seq:
      - id: ssid_mask
        type: u1
    instances:
      ssid:
        value: (ssid_mask & 0x0f) >> 1

  stratosat_beacon_tlm:
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
          value = 0.00006875 * eps_cell_voltage_half [V]
      - id: eps_cell_voltage_full
        type: u2
        doc: |
          Voltage of both batteries
          value = 0.0001375 * eps_cell_voltage_full [V]
      - id: eps_integral_cell_current
        type: u4
        doc: |
          Integral current of charge
          value = 0.00003076 * eps_integral_cell_current [A]
      - id: eps_integral_system_current
        type: u4
        doc: |
          Integral current of discharge
          value = 0.0000766 * eps_integral_system_current [A]
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
      - id: attitude_control
        type: u1
        doc: |
          Attitude control state
          off/on
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
      - id: comm_received_packets
        type: u2
        doc: |
          Number of received packets
      - id: comm_sent_packets
        type: u2
        doc: |
          Number of sent packets
