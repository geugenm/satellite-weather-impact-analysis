---
meta:
  id: bobcat1
  endian: be
doc: |
  :field data: frame.cspheader.data
  :field callsign: frame.data.callsigns.callsign
  :field bobcat1: frame.data.callsigns.bobcat1
  :field bat_v: frame.data.bat_v
  :field bat_i_out: frame.data.bat_i_out
  :field bat_i_in: frame.data.bat_i_in
  :field bootcount_a3200: frame.data.bootcount_a3200
  :field resetcause_a3200: frame.data.resetcause_a3200
  :field bootcause_a3200: frame.data.bootcause_a3200
  :field uptime_a3200: frame.data.uptime_a3200
  :field bootcount_ax100: frame.data.bootcount_ax100
  :field bootcause_ax100: frame.data.bootcause_ax100
  :field i_pwm: frame.data.i_pwm
  :field fs_mounted: frame.data.fs_mounted
  :field antennas_deployed: frame.data.antennas_deployed
  :field deploy_attempts1: frame.data.deploy_attempts1
  :field deploy_attempts2: frame.data.deploy_attempts2
  :field deploy_attempts3: frame.data.deploy_attempts3
  :field deploy_attempts4: frame.data.deploy_attempts4
  :field gyro_x: frame.data.gyro_x
  :field gyro_y: frame.data.gyro_y
  :field gyro_z: frame.data.gyro_z
  :field timestamp: frame.data.timestamp
  :field protocol_version: frame.hk_header.protocol_version
  :field type: frame.hk_header.type
  :field version: frame.hk_header.version
  :field satid: frame.hk_header.satid
  :field checksum: frame.hk_frame.a3200_hktable0.checksum
  :field a3200_hktable0_timestamp: frame.hk_frame.a3200_hktable0.timestamp
  :field source: frame.hk_frame.a3200_hktable0.source
  :field callsign: frame.hk_frame.callsigns.callsign
  :field bobcat1: frame.hk_frame.callsigns.bobcat1
  :field bat_v: frame.hk_frame.bat_v
  :field bat_i_in: frame.hk_frame.bat_i_in
  :field bat_i_out: frame.hk_frame.bat_i_out
  :field solar1_i: frame.hk_frame.solar1_i
  :field solar1_v: frame.hk_frame.solar1_v
  :field solar2_i: frame.hk_frame.solar2_i
  :field solar2_v: frame.hk_frame.solar2_v
  :field solar3_i: frame.hk_frame.solar3_i
  :field solar3_v: frame.hk_frame.solar3_v
  :field novatel_i: frame.hk_frame.novatel_i
  :field sdr_i: frame.hk_frame.sdr_i
  :field bootcount_p31: frame.hk_frame.bootcount_p31
  :field bootcause_p31: frame.hk_frame.bootcause_p31
  :field bootcount_a3200: frame.hk_frame.bootcount_a3200
  :field bootcause_a3200: frame.hk_frame.bootcause_a3200
  :field resetcause_a3200: frame.hk_frame.resetcause_a3200
  :field uptime_a3200: frame.hk_frame.uptime_a3200
  :field temp_mcu: frame.hk_frame.temp_mcu
  :field i_gssb1: frame.hk_frame.i_gssb1
  :field i_pwm: frame.hk_frame.i_pwm
  :field panel_temp1: frame.hk_frame.panel_temp1
  :field panel_temp2: frame.hk_frame.panel_temp2
  :field panel_temp3: frame.hk_frame.panel_temp3
  :field panel_temp4: frame.hk_frame.panel_temp4
  :field panel_temp5: frame.hk_frame.panel_temp5
  :field panel_temp6: frame.hk_frame.panel_temp6
  :field panel_temp7: frame.hk_frame.panel_temp7
  :field panel_temp8: frame.hk_frame.panel_temp8
  :field panel_temp9: frame.hk_frame.panel_temp9
  :field p31_temp1: frame.hk_frame.p31_temp1
  :field p31_temp2: frame.hk_frame.p31_temp2
  :field p31_temp3: frame.hk_frame.p31_temp3
  :field p31_temp4: frame.hk_frame.p31_temp4
  :field p31_temp5: frame.hk_frame.p31_temp5
  :field p31_temp6: frame.hk_frame.p31_temp6
  :field flash0_free: frame.hk_frame.flash0_free
  :field flash1_free: frame.hk_frame.flash1_free
  :field coll_running: frame.hk_frame.coll_running
  :field ax100_telemtable_checksum: frame.hk_frame.ax100_telemtable.checksum
  :field ax100_telemtable_timestamp: frame.hk_frame.ax100_telemtable.timestamp
  :field ax100_telemtable_source: frame.hk_frame.ax100_telemtable.source
  :field temp_brd: frame.hk_frame.temp_brd
  :field temp_pa: frame.hk_frame.temp_pa
  :field bgnd_rssi: frame.hk_frame.bgnd_rssi
  :field tot_tx_count: frame.hk_frame.tot_tx_count
  :field tot_rx_count: frame.hk_frame.tot_rx_count
  :field tot_tx_bytes: frame.hk_frame.tot_tx_bytes
  :field tot_rx_bytes: frame.hk_frame.tot_rx_bytes
  :field bootcount_ax100: frame.hk_frame.bootcount_ax100
  :field bootcause_ax100: frame.hk_frame.bootcause_ax100
  :field a3200_hktable_17_1_checksum: frame.extra_frame.a3200_hktable_17_1.checksum
  :field a3200_hktable_17_1_timestamp: frame.extra_frame.a3200_hktable_17_1.timestamp
  :field a3200_hktable_17_1_source: frame.extra_frame.a3200_hktable_17_1.source
  :field callsign: frame.extra_frame.callsigns.callsign
  :field bobcat1: frame.extra_frame.callsigns.bobcat1
  :field coll_running: frame.extra_frame.coll_running
  :field lat: frame.extra_frame.lat
  :field long: frame.extra_frame.long
  :field height: frame.extra_frame.height
  :field sec_of_week: frame.extra_frame.sec_of_week
  :field a3200_hktable_10_checksum: frame.extra_frame.a3200_hktable_10.checksum
  :field a3200_hktable_10_timestamp: frame.extra_frame.a3200_hktable_10.timestamp
  :field a3200_hktable_10_source: frame.extra_frame.a3200_hktable_10.source
  :field cfg_path: frame.extra_frame.cfg_path
  :field bc1_wdcnt: frame.extra_frame.bc1_wdcnt
  :field collect_id: frame.extra_frame.collect_id
  :field adcs_mode: frame.extra_frame.adcs_mode
  :field a3200_hktable_17_2_checksum: frame.extra_frame.a3200_hktable_17_2.checksum
  :field a3200_hktable_17_2_timestamp: frame.extra_frame.a3200_hktable_17_2.timestamp
  :field a3200_hktable_17_2_source: frame.extra_frame.a3200_hktable_17_2.source
  :field custom_message: frame.extra_frame.custom_message
  :field rev: frame.fwdebug_frame.rev
  :field swload_cnt1: frame.fwdebug_frame.swload_cnt1
  :field swload_cnt2: frame.fwdebug_frame.swload_cnt2
  :field ram_image: frame.fwdebug_frame.ram_image
  :field framelength: framelength
  :field pos_sol_status: frame.xyz_frame.pos_sol_status
  :field gps_week: frame.xyz_frame.gps_week
  :field gps_ms: frame.xyz_frame.gps_ms
  :field pos_x: frame.xyz_frame.pos_x
  :field pos_y: frame.xyz_frame.pos_y
  :field pos_z: frame.xyz_frame.pos_z
  :field vel_x: frame.xyz_frame.vel_x
  :field vel_y: frame.xyz_frame.vel_y
  :field vel_z: frame.xyz_frame.vel_z
  :field vel_latency: frame.xyz_frame.vel_latency
  :field diff_age: frame.xyz_frame.diff_age
  :field sol_age: frame.xyz_frame.sol_age
  :field num_soln_svs: frame.xyz_frame.num_soln_svs

instances:
  framelength:
    value: _io.size

seq:
  - id: frame
    type:
      switch-on: _root.framelength
      cases:
        69: bc1_basic_frame
        156: bc1_hk_frame
        150: bc1_extra_frame
        70: bc1_fwdebug_frame
        98: bc1_xyz_frame

types:
  bc1_basic_frame:
    seq:
      - id: cspheader
        type: cspheader
      - id: data
        type: basic
  bc1_hk_frame:
    seq:
      - id: cspheader
        type: cspheader
      - id: hk_header
        type: hk_header
      - id: hk_frame
        type: hk_data
  bc1_extra_frame:
    seq:
      - id: cspheader
        type: cspheader
      - id: hk_header
        type: hk_header
      - id: extra_frame
        type: extra_data
  bc1_fwdebug_frame:
    seq:
      - id: cspheader
        type: cspheader
      - id: hk_header
        type: hk_header
      - id: fwdebug_frame
        type: fwdebug_frame
  bc1_xyz_frame:
    seq:
      - id: cspheader
        type: cspheader
      - id: xyz_frame
        type: xyz_frame

  cspheader:
    seq:
      - id: data
        type: u4

  callsigns:
    seq:
      - id: callsign
        type: strz
        encoding: ASCII
        valid: '"W8PZS"'
      - id: bobcat1
        type: strz
        encoding: ASCII
        valid: '"BOBCAT-1"'

  basic:
    seq:
      - id: callsigns
        type: callsigns
      - id: bat_v
        type: u2
      - id: bat_i_out
        type: u2
      - id: bat_i_in
        type: u2
      - id: bootcount_a3200
        type: u2
      - id: resetcause_a3200
        type: u1
      - id: bootcause_a3200
        type: u1
      - id: uptime_a3200
        type: u4
      - id: bootcount_ax100
        type: u2
      - id: bootcause_ax100
        type: u4
      - id: i_pwm
        type: u2
      - id: fs_mounted
        type: u1
      - id: antennas_deployed
        type: u1
      - id: deploy_attempts1
        type: u2
      - id: deploy_attempts2
        type: u2
      - id: deploy_attempts3
        type: u2
      - id: deploy_attempts4
        type: u2
      - id: gyro_x
        type: s2
      - id: gyro_y
        type: s2
      - id: gyro_z
        type: s2
      - id: timestamp
        type: u4

  hk_header:
    seq:
      - id: protocol_version
        type: u1
      - id: type
        type: u1
      - id: version
        type: u1
      - id: satid
        type: u2

  beacon_element_header:
    seq:
      - id: checksum
        type: u2
      - id: timestamp
        type: u4
      - id: source
        type: u2

  hk_data:
    seq:
      - id: a3200_hktable0
        type: beacon_element_header
      - id: callsigns
        type: callsigns
      - id: bat_v
        type: u2
      - id: bat_i_in
        type: u2
      - id: bat_i_out
        type: u2
      - id: solar1_i
        type: u2
      - id: solar1_v
        type: u2
      - id: solar2_i
        type: u2
      - id: solar2_v
        type: u2
      - id: solar3_i
        type: u2
      - id: solar3_v
        type: u2
      - id: novatel_i
        type: u2
      - id: sdr_i
        type: u2
      - id: bootcount_p31
        type: u4
      - id: bootcause_p31
        type: u1
      - id: bootcount_a3200
        type: u2
      - id: bootcause_a3200
        type: u1
      - id: resetcause_a3200
        type: u1
      - id: uptime_a3200
        type: u4
      - id: temp_mcu
        type: s2
      - id: i_gssb1
        type: u2
      - id: i_pwm
        type: u2
      - id: panel_temp1
        type: s2
      - id: panel_temp2
        type: s2
      - id: panel_temp3
        type: s2
      - id: panel_temp4
        type: s2
      - id: panel_temp5
        type: s2
      - id: panel_temp6
        type: s2
      - id: panel_temp7
        type: s2
      - id: panel_temp8
        type: s2
      - id: panel_temp9
        type: s2
      - id: p31_temp1
        type: s2
      - id: p31_temp2
        type: s2
      - id: p31_temp3
        type: s2
      - id: p31_temp4
        type: s2
      - id: p31_temp5
        type: s2
      - id: p31_temp6
        type: s2
      - id: flash0_free
        type: u4
      - id: flash1_free
        type: u4
      - id: coll_running
        type: u1
      - id: ax100_telemtable
        type: beacon_element_header
      - id: temp_brd
        type: s2
      - id: temp_pa
        type: s2
      - id: bgnd_rssi
        type: s2
      - id: tot_tx_count
        type: u4
      - id: tot_rx_count
        type: u4
      - id: tot_tx_bytes
        type: u4
      - id: tot_rx_bytes
        type: u4
      - id: bootcount_ax100
        type: u2
      - id: bootcause_ax100
        type: u4

  extra_data:
    seq:
      - id: a3200_hktable_17_1
        type: beacon_element_header
      - id: callsigns
        type: callsigns
      - id: coll_running
        type: u1
      - id: lat
        type: f4
      - id: long
        type: f4
      - id: height
        type: f4
      - id: sec_of_week
        type: u2
      - id: a3200_hktable_10
        type: beacon_element_header
      - id: cfg_path
        type: strz
        size: 50
        encoding: ASCII
      - id: bc1_wdcnt
        type: u4
      - id: collect_id
        type: u4
      - id: adcs_mode
        type: u1
      - id: a3200_hktable_17_2
        type: beacon_element_header
      - id: custom_message
        type: strz
        encoding: ascii
        size: 20

  fwdebug_frame:
    seq:
      - id: a3200_hktable17
        type: beacon_element_header
      - id: callsigns
        type: callsigns
      - id: a3200_hktable0
        type: beacon_element_header
      - id: rev
        type: u1
      - id: a3200_hktable1
        type: beacon_element_header
      - id: swload_cnt1
        type: u2
      - id: swload_cnt2
        type: u2
      - id: a3200_hktable4
        type: beacon_element_header
      - id: ram_image
        type: u1

  xyz_frame:
    seq:
      - id: callsigns
        type: callsigns
      - id: pos_sol_status
        type: u4
      - id: gps_week
        type: u2
      - id: gps_ms
        type: u4
      - id: pos_x
        type: f8
      - id: pos_y
        type: f8
      - id: pos_z
        type: f8
      - id: vel_x
        type: f8
      - id: vel_y
        type: f8
      - id: vel_z
        type: f8
      - id: vel_latency
        type: f4
      - id: diff_age
        type: f4
      - id: sol_age
        type: f4
      - id: num_soln_svs
        type: u1
