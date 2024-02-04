---
meta:
  id: sharjahsat1
  title: Sharjahsat-1 beacon decoder
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field identifier: ax25_frame.payload.ax25_info.identifier
  :field tm_id: ax25_frame.payload.ax25_info.tm_id
  :field data_length: ax25_frame.payload.ax25_info.data_length
  :field packet_counter: ax25_frame.payload.ax25_info.packet_counter
  :field image_data: ax25_frame.payload.ax25_info.data.image_data.data.data_str
  :field op_mode: ax25_frame.payload.ax25_info.data.system_info.op_mode
  :field restart_count: ax25_frame.payload.ax25_info.data.system_info.restart_count
  :field last_reset_cause: ax25_frame.payload.ax25_info.data.system_info.last_reset_cause
  :field system_uptime: ax25_frame.payload.ax25_info.data.system_info.system_uptime
  :field system_time: ax25_frame.payload.ax25_info.data.system_info.system_time
  :field tlm_board_temp1: ax25_frame.payload.ax25_info.data.obc.tlm_board_temp1
  :field tlm_board_temp2: ax25_frame.payload.ax25_info.data.obc.tlm_board_temp2
  :field tlm_board_temp3: ax25_frame.payload.ax25_info.data.obc.tlm_board_temp3
  :field tlm_vbat_v: ax25_frame.payload.ax25_info.data.obc.tlm_vbat_v
  :field tlm_vbat_i: ax25_frame.payload.ax25_info.data.obc.tlm_vbat_i
  :field tlm_vbat_plat_v: ax25_frame.payload.ax25_info.data.obc.tlm_vbat_plat_v
  :field tlm_3v3_plat_v: ax25_frame.payload.ax25_info.data.obc.tlm_3v3_plat_v
  :field tlm_vbat_periph_i: ax25_frame.payload.ax25_info.data.obc.tlm_vbat_periph_i
  :field tlm_3v3_periph_i: ax25_frame.payload.ax25_info.data.obc.tlm_3v3_periph_i
  :field tlm_vbat_periph_v: ax25_frame.payload.ax25_info.data.obc.tlm_vbat_periph_v
  :field tlm_3v3_periph_v: ax25_frame.payload.ax25_info.data.obc.tlm_3v3_periph_v
  :field timestamp_hh: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.timestamp_hh
  :field timestamp_mm: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.timestamp_mm
  :field timestamp_ss: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.timestamp_ss
  :field timestamp_dd: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.timestamp_dd
  :field timestamp_mo: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.timestamp_mo
  :field timestamp_yy: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.timestamp_yy
  :field timestamp_dow: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.timestamp_dow
  :field temperature: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.temperature
  :field antenna_status: ax25_frame.payload.ax25_info.data.interfacebrd_rtc.antenna_status
  :field vbat: ax25_frame.payload.ax25_info.data.battery.vbat
  :field ibat: ax25_frame.payload.ax25_info.data.battery.ibat
  :field vpcm3v3: ax25_frame.payload.ax25_info.data.battery.vpcm3v3
  :field vpcm5v: ax25_frame.payload.ax25_info.data.battery.vpcm5v
  :field ipcm3v3: ax25_frame.payload.ax25_info.data.battery.ipcm3v3
  :field ipcm5v: ax25_frame.payload.ax25_info.data.battery.ipcm5v
  :field tbrd: ax25_frame.payload.ax25_info.data.battery.tbrd
  :field tbat1: ax25_frame.payload.ax25_info.data.battery.tbat1
  :field tbat2: ax25_frame.payload.ax25_info.data.battery.tbat2
  :field tbat3: ax25_frame.payload.ax25_info.data.battery.tbat3
  :field vpcmbatv: ax25_frame.payload.ax25_info.data.eps.vpcmbatv
  :field ipcmbatv: ax25_frame.payload.ax25_info.data.eps.ipcmbatv
  :field eps_vpcm3v3: ax25_frame.payload.ax25_info.data.eps.vpcm3v3
  :field eps_ipcm3v3: ax25_frame.payload.ax25_info.data.eps.ipcm3v3
  :field eps_vpcm5v: ax25_frame.payload.ax25_info.data.eps.vpcm5v
  :field eps_ipcm5v: ax25_frame.payload.ax25_info.data.eps.ipcm5v
  :field i3v3drw: ax25_frame.payload.ax25_info.data.eps.i3v3drw
  :field i5vdrw: ax25_frame.payload.ax25_info.data.eps.i5vdrw
  :field eps_tbrd: ax25_frame.payload.ax25_info.data.eps.tbrd
  :field tbrd_db: ax25_frame.payload.ax25_info.data.eps.tbrd_db
  :field ipcm12v: ax25_frame.payload.ax25_info.data.eps.ipcm12v
  :field vpcm12v: ax25_frame.payload.ax25_info.data.eps.vpcm12v
  :field adcs_state: ax25_frame.payload.ax25_info.data.adcs.adcs_state
  :field sat_pos_llh_lat: ax25_frame.payload.ax25_info.data.adcs.sat_pos_llh_lat
  :field sat_pos_llh_lon: ax25_frame.payload.ax25_info.data.adcs.sat_pos_llh_lon
  :field sat_pos_llh_alt: ax25_frame.payload.ax25_info.data.adcs.sat_pos_llh_alt
  :field estm_att_angle_yaw: ax25_frame.payload.ax25_info.data.adcs.estm_att_angle_yaw
  :field estm_att_angle_pitch: ax25_frame.payload.ax25_info.data.adcs.estm_att_angle_pitch
  :field estm_att_angle_roll: ax25_frame.payload.ax25_info.data.adcs.estm_att_angle_roll
  :field estm_ang_rate_yaw: ax25_frame.payload.ax25_info.data.adcs.estm_ang_rate_yaw
  :field estm_ang_rate_pitch: ax25_frame.payload.ax25_info.data.adcs.estm_ang_rate_pitch
  :field estm_ang_rate_roll: ax25_frame.payload.ax25_info.data.adcs.estm_ang_rate_roll
  :field adcs_gps: ax25_frame.payload.ax25_info.data.adcs.gps.data.data_str
  :field smps_temp: ax25_frame.payload.ax25_info.data.uhf_vhf_modem.smps_temp
  :field pa_temp: ax25_frame.payload.ax25_info.data.uhf_vhf_modem.pa_temp
  :field current_3v3: ax25_frame.payload.ax25_info.data.uhf_vhf_modem.current_3v3
  :field voltage_3v3: ax25_frame.payload.ax25_info.data.uhf_vhf_modem.voltage_3v3
  :field current_5v: ax25_frame.payload.ax25_info.data.uhf_vhf_modem.current_5v
  :field voltage_5v: ax25_frame.payload.ax25_info.data.uhf_vhf_modem.voltage_5v
  :field battery_current: ax25_frame.payload.ax25_info.data.s_band_modem.battery_current
  :field pa_current: ax25_frame.payload.ax25_info.data.s_band_modem.pa_current
  :field battery_voltage: ax25_frame.payload.ax25_info.data.s_band_modem.battery_voltage
  :field pa_voltage: ax25_frame.payload.ax25_info.data.s_band_modem.pa_voltage
  :field pa_temperature: ax25_frame.payload.ax25_info.data.s_band_modem.pa_temperature
  :field rf_output_power: ax25_frame.payload.ax25_info.data.s_band_modem.rf_output_power
  :field board_temp_top: ax25_frame.payload.ax25_info.data.s_band_modem.board_temp_top
  :field board_temp_bottom: ax25_frame.payload.ax25_info.data.s_band_modem.board_temp_bottom
  :field vbcr1: ax25_frame.payload.ax25_info.data.solar_panels.vbcr1
  :field vbcr2: ax25_frame.payload.ax25_info.data.solar_panels.vbcr2
  :field vbcr3: ax25_frame.payload.ax25_info.data.solar_panels.vbcr3
  :field vbcr4: ax25_frame.payload.ax25_info.data.solar_panels.vbcr4
  :field vbcr5: ax25_frame.payload.ax25_info.data.solar_panels.vbcr5
  :field vbcr6: ax25_frame.payload.ax25_info.data.solar_panels.vbcr6
  :field vbcr7: ax25_frame.payload.ax25_info.data.solar_panels.vbcr7
  :field vbcr8: ax25_frame.payload.ax25_info.data.solar_panels.vbcr8
  :field vbcr9: ax25_frame.payload.ax25_info.data.solar_panels.vbcr9
  :field ibcra1: ax25_frame.payload.ax25_info.data.solar_panels.ibcra1
  :field ibcra2: ax25_frame.payload.ax25_info.data.solar_panels.ibcra2
  :field ibcra3: ax25_frame.payload.ax25_info.data.solar_panels.ibcra3
  :field ibcra4: ax25_frame.payload.ax25_info.data.solar_panels.ibcra4
  :field ibcra5: ax25_frame.payload.ax25_info.data.solar_panels.ibcra5
  :field ibcra6: ax25_frame.payload.ax25_info.data.solar_panels.ibcra6
  :field ibcra7: ax25_frame.payload.ax25_info.data.solar_panels.ibcra7
  :field ibcra8: ax25_frame.payload.ax25_info.data.solar_panels.ibcra8
  :field ibcra9: ax25_frame.payload.ax25_info.data.solar_panels.ibcra9
  :field ibcrb1: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb1
  :field ibcrb2: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb2
  :field ibcrb3: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb3
  :field ibcrb4: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb4
  :field ibcrb5: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb5
  :field ibcrb6: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb6
  :field ibcrb7: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb7
  :field ibcrb8: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb8
  :field ibcrb9: ax25_frame.payload.ax25_info.data.solar_panels.ibcrb9
  :field tbcra1: ax25_frame.payload.ax25_info.data.solar_panels.tbcra1
  :field tbcra2: ax25_frame.payload.ax25_info.data.solar_panels.tbcra2
  :field tbcra3: ax25_frame.payload.ax25_info.data.solar_panels.tbcra3
  :field tbcra4: ax25_frame.payload.ax25_info.data.solar_panels.tbcra4
  :field tbcra5: ax25_frame.payload.ax25_info.data.solar_panels.tbcra5
  :field tbcra6: ax25_frame.payload.ax25_info.data.solar_panels.tbcra6
  :field tbcra7: ax25_frame.payload.ax25_info.data.solar_panels.tbcra7
  :field tbcra8: ax25_frame.payload.ax25_info.data.solar_panels.tbcra8
  :field tbcra9: ax25_frame.payload.ax25_info.data.solar_panels.tbcra9
  :field tbcrb1: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb1
  :field tbcrb2: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb2
  :field tbcrb3: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb3
  :field tbcrb4: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb4
  :field tbcrb5: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb5
  :field tbcrb6: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb6
  :field tbcrb7: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb7
  :field tbcrb8: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb8
  :field tbcrb9: ax25_frame.payload.ax25_info.data.solar_panels.tbcrb9
  :field vidiodeout: ax25_frame.payload.ax25_info.data.solar_panels.vidiodeout
  :field iidiodeout: ax25_frame.payload.ax25_info.data.solar_panels.iidiodeout
seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: "https://www.tapr.org/pub_ax25.html"
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
        doc: "Repeater flag is set!"
      - id: ctl
        type: u1
  repeater:
    seq:
      - id: rpt_instance
        type: repeaters
        repeat: until
        repeat-until: ((_.rpt_ssid_raw.ssid_mask & 0x1) == 0x1)
        doc: "Repeat until no repeater flag is set!"
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
        valid:
          any-of:
            - "'A60UOS'"
            - "'A62UOS'"
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
        type: header_t
        size-eos: true
  header_t:
    seq:
      - id: identifier
        type: str
        encoding: ASCII
        size: 4
        valid:
          any-of:
            - "'ESER'"
      - id: tm_id
        type: u1
      - id: data_length
        type: u1
      - id: packet_counter
        type: u4
      - id: data
        type:
          switch-on: tm_id
          cases:
            0x41: image_t
            0x50: tlm_t
  image_t:
    seq:
      - id: image_data
        type: data_b64_t
        size-eos: true
  tlm_t:
    seq:
      - id: system_info
        type: system_info_t
      - id: obc
        type: obc_t
      - id: interfacebrd_rtc
        type: interfacebrd_rtc_t
      - id: battery
        type: battery_t
      - id: eps
        type: eps_t
      - id: adcs
        type: adcs_t
      - id: uhf_vhf_modem
        type: uhf_vhf_modem_t
      - id: s_band_modem
        type: s_band_modem_t
      - id: solar_panels
        type: solar_panels_t
  system_info_t:
    seq:
      - id: op_mode
        type: u2
        doc: |
          Battery     0: Error, 1: Working Correctly
          EPS         0: Error, 1: Working Correctly
          ADCS        0: Error, 1: Working Correctly
          U/V Modem   0: Error, 1: Working Correctly
          SBand       0: Error, 1: Working Correctly
          iXRD        0: Error, 1: Working Correctly
          CAM2MP      0: Error, 1: Working Correctly
          CAM5MP      0: Error, 1: Working Correctly
          IF Board    0: Error, 1: Working Correctly
          RTC         0: Error, 1: Working Correctly
          Beacon      0: Error, 1: Working Correctly
          Antennas    0: Non-Deployed, 1: All Deployed
          Op Mode     0: Startup
                      1: Nominal
                      2: Safe
                      3: ADCS Calibration
                      4: Recovery
                      5: Sun Pointing
                      6: Camera Operation
                      7: XRD Operation
                      8: Diagnostics
      - id: restart_count
        type: u2
      - id: last_reset_cause
        type: u1
      - id: system_uptime
        type: u4
      - id: system_time
        type: u4
  obc_t:
    seq:
      - id: tlm_board_temp1
        type: s2
        doc: 'x/100 [degC]'
      - id: tlm_board_temp2
        type: s2
        doc: 'x/100 [degC]'
      - id: tlm_board_temp3
        type: s2
        doc: 'x/100 [degC]'
      - id: tlm_vbat_v
        type: u2
        doc: 'x/1000 [V]'
      - id: tlm_vbat_i
        type: u2
        doc: 'x/1000 [A]'
      - id: tlm_vbat_plat_v
        type: u2
        doc: 'x/1000 [V]'
      - id: tlm_3v3_plat_v
        type: u2
        doc: 'x/1000 [V]'
      - id: tlm_vbat_periph_i
        type: u2
        doc: 'x/100 [A]'
      - id: tlm_3v3_periph_i
        type: u2
        doc: 'x/100 [A]'
      - id: tlm_vbat_periph_v
        type: u2
        doc: 'x/1000 [V]'
      - id: tlm_3v3_periph_v
        type: u2
        doc: 'x/1000 [V]'
  interfacebrd_rtc_t:
    seq:
      - id: timestamp_hh
        type: u1
      - id: timestamp_mm
        type: u1
      - id: timestamp_ss
        type: u1
      - id: timestamp_dd
        type: u1
      - id: timestamp_mo
        type: u1
      - id: timestamp_yy
        type: u1
      - id: timestamp_dow
        type: u1
      - id: temperature
        type: s2
      - id: antenna_status
        type: u1
  battery_t:
    seq:
      - id: vbat
        type: u2
        doc: 'x*0.008993 [V]'
      - id: ibat
        type: s2
        doc: 'x*14.662757 [mA]'
      - id: vpcm3v3
        type: u2
        doc: 'x*0.004311 [V]'
      - id: vpcm5v
        type: u2
        doc: 'x*0.005865 [V]'
      - id: ipcm3v3
        type: u2
        doc: 'x*1.327547 [mA]'
      - id: ipcm5v
        type: u2
        doc: 'x*1.327547 [mA]'
      - id: tbrd
        type: s2
        doc: '(x*0.372434)-273.15 [degC]'
      - id: tbat1
        type: s2
        doc: '(x*0.3976)-238.57 [degC]'
      - id: tbat2
        type: s2
        doc: '(x*0.3976)-238.57 [degC]'
      - id: tbat3
        type: s2
        doc: '(x*0.3976)-238.57 [degC]'
  eps_t:
    seq:
      - id: vpcmbatv
        type: u2
        doc: 'x*0.008978 [V]'
      - id: ipcmbatv
        type: s2
        doc: 'x*0.00681988679 [A]'
      - id: vpcm3v3
        type: u2
        doc: 'x*0.004311 [V]'
      - id: ipcm3v3
        type: u2
        doc: 'x*0.00681988679 [A]'
      - id: vpcm5v
        type: u2
        doc: 'x*0.005865 [V]'
      - id: ipcm5v
        type: u2
        doc: 'x*0.00681988679 [A]'
      - id: i3v3drw
        type: u2
        doc: 'x*0.001327547 [A]'
      - id: i5vdrw
        type: u2
        doc: 'x*0.001327547 [A]'
      - id: tbrd
        type: u2
        doc: '(x*0.372434)-273.15 [degC]'
      - id: tbrd_db
        type: u2
        doc: '(x*0.372434)-273.15 [degC]'
      - id: ipcm12v
        type: u2
        doc: 'x*0.002066632361 [A]'
      - id: vpcm12v
        type: u2
        doc: 'x*0.01349 [V]'
  adcs_t:
    seq:
      - id: adcs_state
        type: u1
      - id: sat_pos_llh_lat
        type: s2
        doc: 'x*0.01 [deg]'
      - id: sat_pos_llh_lon
        type: s2
        doc: 'x*0.01 [deg]'
      - id: sat_pos_llh_alt
        type: s2
        doc: 'x*0.01 [km]'
      - id: estm_att_angle_yaw
        type: s2
        doc: 'x*0.01 [deg]'
      - id: estm_att_angle_pitch
        type: s2
        doc: 'x*0.01 [deg]'
      - id: estm_att_angle_roll
        type: s2
        doc: 'x*0.01 [deg]'
      - id: estm_ang_rate_yaw
        type: s2
        doc: 'x*0.01 [deg/s]'
      - id: estm_ang_rate_pitch
        type: s2
        doc: 'x*0.01 [deg/s]'
      - id: estm_ang_rate_roll
        type: s2
        doc: 'x*0.01 [deg/s]'
      - id: gps
        type: data_b64_t
        size: 18
        doc: 'ECEF Position & Velocity Vectors (Base64 encoded)'
  uhf_vhf_modem_t:
    seq:
      - id: smps_temp
        type: u1
        doc: 'MSB is a signed bit. Negative values are returned in two’s complement. Temperature=[T7:T0] [degC]'
      - id: pa_temp
        type: u1
        doc: 'MSB is a signed bit. Negative values are returned in two’s complement. Temperature=[T7:T0] [degC]'
      - id: current_3v3
        type: u2
        doc: 'x*3 [uA]'
      - id: voltage_3v3
        type: u2
        doc: 'x*4 [mV]'
      - id: current_5v
        type: u2
        doc: 'x*62 [uA]'
      - id: voltage_5v
        type: u2
        doc: 'x*4 [mV]'
  s_band_modem_t:
    seq:
      - id: battery_current
        type: u2
        doc: 'x*40 [uA]'
      - id: pa_current
        type: u2
        doc: 'x*40 [uA]'
      - id: battery_voltage
        type: u2
        doc: 'x*4 [mV]'
      - id: pa_voltage
        type: u2
        doc: 'x*4 [mV]'
      - id: pa_temperature
        type: u2
        doc: '((x*3/4096)-0.5)*100 [degC]'
      - id: rf_output_power
        type: u2
        doc: 'x*0.00113932291 [Vdet]'
      - id: board_temp_top
        type: s2
        doc: 'x*0.00390625 [degC]'
      - id: board_temp_bottom
        type: s2
        doc: 'x*0.00390625 [degC]'
  solar_panels_t:
    seq:
      - id: vbcr1
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: vbcr2
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: vbcr3
        type: u2
        doc: 'x*0.0099706 [V]'
      - id: vbcr4
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: vbcr5
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: vbcr6
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: vbcr7
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: vbcr8
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: vbcr9
        type: u2
        doc: 'x*0.0322581 [V]'
      - id: ibcra1
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra2
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra3
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra4
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra5
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra6
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra7
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra8
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcra9
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb1
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb2
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb3
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb4
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb5
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb6
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb7
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb8
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: ibcrb9
        type: u2
        doc: 'x*0.0009775 [A]'
      - id: tbcra1
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra2
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra3
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra4
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra5
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra6
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra7
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra8
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcra9
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb1
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb2
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb3
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb4
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb5
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb6
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb7
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb8
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: tbcrb9
        type: s2
        doc: '(x*0.4963)-273.15 [degC]'
      - id: vidiodeout
        type: u2
        doc: 'x*0.008993157 [V]'
      - id: iidiodeout
        type: u2
        doc: 'x*0.014662757 [A]'
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
