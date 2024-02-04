---
meta:
  id: neudose
  title: NEUDOSE decoder struct
  endian: be

doc: |
  :field dest_callsign: ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_header.ctl
  :field pid: ax25_header.pid

  :field csp_hdr_crc: csp_header.crc
  :field csp_hdr_rdp: csp_header.rdp
  :field csp_hdr_xtea: csp_header.xtea
  :field csp_hdr_hmac: csp_header.hmac
  :field csp_hdr_src_port: csp_header.source_port
  :field csp_hdr_dst_port: csp_header.destination_port
  :field csp_hdr_destination: csp_header.destination
  :field csp_hdr_source: csp_header.source
  :field csp_hdr_priority: csp_header.priority

  :field last_rx_timestamp_raw: beacon.last_rx_timestamp_raw
  :field packet_version: beacon.packet_version
  :field unix_timestamp: beacon.unix_timestamp

  :field cdh_on: beacon.sat_status.cdh_on
  :field eps_on: beacon.sat_status.eps_on
  :field comms_on: beacon.sat_status.comms_on
  :field antenna_on: beacon.sat_status.antenna_on
  :field payload_on: beacon.sat_status.payload_on
  :field mech: beacon.sat_status.mech
  :field thermal: beacon.sat_status.thermal
  :field antenna_deployed: beacon.sat_status.antenna_deployed

  :field last_gs_conn_timestamp: beacon.last_gs_conn_timestamp

  :field eps_bat_state: beacon.eps_status.bat_state
  :field eps_bat_htr_state: beacon.eps_status.bat_htr_state
  :field eps_bat_htr_mode: beacon.eps_status.bat_htr_mode
  :field eps_last_reset_rsn: beacon.eps_status.last_reset_rsn
  :field eps_gs_wtdg_rst_mark: beacon.eps_status.gs_wtdg_rst_mark

  :field eps_uptime: beacon.eps_uptime
  :field eps_vbat: beacon.eps_vbat
  :field eps_bat_chrge_curr: beacon.eps_bat_chrge_curr
  :field eps_bat_dischrge_curr: beacon.eps_bat_dischrge_curr

  :field eps_mppt_conv1_temp: beacon.eps_temp.mppt_conv1
  :field eps_mppt_conv2_temp: beacon.eps_temp.mppt_conv2
  :field eps_mppt_conv3_temp: beacon.eps_temp.mppt_conv3
  :field eps_out_conv_3v3_temp: beacon.eps_temp.out_conv_3v3
  :field eps_out_conv_5v0_temp: beacon.eps_temp.out_conv_5v0
  :field eps_battery_pack_temp: beacon.eps_temp.battery_pack

  :field eps_solar_panel_y_n_curr: beacon.eps_solar_panel_curr.y_n
  :field eps_solar_panel_y_p_curr: beacon.eps_solar_panel_curr.y_p
  :field eps_solar_panel_x_n_curr: beacon.eps_solar_panel_curr.x_n
  :field eps_solar_panel_x_p_curr: beacon.eps_solar_panel_curr.x_p
  :field eps_solar_panel_z_n_curr: beacon.eps_solar_panel_curr.z_n
  :field eps_solar_panel_z_p_curr: beacon.eps_solar_panel_curr.z_p

  :field eps_cdh_channel_curr_out: beacon.eps_channel_curr_out.cdh
  :field eps_comm_3v3_channel_curr_out: beacon.eps_channel_curr_out.comm_3v3
  :field eps_comm_5v0_channel_curr_out: beacon.eps_channel_curr_out.comm_5v0
  :field eps_ant_channel_curr_out: beacon.eps_channel_curr_out.ant
  :field eps_pld_channel_curr_out: beacon.eps_channel_curr_out.pld

  :field cdh_curr_state: beacon.cdh_curr_state
  :field cdh_prev_state: beacon.cdh_prev_state

  :field cdh_reset_cause: beacon.cdh_boot_reset_cause.reset_cause
  :field cdh_boot_cause: beacon.cdh_boot_reset_cause.boot_cause

  :field cdh_uptime: beacon.cdh_uptime
  :field cdh_temp_mcu_raw: beacon.cdh_temp_mcu_raw
  :field cdh_temp_ram_raw: beacon.cdh_temp_ram_raw

  :field comms_rtsm_state: beacon.comms_status.rtsm_state
  :field comms_rst_reason: beacon.comms_status.rst_reason
  :field comms_boot_img_bank: beacon.comms_status.boot_img_bank

  :field comms_uptime_raw: beacon.comms_uptime_raw
  :field comms_ina233_pa_curr_raw: beacon.comms_ina233_pa_curr_raw
  :field comms_ad7294_pa_curr_raw: beacon.comms_ad7294_pa_curr_raw
  :field comms_ad7294_gate_volt_raw: beacon.comms_ad7294_gate_volt_raw
  :field comms_cc1125_rssi_raw: beacon.comms_cc1125_rssi_raw

  :field comms_lna_therm_temp: beacon.comms_temp.lna_therm
  :field comms_lna_diode_temp: beacon.comms_temp.lna_diode
  :field comms_stm32_internal_temp: beacon.comms_temp.stm32_internal
  :field comms_cc1125_uhf_temp: beacon.comms_temp.cc1125_uhf
  :field comms_cc1125_vhf_temp: beacon.comms_temp.cc1125_vhf
  :field comms_pa_therm_temp: beacon.comms_temp.pa_therm
  :field comms_pa_diode_temp: beacon.comms_temp.pa_diode
  :field comms_pa_therm_strap_temp: beacon.comms_temp.pa_therm_strap
  :field comms_ad7294_internal_temp: beacon.comms_temp.ad7294_internal

  :field ant_deployment_status: beacon.ant_deployment_status
  :field ant_prev_isis_status: beacon.ant_prev_isis_status
  :field pld_status: beacon.pld_status

seq:
  - id: ax25_header
    type: ax25_header_t
  - id: csp_header
    type: csp_header_t
  - id: beacon
    type: beacon_t

types:
  ax25_header_t:
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
      - id: pid
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

  csp_header_t:
    seq:
      - id: csp_length
        type: u2
      - id: csp_header_raw
        type: u4
    instances:
      priority:
        value: '(csp_header_raw >> 30)'
      source:
        value: '((csp_header_raw >> 25) & 0x1F)'
      destination:
        value: '((csp_header_raw >> 20) & 0x1F)'
      destination_port:
        value: '((csp_header_raw >> 14) & 0x3F)'
      source_port:
        value: '((csp_header_raw >> 8) & 0x3F)'
      reserved:
        value: '((csp_header_raw >> 4) & 0x0F)'
      hmac:
        value: '((csp_header_raw & 0x08) >> 3)'
      xtea:
        value: '((csp_header_raw & 0x04) >> 2)'
      rdp:
        value: '((csp_header_raw & 0x02) >> 1)'
      crc:
        value: '(csp_header_raw & 0x01)'

  beacon_t:
    # Temperatures are in deg C
    # Currents are in mA
    # Voltages are in mV
    # Uptime is in s
    seq:
      - id: last_rx_timestamp_raw
        type: u4
      - id: packet_version
        type: u1
      - id: unix_timestamp
        type: u4
      - id: sat_status
        type: sat_status_t
      - id: last_gs_conn_timestamp
        type: u4
      - id: eps_status
        type: eps_status_t
      - id: eps_uptime
        type: u4
      - id: eps_vbat
        type: u2
      - id: eps_bat_chrge_curr
        type: u2
      - id: eps_bat_dischrge_curr
        type: u2
      - id: eps_temp
        type: eps_temp_t
      - id: eps_solar_panel_curr
        type: eps_solar_panel_curr_t
      - id: eps_channel_curr_out
        type: eps_channel_curr_out_t
      - id: cdh_curr_state
        type: u1
      - id: cdh_prev_state
        type: u1
      - id: cdh_boot_reset_cause
        type: cdh_boot_reset_cause_t
      - id: cdh_uptime
        type: u4
      - id: cdh_temp_mcu_raw
        type: s2
      - id: cdh_temp_ram_raw
        type: s2
      - id: comms_status
        type: comms_status_t
      - id: comms_uptime_raw
        type: u4
      - id: comms_ina233_pa_curr_raw
        type: u2
      - id: comms_ad7294_pa_curr_raw
        type: u2
      - id: comms_ad7294_gate_volt_raw
        type: u2
      - id: comms_cc1125_rssi_raw
        type: u2
      - id: comms_temp
        type: comms_temp_t
      - id: ant_deployment_status
        type: u1
      - id: ant_prev_isis_status
        type: u2
      - id: pld_status
        type: u1

  sat_status_t:
    seq:
      - id: sat_status
        type: u1
    instances:
      cdh_on:
        value: '(sat_status >> 7) & 0x01'
      eps_on:
        value: '(sat_status >> 6) & 0x01'
      comms_on:
        value: '(sat_status >> 5) & 0x01'
      antenna_on:
        value: '(sat_status >> 4) & 0x01'
      payload_on:
        value: '(sat_status >> 3) & 0x01'
      mech:
        value: '(sat_status >> 2) & 0x01'
      thermal:
        value: '(sat_status >> 1) & 0x01'
      antenna_deployed:
        value: '(sat_status >> 0) & 0x01'

  eps_status_t:
    seq:
      - id: eps_status
        type: u1
    instances:
      bat_state:
        value: '(eps_status >> 6) & 0x03'
      bat_htr_state:
        value: '(eps_status >> 5) & 0x01'
      bat_htr_mode:
        value: '(eps_status >> 4) & 0x01'
      last_reset_rsn:
        value: '(eps_status >> 1) & 0x07'
      gs_wtdg_rst_mark:
        value: '(eps_status >> 0) & 0x01'

  eps_temp_t:
    seq:
      - id: mppt_conv1
        type: s1
      - id: mppt_conv2
        type: s1
      - id: mppt_conv3
        type: s1
      - id: out_conv_3v3
        type: s1
      - id: out_conv_5v0
        type: s1
      - id: battery_pack
        type: s1

  eps_solar_panel_curr_t:
    seq:
      - id: eps_solar_panel_curr
        size: 12
    instances:
      y_n:
        value: '(eps_solar_panel_curr [0] << 8) + eps_solar_panel_curr [1]'
      y_p:
        value: '(eps_solar_panel_curr [2] << 8) + eps_solar_panel_curr [3]'
      x_n:
        value: '(eps_solar_panel_curr [4] << 8) + eps_solar_panel_curr [5]'
      x_p:
        value: '(eps_solar_panel_curr [6] << 8) + eps_solar_panel_curr [7]'
      z_n:
        value: '(eps_solar_panel_curr [8] << 8) + eps_solar_panel_curr [9]'
      z_p:
        value: '(eps_solar_panel_curr [10] << 8) + eps_solar_panel_curr [11]'

  eps_channel_curr_out_t:
    seq:
      - id: eps_channel_curr_out
        size: 10
    instances:
      cdh:
        value: '(eps_channel_curr_out [0] << 8) + eps_channel_curr_out [1]'
      comm_3v3:
        value: '(eps_channel_curr_out [2] << 8) + eps_channel_curr_out [3]'
      comm_5v0:
        value: '(eps_channel_curr_out [4] << 8) + eps_channel_curr_out [5]'
      ant:
        value: '(eps_channel_curr_out [6] << 8) + eps_channel_curr_out [7]'
      pld:
        value: '(eps_channel_curr_out [8] << 8) + eps_channel_curr_out [9]'

  cdh_boot_reset_cause_t:
    seq:
      - id: cdh_boot_reset_cause
        type: u1
    instances:
      boot_cause:
        value: '(cdh_boot_reset_cause >> 4) & 0x0F'
      reset_cause:
        value: '(cdh_boot_reset_cause >> 0) & 0x0F'

  comms_status_t:
    seq:
      - id: comms_status
        type: u1
    instances:
      rtsm_state:
        value: '(comms_status >> 5) & 0x07'
      rst_reason:
        value: '(comms_status >> 2) & 0x07'
      boot_img_bank:
        value: '(comms_status >> 0) & 0x03'

  comms_temp_t:
    seq:
      - id: lna_therm
        type: s1
      - id: lna_diode
        type: s1
      - id: stm32_internal
        type: s1
      - id: cc1125_uhf
        type: s1
      - id: cc1125_vhf
        type: s1
      - id: pa_therm
        type: s1
      - id: pa_diode
        type: s1
      - id: pa_therm_strap
        type: s1
      - id: ad7294_internal
        type: s1
