meta:
  id: kafasat1
  file-extension: kafasat1
  title: kafasat ksy parser for sw_stat
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field version: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.version
  :field type: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.type
  :field sec_hdr_flag: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.sec_hdr_flag
  :field pkt_apid: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.pkt_apid
  :field seq_flgs: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.seq_flgs
  :field seq_ctr: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.seq_ctr
  :field pkt_len: ax25_frame.payload.ax25_info.ccsds_space_packet.packet_primary_header.pkt_len
  :field pus_header: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.pus_header
  :field service_type: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.service_type
  :field service_subtype: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.secondary_header.service_subtype
  :field sys_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.mode.sys_mode
  :field battery_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.mode.battery_mode
  :field vbat: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.battery.vbat
  :field cbat: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.battery.cbat
  :field cbchg: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.battery.cbchg
  :field st_5v: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.battery.st_5v
  :field temperature_bat1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.battery.temperature_bat1
  :field temperature_bat2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.battery.temperature_bat2
  :field heater: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.battery.heater
  :field gnd_wdt: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.gnd_wdt
  :field vin0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.vin0
  :field vin1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.vin1
  :field vin2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.vin2
  :field vin3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.vin3
  :field vin4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.vin4
  :field vin5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.vin5
  :field cin0: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.cin0
  :field cin1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.cin1
  :field cin2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.cin2
  :field cin3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.cin3
  :field cin4: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.cin4
  :field cin5: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.acu.cin5
  :field sw_cam_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_cam_vout
  :field sw_hrm1_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_hrm1_vout
  :field sw_ant_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_ant_vout
  :field sw_wheel_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_wheel_vout
  :field sw_trxvu_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_trxvu_vout
  :field sw_sband_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_sband_vout
  :field sw_hrm2_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_hrm2_vout
  :field sw_mtqr_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_mtqr_vout
  :field sw_adcs_vout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_adcs_vout
  :field sw_cam_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_cam_cout
  :field sw_hrm1_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_hrm1_cout
  :field sw_ant_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_ant_cout
  :field sw_wheel_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_wheel_cout
  :field sw_trxvu_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_trxvu_cout
  :field sw_sband_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_sband_cout
  :field sw_hrm2_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_hrm2_cout
  :field sw_mtqr_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_mtqr_cout
  :field sw_adcs_cout: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.pdu.sw_adcs_cout
  :field hrm1_deploy: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.deploy.hrm1_deploy
  :field hrm2_deploy: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.deploy.hrm2_deploy
  :field hrm1_deploy_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.deploy.hrm1_deploy_count
  :field hrm2_deploy_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.deploy.hrm2_deploy_count
  :field rx_uptime: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uptime.rx_uptime
  :field tx_uptime: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.uptime.tx_uptime
  :field attitude_estimation_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.attitude_estimation_mode
  :field control_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.control_mode
  :field adcs_run_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.adcs_run_mode
  :field asgp4_mode: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.asgp4_mode
  :field cubecontrol_signal_enabled: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.cubecontrol_signal_enabled
  :field cubecontrol_motor_enabled: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.cubecontrol_motor_enabled
  :field cube_sense_enabled: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.cube_sense_enabled
  :field cube_enabled1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.cube_enabled1
  :field cube_error1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.cube_error1
  :field cube_error2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.cube_error2
  :field cube_error3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.cube_error3
  :field estimated_roll_angle: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_roll_angle
  :field estimated_pitch_angle: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_pitch_angle
  :field estimated_yaw_angle: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_yaw_angle
  :field estimated_q1: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_q1
  :field estimated_q2: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_q2
  :field estimated_q3: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_q3
  :field estimated_x_angular_rate: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_x_angular_rate
  :field estimated_y_angular_rate: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_y_angular_rate
  :field estimated_z_angular_rate: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.estimated_z_angular_rate
  :field position_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.position_x
  :field position_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.position_y
  :field position_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.position_z
  :field velocity_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.velocity_x
  :field velocity_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.velocity_y
  :field velocity_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.velocity_z
  :field latitude: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.latitude
  :field longitude: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.longitude
  :field altitude: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.altitude
  :field ecef_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.ecef_x
  :field ecef_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.ecef_y
  :field ecef_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_state.ecef_z
  :field magnetic_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.magnetic_x
  :field magnetic_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.magnetic_y
  :field magnetic_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.magnetic_z
  :field css_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.css_x
  :field css_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.css_y
  :field css_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.css_z
  :field sun_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.sun_x
  :field sun_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.sun_y
  :field sun_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.sun_z
  :field nadir_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.nadir_x
  :field nadir_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.nadir_y
  :field nadir_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.nadir_z
  :field angular_rate_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.angular_rate_x
  :field angular_rate_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.angular_rate_y
  :field angular_rate_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.angular_rate_z
  :field wheel_x: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.wheel_x
  :field wheel_y: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.wheel_y
  :field wheel_z: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_measure.wheel_z
  :field adcs_seconds: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_seconds
  :field adcs_subseconds: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.adcs_subseconds
  :field boot_count: ax25_frame.payload.ax25_info.ccsds_space_packet.data_section.user_data_field.boot_count

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
      - id: ccsds_space_packet
        type: ccsds_space_packet_t

  ccsds_space_packet_t:
    seq:
      - id: packet_primary_header
        type: packet_primary_header_t
        size: 6
      - id: data_section
        type: data_section_t

  packet_primary_header_t:
    seq:
      - id: version
        type: b3
      - id: type
        type: b1
      - id: sec_hdr_flag
        type: b1
      - id: pkt_apid
        type: b11
      - id: seq_flgs
        type: b2
      - id: seq_ctr
        type: b14
      - id: pkt_len
        type: u2be

  data_section_t:
    seq:
      - id: secondary_header
        type: secondary_header_t
        size: 3
      - id: user_data_field
        type: kafasat_data_field_t

  secondary_header_t:
    seq:
      - id: pus_header
        type: u1
      - id: service_type
        type: u1
      - id: service_subtype
        type: u1

  kafasat_data_field_t:
    seq:
      - id: mode
        type: mode_t
        size: 2
      - id: battery
        type: battery_t
        size: 13
      - id: gnd_wdt
        type: u4
      - id: acu
        type: acu_t
        size: 24
      - id: pdu
        type: pdu_t
        size: 36
      - id: deploy
        type: deploy_t
        size: 5
      - id: uptime
        type: uptime_t
        size: 8
      - id: adcs_state
        type: adcs_state_t
        size: 54
      - id: adcs_measure
        type: adcs_measure_t
        size: 36
      - id: adcs_seconds
        type: u4
      - id: adcs_subseconds
        type: u2
      - id: boot_count
        type: u2

  mode_t:
    seq:
      - id: sys_mode
        type: u1
        enum: obc_mode
        doc: |
          KAFASAT OBC Mode
          Enumeration values: 2/Normal 6/Safe
      - id: battery_mode
        type: u1
        enum: p60dock_mode
        doc: |
          KAFASAT Battery Mode
          Enumeration values: 1/Critical 2/Safe 3/Normal
    enums:
      obc_mode:
        2: normal
        6: safe
      p60dock_mode:
        1: critical
        2: safe
        3: normal

  battery_t:
    seq:
      - id: vbat
        type: u2
      - id: cbat
        type: s2
      - id: cbchg
        type: s2
      - id: st_5v
        type: u2
      - id: tbat1
        type: s2
      - id: tbat2
        type: s2
      - id: heater
        type: u1
        enum: heater_state
        doc: |
          KAFASAT Battery heater State
          Enumeration values: 0/OFF 1/ON
    enums:
      heater_state:
        0: off
        1: on
    instances:
      temperature_bat1:
        value: tbat1*0.1
      temperature_bat2:
        value: tbat2*0.1

  acu_t:
    seq:
      - id: vin0
        type: u2
        doc: |
          KAFASAT mount+-Z
      - id: vin1
        type: u2
        doc: |
          KAFASAT deploy-Y
      - id: vin2
        type: u2
        doc: |
          KAFASAT deploy+Y
      - id: vin3
        type: u2
        doc: |
          KAFASAT mount+-Y
      - id: vin4
        type: u2
        doc: |
          KAFASAT mount+-X
      - id: vin5
        type: u2
        doc: |
          KAFASAT mount-X
      - id: cin0
        type: s2
      - id: cin1
        type: s2
      - id: cin2
        type: s2
      - id: cin3
        type: s2
      - id: cin4
        type: s2
      - id: cin5
        type: s2

  pdu_t:
    seq:
      - id: sw_cam_vout
        type: u2
        doc: |
          KAFASAT NanoCam C1U BUS Voltage(3300mV)
      - id: sw_hrm1_vout
        type: u2
        doc: |
          KAFASAT HRM1 BUS Voltage(8000mV)
      - id: sw_ant_vout
        type: u2
        doc: |
          KAFASAT ISIS Antenna BUS Voltage(3300mV)
      - id: sw_wheel_vout
        type: u2
        doc: |
          KAFASAT RW BUS Voltage(8000mV)
      - id: sw_trxvu_vout
        type: u2
        doc: |
          KAFASAT ISIS TRXVU BUS Voltage(8000mV)
      - id: sw_sband_vout
        type: u2
        doc: |
          KAFASAT ENDURO SBand BUS Voltage(5000mV)
      - id: sw_hrm2_vout
        type: u2
        doc: |
          KAFASAT HRM2 BUS Voltage(8000mV)
      - id: sw_mtqr_vout
        type: u2
        doc: |
          KAFASAT MTQR BUS Voltage(5000mV)
      - id: sw_adcs_vout
        type: u2
        doc: |
          KAFASAT ADCS Controller BUS Voltage(3300mV)
      - id: sw_cam_cout
        type: s2
      - id: sw_hrm1_cout
        type: s2
      - id: sw_ant_cout
        type: s2
      - id: sw_wheel_cout
        type: s2
      - id: sw_trxvu_cout
        type: s2
      - id: sw_sband_cout
        type: s2
      - id: sw_hrm2_cout
        type: s2
      - id: sw_mtqr_cout
        type: s2
      - id: sw_adcs_cout
        type: s2

  deploy_t:
    seq:
      - id: raw_deploy_stat
        type: b1
        repeat: expr
        repeat-expr: 8
        doc: |
          KAFASAT HRM/Antenna deploy status
      - id: hrm1_deploy_count
        type: u2
      - id: hrm2_deploy_count
        type: u2
    instances:
      hrm1_deploy:
        value: 'raw_deploy_stat[0] ? true: false'
      hrm2_deploy:
        value: 'raw_deploy_stat[2] ? true: false'

  uptime_t:
    seq:
      - id: rx_uptime
        type: u4
        doc: |
          KAFASAT ISIS UVTRX RX Uptime
      - id: tx_uptime
        type: u4
        doc: |
          KAFASAT ISIS UVTRX TX Uptime

  adcs_state_t:
    seq:
      - id: attitude_estimation_mode
        type: b4
      - id: control_mode
        type: b4
      - id: adcs_run_mode
        type: b2
      - id: asgp4_mode
        type: b2
      - id: cubecontrol_signal_enabled
        type: b1
      - id: cubecontrol_motor_enabled
        type: b1
      - id: cube_sense_enabled
        type: b2
      - id: cube_enabled1
        type: u1
      - id: cube_error1
        type: u1
      - id: cube_error2
        type: u4
      - id: cube_error3
        type: u4
      - id: estimated_roll_angle
        type: s2
      - id: estimated_pitch_angle
        type: s2
      - id: estimated_yaw_angle
        type: s2
      - id: estimated_q1
        type: s2
      - id: estimated_q2
        type: s2
      - id: estimated_q3
        type: s2
      - id: estimated_x_angular_rate
        type: s2
      - id: estimated_y_angular_rate
        type: s2
      - id: estimated_z_angular_rate
        type: s2
      - id: position_x
        type: s2
      - id: position_y
        type: s2
      - id: position_z
        type: s2
      - id: velocity_x
        type: s2
      - id: velocity_y
        type: s2
      - id: velocity_z
        type: s2
      - id: latitude
        type: s2
      - id: longitude
        type: s2
      - id: altitude
        type: u2
      - id: ecef_x
        type: s2
      - id: ecef_y
        type: s2
      - id: ecef_z
        type: s2

  adcs_measure_t:
    seq:
      - id: magnetic_x
        type: s2
      - id: magnetic_y
        type: s2
      - id: magnetic_z
        type: s2
      - id: css_x
        type: s2
      - id: css_y
        type: s2
      - id: css_z
        type: s2
      - id: sun_x
        type: s2
      - id: sun_y
        type: s2
      - id: sun_z
        type: s2
      - id: nadir_x
        type: s2
      - id: nadir_y
        type: s2
      - id: nadir_z
        type: s2
      - id: angular_rate_x
        type: s2
      - id: angular_rate_y
        type: s2
      - id: angular_rate_z
        type: s2
      - id: wheel_x
        type: s2
      - id: wheel_y
        type: s2
      - id: wheel_z
        type: s2
