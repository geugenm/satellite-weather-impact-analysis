---
meta:
  id: neutron1
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packet_type: ax25_frame.payload.ax25_info.packet_type
  :field utc: ax25_frame.payload.ax25_info.utc
  :field pos_eci_0: ax25_frame.payload.ax25_info.pos_eci_0
  :field pos_eci_1: ax25_frame.payload.ax25_info.pos_eci_1
  :field pos_eci_2: ax25_frame.payload.ax25_info.pos_eci_2
  :field vel_eci_0: ax25_frame.payload.ax25_info.vel_eci_0
  :field vel_eci_1: ax25_frame.payload.ax25_info.vel_eci_1
  :field vel_eci_2: ax25_frame.payload.ax25_info.vel_eci_2
  :field att_icrf_s_w: ax25_frame.payload.ax25_info.att_icrf_s_w
  :field att_icrf_s_x: ax25_frame.payload.ax25_info.att_icrf_s_x
  :field att_icrf_s_y: ax25_frame.payload.ax25_info.att_icrf_s_y
  :field att_icrf_s_z: ax25_frame.payload.ax25_info.att_icrf_s_z
  :field last_rssi_time: ax25_frame.payload.ax25_info.last_rssi_time
  :field batt_percent: ax25_frame.payload.ax25_info.batt_percent
  :field batt_volt: ax25_frame.payload.ax25_info.batt_volt
  :field batt_current: ax25_frame.payload.ax25_info.batt_current
  :field powgen: ax25_frame.payload.ax25_info.powgen
  :field eps_temp: ax25_frame.payload.ax25_info.eps_temp
  :field batt_temp: ax25_frame.payload.ax25_info.batt_temp
  :field cpu_temp: ax25_frame.payload.ax25_info.cpu_temp
  :field duplex_flag: ax25_frame.payload.ax25_info.duplex_flag
  :field nframes_recv_buf: ax25_frame.payload.ax25_info.nframes_recv_buf
  :field last_rssi: ax25_frame.payload.ax25_info.last_rssi
  :field antenna_deployed_status: ax25_frame.payload.ax25_info.antenna_deployed_status
  :field powmode: ax25_frame.payload.ax25_info.powmode
  :field callsign: ax25_frame.payload.ax25_info.callsign

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
      - id: ax25_info
        type: neutron1_beacon_t
  neutron1_beacon_t:
    meta:
      endian: le
    seq:
      - id: packet_type
        type: u1
      - id: utc
        type: f8
        doc: 'Coordinated Universal Time, Modified Julian Day'
      - id: pos_eci_0
        type: f8
        doc: 'Earth Centered Inertial X Position, Meters'
      - id: pos_eci_1
        type: f8
        doc: 'Earth Centered Inertial Y Position, Meters'
      - id: pos_eci_2
        type: f8
        doc: 'Earth Centered Inertial Z Position, Meters'
      - id: vel_eci_0
        type: f8
        doc: 'Earth Centered Inertial X Velocity, Meters/Sec'
      - id: vel_eci_1
        type: f8
        doc: 'Earth Centered Inertial Y Velocity, Meters/Sec'
      - id: vel_eci_2
        type: f8
        doc: 'Earth Centered Inertial Z Velocity, Meters/Sec'
      - id: att_icrf_s_w
        type: f8
      - id: att_icrf_s_x
        type: f8
      - id: att_icrf_s_y
        type: f8
      - id: att_icrf_s_z
        type: f8
      - id: last_rssi_time
        type: f8
        doc: 'Time of last RSS, Coordinated Universal Time, Modified Julian Day'
      - id: batt_percent
        type: f4
        doc: 'Battery Percent (device_batt_percent_000), 0. - 1'
      - id: batt_volt
        type: f4
        doc: 'Battery Voltage (device_batt_volt_000), Volts'
      - id: batt_current
        type: f4
        doc: 'Battery Current (device_batt_amp_000), Amps'
      - id: powgen
        type: f4
        doc: 'Coordinated Universal Time, Modified Julian Day'
      - id: eps_temp
        type: f4
        doc: 'K'
      - id: batt_temp
        type: f4
        doc: 'Battery Current (device_batt_temp_000)'
      - id: cpu_temp
        type: f4
        doc: 'CPU temp, K (device_cpu_temp_003)'
      - id: duplex_flag
        type: u4
        doc: 'Duplex state flag'
      - id: nframes_recv_buf
        type: u2
        doc: 'Number of frames in the receive buffer'
      - id: last_rssi
        type: u2
        doc: 'RSSI of most recently received frame'
      - id: antenna_deployed_status
        type: u2
        doc: 'Antenna deployed count'
      - id: powmode
        type: s2
      - id: callsign
        type: str
        size: 6
        encoding: utf-8
