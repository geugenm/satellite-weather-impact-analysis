---
meta:
  id: fox
doc: |
  :field id: raw.hdr.id
  :field reset_count: raw.hdr.reset_count
  :field uptime: raw.hdr.uptime
  :field frm_type: raw.hdr.frm_type
  :field batt_a_v: raw.frame.rt_tlm.batt_a_v
  :field batt_b_v: raw.frame.rt_tlm.batt_b_v
  :field batt_c_v: raw.frame.rt_tlm.batt_c_v
  :field batt_a_t: raw.frame.rt_tlm.batt_a_t
  :field batt_b_t: raw.frame.rt_tlm.batt_b_t
  :field batt_c_t: raw.frame.rt_tlm.batt_c_t
  :field total_batt_i: raw.frame.rt_tlm.total_batt_i
  :field batt_board_temp: raw.frame.rt_tlm.batt_board_temp
  :field pos_x_panel_v: raw.frame.rt_tlm.pos_x_panel_v
  :field neg_x_panel_v: raw.frame.rt_tlm.neg_x_panel_v
  :field pos_y_panel_v: raw.frame.rt_tlm.pos_y_panel_v
  :field neg_y_panel_v: raw.frame.rt_tlm.neg_y_panel_v
  :field pos_z_panel_v: raw.frame.rt_tlm.pos_z_panel_v
  :field neg_z_panel_v: raw.frame.rt_tlm.neg_z_panel_v
  :field pos_x_panel_t: raw.frame.rt_tlm.pos_x_panel_t
  :field neg_x_panel_t: raw.frame.rt_tlm.neg_x_panel_t
  :field pos_y_panel_t: raw.frame.rt_tlm.pos_y_panel_t
  :field neg_y_panel_t: raw.frame.rt_tlm.neg_y_panel_t
  :field pos_z_panel_t: raw.frame.rt_tlm.pos_z_panel_t
  :field neg_z_panel_t: raw.frame.rt_tlm.neg_z_panel_t
  :field psu_temp: raw.frame.rt_tlm.psu_temp
  :field spin: raw.frame.rt_tlm.spin
  :field tx_pa_curr: raw.frame.rt_tlm.tx_pa_curr
  :field tx_temp: raw.frame.rt_tlm.tx_temp
  :field rx_temp: raw.frame.rt_tlm.rx_temp
  :field rssi: raw.frame.rt_tlm.rssi
  :field ihu_cpu_temp: raw.frame.rt_tlm.ihu_cpu_temp
  :field sat_x_ang_vcty: raw.frame.rt_tlm.sat_x_ang_vcty
  :field sat_y_ang_vcty: raw.frame.rt_tlm.sat_y_ang_vcty
  :field sat_z_ang_vcty: raw.frame.rt_tlm.sat_z_ang_vcty
  :field exp_4_temp: raw.frame.rt_tlm.exp_4_temp
  :field psu_curr: raw.frame.rt_tlm.psu_curr
  :field ihu_diag_data: raw.frame.rt_tlm.ihu_diag_data
  :field exp_fail_ind: raw.frame.rt_tlm.exp_fail_ind
  :field sys_i2c_fail_ind: raw.frame.rt_tlm.sys_i2c_fail_ind
  :field grnd_cmded_tlm_rsts: raw.frame.rt_tlm.grnd_cmded_tlm_rsts
  :field ant_deploy_sensors: raw.frame.rt_tlm.ant_deploy_sensors

seq:
  - id: raw
    size-eos: true
    type: frame

types:
  frame:
    seq:
      - id: hdr
        type: hdr
        size: 6
      - id: frame
        type:
          switch-on: hdr.frm_type
          cases:
            0x0: debug_data_t
            0x1: rt_tlm_t
            0x2: max_vals_tlm_t
            0x3: min_vals_tlm_t
            0x4: exp_tlm_t
            0x5: cam_jpeg_data_t

  hdr:
    seq:
      - id: b
        type: u1
        repeat: expr
        repeat-expr: 6
    instances:
      id:
        value: 'b[0] & 0x7'
      reset_count:
        value: '((b[2] << 16 | b[1] << 8 | b[0]) >> 3) & 0xffff'
      uptime:
        value: '((b[5] << 24 | b[4] << 16 | b[3] << 8 | b[2]) >> 3) & 0x1ffffff'
      frm_type:
        value: '(b[5] >> 4) & 0xf'

  debug_data_t:
    seq:
      - id: debug_data
        size-eos: true

  rt_tlm_t:
    seq:
      - id: rt_tlm
        type: rt_tlm

  max_vals_tlm_t:
    seq:
      - id: max_vals_tlm
        type: max_vals_tlm

  min_vals_tlm_t:
    seq:
      - id: min_vals_tlm
        type: min_vals_tlm

  exp_tlm_t:
    seq:
      - id: exp_tlm
        size-eos: true

  cam_jpeg_data_t:
    seq:
      - id: cam_jpeg_data
        size-eos: true

  rt_tlm:
    seq:
      - id: b
        type: u1
        repeat: eos
    instances:
      batt_a_v:
        value: '((b[1] & 0xf) << 8 | b[0])'
      batt_b_v:
        value: '(b[2] << 4 | b[1] >> 4)'
      batt_c_v:
        value: '((b[4] & 0xf) << 8 | b[3])'
      batt_a_t:
        value: '(b[5] << 4 | b[4] >> 4)'
      batt_b_t:
        value: '((b[7] & 0xf) << 8 | b[6])'
      batt_c_t:
        value: '(b[8] << 4 | b[7] >> 4)'
      total_batt_i:
        value: '((b[10] & 0xf) << 8 | b[9])'
      batt_board_temp:
        value: '(b[11] << 4 | b[10] >> 4)'
      pos_x_panel_v:
        value: '((b[13] & 0xf) << 8 | b[12])'
      neg_x_panel_v:
        value: '(b[14] << 4 | b[13] >> 4)'
      pos_y_panel_v:
        value: '((b[16] & 0xf) << 8 | b[15])'
      neg_y_panel_v:
        value: '(b[17] << 4 | b[16] >> 4)'
      pos_z_panel_v:
        value: '((b[19] & 0xf) << 8 | b[18])'
      neg_z_panel_v:
        value: '(b[20] << 4 | b[19] >> 4)'
      pos_x_panel_t:
        value: '((b[22] & 0xf) << 8 | b[21])'
      neg_x_panel_t:
        value: '(b[23] << 4 | b[22] >> 4)'
      pos_y_panel_t:
        value: '((b[25] & 0xf) << 8 | b[24])'
      neg_y_panel_t:
        value: '(b[26] << 4 | b[25] >> 4)'
      pos_z_panel_t:
        value: '((b[28] & 0xf) << 8 | b[27])'
      neg_z_panel_t:
        value: '(b[29] << 4 | b[28] >> 4)'
      psu_temp:
        value: '((b[31] & 0xf) << 8 | b[30])'
      spin:
        value: '(b[32] << 4 | b[31] >> 4)'
      tx_pa_curr:
        value: '((b[34] & 0xf) << 8 | b[33])'
      tx_temp:
        value: '(b[35] << 4 | b[34] >> 4)'
      rx_temp:
        value: '((b[37] & 0xf) << 8 | b[36])'
      rssi:
        value: '(b[38] << 4 | b[37] >> 4)'
      ihu_cpu_temp:
        value: '((b[40] & 0xf) << 8 | b[39])'
      sat_x_ang_vcty:
        value: '(b[41] << 4 | b[40] >> 4)'
      sat_y_ang_vcty:
        value: '((b[43] & 0xf) << 8 | b[42])'
      sat_z_ang_vcty:
        value: '(b[44] << 4 | b[43] >> 4)'
      exp_4_temp:
        value: '((b[46] & 0xf) << 8 | b[45])'
      psu_curr:
        value: '(b[47] << 4 | b[46] >> 4)'
      ihu_diag_data:
        value: '(b[51] << 24 | b[50] << 16 | b[49] << 8 | b[48])'
      exp_fail_ind:
        value: '(b[52] & 0xf)'
      sys_i2c_fail_ind:
        value: '(b[52] >> 4) & 0x7'
      grnd_cmded_tlm_rsts:
        value: '(((b[52] >> 7) & 0x1) | (b[53] << 1)) & 0xf'
      ant_deploy_sensors:
        value: '(b[53] >> 3) & 0x3'

  max_vals_tlm:
    seq:
      - id: b
        type: u1
        repeat: eos

  min_vals_tlm:
    seq:
      - id: b
        type: u1
        repeat: eos
