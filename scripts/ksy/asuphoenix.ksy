---
meta:
  id: asuphoenix
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field priority: ax25_frame.payload.ax25_info.csp_header.priority
  :field source: ax25_frame.payload.ax25_info.csp_header.source
  :field destination: ax25_frame.payload.ax25_info.csp_header.destination
  :field destination_port: ax25_frame.payload.ax25_info.csp_header.destination_port
  :field source_port: ax25_frame.payload.ax25_info.csp_header.source_port
  :field reserved: ax25_frame.payload.ax25_info.csp_header.reserved
  :field hmac: ax25_frame.payload.ax25_info.csp_header.hmac
  :field xtea: ax25_frame.payload.ax25_info.csp_header.xtea
  :field rdp: ax25_frame.payload.ax25_info.csp_header.rdp
  :field crc: ax25_frame.payload.ax25_info.csp_header.crc
  :field comms_idx_int: ax25_frame.payload.ax25_info.csp_node.csp_node_port.comms_idx_int
  :field total_obc_resets: ax25_frame.payload.ax25_info.csp_node.csp_node_port.total_obc_resets
  :field current_bat_volt_flt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.current_bat_volt_flt
  :field obc_clock: ax25_frame.payload.ax25_info.csp_node.csp_node_port.obc_clock
  :field current_3v3_flt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.current_3v3_flt
  :field current_5v_flt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.current_5v_flt
  :field current_adcs_flt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.current_adcs_flt
  :field eps_charge_volt_bat_flt: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps_charge_volt_bat_flt
  :field eps_charge_current_bat: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps_charge_current_bat
  :field eps_temp: ax25_frame.payload.ax25_info.csp_node.csp_node_port.eps_temp
  :field bat_temp: ax25_frame.payload.ax25_info.csp_node.csp_node_port.bat_temp
  :field brownouts: ax25_frame.payload.ax25_info.csp_node.csp_node_port.brownouts
  :field ax100_rssi: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ax100_rssi
  :field ax100_board_temp: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ax100_board_temp
  :field gps_sats_used: ax25_frame.payload.ax25_info.csp_node.csp_node_port.gps_sats_used
  :field ants_deployed: ax25_frame.payload.ax25_info.csp_node.csp_node_port.ants_deployed
  :field gpio_state: ax25_frame.payload.ax25_info.csp_node.csp_node_port.gpio_state
  :field temp_brd: ax25_frame.payload.ax25_info.csp_node.csp_node_port.temp_brd
  :field temp_pa: ax25_frame.payload.ax25_info.csp_node.csp_node_port.temp_pa
  :field last_rssi: ax25_frame.payload.ax25_info.csp_node.csp_node_port.last_rssi
  :field last_rferr: ax25_frame.payload.ax25_info.csp_node.csp_node_port.last_rferr
  :field tx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tx_count
  :field rx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.rx_count
  :field tx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tx_bytes
  :field rx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.rx_bytes
  :field active_conf: ax25_frame.payload.ax25_info.csp_node.csp_node_port.active_conf
  :field boot_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.boot_count
  :field boot_cause: ax25_frame.payload.ax25_info.csp_node.csp_node_port.boot_cause
  :field last_contact: ax25_frame.payload.ax25_info.csp_node.csp_node_port.last_contact
  :field bgnd_rssi: ax25_frame.payload.ax25_info.csp_node.csp_node_port.bgnd_rssi
  :field tx_duty: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tx_duty
  :field tot_tx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_tx_count
  :field tot_rx_count: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_rx_count
  :field tot_tx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_tx_bytes
  :field tot_rx_bytes: ax25_frame.payload.ax25_info.csp_node.csp_node_port.tot_rx_bytes

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
      # ASU Phoenix does not follow the AX.25 specs and produces corrupted headers.
      # Thus the following unroll mechanism does not work!
      # - id: repeater
      #   type: repeater
      #   if: (src_ssid_raw.ssid_mask & 0x01) == 0
      #   doc: 'Repeater flag is set!'
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
        process: ror(0)
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
      - id: csp_header
        type: csp_header_t
      - id: csp_node
        type:
          switch-on: csp_header.source
          cases:
            2: obc_t
            5: ax100_t
  csp_header_t:
    seq:
      - id: raw_csp_header
        type: u4be
    instances:
      priority:
        value: '(raw_csp_header >> 30)'
      source:
        value: '((raw_csp_header >> 25) & 0x1F)'
      destination:
        value: '((raw_csp_header >> 20) & 0x1F)'
      destination_port:
        value: '((raw_csp_header >> 14) & 0x3F)'
      source_port:
        value: '((raw_csp_header >> 8) & 0x3F)'
      reserved:
        value: '((raw_csp_header >> 4) & 0x0F)'
      hmac:
        value: '((raw_csp_header & 0x08) >> 3)'
      xtea:
        value: '((raw_csp_header & 0x04) >> 2)'
      rdp:
        value: '((raw_csp_header & 0x02) >> 1)'
      crc:
        value: '(raw_csp_header & 0x01)'
  ax100_t:
    seq:
      - id: csp_node_port
        type:
          switch-on: _parent.csp_header.source_port
          cases:
            0: ax100_control_port_t
  obc_t:
    seq:
      - id: csp_node_port
        type:
          switch-on: _parent.csp_header.source_port
          cases:
            27: obc_hk_t
  ax100_control_port_t:
    seq:
      - id: temp_brd
        type: s2
      - id: temp_pa
        type: s2
      - id: last_rssi
        type: s2
      - id: last_rferr
        type: s2
      - id: tx_count
        type: u4
      - id: rx_count
        type: u4
      - id: tx_bytes
        type: u4
      - id: rx_bytes
        type: u4
      - id: active_conf
        type: u1
      - id: boot_count
        type: u2
      - id: boot_cause
        type: u4
      - id: last_contact
        type: u4
      - id: bgnd_rssi
        type: s2
      - id: tx_duty
        type: u1
      - id: tot_tx_count
        type: u4
      - id: tot_rx_count
        type: u4
      - id: tot_tx_bytes
        type: u4
      - id: tot_rx_bytes
        type: u4
  obc_hk_t:
    doc-ref: 'http://phxcubesat.asu.edu/content/amateur-operations'
    seq:
      - id: beacon_type_magic
        contents: [0x68, 0x6b, 0x3a]
        doc: |
          Health Beacon indication = 'hk:'
      - id: int_comms_idx_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Internal Communications Index
      - id: total_obc_resets_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Number of total OBC resets
      - id: current_bat_volt_int_str
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Current Battery Voltage
      - id: current_bat_volt_frac_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Current Battery Voltage
      - id: obc_disk_space_used_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Amount of disk space currently used on the OBC
      - id: obc_clock_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Current time of the OBC clock. It is formatted as an RTC (Unix)
          timestamp, which is the number of seconds since Jan 01, 1970
          Keep in mind that this time is 7 hours ahead of the current time in
          AZ. Therefore, this should be taken into account before assessing
          clock drift
      - id: current_3v3_int_str
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Current draw from everything getting 3.3V (in mA)
          (Note: This is the nominal voltage draw when the GPS, OBC, and AX100
          are all getting power)
      - id: current_3v3_frac_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Current draw from everything getting 3.3V (in mA)
          (Note: This is the nominal voltage draw when the GPS, OBC, and AX100
          are all getting power)
      - id: current_5v_int_str
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Current draw from everything getting 5V (in mA)
      - id: current_5v_frac_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Current draw from everything getting 5V (in mA)
      - id: current_adcs_int_str
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Current draw from power switch 7, the switch to the ADCS
      - id: current_adcs_frac_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Current draw from power switch 7, the switch to the ADCS
      - id: eps_charge_volt_bat_int_str
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Voltage the battery is being charged at via the EPS
      - id: eps_charge_volt_bat_frac_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Voltage the battery is being charged at via the EPS
      - id: eps_charge_current_bat_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Current the battery is being charged with (in mA)
      - id: eps_temp_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          EPS temperature (in K)
      - id: bat_temp_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Battery temperature (in K)
      - id: brownouts_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Number of Brownouts
      - id: ax100_rssi_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          AX-100 Received Signal Strength Index (RSSI)
      - id: ax100_board_temp_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          AX-100 board temperature
      - id: gps_sats_used_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Number of satellites used in the last GPS solution
      - id: ants_deployed_str
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Number of deployed antennas. This will return a value if I2C
          communication with the antenna is working and deploys the antenna)
      - id: gpio_state_str
        type: str
        size: 1
        encoding: utf-8
        doc: |
          GPIO State (0 = switch is on the ADCS, 1 = switch is on the FLIR camera)
    instances:
      comms_idx_int:
        value: int_comms_idx_str.to_i
      total_obc_resets:
        value: total_obc_resets_str.to_i
      current_bat_volt_flt:
        value: current_bat_volt_int_str.to_i + (((current_bat_volt_int_str.to_i < 0).to_i)*(-2)+1) * current_bat_volt_frac_str.to_i / 100.0
      obc_clock:
        value: obc_clock_str.to_i
      current_3v3_flt:
        value: current_3v3_int_str.to_i + (((current_3v3_int_str.to_i < 0).to_i)*(-2)+1) * current_3v3_frac_str.to_i / 1000.0
      current_5v_flt:
        value: current_5v_int_str.to_i + (((current_5v_int_str.to_i < 0).to_i)*(-2)+1) * current_5v_frac_str.to_i / 1000.0
      current_adcs_flt:
        value: current_adcs_int_str.to_i + (((current_adcs_int_str.to_i < 0).to_i)*(-2)+1) * current_adcs_frac_str.to_i / 1000.0
      eps_charge_volt_bat_flt:
        value: eps_charge_volt_bat_int_str.to_i + (((eps_charge_volt_bat_int_str.to_i < 0).to_i)*(-2)+1) * eps_charge_volt_bat_frac_str.to_i / 100.0
      eps_charge_current_bat:
        value: eps_charge_current_bat_str.to_i
      eps_temp:
        value: eps_temp_str.to_i
      bat_temp:
        value: bat_temp_str.to_i
      brownouts:
        value: brownouts_str.to_i
      ax100_rssi:
        value: ax100_rssi_str.to_i
      ax100_board_temp:
        value: ax100_board_temp_str.to_i
      gps_sats_used:
        value: gps_sats_used_str.to_i
      ants_deployed:
        value: ants_deployed_str.to_i
      gpio_state:
        value: gpio_state_str.to_i
