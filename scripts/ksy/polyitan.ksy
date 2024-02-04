---
meta:
  id: polyitan1
  endian: le
doc-ref: 'https://amsat.vhfdx.in.ua/documents/polyitan.ksy'
doc: |
  :field dst_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field data_type: ax25_frame.payload.ax25_info.header.data_type
  :field beacon0: ax25_frame.payload.ax25_info.data.body
  :field device_err1_raw: ax25_frame.payload.ax25_info.data.device_err1_raw
  :field device_err2_raw: ax25_frame.payload.ax25_info.data.device_err2_raw
  :field device_err3_raw: ax25_frame.payload.ax25_info.data.device_err3_raw
  :field ss256: ax25_frame.payload.ax25_info.data.ss256
  :field rtc_s: ax25_frame.payload.ax25_info.data.rtc_s
  :field sat_mode: ax25_frame.payload.ax25_info.data.sat_mode
  :field submode: ax25_frame.payload.ax25_info.data.submode
  :field mux_i3_3: ax25_frame.payload.ax25_info.data.mux_i3_3
  :field arege: ax25_frame.payload.ax25_info.data.arege
  :field eab1: ax25_frame.payload.ax25_info.data.eab1
  :field eab2: ax25_frame.payload.ax25_info.data.eab2
  :field eab3: ax25_frame.payload.ax25_info.data.eab3
  :field v_acb: ax25_frame.payload.ax25_info.data.v_acb
  :field cab1: ax25_frame.payload.ax25_info.data.cab1
  :field cab2: ax25_frame.payload.ax25_info.data.cab2
  :field cab3: ax25_frame.payload.ax25_info.data.cab3
  :field c_from_sb_all: ax25_frame.payload.ax25_info.data.c_from_sb_all
  :field curr_sp_main: ax25_frame.payload.ax25_info.data.curr_sp_main
  :field c_load_all: ax25_frame.payload.ax25_info.data.c_load_all
  :field p_sbx: ax25_frame.payload.ax25_info.data.p_sbx
  :field p_sby: ax25_frame.payload.ax25_info.data.p_sby
  :field p_sbz: ax25_frame.payload.ax25_info.data.p_sbz
  :field device_errors: ax25_frame.payload.ax25_info.data.device_errors
  :field magtl_x: ax25_frame.payload.ax25_info.data.magtl_x
  :field magtl_y: ax25_frame.payload.ax25_info.data.magtl_y
  :field magtl_z: ax25_frame.payload.ax25_info.data.magtl_z
  :field gyro_x_mdps: ax25_frame.payload.ax25_info.data.gyro_x_mdps
  :field gyro_y_mdps: ax25_frame.payload.ax25_info.data.gyro_y_mdps
  :field gyro_z_mdps: ax25_frame.payload.ax25_info.data.gyro_z_mdps
  :field mux_i5_0: ax25_frame.payload.ax25_info.data.mux_i5_0
  :field ads1248_tmp_c: ax25_frame.payload.ax25_info.data.ads1248_tmp_c
  :field charge: ax25_frame.payload.ax25_info.data.charge
  :field antennas_status: ax25_frame.payload.ax25_info.data.antennas_status
  :field t_ab1: ax25_frame.payload.ax25_info.data.t_ab1
  :field t_ab2: ax25_frame.payload.ax25_info.data.t_ab2
  :field t_ab3: ax25_frame.payload.ax25_info.data.t_ab3
  :field mode: ax25_frame.payload.ax25_info.data.mode
  :field device_status: ax25_frame.payload.ax25_info.info.data.device_status
  :field rtc_ss: ax25_frame.payload.ax25_info.data.rtc_ss
  :field u_3_3v_digi: ax25_frame.payload.ax25_info.data.u_3_3v_digi
  :field u_3_3v_rf: ax25_frame.payload.ax25_info.data.u_3_3v_rf
  :field u_3_3v_rf_amp: ax25_frame.payload.ax25_info.data.u_3_3v_rf_amp
  :field temp2: ax25_frame.payload.ax25_info.data.temp2
  :field temp1: ax25_frame.payload.ax25_info.data.temp1
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
        doc: 'Protocol ID No L3 ( F0 )'
      - id: ax25_info
        type:
          switch-on: '_parent.ax25_header.src_callsign_raw.callsign_ror.callsign'
          cases:
            '"EM0UKP"': ax25_info
        size-eos: true

  ax25_info:
    seq:
      - id: header
        type: header
      - id: data
        type:
          switch-on: header.data_type
          cases:
            0: beacon0
            1: beacon1
            2: beacon2

  header:
    seq:
      - id: data_type
        type: u1

  beacon0:
    seq:
      - id: body
        type: str
        size-eos: true
        encoding: ASCII

  beacon1:
    seq:
      - id: device_err1_raw
        type: u1
      - id: device_err2_raw
        type: u1
      - id: device_err3_raw
        type: u1
        doc: '24 bits'
      - id: ss256
        type: u1
      - id: rtc_s
        type: s4
        doc: 'value [s]'
      - id: sat_mode
        type: u1
        doc: not working
      - id: submode
        type: u1
      - id: magtl_x1_raw
        type: u1
      - id: magtl_x2_raw
        type: u1
      - id: magtl_x3_raw
        type: u1
        doc: 'value [nTl], 24 bits'
      - id: magtl_y1_raw
        type: u1
      - id: magtl_y2_raw
        type: u1
      - id: magtl_y3_raw
        type: u1
        doc: 'value [nTl], 24 bits'
      - id: magtl_z1_raw
        type: u1
      - id: magtl_z2_raw
        type: u1
      - id: magtl_z3_raw
        type: u1
        doc: 'value [nTl], 24 bits'
      - id: gyro_x1_mdps_raw
        type: u1
      - id: gyro_x2_mdps_raw
        type: u1
      - id: gyro_x3_mdps_raw
        type: u1
        doc: 'value [mdps], 24 bits'
      - id: gyro_y1_mdps_raw
        type: u1
      - id: gyro_y2_mdps_raw
        type: u1
      - id: gyro_y3_mdps_raw
        type: u1
        doc: 'value [mdps], 24 bits'
      - id: gyro_z1_mdps_raw
        type: u1
      - id: gyro_z2_mdps_raw
        type: u1
      - id: gyro_z3_mdps_raw
        type: u1
        doc: 'value [mdps], 24 bits'
      - id: mux_i3_3
        type: u2
        doc: 'value [mA]'
      - id: mux_i5_0_raw
        type: u2
        doc: 'value [mA], non zero if orientation enabled'
      - id: ads1248_tmp_c_raw
        type: s2
        doc: 'value [В°C]'
      - id: arege
        type: u2
      - id: antennas_status_raw
        type: u2
      - id: charge_raw
        type: u2be
        doc: 'value [%], not working'
      - id: eab1
        type: u2
        doc: 'value [J], not working'
      - id: eab2
        type: u2
        doc: 'value [J], not working'
      - id: eab3
        type: u2
        doc: 'value [J]'
      - id: v_acb
        type: s2
        doc: 'value [mV]'
      - id: cab1
        type: s2
        doc: 'value [mA]'
      - id: cab2
        type: s2
        doc: 'value [mA]'
      - id: cab3
        type: s2
        doc: 'value [mA], Current at the inverter from the solar panels to main bus'
      - id: c_from_sb_all
        type: s2
        doc: 'value [mA]'
      - id: curr_sp_main
        type: u2
        doc: |
          'value [mA],
          total current consumers from the main bus shall be equal to the sum of the currents from solar panels and batteries'
      - id: c_load_all
        type: s2
        doc: 'value [mA], not set'
      - id: t_ab2_raw
        type: s2
        doc: 'value [В°C], not set'
      - id: t_ab3_raw
        type: s2
        doc: 'value [В°C], inadequate'
      - id: p_sbx
        type: s2
        doc: 'value [mW], inadequate'
      - id: p_sby
        type: s2
        doc: 'value [mW], inadequate'
      - id: p_sbz
        type: s2
        doc: 'value [mW]'
    instances:
      device_errors:
        value: 'device_err3_raw << 16 | device_err2_raw << 8 | device_err1_raw'
        doc: 'non zero if orientation enabled'
      magtl_x:
        value: 'magtl_x3_raw << 16 | magtl_x2_raw  << 8 | magtl_x1_raw'
        doc: 'non zero if orientation enabled'
      magtl_y:
        value: 'magtl_y3_raw << 16 | magtl_y2_raw  << 8 | magtl_y1_raw'
        doc: 'non zero if orientation enabled'
      magtl_z:
        value: 'magtl_z3_raw << 16 | magtl_z2_raw  << 8 | magtl_z1_raw'
        doc: 'non zero if orientation enabled'
      gyro_x_mdps:
        value: 'gyro_x3_mdps_raw << 16 | gyro_x2_mdps_raw  << 8 | gyro_x1_mdps_raw'
        doc: 'non zero if orientation enabled'
      gyro_y_mdps:
        value: 'gyro_y3_mdps_raw << 16 | gyro_y2_mdps_raw  << 8 | gyro_y1_mdps_raw'
        doc: 'non zero if orientation enabled'
      gyro_z_mdps:
        value: 'gyro_z3_mdps_raw << 16 | gyro_z2_mdps_raw  << 8 | gyro_z1_mdps_raw'
      mux_i5_0:
        value: mux_i5_0_raw * 0.1
      ads1248_tmp_c:
        value: ads1248_tmp_c_raw * 0.1
      charge:
        value: charge_raw * 0.1
      antennas_status:
        value: '(antennas_status_raw & 0xf)'
        doc: 'not set'
      t_ab1:
        value: 0.0
        doc: 'not set'
      t_ab2:
        value: t_ab2_raw * 0.1
        doc: 'not set'
      t_ab3:
        value: t_ab3_raw * 0.1
      mode:
        value: 'sat_mode == 2 ?
        "Beacon" : (sat_mode == 1 ?
        "PostLauncheDepl" : (sat_mode == 3 ?
        "Recharge" : (sat_mode == 4 ?
        "Telecom" : (sat_mode == 5 ?
        "Failsafe" : (sat_mode == 6 ?
        "Off" : (sat_mode == 7 ? "Sun" : "PostLaunche"))))))'

  beacon2:
    seq:
      - id: device_status
        type: u2
      - id: rtc_ss
        type: s4
        doc: 'value [s]'
      - id: temp2_raw
        type: s2
        doc: 'not working'
      - id: temp1_raw
        type: s2
      - id: u_3_3v_digi
        type: s2
        doc: 'value [mV]'
      - id: u_3_3v_rf
        type: s2
        doc: 'value [mV]'
      - id: u_3_3v_rf_amp
        type: s2
        doc: 'value [mV]'
    instances:
      temp2:
        value: 'temp2_raw * 0.1'
        doc: 'value [В°C]'
      temp1:
        value: 'temp1_raw * 0.1'
        doc: 'value [В°C]'
