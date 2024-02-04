---
meta:
  id: skcube
  title: skCUBE Telemetry Decoder
  endian: le
doc-ref: http://www.skcube.sk/wp-content/uploads/2016/06/skcube_data_structures.xlsx
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packet_type: ax25_frame.payload.ax25_info.packet_type
  :field adcs_mode: ax25_frame.payload.ax25_info.telemetry.adcs_mode
  :field bd_k: ax25_frame.payload.ax25_info.telemetry.bd_k
  :field max_pwm_coil_x: ax25_frame.payload.ax25_info.telemetry.max_pwm_coil_x
  :field max_pwm_coil_y: ax25_frame.payload.ax25_info.telemetry.max_pwm_coil_y
  :field max_pwm_coil_z: ax25_frame.payload.ax25_info.telemetry.max_pwm_coil_z
  :field sun_x_p_x: ax25_frame.payload.ax25_info.telemetry.sun_x_p_x
  :field sun_x_p_y: ax25_frame.payload.ax25_info.telemetry.sun_x_p_y
  :field sun_x_p_irradiation: ax25_frame.payload.ax25_info.telemetry.sun_x_p_irradiation
  :field sun_x_m_x: ax25_frame.payload.ax25_info.telemetry.sun_x_m_x
  :field sun_x_m_y: ax25_frame.payload.ax25_info.telemetry.sun_x_m_y
  :field sun_x_m_irradiation: ax25_frame.payload.ax25_info.telemetry.sun_x_m_irradiation
  :field sun_y_p_x: ax25_frame.payload.ax25_info.telemetry.sun_y_p_x
  :field sun_y_p_y: ax25_frame.payload.ax25_info.telemetry.sun_y_p_y
  :field sun_y_p_irradiation: ax25_frame.payload.ax25_info.telemetry.sun_y_p_irradiation
  :field sun_y_m_x: ax25_frame.payload.ax25_info.telemetry.sun_y_m_x
  :field sun_y_m_y: ax25_frame.payload.ax25_info.telemetry.sun_y_m_y
  :field sun_y_m_irradiation: ax25_frame.payload.ax25_info.telemetry.sun_y_m_irradiation
  :field sun_z_p_x: ax25_frame.payload.ax25_info.telemetry.sun_z_p_x
  :field sun_z_p_y: ax25_frame.payload.ax25_info.telemetry.sun_z_p_y
  :field sun_z_p_irradiation: ax25_frame.payload.ax25_info.telemetry.sun_z_p_irradiation
  :field sun_z_m_x: ax25_frame.payload.ax25_info.telemetry.sun_z_m_x
  :field sun_z_m_y: ax25_frame.payload.ax25_info.telemetry.sun_z_m_y
  :field sun_z_m_irradiation: ax25_frame.payload.ax25_info.telemetry.sun_z_m_irradiation
  :field gyroscopex: ax25_frame.payload.ax25_info.telemetry.gyroscopex
  :field gyroscopey: ax25_frame.payload.ax25_info.telemetry.gyroscopey
  :field gyroscopez: ax25_frame.payload.ax25_info.telemetry.gyroscopez
  :field gyroscope_temp: ax25_frame.payload.ax25_info.telemetry.gyroscope_temp
  :field magnetometer_1_x: ax25_frame.payload.ax25_info.telemetry.magnetometer_1_x
  :field magnetometer_1_y: ax25_frame.payload.ax25_info.telemetry.magnetometer_1_y
  :field magnetometer_1_z: ax25_frame.payload.ax25_info.telemetry.magnetometer_1_z
  :field magnetometer_1_temp: ax25_frame.payload.ax25_info.telemetry.magnetometer_1_temp
  :field magnetometer_2_x: ax25_frame.payload.ax25_info.telemetry.magnetometer_2_x
  :field magnetometer_2_y: ax25_frame.payload.ax25_info.telemetry.magnetometer_2_y
  :field magnetometer_2_z: ax25_frame.payload.ax25_info.telemetry.magnetometer_2_z
  :field magnetometer_2_temp: ax25_frame.payload.ax25_info.telemetry.magnetometer_2_temp
  :field accelerometer_x: ax25_frame.payload.ax25_info.telemetry.accelerometer_x
  :field accelerometer_y: ax25_frame.payload.ax25_info.telemetry.accelerometer_y
  :field accelerometer_z: ax25_frame.payload.ax25_info.telemetry.accelerometer_z
  :field accel_temp: ax25_frame.payload.ax25_info.telemetry.accel_temp
  :field earth_sensor_x_m: ax25_frame.payload.ax25_info.telemetry.earth_sensor_x_m
  :field earth_sensor_x_p: ax25_frame.payload.ax25_info.telemetry.earth_sensor_x_p
  :field earth_sensor_y_m: ax25_frame.payload.ax25_info.telemetry.earth_sensor_y_m
  :field earth_sensor_y_p: ax25_frame.payload.ax25_info.telemetry.earth_sensor_y_p
  :field timestamp: ax25_frame.payload.ax25_info.telemetry.timestamp
  :field fwversion: ax25_frame.payload.ax25_info.telemetry.fwversion
  :field activecom: ax25_frame.payload.ax25_info.telemetry.activecom
  :field digipeatermode: ax25_frame.payload.ax25_info.telemetry.digipeatermode
  :field noofreboots: ax25_frame.payload.ax25_info.telemetry.noofreboots
  :field outputreflpower: ax25_frame.payload.ax25_info.telemetry.outputreflpower
  :field outputforwardpower: ax25_frame.payload.ax25_info.telemetry.outputforwardpower
  :field outputreflpowercw: ax25_frame.payload.ax25_info.telemetry.outputreflpowercw
  :field outputforwardpowercw: ax25_frame.payload.ax25_info.telemetry.outputforwardpowercw
  :field rssi: ax25_frame.payload.ax25_info.telemetry.rssi
  :field rssinoise: ax25_frame.payload.ax25_info.telemetry.rssinoise
  :field mcutemperature: ax25_frame.payload.ax25_info.telemetry.mcutemperature
  :field patemperature: ax25_frame.payload.ax25_info.telemetry.patemperature
  :field cwbeaconsent: ax25_frame.payload.ax25_info.telemetry.cwbeaconsent
  :field packetsent: ax25_frame.payload.ax25_info.telemetry.packetsent
  :field correctpacketsreceived: ax25_frame.payload.ax25_info.telemetry.correctpacketsreceived
  :field brokenpacketsreceived: ax25_frame.payload.ax25_info.telemetry.brokenpacketsreceived
  :field comprotocolerror: ax25_frame.payload.ax25_info.telemetry.comprotocolerror
  :field gsprotocolerror: ax25_frame.payload.ax25_info.telemetry.gsprotocolerror
  :field txdisablestatus: ax25_frame.payload.ax25_info.telemetry.txdisablestatus
  :field orbittime: ax25_frame.payload.ax25_info.telemetry.orbittime
  :field timeslotstart: ax25_frame.payload.ax25_info.telemetry.timeslotstart
  :field timeslotend: ax25_frame.payload.ax25_info.telemetry.timeslotend
  :field fw_version: ax25_frame.payload.ax25_info.telemetry.fw_version
  :field number_of_reboots: ax25_frame.payload.ax25_info.telemetry.number_of_reboots
  :field jpeg_compression: ax25_frame.payload.ax25_info.telemetry.jpeg_compression
  :field jpeg_scale: ax25_frame.payload.ax25_info.telemetry.jpeg_scale
  :field mcu_temperature: ax25_frame.payload.ax25_info.telemetry.mcu_temperature
  :field vref_internal: ax25_frame.payload.ax25_info.telemetry.vref_internal
  :field packets_sent: ax25_frame.payload.ax25_info.telemetry.packets_sent
  :field cw_sent: ax25_frame.payload.ax25_info.telemetry.cw_sent
  :field flash_image_position: ax25_frame.payload.ax25_info.telemetry.flash_image_position
  :field tx_datarate: ax25_frame.payload.ax25_info.telemetry.tx_datarate
  :field fulluptime: ax25_frame.payload.ax25_info.telemetry.fulluptime
  :field uptime: ax25_frame.payload.ax25_info.telemetry.uptime
  :field active_procesor: ax25_frame.payload.ax25_info.telemetry.active_procesor
  :field countcomerrors: ax25_frame.payload.ax25_info.telemetry.countcomerrors
  :field countpsuerrors: ax25_frame.payload.ax25_info.telemetry.countpsuerrors
  :field solar_j_current: ax25_frame.payload.ax25_info.telemetry.solar_j_current
  :field solar_k_current: ax25_frame.payload.ax25_info.telemetry.solar_k_current
  :field solar_l_current: ax25_frame.payload.ax25_info.telemetry.solar_l_current
  :field solar_m_current: ax25_frame.payload.ax25_info.telemetry.solar_m_current
  :field solar_u_current: ax25_frame.payload.ax25_info.telemetry.solar_u_current
  :field solar_d_current: ax25_frame.payload.ax25_info.telemetry.solar_d_current
  :field solar_j_temp: ax25_frame.payload.ax25_info.telemetry.solar_j_temp
  :field solar_k_temp: ax25_frame.payload.ax25_info.telemetry.solar_k_temp
  :field solar_l_temp: ax25_frame.payload.ax25_info.telemetry.solar_l_temp
  :field solar_m_temp: ax25_frame.payload.ax25_info.telemetry.solar_m_temp
  :field solar_u_temp: ax25_frame.payload.ax25_info.telemetry.solar_u_temp
  :field solar_d_temp: ax25_frame.payload.ax25_info.telemetry.solar_d_temp
  :field battery_a_voltage: ax25_frame.payload.ax25_info.telemetry.battery_a_voltage
  :field battery_b_voltage: ax25_frame.payload.ax25_info.telemetry.battery_b_voltage
  :field battery_temp: ax25_frame.payload.ax25_info.telemetry.battery_temp
  :field battery_a_capacity: ax25_frame.payload.ax25_info.telemetry.battery_b_capacity
  :field bat_capacity: ax25_frame.payload.ax25_info.telemetry.bat_capacity
  :field battery_a_current: ax25_frame.payload.ax25_info.telemetry.battery_a_current
  :field battery_b_current: ax25_frame.payload.ax25_info.telemetry.battery_b_current
  :field battery_a_min_current: ax25_frame.payload.ax25_info.telemetry.battery_a_min_current
  :field battery_b_min_current: ax25_frame.payload.ax25_info.telemetry.battery_b_min_current
  :field battery_a_max_current: ax25_frame.payload.ax25_info.telemetry.battery_a_max_current
  :field battery_b_max_current: ax25_frame.payload.ax25_info.telemetry.battery_b_max_current
  :field battery_a_avg_current: ax25_frame.payload.ax25_info.telemetry.battery_a_avg_current
  :field battery_b_avg_current: ax25_frame.payload.ax25_info.telemetry.battery_b_avg_current
  :field chds_min_current: ax25_frame.payload.ax25_info.telemetry.chds_min_current
  :field chds_max_current: ax25_frame.payload.ax25_info.telemetry.chds_max_current
  :field chds_avg_current: ax25_frame.payload.ax25_info.telemetry.chds_avg_current
  :field chds_actual_current: ax25_frame.payload.ax25_info.telemetry.chds_actual_current
  :field cam_min_current: ax25_frame.payload.ax25_info.telemetry.cam_min_current
  :field cam_max_current: ax25_frame.payload.ax25_info.telemetry.cam_max_current
  :field cam_avg_current: ax25_frame.payload.ax25_info.telemetry.cam_avg_current
  :field cam_actual_current: ax25_frame.payload.ax25_info.telemetry.cam_actual_current
  :field exp_min_current: ax25_frame.payload.ax25_info.telemetry.exp_min_current
  :field exp_max_current: ax25_frame.payload.ax25_info.telemetry.exp_max_current
  :field exp_avg_current: ax25_frame.payload.ax25_info.telemetry.exp_avg_current
  :field exp_actual_current: ax25_frame.payload.ax25_info.telemetry.exp_actual_current
  :field adcs_min_current: ax25_frame.payload.ax25_info.telemetry.adcs_min_current
  :field adcs_max_current: ax25_frame.payload.ax25_info.telemetry.adcs_max_current
  :field adcs_avg_current: ax25_frame.payload.ax25_info.telemetry.adcs_avg_current
  :field adcs_actual_current: ax25_frame.payload.ax25_info.telemetry.adcs_actual_current
  :field sys_voltage_min: ax25_frame.payload.ax25_info.telemetry.sys_voltage_min
  :field sys_voltage_max: ax25_frame.payload.ax25_info.telemetry.sys_voltage_max
  :field sys_voltage_actual: ax25_frame.payload.ax25_info.telemetry.sys_voltage_actual
  :field nadprudy: ax25_frame.payload.ax25_info.telemetry.nadprudy
  :field stav_pripojenia: ax25_frame.payload.ax25_info.telemetry.stav_pripojenia
  :field ts_temp: ax25_frame.payload.ax25_info.telemetry.ts_temp
  :field countpacket: ax25_frame.payload.ax25_info.telemetry.countpacket
  :field psu_error: ax25_frame.payload.ax25_info.telemetry.psu_error
  :field psu_lasterror: ax25_frame.payload.ax25_info.telemetry.psu_lasterror
  :field com_error: ax25_frame.payload.ax25_info.telemetry.com_error
  :field com_lasterror: ax25_frame.payload.ax25_info.telemetry.com_lasterror
  :field cdhs_i_limit: ax25_frame.payload.ax25_info.telemetry.cdhs_i_limit
  :field com_i_limit: ax25_frame.payload.ax25_info.telemetry.com_i_limit
  :field cam_i_limit: ax25_frame.payload.ax25_info.telemetry.cam_i_limit
  :field adcs_i_limit: ax25_frame.payload.ax25_info.telemetry.adcs_i_limit
  :field exp_i_limit: ax25_frame.payload.ax25_info.telemetry.exp_i_limit
  :field cam_uv_limit: ax25_frame.payload.ax25_info.telemetry.cam_uv_limit
  :field adcs_uv_limit: ax25_frame.payload.ax25_info.telemetry.adcs_uv_limit
  :field bat1_vmax: ax25_frame.payload.ax25_info.telemetry.bat1_vmax
  :field bat1_vmin: ax25_frame.payload.ax25_info.telemetry.bat1_vmin
  :field bat2_vmax: ax25_frame.payload.ax25_info.telemetry.bat2_vmax
  :field bat2_vmin: ax25_frame.payload.ax25_info.telemetry.bat2_vmin
  :field endofdata: ax25_frame.payload.ax25_info.telemetry.endofdata
  :field active_adc_channel: ax25_frame.payload.ax25_info.telemetry.active_adc_channel
  :field fft_gain: ax25_frame.payload.ax25_info.telemetry.fft_gain
  :field low_frequency: ax25_frame.payload.ax25_info.telemetry.low_frequency
  :field high_frequency: ax25_frame.payload.ax25_info.telemetry.high_frequency
  :field max_hold_sec: ax25_frame.payload.ax25_info.telemetry.max_hold_sec
  :field slow_position: ax25_frame.payload.ax25_info.telemetry.slow_position
  :field postring_samples: ax25_frame.payload.ax25_info.telemetry.postring_samples
  :field psd: ax25_frame.payload.ax25_info.telemetry.psd
  :field psd_max: ax25_frame.payload.ax25_info.telemetry.psd_max
  :field psd_selected: ax25_frame.payload.ax25_info.telemetry.psd_selected
  :field psd_selected_max: ax25_frame.payload.ax25_info.telemetry.psd_selected_max
  :field peak_freq: ax25_frame.payload.ax25_info.telemetry.peak_freq
  :field peak_amp: ax25_frame.payload.ax25_info.telemetry.peak_amp
  :field psd_threshold: ax25_frame.payload.ax25_info.telemetry.psd_threshold
  :field psd_selected_events: ax25_frame.payload.ax25_info.telemetry.psd_selected_events
  :field events_position: ax25_frame.payload.ax25_info.telemetry.events_position
  :field event_time_1: ax25_frame.payload.ax25_info.telemetry.event_time_1
  :field event_time_2: ax25_frame.payload.ax25_info.telemetry.event_time_2
  :field event_time_3: ax25_frame.payload.ax25_info.telemetry.event_time_3
  :field event_time_4: ax25_frame.payload.ax25_info.telemetry.event_time_4
  :field event_time_5: ax25_frame.payload.ax25_info.telemetry.event_time_5
  :field event_time_6: ax25_frame.payload.ax25_info.telemetry.event_time_6
  :field event_time_7: ax25_frame.payload.ax25_info.telemetry.event_time_7
  :field event_time_8: ax25_frame.payload.ax25_info.telemetry.event_time_8
  :field event_time_9: ax25_frame.payload.ax25_info.telemetry.event_time_9
  :field event_time_10: ax25_frame.payload.ax25_info.telemetry.event_time_10
  :field message: ax25_frame.payload.ax25_info.telemetry.message

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
        type:
          switch-on: pid
          cases:
            0xF0: skcube_frame
        size-eos: true

  skcube_frame:
    seq:
      - id: telemetry
        type:
          switch-on: packet_type
          cases:
            2: block2_adcs
            3: block3_com
            4: block4_cam
            5: block5_pwr
            6: block6_exp
            _: block_message
    types:
      block2_adcs:
        seq:
          - id: packet_type_holder
            type: u1
          - id: adcs_mode
            type: u1
            doc: "ADCS mode"
          - id: bd_k
            type: u1
            doc: "bd_k"
          - id: max_pwm_coil_x
            type: u1
            doc: "Max PWM coil X"
          - id: max_pwm_coil_y
            type: u1
            doc: "Max PWM coil Y"
          - id: max_pwm_coil_z
            type: u1
            doc: "Max PWM coil Z"
          - id: sun_x_p_x
            type: s2
            doc: "SUN X+ (x)"
          - id: sun_x_p_y
            type: s2
            doc: "SUN X+ (y)"
          - id: sun_x_p_irradiation
            type: u1
            doc: "SUN X+ irradiation"
          - id: sun_x_m_x
            type: s2
            doc: "SUN X- (x)"
          - id: sun_x_m_y
            type: s2
            doc: "SUN X- (y)"
          - id: sun_x_m_irradiation
            type: u1
            doc: "SUN X- irradiation"
          - id: sun_y_p_x
            type: s2
            doc: "SUN Y+ (x)"
          - id: sun_y_p_y
            type: s2
            doc: "SUN Y+ (y)"
          - id: sun_y_p_irradiation
            type: u1
            doc: "SUN Y+ irradiation"
          - id: sun_y_m_x
            type: s2
            doc: "SUN Y- (x)"
          - id: sun_y_m_y
            type: s2
            doc: "SUN Y- (y)"
          - id: sun_y_m_irradiation
            type: u1
            doc: "SUN Y- irradiation"
          - id: sun_z_p_x
            type: s2
            doc: "SUN Z+ (x)"
          - id: sun_z_p_y
            type: s2
            doc: "SUN Z+ (y)"
          - id: sun_z_p_irradiation
            type: u1
            doc: "SUN Z+ irradiation"
          - id: sun_z_m_x
            type: s2
            doc: "SUN Z- (x)"
          - id: sun_z_m_y
            type: s2
            doc: "SUN Z- (y)"
          - id: sun_z_m_irradiation
            type: u1
            doc: "SUN Z- irradiation"
          - id: gyroscope_x
            type: u2
            doc: "Gyroscope X"
          - id: gyroscope_y
            type: u2
            doc: "Gyroscope Y"
          - id: gyroscope_z
            type: u2
            doc: "Gyroscope Z"
          - id: gyroscope_temp
            type: u2
            doc: "Gyroscope temp"
          - id: magnetometer_1_x
            type: u2
            doc: "Magnetometer 1 X"
          - id: magnetometer_1_y
            type: u2
            doc: "Magnetometer 1 Y"
          - id: magnetometer_1_z
            type: u2
            doc: "Magnetometer 1 Z"
          - id: magnetometer_1_temp
            type: u2
            doc: "Magnetometer 1 temp"
          - id: magnetometer_2_x
            type: u2
            doc: "Magnetometer 2 X"
          - id: magnetometer_2_y
            type: u2
            doc: "Magnetometer 2 Y"
          - id: magnetometer_2_z
            type: u2
            doc: "Magnetometer 2 Z"
          - id: magnetometer_2_temp
            type: u2
            doc: "Magnetometer 2 temp"
          - id: accelerometer_x
            type: u2
            doc: "Accelerometer X"
          - id: accelerometer_y
            type: u2
            doc: "Accelerometer Y"
          - id: accelerometer_z
            type: u2
            doc: "Accelerometer Z"
          - id: accel_temp
            type: u2
            doc: "Accel temp"
          - id: earth_sensor_x_p
            type: u2
            doc: "Earth sensor X+"
          - id: earth_sensor_x_m
            type: u2
            doc: "Earth sensor X-"
          - id: earth_sensor_y_p
            type: u2
            doc: "Earth sensor Y+"
          - id: earth_sensor_y_m
            type: u2
            doc: "Earth sensor Y-"
      block3_com:
        seq:
          - id: packet_type_holder
            type: u1
          - id: timestamp
            type: u4
          - id: fwversion
            type: u2
          - id: activecom
            type: u1
          - id: digipeatermode
            type: u1
          - id: noofreboots
            type: u2
          - id: outputreflpower
            type: u2
          - id: outputforwardpower
            type: u2
          - id: outputreflpowercw
            type: u2
          - id: outputforwardpowercw
            type: u2
          - id: rssi
            type: u2
          - id: rssinoise
            type: u2
          - id: mcutemperature
            type: s1
          - id: patemperature
            type: s1
          - id: cwbeaconsent
            type: u2
          - id: packetsent
            type: u2
          - id: correctpacketsreceived
            type: u2
          - id: brokenpacketsreceived
            type: u2
          - id: comprotocolerror
            type: u2
          - id: gsprotocolerror
            type: u2
          - id: txdisablestatus
            type: u1
          - id: orbittime
            type: u1
          - id: timeslotstart
            type: u1
          - id: timeslotend
            type: u1
      block4_cam:
        seq:
          - id: packet_type_holder
            type: u1
          - id: timestamp
            type: u4
            doc: "Timestamp"
          - id: fw_version
            type: u2
            doc: "FW version"
          - id: number_of_reboots
            type: u2
            doc: "Number of reboots"
          - id: jpeg_compression
            type: u1
            doc: "JPEG compression"
          - id: jpeg_scale
            type: u1
            doc: "JPEG scale"
          - id: mcu_temperature
            type: s1
            doc: "MCU Temperature"
          - id: vref_internal
            type: u2
            doc: "Vref internal"
          - id: packets_sent
            type: u2
            doc: "Packets sent"
          - id: cw_sent
            type: u2
            doc: "CW sent"
          - id: flash_image_position
            type: u1
            doc: "Flash image position"
          - id: tx_datarate
            type: u1
            doc: "TX datarate"
      block5_pwr:
        seq:
          - id: packet_type_holder
            type: u1
          - id: timestamp
            type: u4
            doc: "Timestamp"
          - id: fulluptime
            type: u4
            doc: "FullUptime"
          - id: uptime
            type: u4
            doc: "Uptime"
          - id: active_procesor
            type: u2
            doc: "Active procesor"
          - id: fw_version
            type: u2
            doc: "FW version"
          - id: number_of_reboots
            type: u2
            doc: "Number of reboots"
          - id: countcomerrors
            type: u2
            doc: "CountComErrors"
          - id: countpsuerrors
            type: u2
            doc: "CountPSUErrors"
          - id: solar_j_current
            type: s2
            doc: "Solar J current"
          - id: solar_k_current
            type: s2
            doc: "Solar K current"
          - id: solar_l_current
            type: s2
            doc: "Solar L current"
          - id: solar_m_current
            type: s2
            doc: "Solar M current"
          - id: solar_u_current
            type: s2
            doc: "Solar U current"
          - id: solar_d_current
            type: s2
            doc: "Solar D current"
          - id: solar_j_temp
            type: s2
            doc: "Solar J temp"
          - id: solar_k_temp
            type: s2
            doc: "Solar K temp"
          - id: solar_l_temp
            type: s2
            doc: "Solar L temp"
          - id: solar_m_temp
            type: s2
            doc: "Solar M temp"
          - id: solar_u_temp
            type: s2
            doc: "Solar U temp"
          - id: solar_d_temp
            type: s2
            doc: "Solar D temp"
          - id: battery_a_voltage
            type: s2
            doc: "Battery A voltage"
          - id: battery_b_voltage
            type: s2
            doc: "Battery B voltage"
          - id: battery_temp
            type: s2
            doc: "Battery temp"
          - id: battery_a_capacity
            type: u2
            doc: "Battery A capacity"
          - id: battery_b_capacity
            type: u2
            doc: "Battery B capacity"
          - id: bat_capacity
            type: u2
            doc: "Bat Capacity (math 0-100%)"
          - id: battery_a_current
            type: s2
            doc: "Battery A current"
          - id: battery_b_current
            type: s2
            doc: "Battery B current"
          - id: battery_a_min_current
            type: s2
            doc: "Battery A min current"
          - id: battery_b_min_current
            type: s2
            doc: "Battery B min current"
          - id: battery_a_max_current
            type: s2
            doc: "Battery A max current"
          - id: battery_b_max_current
            type: s2
            doc: "Battery B max current"
          - id: battery_a_avg_current
            type: s2
            doc: "Battery A avg current"
          - id: battery_b_avg_current
            type: s2
            doc: "Battery B avg current"
          - id: chds_min_current
            type: s2
            doc: "CHDS min current"
          - id: chds_max_current
            type: s2
            doc: "CHDS max current"
          - id: chds_avg_current
            type: s2
            doc: "CHDS avg current"
          - id: chds_actual_current
            type: s2
            doc: "CHDS actual current"
          - id: com_min_current
            type: s2
            doc: "COM min current"
          - id: com_max_current
            type: s2
            doc: "COM max current"
          - id: com_avg_current
            type: s2
            doc: "COM avg current"
          - id: com_actual_current
            type: s2
            doc: "COM actual current"
          - id: cam_min_current
            type: s2
            doc: "CAM min current"
          - id: cam_max_current
            type: s2
            doc: "CAM max current"
          - id: cam_avg_current
            type: s2
            doc: "CAM avg current"
          - id: cam_actual_current
            type: s2
            doc: "CAM actual current"
          - id: exp_min_current
            type: s2
            doc: "EXP min current"
          - id: exp_max_current
            type: s2
            doc: "EXP max current"
          - id: exp_avg_current
            type: s2
            doc: "EXP avg current"
          - id: exp_actual_current
            type: s2
            doc: "EXP actual current"
          - id: adcs_min_current
            type: s2
            doc: "ADCS min current"
          - id: adcs_max_current
            type: s2
            doc: "ADCS max current"
          - id: adcs_avg_current
            type: s2
            doc: "ADCS avg current"
          - id: adcs_actual_current
            type: s2
            doc: "ADCS actual current"
          - id: sys_voltage_min
            type: u2
            doc: "SYS voltage min"
          - id: sys_voltage_max
            type: u2
            doc: "SYS voltage max"
          - id: sys_voltage_actual
            type: u2
            doc: "SYS voltage actual"
          - id: nadprudy
            type: u2
            doc: "Nadprudy"
          - id: stav_pripojenia
            type: u2
            doc: "Stav pripojenia"
          - id: ts_temp
            type: s2
            doc: "TS_Temp"
          - id: countpacket
            type: u4
            doc: "CountPacket"
          - id: psu_error
            type: u2
            doc: "PSU_Error"
          - id: psu_lasterror
            type: u2
            doc: "PSU_Lasterror"
          - id: com_error
            type: u2
            doc: "COM_error"
          - id: com_lasterror
            type: u2
            doc: "COM_Lasterror"
          - id: cdhs_i_limit
            type: u1
            doc: "CDHS_I_limit"
          - id: com_i_limit
            type: u1
            doc: "COM_I_limit"
          - id: cam_i_limit
            type: u1
            doc: "CAM_I_limit"
          - id: adcs_i_limit
            type: u1
            doc: "ADCS_I_limit"
          - id: exp_i_limit
            type: u1
            doc: "EXP_I_limit"
          - id: cam_uv_limit
            type: u1
            doc: "CAM_UV_limit"
          - id: exp_uv_limit
            type: u1
            doc: "EXP_UV_limit"
          - id: adcs_uv_limit
            type: u1
            doc: "ADCS_UV_limit"
          - id: bat1_vmax
            type: s2
            doc: "BAT1_Vmax"
          - id: bat1_vmin
            type: s2
            doc: "BAT1_Vmin"
          - id: bat2_vmax
            type: s2
            doc: "BAT2_Vmax"
          - id: bat2_vmin
            type: s2
            doc: "BAT2_Vmin"
          - id: endofdata
            type: u2
            doc: "Endofdata"
      block6_exp:
        seq:
          - id: packet_type_holder
            type: u1
          - id: timestamp
            type: u4
            doc: "Timestamp"
          - id: fw_version
            type: u2
            doc: "FW version"
          - id: number_of_reboots
            type: u2
            doc: "Number of reboots"
          - id: active_adc_channel
            type: u1
            doc: "Active ADC channel"
          - id: fft_gain
            type: u1
            doc: "FFT gain"
          - id: low_frequency
            type: u1
            doc: "Low frequency"
          - id: high_frequency
            type: u1
            doc: "High frequency"
          - id: max_hold_sec
            type: u2
            doc: "Max hold sec"
          - id: slow_position
            type: u2
            doc: "Slow position"
          - id: postring_samples
            type: u2
            doc: "Postring samples"
          - id: psd
            type: u2
            doc: "PSD"
          - id: psd_max
            type: u2
            doc: "PSD max"
          - id: psd_selected
            type: u2
            doc: "PSD selected"
          - id: psd_selected_max
            type: u2
            doc: "PSD selected max"
          - id: peak_freq
            type: u2
            doc: "Peak freq"
          - id: peak_amp
            type: u2
            doc: "Peak amp"
          - id: psd_threshold
            type: u2
            doc: "PSD threshold"
          - id: psd_selected_events
            type: u2
            doc: "PSD selected events"
          - id: events_position
            type: u1
            doc: "Events position"
          - id: event_time_1
            type: u4
            doc: "Event time 1"
          - id: event_time_2
            type: u4
            doc: "Event time 2"
          - id: event_time_3
            type: u4
            doc: "Event time 3"
          - id: event_time_4
            type: u4
            doc: "Event time 4"
          - id: event_time_5
            type: u4
            doc: "Event time 5"
          - id: event_time_6
            type: u4
            doc: "Event time 6"
          - id: event_time_7
            type: u4
            doc: "Event time 7"
          - id: event_time_8
            type: u4
            doc: "Event time 8"
          - id: event_time_9
            type: u4
            doc: "Event time 9"
          - id: event_time_10
            type: u4
            doc: "Event time 10"
      block_message:
        seq:
          - id: message
            type: str
            encoding: utf-8
            size-eos: true
    instances:
      packet_type:
        pos: 0x0000000
        type: u1
