---
meta:
  id: lightsail2
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field src_ip_addr: ax25_frame.payload.ax25_info.src_ip_addr
  :field dst_ip_addr: ax25_frame.payload.ax25_info.dst_ip_addr
  :field src_port: ax25_frame.payload.ax25_info.body.src_port
  :field dst_port: ax25_frame.payload.ax25_info.body.dst_port
  :field type: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.type
  :field daughter_atmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.daughter_atmp
  :field daughter_btmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.daughter_btmp
  :field threev_pltmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.threev_pltmp
  :field rf_amptmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.rf_amptmp
  :field nx_tmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nx_tmp
  :field px_tmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.px_tmp
  :field ny_tmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.ny_tmp
  :field py_tmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.py_tmp
  :field nz_tmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nz_tmp
  :field pz_tmp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.pz_tmp
  :field atmelpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.atmelpwrcurr
  :field atmelpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.atmelpwrbusv
  :field threev_pwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.threev_pwrcurr
  :field threev_pwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.threev_pwrbusv
  :field threev_plpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.threev_plpwrcurr
  :field threev_plpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.threev_plpwrbusv
  :field fivev_plpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.fivev_plpwrcurr
  :field fivev_plpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.fivev_plpwrbusv
  :field daughter_apwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.daughter_apwrcurr
  :field daughter_apwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.daughter_apwrbusv
  :field daughter_bpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.daughter_bpwrcurr
  :field daughter_bpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.daughter_bpwrbusv
  :field nx_intpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nx_intpwrcurr
  :field nx_intpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nx_intpwrbusv
  :field nx_extpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nx_extpwrcurr
  :field nx_extpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nx_extpwrbusv
  :field px_intpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.px_intpwrcurr
  :field px_intpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.px_intpwrbusv
  :field px_extpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.px_extpwrcurr
  :field px_extpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.px_extpwrbusv
  :field ny_intpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.ny_intpwrcurr
  :field ny_intpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.ny_intpwrbusv
  :field ny_extpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.ny_extpwrcurr
  :field ny_extpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.ny_extpwrbusv
  :field py_intpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.py_intpwrcurr
  :field py_intpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.py_intpwrbusv
  :field py_extpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.py_extpwrcurr
  :field py_extpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.py_extpwrbusv
  :field nz_extpwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nz_extpwrcurr
  :field nz_extpwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nz_extpwrbusv
  :field usercputime: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.usercputime
  :field syscputime: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.syscputime
  :field idlecputime: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.idlecputime
  :field processes: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.processes
  :field memfree: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.memfree
  :field buffers: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.buffers
  :field cached: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.cached
  :field datafree: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.datafree
  :field nanderasures: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.nanderasures
  :field beaconcnt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.beaconcnt
  :field time: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.time
  :field boottime: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.boottime
  :field long_dur_counter: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sys.long_dur_counter
  :field batt_pwr_draw: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.battPwrDraw
  :field adcs_mode: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.adcs_mode
  :field flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.flags
  :field q0_act: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.q0_act
  :field q1_act: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.q1_act
  :field q2_act: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.q2_act
  :field q3_act: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.q3_act
  :field x_rate: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.x_rate
  :field y_rate: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.y_rate
  :field z_rate: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.z_rate
  :field gyro_px: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.gyro_pxy.val_a
  :field gyro_py: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.gyro_pxy.val_b
  :field gyro_iz: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.gyro_piz.val_a
  :field gyro_pz: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.gyro_piz.val_b
  :field gyro_ix: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.gyro_ixy.val_a
  :field gyro_iy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.gyro_ixy.val_b
  :field sol_nxx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_nxx
  :field sol_nxy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_nxy
  :field sol_nyx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_nyx
  :field sol_nyy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_nyy
  :field sol_nzx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_nzx
  :field sol_nzy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_nzy
  :field sol_pxx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_pxx
  :field sol_pxy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_pxy
  :field sol_pyx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_pyx
  :field sol_pyy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.sol_pyy
  :field mag_nxx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_nxxy.val_a
  :field mag_nxy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_nxxy.val_b
  :field mag_nxz: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_npxz.val_a
  :field mag_pxz: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_npxz.val_b
  :field mag_pxx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_pxxy.val_a
  :field mag_pxy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_pxxy.val_b
  :field mag_nyz: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_npyz.val_a
  :field mag_pyz: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_npyz.val_b
  :field mag_pyx: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_pyxy.val_a
  :field mag_pyy: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.mag_pyxy.val_b
  :field wheel_rpm: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.wheel_rpm
  :field cam0_status: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam0.status
  :field cam0_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam0.temp
  :field cam0_last_contact: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam0.last_contact
  :field cam0_pics_remaining: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam0.pics_remaining
  :field cam0_retry_fails: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam0.retry_fails
  :field cam1_status: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam1.status
  :field cam1_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam1.temp
  :field cam1_last_contact: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam1.last_contact
  :field cam1_pics_remaining: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam1.pics_remaining
  :field cam1_retry_fails: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.cam1.retry_fails
  :field torqx_pwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.torqx_pwrcurr
  :field torqx_pwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.torqx_pwrbusv
  :field torqy_pwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.torqy_pwrcurr
  :field torqy_pwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.torqy_pwrbusv
  :field torqz_pwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.torqz_pwrcurr
  :field torqz_pwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.torqz_pwrbusv
  :field motor_pwrcurr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.motor_pwrcurr
  :field motor_pwrbusv: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.motor_pwrbusv
  :field pic_panel_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.pic_panel_flags
  :field motor_cnt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.motor_cnt
  :field motor_limit: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.motor_limit
  :field bat0_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat0.curr
  :field bat0_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat0.volt
  :field bat0_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat0.temp
  :field bat0_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat0.flags
  :field bat0_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat0.ctlflags
  :field bat1_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat1.curr
  :field bat1_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat1.volt
  :field bat1_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat1.temp
  :field bat1_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat1.flags
  :field bat1_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat1.ctlflags
  :field bat2_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat2.curr
  :field bat2_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat2.volt
  :field bat2_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat2.temp
  :field bat2_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat2.flags
  :field bat2_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat2.ctlflags
  :field bat3_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat3.curr
  :field bat3_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat3.volt
  :field bat3_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat3.temp
  :field bat3_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat3.flags
  :field bat3_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat3.ctlflags
  :field bat4_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat4.curr
  :field bat4_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat4.volt
  :field bat4_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat4.temp
  :field bat4_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat4.flags
  :field bat4_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat4.ctlflags
  :field bat5_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat5.curr
  :field bat5_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat5.volt
  :field bat5_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat5.temp
  :field bat5_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat5.flags
  :field bat5_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat5.ctlflags
  :field bat6_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat6.curr
  :field bat6_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat6.volt
  :field bat6_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat6.temp
  :field bat6_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat6.flags
  :field bat6_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat6.ctlflags
  :field bat7_curr: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat7.curr
  :field bat7_volt: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat7.volt
  :field bat7_temp: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat7.temp
  :field bat7_flags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat7.flags
  :field bat7_ctlflags: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.bat7.ctlflags
  :field comm_rxcount: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.comm.rxcount
  :field comm_txcount: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.comm.txcount
  :field comm_rxbytes: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.comm.rxbytes
  :field comm_txbytes: ax25_frame.payload.ax25_info.body.body.lsb_beacondata.comm.txbytes
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
        encoding: ascii
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
            0xcc: ipv4_pkt
            0xf0: none_l3
        size-eos: true
  none_l3:
    seq:
      - id: data
        size-eos: true
  ipv4_pkt:
    seq:
      - id: b1
        type: u1
      - id: b2
        type: u1
      - id: total_length
        type: u2be
      - id: identification
        type: u2be
      - id: b67
        type: u2be
      - id: ttl
        type: u1
      - id: protocol
        type: u1
        enum: protocol_enum
      - id: header_checksum
        type: u2be
      - id: src_ip_addr
        type: u4
      - id: dst_ip_addr
        type: u4
      - id: options
        type: ipv4_options
        size: ihl_bytes - 20
      - id: body
        size: total_length - ihl_bytes
        type:
          switch-on: protocol
          cases:
            'protocol_enum::tcp': tcp_segm
            'protocol_enum::icmp': icmp_pkt
            'protocol_enum::udp': udp_dtgrm
            'protocol_enum::ipv6': ipv6_pkt
    enums:
      protocol_enum:
        # http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
        0: hopopt
        1: icmp
        2: igmp
        3: ggp
        4: ipv4
        5: st
        6: tcp
        7: cbt
        8: egp
        9: igp
        10: bbn_rcc_mon
        11: nvp_ii
        12: pup
        13: argus
        14: emcon
        15: xnet
        16: chaos
        17: udp
        18: mux
        19: dcn_meas
        20: hmp
        21: prm
        22: xns_idp
        23: trunk_1
        24: trunk_2
        25: leaf_1
        26: leaf_2
        27: rdp
        28: irtp
        29: iso_tp4
        30: netblt
        31: mfe_nsp
        32: merit_inp
        33: dccp
        34: x_3pc
        35: idpr
        36: xtp
        37: ddp
        38: idpr_cmtp
        39: tp_plus_plus
        40: il
        41: ipv6
        42: sdrp
        43: ipv6_route
        44: ipv6_frag
        45: idrp
        46: rsvp
        47: gre
        48: dsr
        49: bna
        50: esp
        51: ah
        52: i_nlsp
        53: swipe
        54: narp
        55: mobile
        56: tlsp
        57: skip
        58: ipv6_icmp
        59: ipv6_nonxt
        60: ipv6_opts
        61: any_host_internal_protocol
        62: cftp
        63: any_local_network
        64: sat_expak
        65: kryptolan
        66: rvd
        67: ippc
        68: any_distributed_file_system
        69: sat_mon
        70: visa
        71: ipcv
        72: cpnx
        73: cphb
        74: wsn
        75: pvp
        76: br_sat_mon
        77: sun_nd
        78: wb_mon
        79: wb_expak
        80: iso_ip
        81: vmtp
        82: secure_vmtp
        83: vines
        84: ttp
        # fixme: possible enumeration bug!
        # 84: iptm
        85: nsfnet_igp
        86: dgp
        87: tcf
        88: eigrp
        89: ospfigp
        90: sprite_rpc
        91: larp
        92: mtp
        93: ax_25
        94: ipip
        95: micp
        96: scc_sp
        97: etherip
        98: encap
        99: any_private_encryption_scheme
        100: gmtp
        101: ifmp
        102: pnni
        103: pim
        104: aris
        105: scps
        106: qnx
        107: a_n
        108: ipcomp
        109: snp
        110: compaq_peer
        111: ipx_in_ip
        112: vrrp
        113: pgm
        114: any_0_hop
        115: l2tp
        116: ddx
        117: iatp
        118: stp
        119: srp
        120: uti
        121: smp
        122: sm
        123: ptp
        124: isis_over_ipv4
        125: fire
        126: crtp
        127: crudp
        128: sscopmce
        129: iplt
        130: sps
        131: pipe
        132: sctp
        133: fc
        134: rsvp_e2e_ignore
        135: mobility_header
        136: udplite
        137: mpls_in_ip
        138: manet
        139: hip
        140: shim6
        141: wesp
        142: rohc
        255: reserved_255
    instances:
      version:
        value: (b1 & 0xf0) >> 4
      ihl:
        value: b1 & 0xf
      ihl_bytes:
        value: ihl * 4
  ipv4_options:
    seq:
      - id: entries
        type: ipv4_option
        repeat: eos
  ipv4_option:
    seq:
      - id: b1
        type: u1
      - id: len
        type: u1
      - id: body
        size: 'len > 2 ? len - 2 : 0'
    instances:
      copy:
        value: (b1 & 0b10000000) >> 7
      opt_class:
        value: (b1 & 0b01100000) >> 5
      number:
        value: (b1 & 0b00011111)
  tcp_segm:
    seq:
      - id: src_port
        type: u2
      - id: dst_port
        type: u2
      - id: seq_num
        type: u4
      - id: ack_num
        type: u4
      - id: b12
        type: u1
      - id: b13
        type: u1
      - id: window_size
        type: u2
      - id: checksum
        type: u2
      - id: urgent_pointer
        type: u2
      - id: body
        size-eos: true
  icmp_pkt:
    seq:
      - id: icmp_type
        type: u1
        enum: icmp_type_enum
      - id: destination_unreachable
        type: destination_unreachable_msg
        if: icmp_type == icmp_type_enum::destination_unreachable
      - id: time_exceeded
        type: time_exceeded_msg
        if: icmp_type == icmp_type_enum::time_exceeded
      - id: echo
        type: echo_msg
        if: icmp_type == icmp_type_enum::echo or icmp_type == icmp_type_enum::echo_reply
    enums:
      icmp_type_enum:
        0: echo_reply
        3: destination_unreachable
        4: source_quench
        5: redirect
        8: echo
        11: time_exceeded
  destination_unreachable_msg:
    seq:
      - id: code
        type: u1
        enum: destination_unreachable_code
      - id: checksum
        type: u2
    enums:
      destination_unreachable_code:
        0: net_unreachable
        1: host_unreachable
        2: protocol_unreachable
        3: port_unreachable
        4: fragmentation_needed_and_df_set
        5: source_route_failed
        6: dst_net_unkown
        7: sdt_host_unkown
        8: src_isolated
        9: net_prohibited_by_admin
        10: host_prohibited_by_admin
        11: net_unreachable_for_tos
        12: host_unreachable_for_tos
        13: communication_prohibited_by_admin
        14: host_precedence_violation
        15: precedence_cuttoff_in_effect
  time_exceeded_msg:
    seq:
      - id: code
        type: u1
        enum: time_exceeded_code
      - id: checksum
        type: u2
    enums:
      time_exceeded_code:
        0: time_to_live_exceeded_in_transit
        1: fragment_reassembly_time_exceeded
  echo_msg:
    seq:
      - id: code
        contents: [0]
      - id: checksum
        type: u2
      - id: identifier
        type: u2
      - id: seq_num
        type: u2
      - id: data
        size-eos: true
  udp_dtgrm:
    seq:
      - id: src_port
        type: u2
      - id: dst_port
        type: u2
      - id: length
        type: u2
      - id: checksum
        type: u2
      - id: body
        type: udp_payload
        size-eos: true
  ipv6_pkt:
    seq:
      - id: version
        type: b4
      - id: traffic_class
        type: b8
      - id: flow_label
        type: b20
      - id: payload_length
        type: u2
      - id: next_header_type
        type: u1
      - id: hop_limit
        type: u1
      - id: src_ipv6_addr
        size: 16
      - id: dst_ipv6_addr
        size: 16
      - id: next_header
        type:
          switch-on: next_header_type
          cases:
            0: option_hop_by_hop
            4: ipv4_pkt
            6: tcp_segm
            17: udp_dtgrm
            59: no_next_header
      - id: rest
        size-eos: true
  no_next_header: {}
  option_hop_by_hop:
    seq:
      - id: next_header_type
        type: u1
      - id: hdr_ext_len
        type: u1
      - id: body
        size: hdr_ext_len - 1
      - id: next_header
        type:
          switch-on: next_header_type
          cases:
            0: option_hop_by_hop
            6: tcp_segm
            59: no_next_header
  udp_payload:
    seq:
      - id: lsb_beacondata
        type: lsb_beacondata_t
  lsb_beacondata_t:
    seq:
      - id: sys
        type: lsb_sysmgrdata_t
      - id: comm
        type: lsb_commdata_t
      - id: bat0
        type: lsb_batterydata_t
      - id: bat1
        type: lsb_batterydata_t
      - id: bat2
        type: lsb_batterydata_t
      - id: bat3
        type: lsb_batterydata_t
      - id: bat4
        type: lsb_batterydata_t
      - id: bat5
        type: lsb_batterydata_t
      - id: bat6
        type: lsb_batterydata_t
      - id: bat7
        type: lsb_batterydata_t
      - id: batt_pwr_draw
        doc: |
          network byte order.  lsb is 1mw.
        type: s2
      - id: adcs_mode
        doc: |
          enumeration
        type: u1
      - id: flags
        doc: |
          bitfield per lsb_flag_* marcos
        type: u1
      - id: q0_act
        doc: |
           network byte order.  lsb is 1/128.
        type: s2
      - id: q1_act
        doc: |
           network byte order.  lsb is 1/128.
        type: s2
      - id: q2_act
        doc: |
           network byte order.  lsb is 1/128.
        type: s2
      - id: q3_act
        doc: |
           network byte order.  lsb is 1/128.
        type: s2
      - id: x_rate
        doc: |
          network byte order.  lsb is 1/128 deg/second.
        type: s2
      - id: y_rate
        doc: |
          network byte order.  lsb is 1/128 deg/second.
        type: s2
      - id: z_rate
        doc: |
          network byte order.  lsb is 1/128 deg/second.
        type: s2
      - id: gyro_pxy
        doc: |
          unpack 12 bit fields.  a == x payload gyro, b == y payload gyro. 1/8 deg/second.
        type: packedsigned2x12_t
      - id: gyro_piz
        doc: |
          unpack 12 bit fields.  a == z payload gyro, b == z internal gyro. 1/8 deg/second.
        type: packedsigned2x12_t
      - id: gyro_ixy
        doc: |
          unpack 12 bit fields.  a == y internal gyro, b == z internal gyro. 1/8 deg/second.
        type: packedsigned2x12_t
      - id: sol_nxx
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_nxy
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_nyx
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_nyy
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_nzx
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_nzy
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_pxx
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_pxy
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_pyx
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: sol_pyy
        doc: |
          network byte order, raw sensor units
        type: u2
      - id: mag_nxxy
        doc: |
          unpack 12 bit fields.  a == -x panel magnetometer x channel, b == -x panel magnetometer y channel. lsb is 100nt
        type: packedsigned2x12_t
      - id: mag_npxz
        doc: |
          unpack 12 bit fields.  a == -x panel magnetometer z channel, b == +x panel magnetometer z channel. lsb is 100nt
        type: packedsigned2x12_t
      - id: mag_pxxy
        doc: |
          unpack 12 bit fields.  a == +x panel magnetometer x channel, b == +x panel magnetometer y channel. lsb is 100nt
        type: packedsigned2x12_t
      - id: mag_npyz
        doc: |
          unpack 12 bit fields.  a == -y panel magnetometer z channel, b == +y panel magnetometer z channel. lsb is 100nt
        type: packedsigned2x12_t
      - id: mag_pyxy
        doc: |
          unpack 12 bit fields.  a == +y panel magnetometer x channel, b == +y panel magnetometer y channel. lsb is 100nt
        type: packedsigned2x12_t
      - id: wheel_rpm
        doc: |
          network byte order in rpm
        type: s2
      - id: cam0
        doc: |
          camera state
        type: camerainfo_t
      - id: cam1
        doc: |
          camera state
        type: camerainfo_t
      - id: torqx_pwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: torqx_pwrbusv
        doc: |
          volts.  lsb is 1/16 v
        type: s1
      - id: torqy_pwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: torqy_pwrbusv
        doc: |
          volts.  lsb is 1/16 v
        type: s1
      - id: torqz_pwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: torqz_pwrbusv
        doc: |
          volts.  lsb is 1/16 v
        type: s1
      - id: motor_pwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: motor_pwrbusv
        doc: |
          volts.  lsb is 1/16 v
        type: u1
      - id: pic_panel_flags
        doc: |
          bit field per panel_*, pic_*, motor_moving macros
        type: u1
      - id: motor_cnt_high
        doc: |
          high 8 bits of the motor position count
        type: s1
      - id: motor_cnt_low
        doc: |
          low 16 bits of motor position count in network byte order
        type: u2
      - id: motor_limit_high
        doc: |
          high 8 bits of the motor position limit
        type: s1
      - id: motor_limit_low
        doc: |
          low 16 bits of motor position limit in network byte order
        type: u2
    instances:
      motor_cnt:
        value: (motor_cnt_high << 16) | motor_cnt_low
      motor_limit:
        value: (motor_limit_high << 16) | motor_limit_low
  lsb_batterydata_t:
    seq:
      - id: curr
        doc: |
          amps.  lsb is 1/128 a
        type: s1
      - id: volt
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: temp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: flags
        doc: |
          bitfield per batt_flags_* marcos
        type: u1
      - id: ctlflags
        doc: |
          bitfield per batt_ctlflags_* marcos
        type: u1
  packedsigned2x12_t:
    seq:
      - id: a_high
        doc: |
          high 8 bits of value a
        type: s1
      - id: b_high
        doc: |
          high 8 bits of vales b
        type: s1
      - id: ab_low
        doc: |
          bits [0-3]: low 4 bits of value b.  bits [4-7]: low 4 bits of value a
        type: u1
    instances:
      val_a:
        value: a_high << 4 | (ab_low & 0x0f)
      val_b:
        value: b_high << 4 | (ab_low & 0xf0 >> 4)
  packedunsigned2x12_t:
    seq:
      - id: a_high
        doc: |
          high 8 bits of value a
        type: u1
      - id: b_high
        doc: |
          high 8 bits of vales b
        type: u1
      - id: ab_low
        doc: |
          bits [0-3]: low 4 bits of value b.  bits [4-7]: low 4 bits of value a
        type: u1
    instances:
      val_a:
        value: a_high << 4 | (ab_low & 0x0f)
      val_b:
        value: b_high << 4 | (ab_low & 0xf0 >> 4)
  camerainfo_t:
    seq:
      - id: status
        doc: |
          bit field as defined with the cam_* macros
        type: u1
      - id: temp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: last_contact
        doc: |
          seconds since last contact
        type: u1
      - id: pics_remaining
        doc: |
          count
        type: b6
      - id: retry_fails
        doc: |
          count
        type: b2
  lsb_commdata_t:
    seq:
      - id: rxcount
        doc: |
          network byte order
        type: u2
      - id: txcount
        doc: |
          network byte order
        type: u2
      - id: rxbytes
        doc: |
          network byte order
        type: u4
      - id: txbytes
        doc: |
          network byte order
        type: u4
  lsb_sysmgrdata_t:
    seq:
      - id: type
        doc: |
          will always be 1
        type: u1
      # temperatures from the various temp sensors
      - id: daughter_atmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: daughter_btmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: threev_pltmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: rf_amptmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: nx_tmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: px_tmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: ny_tmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: py_tmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: nz_tmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1
      - id: pz_tmp
        doc: |
          least significant bit (lsb) is 0.5 degrees c.  0 == -75c
        type: u1

      # readings from the various ina power sensors
      - id: atmelpwrcurr
        doc: |
          amps.  lsb is 1/2048 a
        type: u1
      - id: atmelpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: threev_pwrcurr
        doc: |
          amps.  lsb is 1/2048 a
        type: u1
      - id: threev_pwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: threev_plpwrcurr
        doc: |
          amps.  lsb is 1/128 a
        type: u1
      - id: threev_plpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: fivev_plpwrcurr
        doc: |
          amps.  lsb is 1/128 a
        type: u1
      - id: fivev_plpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: daughter_apwrcurr
        doc: |
          amps.  lsb is 1/128 a
        type: u1
      - id: daughter_apwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: daughter_bpwrcurr
        doc: |
          amps.  lsb is 1/128 a
        type: u1
      - id: daughter_bpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: nx_intpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: nx_intpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: nx_extpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: nx_extpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: px_intpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: px_intpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: px_extpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: px_extpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: ny_intpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: ny_intpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: ny_extpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: ny_extpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: py_intpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: py_intpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: py_extpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: py_extpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      - id: nz_extpwrcurr
        doc: |
          amps.  lsb is 1/64 a
        type: u1
      - id: nz_extpwrbusv
        doc: |
          volts.  lsb is 1/32 v
        type: u1
      # software telemetry
      - id: usercputime
        doc: |
          network byte order.  per linux
        type: u4
      - id: syscputime
        doc: |
          network byte order.  per linux
        type: u4
      - id: idlecputime
        doc: |
          network byte order.  per linux
        type: u4
      - id: processes
        doc: |
          network byte order.  per linux
        type: u4
      - id: memfree
        doc: |
          network byte order.  per linux
        type: u4
      - id: buffers
        doc: |
          network byte order.  per linux
        type: u4
      - id: cached
        doc: |
          network byte order.  per linux
        type: u4
      - id: datafree
        doc: |
          network byte order.  lsb indicates if the value is kb (0) or mb (1).  lsb not part of value
        type: u4
      - id: nanderasures
        doc: |
          network byte order.  lsb indicates if the value is kb (0) or mb (1).  lsb not part of value
        type: u4
      # beacon info
      - id: beaconcnt
        doc: |
          network byte order.
        type: u2
      - id: time
        doc: |
          network byte order.  unix timestamp
        type: u4
      - id: boottime
        doc: |
          network byte order.  unix timestamp
        type: u4
      - id: long_dur_counter
        doc: |
          network byte order.
        type: u2
