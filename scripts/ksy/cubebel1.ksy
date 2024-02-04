---
meta:
  id: cubebel1
  endian: le
doc-ref: 'https://bsusat.com/media/docs/2018/bsusat-1_data_struct.xlsx'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field hdr_rf_id: ax25_frame.payload.ax25_info.header.rf_id
  :field hdr_opr_time: ax25_frame.payload.ax25_info.header.opr_time
  :field hdr_reboot_cnt: ax25_frame.payload.ax25_info.header.reboot_cnt
  :field hdr_mcusr: ax25_frame.payload.ax25_info.header.mcusr
  :field hdr_pamp_temp: ax25_frame.payload.ax25_info.header.pamp_temp
  :field hdr_pamp_voltage: ax25_frame.payload.ax25_info.header.pamp_voltage
  :field hdr_tx_attenuator: ax25_frame.payload.ax25_info.header.tx_attenuator
  :field hdr_battery_voltage: ax25_frame.payload.ax25_info.header.battery_voltage
  :field hdr_system_voltage: ax25_frame.payload.ax25_info.header.system_voltage
  :field hdr_seq_number: ax25_frame.payload.ax25_info.header.seq_number
  :field hdr_pwr_save_state: ax25_frame.payload.ax25_info.header.pwr_save_state
  :field hdr_modem_on_period: ax25_frame.payload.ax25_info.header.modem_on_period
  :field hdr_obc_can_status: ax25_frame.payload.ax25_info.header.obc_can_status
  :field hdr_eps_can_status: ax25_frame.payload.ax25_info.header.eps_can_status
  :field hdr_info_size: ax25_frame.payload.ax25_info.header.info_size
  :field hdr_data_type: ax25_frame.payload.ax25_info.header.data_type
  :field fec_crc_status: ax25_frame.payload.ax25_info.data.fec_crc_status
  :field rx_msg_state: ax25_frame.payload.ax25_info.data.rx_msg_state
  :field rssi: ax25_frame.payload.ax25_info.data.rssi
  :field rf_msg: ax25_frame.payload.ax25_info.data.rf_msg
  :field current_to_gamma: ax25_frame.payload.ax25_info.data.current_to_gamma
  :field current_to_irsensor: ax25_frame.payload.ax25_info.data.current_to_irsensor
  :field current_to_extflash: ax25_frame.payload.ax25_info.data.current_to_extflash
  :field current_to_solarsens: ax25_frame.payload.ax25_info.data.current_to_solarsens
  :field current_to_magnetcoils: ax25_frame.payload.ax25_info.data.current_to_magnetcoils
  :field current_to_coil_x: ax25_frame.payload.ax25_info.data.current_to_coil_x
  :field current_to_coil_y: ax25_frame.payload.ax25_info.data.current_to_coil_y
  :field current_to_coil_pz: ax25_frame.payload.ax25_info.data.current_to_coil_pz
  :field current_to_coil_nz: ax25_frame.payload.ax25_info.data.current_to_coil_nz
  :field battery1_temp: ax25_frame.payload.ax25_info.data.battery1_temp
  :field battery2_temp: ax25_frame.payload.ax25_info.data.battery2_temp
  :field numb_oc_obc: ax25_frame.payload.ax25_info.data.numb_oc_obc
  :field numb_oc_out_gamma: ax25_frame.payload.ax25_info.data.numb_oc_out_gamma
  :field numb_oc_out_rf1: ax25_frame.payload.ax25_info.data.numb_oc_out_rf1
  :field numb_oc_out_rf2: ax25_frame.payload.ax25_info.data.numb_oc_out_rf2
  :field numb_oc_out_flash: ax25_frame.payload.ax25_info.data.numb_oc_out_flash
  :field numb_oc_out_irsens: ax25_frame.payload.ax25_info.data.numb_oc_out_irsens
  :field numb_oc_coil_x: ax25_frame.payload.ax25_info.data.numb_oc_coil_x
  :field numb_oc_coil_y: ax25_frame.payload.ax25_info.data.numb_oc_coil_y
  :field numb_oc_coil_pz: ax25_frame.payload.ax25_info.data.numb_oc_coil_pz
  :field numb_oc_coil_nz: ax25_frame.payload.ax25_info.data.numb_oc_coil_nz
  :field numb_oc_magnetcoils: ax25_frame.payload.ax25_info.data.numb_oc_magnetcoils
  :field numb_oc_solarsens: ax25_frame.payload.ax25_info.data.numb_oc_solarsens
  :field reset_num: ax25_frame.payload.ax25_info.data.reset_num
  :field reset_reason: ax25_frame.payload.ax25_info.data.reset_reason
  :field pwr_sat: ax25_frame.payload.ax25_info.data.pwr_sat
  :field pwr_rf1: ax25_frame.payload.ax25_info.data.pwr_rf1
  :field pwr_rf2: ax25_frame.payload.ax25_info.data.pwr_rf2
  :field pwr_sunsensor: ax25_frame.payload.ax25_info.data.pwr_sunsensor
  :field pwr_gamma: ax25_frame.payload.ax25_info.data.pwr_gamma
  :field pwr_irsensor: ax25_frame.payload.ax25_info.data.pwr_irsensor
  :field pwr_flash: ax25_frame.payload.ax25_info.data.pwr_flash
  :field pwr_magnet_x: ax25_frame.payload.ax25_info.data.pwr_magnet_x
  :field pwr_magnet_y: ax25_frame.payload.ax25_info.data.pwr_magnet_y
  :field pwr_magnet_z: ax25_frame.payload.ax25_info.data.pwr_magnet_z
  :field sys_time: ax25_frame.payload.ax25_info.data.sys_time
  :field adc_correctness: ax25_frame.payload.ax25_info.data.adc_correctness
  :field t_adc1: ax25_frame.payload.ax25_info.data.t_adc1
  :field t_adc2: ax25_frame.payload.ax25_info.data.t_adc2
  :field stepup_current: ax25_frame.payload.ax25_info.data.stepup_current
  :field stepup_voltage: ax25_frame.payload.ax25_info.data.stepup_voltage
  :field afterbq_current: ax25_frame.payload.ax25_info.data.afterbq_current
  :field battery_voltage: ax25_frame.payload.ax25_info.data.battery_voltage
  :field sys_voltage_50: ax25_frame.payload.ax25_info.data.sys_voltage_50
  :field sys_voltage_33: ax25_frame.payload.ax25_info.data.sys_voltage_33
  :field eps_uc_current: ax25_frame.payload.ax25_info.data.eps_uc_current
  :field obc_uc_current: ax25_frame.payload.ax25_info.data.obc_uc_current
  :field rf1_uc_current: ax25_frame.payload.ax25_info.data.rf1_uc_current
  :field rf2_uc_current: ax25_frame.payload.ax25_info.data.rf2_uc_current
  :field solar_voltage: ax25_frame.payload.ax25_info.data.solar_voltage
  :field side_x_current: ax25_frame.payload.ax25_info.data.side_x_current
  :field side_py_current: ax25_frame.payload.ax25_info.data.side_py_current
  :field side_ny_current: ax25_frame.payload.ax25_info.data.side_ny_current
  :field side_pz_current: ax25_frame.payload.ax25_info.data.side_pz_current
  :field side_nz_current: ax25_frame.payload.ax25_info.data.side_nz_current

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
        type: frame
        size-eos: true

  frame:
    seq:
      - id: header
        type: header
      - id: data
        if: header.info_size > 0
        type:
          switch-on: header.data_type
          cases:
            # 0x00: rf_beacon
            0x01: rf_response
            # 0x02: rf_image
            0x03: rf_message
            # 0x04: rf_command_list
            # 0x05: rf_current_settings
            # 0x06: rf_default_settings
            # 0x07: rf_logo
            # 0x08: rf_saved_eps_tel
            # 0x09: rf_saved_obc_tel
            # 0x80: obc_tlm
            0xfe: eps_full_tel
            0xff: eps_short_tel

  header:
    seq:
      - id: rf_id
        type: u1
      - id: opr_time
        type: u2
      - id: reboot_cnt
        type: u1
      - id: mcusr
        type: u1
      - id: pamp_temp
        type: u2
      - id: pamp_voltage
        type: u1
      - id: tx_attenuator
        type: u1
      - id: battery_voltage
        type: u2
      - id: system_voltage
        type: u2
      - id: seq_number
        type: u2
      - id: pwr_save_state
        type: u1
      - id: modem_on_period
        type: u2
      - id: obc_can_status
        type: u1
      - id: eps_can_status
        type: u1
      - id: info_size
        type: u1
      - id: data_type
        type: u1

  rf_response:
    seq:
      - id: status_bits
        type: u1
      - id: rssi
        type: u1
    instances:
      fec_crc_status:
        value: >-
          (
          (status_bits)
          ) & 0x1
      rx_msg_state:
        value: >-
          (
          (status_bits)
          ) >> 1

  rf_message:
    seq:
      - id: rf_msg
        type: str
        encoding: utf-8
        size: _parent.header.info_size - 2

  eps_full_tel:
    seq:
      - id: bytes
        type: u1
        repeat: eos
    instances:
      sys_time:
        value: >-
          (bytes[0]) |
          (bytes[1] << 8)
        doc: '16 bits'
      adc_correctness:
        value: >-
          (
          (bytes[2])
          ) & 0x3
        doc: '2 bits'
      t_adc1:
        value: >-
          (
          (
          (bytes[2]) |
          (bytes[3] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      t_adc2:
        value: >-
          (
          (
          (bytes[3]) |
          (bytes[4] << 8) |
          (bytes[5] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      stepup_current:
        value: >-
          (
          (
          (bytes[5]) |
          (bytes[6] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      stepup_voltage:
        value: >-
          (
          (
          (bytes[6]) |
          (bytes[7] << 8) |
          (bytes[8] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      afterbq_current:
        value: >-
          (
          (
          (bytes[8]) |
          (bytes[9] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      battery_voltage:
        value: >-
          (
          (
          (bytes[9]) |
          (bytes[10] << 8) |
          (bytes[11] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      sys_voltage_50:
        value: >-
          (
          (
          (bytes[11]) |
          (bytes[12] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      sys_voltage_33:
        value: >-
          (
          (
          (bytes[12]) |
          (bytes[13] << 8) |
          (bytes[14] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      eps_uc_current:
        value: >-
          (
          (
          (bytes[14]) |
          (bytes[15] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      obc_uc_current:
        value: >-
          (
          (bytes[15]) |
          (bytes[16] << 8)
          ) >> 6
        doc: '10 bits'
      rf1_uc_current:
        value: >-
          (
          (bytes[17]) |
          (bytes[18] << 8)
          ) & 0x3FF
        doc: '10 bits'
      rf2_uc_current:
        value: >-
          (
          (
          (bytes[18]) |
          (bytes[19] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      solar_voltage:
        value: >-
          (
          (
          (bytes[19]) |
          (bytes[20] << 8) |
          (bytes[21] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      side_x_current:
        value: >-
          (
          (
          (bytes[21]) |
          (bytes[22] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      side_py_current:
        value: >-
          (
          (
          (bytes[22]) |
          (bytes[23] << 8) |
          (bytes[24] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      side_ny_current:
        value: >-
          (
          (
          (bytes[24]) |
          (bytes[25] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      side_pz_current:
        value: >-
          (
          (
          (bytes[25]) |
          (bytes[26] << 8) |
          (bytes[27] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      side_nz_current:
        value: >-
          (
          (
          (bytes[27]) |
          (bytes[28] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      # --- end of eps_short_tel
      current_to_gamma:
        value: >-
          (
          (
          (bytes[28]) |
          (bytes[29] << 8) |
          (bytes[30] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      current_to_irsensor:
        value: >-
          (
          (
          (bytes[30]) |
          (bytes[31] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      current_to_extflash:
        value: >-
          (
          (
          (bytes[31]) |
          (bytes[32] << 8) |
          (bytes[33] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      current_to_solarsens:
        value: >-
          (
          (
          (bytes[33]) |
          (bytes[34] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      current_to_magnetcoils:
        value: >-
          (
          (
          (bytes[34]) |
          (bytes[35] << 8) |
          (bytes[36] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      current_to_coil_x:
        value: >-
          (
          (
          (bytes[36]) |
          (bytes[37] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      current_to_coil_y:
        value: >-
          (
          (
          (bytes[37]) |
          (bytes[38] << 8) |
          (bytes[39] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      current_to_coil_pz:
        value: >-
          (
          (
          (bytes[39]) |
          (bytes[40] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      current_to_coil_nz:
        value: >-
          (
          (
          (bytes[40]) |
          (bytes[41] << 8) |
          (bytes[42] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      battery1_temp:
        value: >-
          (
          (
          (bytes[42]) |
          (bytes[43] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      battery2_temp:
        value: >-
          (
          (
          (bytes[43]) |
          (bytes[44] << 8) |
          (bytes[45] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      numb_oc_obc:
        value: >-
          (bytes[46])
        doc: '8 bits'
      numb_oc_out_gamma:
        value: >-
          (bytes[47])
        doc: '8 bits'
      numb_oc_out_rf1:
        value: >-
          (bytes[48])
        doc: '8 bits'
      numb_oc_out_rf2:
        value: >-
          (bytes[49])
        doc: '8 bits'
      numb_oc_out_flash:
        value: >-
          (bytes[50])
        doc: '8 bits'
      numb_oc_out_irsens:
        value: >-
          (bytes[51])
        doc: '8 bits'
      numb_oc_coil_x:
        value: >-
          (bytes[52])
        doc: '8 bits'
      numb_oc_coil_y:
        value: >-
          (bytes[53])
        doc: '8 bits'
      numb_oc_coil_pz:
        value: >-
          (bytes[54])
        doc: '8 bits'
      numb_oc_coil_nz:
        value: >-
          (bytes[55])
        doc: '8 bits'
      numb_oc_magnetcoils:
        value: >-
          (bytes[56])
        doc: '8 bits'
      numb_oc_solarsens:
        value: >-
          (bytes[57])
        doc: '8 bits'
      reset_num:
        value: >-
          (bytes[58]) |
          (bytes[59] << 8)
        doc: '16 bits'
      reset_reason:
        value: >-
          (bytes[60])
        doc: '8 bits'
      pwr_sat:
        value: >-
          (
          (bytes[61])
          ) & 0x1
        doc: '1 bits'
      pwr_rf1:
        value: >-
          (
          (
          (bytes[61])
          ) >> 1
          ) & 0x1
        doc: '1 bits'
      pwr_rf2:
        value: >-
          (
          (
          (bytes[61])
          ) >> 2
          ) & 0x1
        doc: '1 bits'
      pwr_sunsensor:
        value: >-
          (
          (
          (bytes[61])
          ) >> 3
          ) & 0x1
        doc: '1 bits'
      pwr_gamma:
        value: >-
          (
          (
          (bytes[61])
          ) >> 4
          ) & 0x1
        doc: '1 bits'
      pwr_irsensor:
        value: >-
          (
          (
          (bytes[61])
          ) >> 5
          ) & 0x1
        doc: '1 bits'
      pwr_flash:
        value: >-
          (
          (
          (bytes[61])
          ) >> 6
          ) & 0x1
        doc: '1 bits'
      pwr_magnet_x:
        value: >-
          (
          (bytes[61])
          ) >> 7
        doc: '1 bits'
      pwr_magnet_y:
        value: >-
          (
          (bytes[62])
          ) & 0x1
        doc: '1 bits'
      pwr_magnet_z:
        value: >-
          (
          (
          (bytes[62])
          ) >> 1
          ) & 0x1
        doc: '1 bits'

  eps_short_tel:
    seq:
      - id: bytes
        type: u1
        repeat: eos
    instances:
      sys_time:
        value: >-
          (bytes[0]) |
          (bytes[1] << 8)
        doc: '16 bits'
      adc_correctness:
        value: >-
          (
          (bytes[2])
          ) & 0x3
        doc: '2 bits'
      t_adc1:
        value: >-
          (
          (
          (bytes[2]) |
          (bytes[3] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      t_adc2:
        value: >-
          (
          (
          (bytes[3]) |
          (bytes[4] << 8) |
          (bytes[5] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      stepup_current:
        value: >-
          (
          (
          (bytes[5]) |
          (bytes[6] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      stepup_voltage:
        value: >-
          (
          (
          (bytes[6]) |
          (bytes[7] << 8) |
          (bytes[8] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      afterbq_current:
        value: >-
          (
          (
          (bytes[8]) |
          (bytes[9] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      battery_voltage:
        value: >-
          (
          (
          (bytes[9]) |
          (bytes[10] << 8) |
          (bytes[11] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      sys_voltage_50:
        value: >-
          (
          (
          (bytes[11]) |
          (bytes[12] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      sys_voltage_33:
        value: >-
          (
          (
          (bytes[12]) |
          (bytes[13] << 8) |
          (bytes[14] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      eps_uc_current:
        value: >-
          (
          (
          (bytes[14]) |
          (bytes[15] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      obc_uc_current:
        value: >-
          (
          (bytes[15]) |
          (bytes[16] << 8)
          ) >> 6
        doc: '10 bits'
      rf1_uc_current:
        value: >-
          (
          (bytes[17]) |
          (bytes[18] << 8)
          ) & 0x3FF
        doc: '10 bits'
      rf2_uc_current:
        value: >-
          (
          (
          (bytes[18]) |
          (bytes[19] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      solar_voltage:
        value: >-
          (
          (
          (bytes[19]) |
          (bytes[20] << 8) |
          (bytes[21] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      side_x_current:
        value: >-
          (
          (
          (bytes[21]) |
          (bytes[22] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      side_py_current:
        value: >-
          (
          (
          (bytes[22]) |
          (bytes[23] << 8) |
          (bytes[24] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      side_ny_current:
        value: >-
          (
          (
          (bytes[24]) |
          (bytes[25] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
      side_pz_current:
        value: >-
          (
          (
          (bytes[25]) |
          (bytes[26] << 8) |
          (bytes[27] << 16)
          ) >> 6
          ) & 0xFFF
        doc: '12 bits'
      side_nz_current:
        value: >-
          (
          (
          (bytes[27]) |
          (bytes[28] << 8)
          ) >> 2
          ) & 0xFFF
        doc: '12 bits'
