meta:
  id: celesta
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.dest_callsign_ror.dest_callsign
  :field dest_ssid_raw: ax25_frame.ax25_header.dest_ssid_raw
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.src_callsign_ror.src_callsign
  :field src_ssid_raw: ax25_frame.ax25_header.src_ssid_raw
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.ax25_data.pid
  :field size: ax25_frame.ax25_data.size
  :field frame_type: ax25_frame.ax25_data.frame_type
  :field ts: ax25_frame.ax25_data.ts
  :field timestamp: ax25_frame.ax25_data.obdh.timestamp
  :field temperature: ax25_frame.ax25_data.obdh.temperature
  :field satellite_mode: ax25_frame.ax25_data.obdh.satellite_mode
  :field obdh_mode: ax25_frame.ax25_data.obdh.obdh_mode
  :field bytes_to_transmit: ax25_frame.ax25_data.obdh.bytes_to_transmit
  :field number_of_resets: ax25_frame.ax25_data.obdh.number_of_resets
  :field number_of_errors: ax25_frame.ax25_data.obdh.number_of_errors
  :field eps_mode: ax25_frame.ax25_data.eps.eps_mode
  :field battery_voltage_raw: ax25_frame.ax25_data.eps.battery_voltage_raw
  :field battery_temperature: ax25_frame.ax25_data.eps.battery_temperature
  :field min_battery_voltage_raw: ax25_frame.ax25_data.eps.min_battery_voltage_raw
  :field max_battery_voltage_raw: ax25_frame.ax25_data.eps.max_battery_voltage_raw
  :field avg_battery_voltage_raw: ax25_frame.ax25_data.eps.avg_battery_voltage_raw
  :field avg_charge_current_raw: ax25_frame.ax25_data.eps.avg_charge_current_raw
  :field max_charge_current_raw: ax25_frame.ax25_data.eps.max_charge_current_raw
  :field z_minu_face_temperature: ax25_frame.ax25_data.eps.z_minu_face_temperature
  :field o_b_d_h_current: ax25_frame.ax25_data.eps.o_b_d_h_current
  :field e_p_s_current: ax25_frame.ax25_data.eps.e_p_s_current
  :field t_t_c_micro_c_current: ax25_frame.ax25_data.eps.t_t_c_micro_c_current
  :field t_t_c_p_a_current_raw: ax25_frame.ax25_data.eps.t_t_c_p_a_current_raw
  :field d_o_s_i_current: ax25_frame.ax25_data.eps.d_o_s_i_current
  :field charge_current_raw: ax25_frame.ax25_data.eps.charge_current_raw
  :field spare: ax25_frame.ax25_data.eps.spare
  :field last_battery_voltage: ax25_frame.ax25_data.eps.last_battery_voltage
  :field minimum_battery_voltage_measured_since_reboot: ax25_frame.ax25_data.eps.minimum_battery_voltage_measured_since_reboot
  :field maximum_battery_voltage_measured_since_reboot: ax25_frame.ax25_data.eps.maximum_battery_voltage_measured_since_reboot
  :field average_battery_voltage_measured_since_reboot: ax25_frame.ax25_data.eps.average_battery_voltage_measured_since_reboot
  :field average_charge_current_measured_since_reboot: ax25_frame.ax25_data.eps.average_charge_current_measured_since_reboot
  :field maximum_charge_current_measured_since_reboot: ax25_frame.ax25_data.eps.maximum_charge_current_measured_since_reboot
  :field current_consumption_of_the_power_amplifier_of_the_ttc: ax25_frame.ax25_data.eps.current_consumption_of_the_power_amplifier_of_the_ttc
  :field total_charge_current_of_the_battery: ax25_frame.ax25_data.eps.total_charge_current_of_the_battery
  :field mode: ax25_frame.ax25_data.ttc.mode
  :field number_of_ttc_resets: ax25_frame.ax25_data.ttc.number_of_ttc_resets
  :field last_reset_cause: ax25_frame.ax25_data.ttc.last_reset_cause
  :field number_of_received_valid_packets: ax25_frame.ax25_data.ttc.number_of_received_valid_packets
  :field number_of_transmitted_packets: ax25_frame.ax25_data.ttc.number_of_transmitted_packets
  :field measured_transmission_power: ax25_frame.ax25_data.ttc.measured_transmission_power
  :field last_error_code: ax25_frame.ax25_data.ttc.last_error_code
  :field power_configuration: ax25_frame.ax25_data.ttc.power_configuration
  :field power_amplifier_temperature: ax25_frame.ax25_data.ttc.power_amplifier_temperature
  :field rssi_of_last_received_packet_raw: ax25_frame.ax25_data.ttc.rssi_of_last_received_packet_raw
  :field frequency_deviation_of_last_received_packet_raw: ax25_frame.ax25_data.ttc.frequency_deviation_of_last_received_packet_raw
  :field beacon_period: ax25_frame.ax25_data.ttc.beacon_period
  :field rssi_of_last_received_packet: ax25_frame.ax25_data.ttc.rssi_of_last_received_packet
  :field frequency_deviation_of_last_received_packet_with_valid_crc: ax25_frame.ax25_data.ttc.frequency_deviation_of_last_received_packet_with_valid_crc
  :field last_message_rssi_raw: ax25_frame.ax25_data.ham_message.last_message_rssi_raw
  :field radio_message: ax25_frame.ax25_data.ham_message.radio_message
  :field last_msg_rssi_dbm: ax25_frame.ax25_data.ham_message.last_msg_rssi_dbm
seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://csum.umontpellier.fr/files/2022/07/2022-07-13-DECODING_MTCUBE_2__CELESTA_MISSIONS_AND_HAMRADIO_CHALLENGE_v3_1.pdf'

types:
  ax25_frame:
    seq:
    - id: ax25_header
      type: ax25_header
    - id: ax25_data
      type: ax25_data

  ax25_header:
    seq:
      - id: dest_callsign_raw
        type: dest_callsign_raw
      - id: dest_ssid_raw
        type: u1
        doc: 0xE0
      - id: src_callsign_raw
        type: src_callsign_raw
      - id: src_ssid_raw
        type: u1
        doc: 0xE1
      - id: ctl
        type: u1
        doc: 0x03

  dest_callsign_raw:
    seq:
      - id: dest_callsign_ror
        process: ror(1)
        size: 6
        type: dest_callsign
  src_callsign_raw:
    seq:
      - id: src_callsign_ror
        process: ror(1)
        type: src_callsign
        size: 6
  dest_callsign:
    seq:
      - id: dest_callsign
        type: str
        encoding: ASCII
        size: 6
  src_callsign:
    seq:
      - id: src_callsign
        type: str
        encoding: ASCII
        size: 6

  ax25_data:
    seq:
      - id: pid
        type: u1
        doc: 0xF0
      - id: size
        type: u1
        doc: 0xEA
      - id: frame_type
        type: u1
        doc: 0x10
      - id: ts
        type: u4
      - id: obdh
        type: obdh
      - id: eps
        type: eps
      - id: ttc
        type: ttc
      - id: payload
        size: 48 
      - id: ham_message
        type: ham_message

  obdh:
    seq:
      - id: timestamp
        type: u4
      - id: temperature
        type: u2le
      - id: satellite_mode
        type: u1
        enum: e_satellite_mode
      - id: obdh_mode
        type: u1
        enum: e_obdh_mode
      - id: bytes_to_transmit
        type: u4le
      - id: number_of_resets
        type: u2le
      - id: number_of_errors
        type: u2le
    enums:
      e_satellite_mode:
        0x00: standby
        0x01: deploy
        0x02: commissionning
        0x03: comm_pl
        0x04: mission
        0x05: low_p_mission
        0x06: transmit
        0x07: survival
        0x08: silent
      e_obdh_mode:
        0x011: standby
        0x022: deploy
        0x033: commissionning
        0x044: comm_pl
        0x055: mission
        0x066: low_power_mission
        0x077: silent
        0x0FF: por

  eps:
    seq:
      - id: eps_mode
        type: u1
        enum: e_eps_mode
      - id: battery_voltage_raw
        type: u1
      - id: battery_temperature
        type: s1
      - id: min_battery_voltage_raw
        type: u1
      - id: max_battery_voltage_raw
        type: u1
      - id: avg_battery_voltage_raw
        type: u1
      - id: avg_charge_current_raw
        type: u1 
      - id: max_charge_current_raw
        type: u1
      - id: z_minu_face_temperature
        type: s1
      - id: o_b_d_h_current
        type: u1
      - id: e_p_s_current
        type: u1
      - id: t_t_c_micro_c_current
        type: u1
      - id: t_t_c_p_a_current_raw
        type: u1
      - id: d_o_s_i_current
        type: u1
      - id: charge_current_raw
        type: u1
      - id: spare
        type: u1 
    enums:
      e_eps_mode:
        0x00: idle
        0x11: survival
        0x22: stnadby
        0x33: deploy
        0x44: commissionnong
        0x55: mission
        0x66: low_power_mission
        0x77: silent
    instances:
      last_battery_voltage:
        value: battery_voltage_raw * 20
      minimum_battery_voltage_measured_since_reboot:
        value: min_battery_voltage_raw * 20
      maximum_battery_voltage_measured_since_reboot:
        value: max_battery_voltage_raw * 20
      average_battery_voltage_measured_since_reboot:
        value: avg_battery_voltage_raw * 20
      average_charge_current_measured_since_reboot:
        value: avg_charge_current_raw * 12
      maximum_charge_current_measured_since_reboot:  
        value: max_charge_current_raw * 12  
      current_consumption_of_the_power_amplifier_of_the_ttc:
        value: t_t_c_p_a_current_raw * 5
      total_charge_current_of_the_battery:
        value: charge_current_raw * 12

  ttc:
    seq:
      - id: mode 
        type: u1
        enum: e_mode
      - id: number_of_ttc_resets 
        type: u2le
      - id: last_reset_cause 
        type: u1
        enum: e_last_reset_cause
      - id: number_of_received_valid_packets 
        type: u2le
      - id: number_of_transmitted_packets 
        type: u2le
      - id: measured_transmission_power 
        type: u2le
      - id: last_error_code 
        type: u1
        enum: e_last_error_code
      - id: power_configuration 
        type: u1
      - id: power_amplifier_temperature 
        type: s1
      - id: rssi_of_last_received_packet_raw
        type: u1
      - id: frequency_deviation_of_last_received_packet_raw
        type: u1
      - id: beacon_period 
        type: u1 
    enums:
      e_mode:
        0x01: idle
        0x11: beacon
        0x22: commissionning
        0x44: silent
      e_last_reset_cause:
        0x11: power_supply_reset
        0x22: watchdog
        0x33: oscillator_error
        0x44: reset_pin
        0x55: debugger_reset
        0x77: software_reset
      e_last_error_code:
        0x00: nothing
        0x11: radio_hw_error
        0x22: tx_queue_full
        0x33: rx_queue_full
        0x44: tx_bus_queue_full
        0x55: rx_bus_queue_full
        0x66: obc_temp_hw_error
        0x77: obc_temp_h_limit_error
        0x88: obc_temp_l_limit_error
        0x99: pa_temp_hw_error
        0xAA: pa_temp_h_limit_error
        0xBB: pa_temp_l_limit_error
        0xCC: obdh_nack
        0xDD: pf_reset_req
        0xD1: ttc_reset_req
        0xEE: radio_task_timeout
        0xFF: radio_unqueue
        0x01: obdh_status_req
        0x02: obdh_bdr_req
        0xA1: fram_id_error
        0xA2: fram_hw_error
        0xA3: fram_read_error
        0xA4: fram_write_error
        0xA5: event_queue_read_error
    instances:
      rssi_of_last_received_packet:
        value: -1 * rssi_of_last_received_packet_raw
      frequency_deviation_of_last_received_packet_with_valid_crc:
        value: frequency_deviation_of_last_received_packet_raw * 17
        
  ham_message:
    seq:
      - id: last_message_rssi_raw
        type: u1
      - id: radio_message
        size: 133
        type: str
        encoding: ASCII

    instances:
      last_msg_rssi_dbm:
        value: -1 * last_message_rssi_raw 
        
