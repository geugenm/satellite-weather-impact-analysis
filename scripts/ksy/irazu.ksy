---
meta:
  id: irazu
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field beacon_verf_code: ax25_frame.payload.ax25_info.data.beacon_verf_code
  :field time_sync: ax25_frame.payload.ax25_info.data.time_sync_int
  :field timestamp: ax25_frame.payload.ax25_info.data.timestamp
  :field mission_files: ax25_frame.payload.ax25_info.data.mission_files_int
  :field buffers_free: ax25_frame.payload.ax25_info.data.buffers_free_int
  :field last_rssi: ax25_frame.payload.ax25_info.data.last_rssi_int
  :field obc_temp1: ax25_frame.payload.ax25_info.data.obc_temp1_flt
  :field obc_temp2: ax25_frame.payload.ax25_info.data.obc_temp2_flt
  :field com_temp_pa: ax25_frame.payload.ax25_info.data.com_temp_pa_int
  :field com_temp_mcu: ax25_frame.payload.ax25_info.data.com_temp_mcu_int
  :field eps_temp_t4: ax25_frame.payload.ax25_info.data.eps_temp_t4_int
  :field bat_voltage: ax25_frame.payload.ax25_info.data.bat_voltage_int
  :field cur_sun: ax25_frame.payload.ax25_info.data.cur_sun_int
  :field cur_sys: ax25_frame.payload.ax25_info.data.cur_sys_int
  :field batt_mode: ax25_frame.payload.ax25_info.data.batt_mode_int
  :field panel1_voltage: ax25_frame.payload.ax25_info.data.panel1_voltage_int
  :field panel2_voltage: ax25_frame.payload.ax25_info.data.panel2_voltage_int
  :field panel3_voltage: ax25_frame.payload.ax25_info.data.panel3_voltage_int
  :field panel1_current: ax25_frame.payload.ax25_info.data.panel1_current_int
  :field panel2_current: ax25_frame.payload.ax25_info.data.panel2_current_int
  :field panel3_current: ax25_frame.payload.ax25_info.data.panel3_current_int
  :field bat_bootcount: ax25_frame.payload.ax25_info.data.bat_bootcount_int
  :field gyro_x: ax25_frame.payload.ax25_info.data.gyro_x_flt
  :field gyro_y: ax25_frame.payload.ax25_info.data.gyro_y_flt
  :field gyro_z: ax25_frame.payload.ax25_info.data.gyro_z_flt
  :field magneto_x: ax25_frame.payload.ax25_info.data.magneto_x_flt
  :field magneto_y: ax25_frame.payload.ax25_info.data.magneto_y_flt
  :field magneto_z: ax25_frame.payload.ax25_info.data.magneto_z_flt

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
      - id: data
        type:
          switch-on: tlm_type
          cases:
            0x42: beacon
    instances:
      tlm_type:
        pos: 4
        type: u1
  beacon:
    seq:
      - id: prefix
        size: 4
      - id: beacon_verf_code
        -orig-id: beacon_verf_code
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Beacon Verififcation Code = 'B'
      - id: time_sync_label
        -orig-id: time_sync_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Timestamp Sync Label "time_sync:"
      - id: time_sync
        -orig-id: time_sync
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Timestamp sync, 0 = Timestamp No sync, 1 = Timestamp sync
      - id: timestamp_label
        -orig-id: timestamp_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Timestamp Label "time:"
      - id: timestamp
        -orig-id: timestamp
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Timestamp with format:
          01-01-1970_00:17:05.527
          "dd-mm-yyyy_hh:mm:ss.mil"
      - id: mission_files_label
        -orig-id: mission_files_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Mission Files Label "files:"
      - id: mission_files
        -orig-id: mission_files
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Total Mission Files on memory
      - id: buffers_free_label
        -orig-id: buffers_free_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          CSP Buffers Free Label
      - id: buffers_free
        -orig-id: buffers_free
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          CSP Buffers Free
      - id: last_rssi_label
        -orig-id: last_rssi_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Last rssi Label
      - id: last_rssi
        -orig-id: last_rssi
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Last rssi
      - id: obc_temperature_label
        -orig-id: obc_temperature_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          OBC Temperature Sensor 1 and 2 Label
      - id: obc_temp1_int
        -orig-id: obc_temp1
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          OBC temp value from sensor 1 in ° C
      - id: obc_temp1_frac
        -orig-id: obc_temp1
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          OBC temp value from sensor 1 in ° C
      - id: obc_temp2_int
        -orig-id: obc_temp2
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          OBC temp value from sensor 2 in ° C
      - id: obc_temp2_frac
        -orig-id: obc_temp2
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          OBC temp value from sensor 2 in ° C
      - id: com_temperature_label
        -orig-id: com_temperature_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          COM Temperature PA and Temperature MCU
      - id: com_temp_pa
        -orig-id: com_temp_pa
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          COM temp value from PA in ° C
      - id: com_temp_mcu
        -orig-id: com_temp_mcu
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          COM temp value from MCU in ° C
      - id: eps_temp_label
        -orig-id: eps_temp_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          EPS Temperature Sensor T4
      - id: eps_temp_t4
        -orig-id: eps_temp_t4
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          EPS temp value from sensor T4 in ° C
      - id: bat_voltage_label
        -orig-id: bat_voltage_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Battery Voltage
      - id: bat_voltage
        -orig-id: bat_voltage
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Voltage of battery in mV
      - id: cur_sun_label
        -orig-id: cur_sun_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Current from boost converters Label
      - id: cur_sun
        -orig-id: cur_sun
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Input current from boost converters in mA
      - id: cur_sys_label
        -orig-id: cur_sys_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Current out of battery label
      - id: cur_sys
        -orig-id: cur_sys
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Current out of battery [mA]
      - id: batt_mode_label
        -orig-id: batt_mode_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Battery mode
      - id: batt_mode
        -orig-id: batt_mode
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Mode for battery [0 = normal, 1 = undervoltage, 2 = overvoltage]
      - id: panels_voltage_label
        -orig-id: panels_voltage_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Photo-voltaic input voltage label
      - id: panel1_voltage
        -orig-id: panel1_voltage
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Photo-voltaic 1 input voltage [mV]
      - id: panel2_voltage
        -orig-id: panel2_voltage
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Photo-voltaic 2 input voltage [mV]
      - id: panel3_voltage
        -orig-id: panel3_voltage
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Photo-voltaic 3 input voltage [mV]
      - id: panels_current_label
        -orig-id: panels_current_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Photo-voltaic input current label
      - id: panel1_current
        -orig-id: panel1_current
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Photo-voltaic 1 input current [mA]
      - id: panel2_current
        -orig-id: panel2_current
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Photo-voltaic 2 input current [mA]
      - id: panel3_current
        -orig-id: panel3_current
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Photo-voltaic 3 input current [mA]
      - id: bat_bootcount_label
        type: str
        size: 1
        encoding: utf-8
      - id: bat_bootcount
        type: str
        terminator: 0x2c
        encoding: utf-8
      - id: gyro_label
        -orig-id: gyro_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Gyroscope  x,y,z rates Label
      - id: gyro_x_int
        -orig-id: gyro_x
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Gyro x rate as degrees/s
      - id: gyro_x_frac
        -orig-id: gyro_x
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Gyro x rate as degrees/s
      - id: gyro_y_int
        -orig-id: gyro_y
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Gyro y rate as degrees/s
      - id: gyro_y_frac
        -orig-id: gyro_y
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Gyro y rate as degrees/s
      - id: gyro_z_int
        -orig-id: gyro_z
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Gyro z rate as degrees/s
      - id: gyro_z_frac
        -orig-id: gyro_z
        type: str
        terminator: 0x2c
        encoding: utf-8
        doc: |
          Gyro z rate as degrees/s
      - id: magneto_label
        -orig-id: magneto_label
        type: str
        size: 1
        encoding: utf-8
        doc: |
          Magnetometer x,y,z rates Label
      - id: magneto_x_int
        -orig-id: magneto_x
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Magneto x rate in milli Gauss
      - id: magneto_x_frac
        -orig-id: magneto_x
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Magneto x rate in milli Gauss
      - id: magneto_y_int
        -orig-id: magneto_y
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Magneto y rate in milli Gauss
      - id: magneto_y_frac
        -orig-id: magneto_y
        type: str
        terminator: 0x2f
        encoding: utf-8
        doc: |
          Magneto y rate in milli Gauss
      - id: magneto_z_int
        -orig-id: magneto_z
        type: str
        terminator: 0x2e
        encoding: utf-8
        doc: |
          Magneto z rate in milli Gauss
      - id: magneto_z_frac
        -orig-id: magneto_z
        type: str
        terminator: 0
        encoding: utf-8
        doc: |
          Magneto z rate in milli Gauss
      - id: suffix
        size: 5
    instances:
      time_sync_int:
        value: time_sync.to_i
        doc: 'A'
      mission_files_int:
        value: mission_files.to_i
        doc: 'D'
      buffers_free_int:
        value: buffers_free.to_i
        doc: 'E'
      last_rssi_int:
        value: last_rssi.to_i
        doc: 'F'
      obc_temp1_flt:
        value: obc_temp1_int.to_i + (((obc_temp1_int.to_i < 0).to_i)*(-2)+1) * obc_temp1_frac.to_i / 100.0
        doc: 'G[0]'
      obc_temp2_flt:
        value: obc_temp2_int.to_i + (((obc_temp2_int.to_i < 0).to_i)*(-2)+1) * obc_temp2_frac.to_i / 100.0
        doc: 'G[1]'
      com_temp_pa_int:
        value: com_temp_pa.to_i
        doc: 'H[0]'
      com_temp_mcu_int:
        value: com_temp_mcu.to_i
        doc: 'H[1]'
      eps_temp_t4_int:
        value: eps_temp_t4.to_i
        doc: 'I'
      bat_voltage_int:
        value: bat_voltage.to_i
        doc: 'J'
      cur_sun_int:
        value: cur_sun.to_i
        doc: 'K'
      cur_sys_int:
        value: cur_sys.to_i
        doc: 'L'
      batt_mode_int:
        value: batt_mode.to_i
        doc: 'M'
      panel1_voltage_int:
        value: panel1_voltage.to_i
        doc: 'N[0]'
      panel2_voltage_int:
        value: panel2_voltage.to_i
        doc: 'N[1]'
      panel3_voltage_int:
        value: panel3_voltage.to_i
        doc: 'N[2]'
      panel1_current_int:
        value: panel1_current.to_i
        doc: 'O[0]'
      panel2_current_int:
        value: panel2_current.to_i
        doc: 'O[1]'
      panel3_current_int:
        value: panel3_current.to_i
        doc: 'O[2]'
      bat_bootcount_int:
        value: bat_bootcount.to_i
        doc: 'P'
      gyro_x_flt:
        value: gyro_x_int.to_i + (((gyro_x_int.to_i < 0).to_i)*(-2)+1) * gyro_x_frac.to_i / 1000000.0
        doc: 'Q[0]'
      gyro_y_flt:
        value: gyro_y_int.to_i + (((gyro_y_int.to_i < 0).to_i)*(-2)+1) * gyro_y_frac.to_i / 1000000.0
        doc: 'Q[1]'
      gyro_z_flt:
        value: gyro_z_int.to_i + (((gyro_z_int.to_i < 0).to_i)*(-2)+1) * gyro_z_frac.to_i / 1000000.0
        doc: 'Q[2]'
      magneto_x_flt:
        value: magneto_x_int.to_i + (((magneto_x_int.to_i < 0).to_i)*(-2)+1) * magneto_x_frac.to_i / 1000.0
        doc: 'R[0]'
      magneto_y_flt:
        value: magneto_y_int.to_i + (((magneto_y_int.to_i < 0).to_i)*(-2)+1) * magneto_y_frac.to_i / 1000.0
        doc: 'R[1]'
      magneto_z_flt:
        value: magneto_z_int.to_i + (((magneto_z_int.to_i < 0).to_i)*(-2)+1) * magneto_z_frac.to_i / 1000.0
        doc: 'R[2]'
