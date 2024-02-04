---
meta:
  id: delfin3xt
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field elapsed_time: ax25_frame.payload.ax25_payload.elapsed_time
  :field framecounter: ax25_frame.payload.ax25_payload.framecounter
  :field frametype: ax25_frame.payload.ax25_payload.frametype
  :field boot_counter: ax25_frame.payload.ax25_payload.boot_counter
  :field ptrx_dv: ax25_frame.payload.ax25_payload.ptrx_dv_raw
  :field ptrx_rss: ax25_frame.payload.ax25_payload.ptrx_rss_raw
  :field ptrx_rp: ax25_frame.payload.ax25_payload.ptrx_rp_raw
  :field ptrx_fp: ax25_frame.payload.ax25_payload.ptrx_fp_raw
  :field ptrx_tsc: ax25_frame.payload.ax25_payload.ptrx_tsc_raw
  :field ptrx_rsc: ax25_frame.payload.ax25_payload.ptrx_rsc_raw
  :field ptrx_pa_temp: ax25_frame.payload.ax25_payload.ptrx_pa_temp_raw
  :field ptrx_pbv: ax25_frame.payload.ax25_payload.ptrx_pbv_raw
  :field depl_sol_x_minus: ax25_frame.payload.ax25_payload.depl_sol_x_minus
  :field depl_sol_x_plus: ax25_frame.payload.ax25_payload.depl_sol_x_plus
  :field depl_sol_y_minus: ax25_frame.payload.ax25_payload.depl_sol_y_minus
  :field depl_sol_y_plus: ax25_frame.payload.ax25_payload.depl_sol_y_plus
  :field depl_ant_x_minus: ax25_frame.payload.ax25_payload.depl_ant_x_minus
  :field depl_ant_x_plus: ax25_frame.payload.ax25_payload.depl_ant_x_plus
  :field depl_ant_y_minus: ax25_frame.payload.ax25_payload.depl_ant_y_minus
  :field depl_ant_y_plus: ax25_frame.payload.ax25_payload.depl_ant_y_plus
  :field dab_temp: ax25_frame.payload.ax25_payload.dab_temp
  :field eps_bus_current: ax25_frame.payload.ax25_payload.eps_bus_current
  :field eps_bus_voltage: ax25_frame.payload.ax25_payload.eps_bus_voltage
  :field eps_variable_bus_v: ax25_frame.payload.ax25_payload.eps_variable_bus_v
  :field power_status_solar_panel_xpzp: ax25_frame.payload.ax25_payload.power_status_solar_panel_xpzp
  :field power_status_solar_panel_xpzm: ax25_frame.payload.ax25_payload.power_status_solar_panel_xpzm
  :field power_status_solar_panel_xmzp: ax25_frame.payload.ax25_payload.power_status_solar_panel_xmzp
  :field power_status_solar_panel_xmzm: ax25_frame.payload.ax25_payload.power_status_solar_panel_xmzm
  :field power_status_solar_panel_ypzp: ax25_frame.payload.ax25_payload.power_status_solar_panel_ypzp
  :field power_status_solar_panel_ypzm: ax25_frame.payload.ax25_payload.power_status_solar_panel_ypzm
  :field power_status_solar_panel_ymzp: ax25_frame.payload.ax25_payload.power_status_solar_panel_ymzp
  :field power_status_solar_panel_ymzm: ax25_frame.payload.ax25_payload.power_status_solar_panel_ymzm
  :field oppsp_xpzp_c: ax25_frame.payload.ax25_payload.oppsp_xpzp_c
  :field oppsp_xpzm_c: ax25_frame.payload.ax25_payload.oppsp_xpzm_c
  :field oppsp_xmzp_c: ax25_frame.payload.ax25_payload.oppsp_xmzp_c
  :field oppsp_xmzm_c: ax25_frame.payload.ax25_payload.oppsp_xmzm_c
  :field oppsp_ypzp_c: ax25_frame.payload.ax25_payload.oppsp_ypzp_c
  :field oppsp_ypzm_c: ax25_frame.payload.ax25_payload.oppsp_ypzm_c
  :field oppsp_ymzp_c: ax25_frame.payload.ax25_payload.oppsp_ymzp_c
  :field oppsp_ymzm_c: ax25_frame.payload.ax25_payload.oppsp_ymzm_c
  :field oppsp_xpzp_v: ax25_frame.payload.ax25_payload.oppsp_xpzp_v
  :field oppsp_xpzm_v: ax25_frame.payload.ax25_payload.oppsp_xpzm_v
  :field oppsp_xmzp_v: ax25_frame.payload.ax25_payload.oppsp_xmzp_v
  :field oppsp_xmzm_v: ax25_frame.payload.ax25_payload.oppsp_xmzm_v
  :field oppsp_ypzp_v: ax25_frame.payload.ax25_payload.oppsp_ypzp_v
  :field oppsp_ypzm_v: ax25_frame.payload.ax25_payload.oppsp_ypzm_v
  :field oppsp_ymzp_v: ax25_frame.payload.ax25_payload.oppsp_ymzp_v
  :field oppsp_ymzm_v: ax25_frame.payload.ax25_payload.oppsp_ymzm_v
  :field eps_solar_panel_xpzp_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_xpzp_temp
  :field eps_solar_panel_xpzm_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_xpzm_temp
  :field eps_solar_panel_xmzp_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_xmzp_temp
  :field eps_solar_panel_xmzm_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_xmzm_temp
  :field eps_solar_panel_ypzp_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_ypzp_temp
  :field eps_solar_panel_ypzm_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_ypzm_temp
  :field eps_solar_panel_ymzp_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_ymzp_temp
  :field eps_solar_panel_ymzm_temp: ax25_frame.payload.ax25_payload.eps_solar_panel_ymzm_temp
  :field eps_reg_board_temp: ax25_frame.payload.ax25_payload.eps_reg_board_temp
  :field bat1_dod: ax25_frame.payload.ax25_payload.bat1_dod
  :field bat1_cc: ax25_frame.payload.ax25_payload.bat1_cc
  :field bat1_dc: ax25_frame.payload.ax25_payload.bat1_dc
  :field bat1_v: ax25_frame.payload.ax25_payload.bat1_v
  :field bat1_temp: ax25_frame.payload.ax25_payload.bat1_temp
  :field bat2_dod: ax25_frame.payload.ax25_payload.bat2_dod
  :field bat2_cc: ax25_frame.payload.ax25_payload.bat2_cc
  :field bat2_dc: ax25_frame.payload.ax25_payload.bat2_dc
  :field bat2_v: ax25_frame.payload.ax25_payload.bat2_v
  :field bat2_temp: ax25_frame.payload.ax25_payload.bat2_temp
  :field bat3_dod: ax25_frame.payload.ax25_payload.bat3_dod
  :field bat3_cc: ax25_frame.payload.ax25_payload.bat3_cc
  :field bat3_dc: ax25_frame.payload.ax25_payload.bat3_dc
  :field bat3_v: ax25_frame.payload.ax25_payload.bat3_v
  :field bat3_temp: ax25_frame.payload.ax25_payload.bat3_temp
  :field bat4_dod: ax25_frame.payload.ax25_payload.bat4_dod
  :field bat4_cc: ax25_frame.payload.ax25_payload.bat4_cc
  :field bat4_dc: ax25_frame.payload.ax25_payload.bat4_dc
  :field bat4_v: ax25_frame.payload.ax25_payload.bat4_v
  :field bat4_temp: ax25_frame.payload.ax25_payload.bat4_temp
  :field t3_vc: ax25_frame.payload.ax25_payload.t3_vc
  :field t3_ic: ax25_frame.payload.ax25_payload.t3_ic
  :field t3_iv: ax25_frame.payload.ax25_payload.t3_iv
  :field t3_pt: ax25_frame.payload.ax25_payload.t3_pt
  :field t3_mt: ax25_frame.payload.ax25_payload.t3_mt
  :field t3_pp_1: ax25_frame.payload.ax25_payload.t3_pp_1
  :field t3_pp_2: ax25_frame.payload.ax25_payload.t3_pp_2
  :field t3_pp_3: ax25_frame.payload.ax25_payload.t3_pp_3
  :field t3_pp_4: ax25_frame.payload.ax25_payload.t3_pp_4
  :field t3_pp_5: ax25_frame.payload.ax25_payload.t3_pp_5
  :field t3_pp_6: ax25_frame.payload.ax25_payload.t3_pp_6
  :field t3_pp_7: ax25_frame.payload.ax25_payload.t3_pp_7
  :field t3_pp_8: ax25_frame.payload.ax25_payload.t3_pp_8
  :field t3_pp_9: ax25_frame.payload.ax25_payload.t3_pp_9
  :field t3_pp_10: ax25_frame.payload.ax25_payload.t3_pp_10
  :field t3_pp_11: ax25_frame.payload.ax25_payload.t3_pp_11
  :field t3_pp_12: ax25_frame.payload.ax25_payload.t3_pp_12
  :field t3_pp_13: ax25_frame.payload.ax25_payload.t3_pp_13
  :field t3_pp_14: ax25_frame.payload.ax25_payload.t3_pp_14
  :field t3_pp_15: ax25_frame.payload.ax25_payload.t3_pp_15
  :field t3_pp_16: ax25_frame.payload.ax25_payload.t3_pp_16
  :field t3_pp_17: ax25_frame.payload.ax25_payload.t3_pp_17
  :field t3_pp_18: ax25_frame.payload.ax25_payload.t3_pp_18
  :field t3_pp_19: ax25_frame.payload.ax25_payload.t3_pp_19
  :field t3_pp_20: ax25_frame.payload.ax25_payload.t3_pp_20
  :field t3_pp_21: ax25_frame.payload.ax25_payload.t3_pp_21
  :field t3_pp_22: ax25_frame.payload.ax25_payload.t3_pp_22
  :field t3_pp_23: ax25_frame.payload.ax25_payload.t3_pp_23
  :field t3_pp_24: ax25_frame.payload.ax25_payload.t3_pp_24
  :field t3_pp_25: ax25_frame.payload.ax25_payload.t3_pp_25
  :field t3_pp_26: ax25_frame.payload.ax25_payload.t3_pp_26
  :field t3_pp_27: ax25_frame.payload.ax25_payload.t3_pp_27
  :field t3_pp_28: ax25_frame.payload.ax25_payload.t3_pp_28
  :field t3_pp_29: ax25_frame.payload.ax25_payload.t3_pp_29
  :field t3_pp_30: ax25_frame.payload.ax25_payload.t3_pp_30
  :field t3_pp_31: ax25_frame.payload.ax25_payload.t3_pp_31
  :field t3_pp_32: ax25_frame.payload.ax25_payload.t3_pp_32
  :field t3_pp_33: ax25_frame.payload.ax25_payload.t3_pp_33
  :field t3_pp_34: ax25_frame.payload.ax25_payload.t3_pp_34
  :field t3_pp_35: ax25_frame.payload.ax25_payload.t3_pp_35
  :field t3_pp_36: ax25_frame.payload.ax25_payload.t3_pp_36
  :field t3_pp_37: ax25_frame.payload.ax25_payload.t3_pp_37
  :field t3_pp_38: ax25_frame.payload.ax25_payload.t3_pp_38
  :field t3_pp_39: ax25_frame.payload.ax25_payload.t3_pp_39
  :field t3_pp_40: ax25_frame.payload.ax25_payload.t3_pp_40
  :field t3_pp_41: ax25_frame.payload.ax25_payload.t3_pp_41
  :field t3_pp_42: ax25_frame.payload.ax25_payload.t3_pp_42
  :field t3_pp_43: ax25_frame.payload.ax25_payload.t3_pp_43
  :field t3_pp_44: ax25_frame.payload.ax25_payload.t3_pp_44
  :field t3_pp_45: ax25_frame.payload.ax25_payload.t3_pp_45
  :field t3_pp_46: ax25_frame.payload.ax25_payload.t3_pp_46
  :field t3_pp_47: ax25_frame.payload.ax25_payload.t3_pp_47
  :field t3_pp_48: ax25_frame.payload.ax25_payload.t3_pp_48
  :field t3_pp_49: ax25_frame.payload.ax25_payload.t3_pp_49
  :field t3_pp_50: ax25_frame.payload.ax25_payload.t3_pp_50
  :field t3_pp_51: ax25_frame.payload.ax25_payload.t3_pp_51
  :field t3_pp_52: ax25_frame.payload.ax25_payload.t3_pp_52
  :field t3_pp_53: ax25_frame.payload.ax25_payload.t3_pp_53
  :field t3_pp_54: ax25_frame.payload.ax25_payload.t3_pp_54
  :field t3_pp_55: ax25_frame.payload.ax25_payload.t3_pp_55
  :field t3_pp_56: ax25_frame.payload.ax25_payload.t3_pp_56
  :field t3_pp_57: ax25_frame.payload.ax25_payload.t3_pp_57
  :field t3_pp_58: ax25_frame.payload.ax25_payload.t3_pp_58
  :field t3_pp_59: ax25_frame.payload.ax25_payload.t3_pp_59
  :field t3_pp_60: ax25_frame.payload.ax25_payload.t3_pp_60
  :field sdm_iv_id: ax25_frame.payload.ax25_payload.sdm_iv_id
  :field skip: ax25_frame.payload.ax25_payload.skip
  :field sdm_status_cell_temp_ym: ax25_frame.payload.ax25_payload.sdm_status_cell_temp_ym
  :field sdm_status_cell_temp_yp: ax25_frame.payload.ax25_payload.sdm_status_cell_temp_yp
  :field sdm_iv_curve_c1: ax25_frame.payload.ax25_payload.sdm_iv_curve_c1
  :field sdm_iv_curve_c2: ax25_frame.payload.ax25_payload.sdm_iv_curve_c2
  :field sdm_iv_curve_c3: ax25_frame.payload.ax25_payload.sdm_iv_curve_c3
  :field sdm_iv_curve_c4: ax25_frame.payload.ax25_payload.sdm_iv_curve_c4
  :field sdm_iv_curve_c5: ax25_frame.payload.ax25_payload.sdm_iv_curve_c5
  :field sdm_iv_curve_c6: ax25_frame.payload.ax25_payload.sdm_iv_curve_c6
  :field sdm_iv_curve_c7: ax25_frame.payload.ax25_payload.sdm_iv_curve_c7
  :field sdm_iv_curve_c8: ax25_frame.payload.ax25_payload.sdm_iv_curve_c8
  :field sdm_iv_curve_v1: ax25_frame.payload.ax25_payload.sdm_iv_curve_v1
  :field sdm_iv_curve_v2: ax25_frame.payload.ax25_payload.sdm_iv_curve_v2
  :field sdm_iv_curve_v3: ax25_frame.payload.ax25_payload.sdm_iv_curve_v3
  :field sdm_iv_curve_v4: ax25_frame.payload.ax25_payload.sdm_iv_curve_v4
  :field sdm_iv_curve_v5: ax25_frame.payload.ax25_payload.sdm_iv_curve_v5
  :field sdm_iv_curve_v6: ax25_frame.payload.ax25_payload.sdm_iv_curve_v6
  :field sdm_iv_curve_v7: ax25_frame.payload.ax25_payload.sdm_iv_curve_v7
  :field sdm_iv_curve_v8: ax25_frame.payload.ax25_payload.sdm_iv_curve_v8
  :field sdm_cell_temp_ym: ax25_frame.payload.ax25_payload.sdm_cell_temp_ym
  :field sdm_cell_temp_yp: ax25_frame.payload.ax25_payload.sdm_cell_temp_yp


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
      - id: ax25_payload
        type: delfin3xt_payload
        size-eos: true

  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_payload
        type: delfin3xt_payload
        doc-ref: 'https://www.pe0sat.vgnet.nl/download/DELFI/Delfi-n3xt-Telemetry-Format.xlsx'
        size-eos: true

  delfin3xt_payload:
    meta:
      endian: be
    seq:
      - id: elapsed_time
        type: u4
      - id: boot_counter
        type: u2
      - id: frame_ctr_type
        type: u4
      - id: ptrx_dv_raw
        type: b12
      - id: ptrx_rss_raw
        type: b12
      - id: ptrx_rp_raw
        type: b12
      - id: ptrx_fp_raw
        type: b12
      - id: ptrx_tsc_raw
        type: b12
      - id: ptrx_rsc_raw
        type: b12
      - id: ptrx_pa_temp_raw
        type: b12
      - id: ptrx_pbv_raw
        type: b12
      - id: depl_sol_x_minus
        type: b1
      - id: depl_sol_x_plus
        type: b1
      - id: depl_sol_y_minus
        type: b1
      - id: depl_sol_y_plus
        type: b1
      - id: depl_ant_x_minus
        type: b1
      - id: depl_ant_x_plus
        type: b1
      - id: depl_ant_y_minus
        type: b1
      - id: depl_ant_y_plus
        type: b1
      - id: dab_temp
        type: u1
      - id: eps_bus_current
        type: b12
      - id: eps_bus_voltage
        type: b12
      - id: eps_variable_bus_v
        type: u1
      - id: power_status_solar_panel_xpzp
        type: b1
      - id: power_status_solar_panel_xpzm
        type: b1
      - id: power_status_solar_panel_xmzp
        type: b1
      - id: power_status_solar_panel_xmzm
        type: b1
      - id: power_status_solar_panel_ypzp
        type: b1
      - id: power_status_solar_panel_ypzm
        type: b1
      - id: power_status_solar_panel_ymzp
        type: b1
      - id: power_status_solar_panel_ymzm
        type: b1
      - id: oppsp_xpzp_c
        type: u1
      - id: oppsp_xpzm_c
        type: u1
      - id: oppsp_xmzp_c
        type: u1
      - id: oppsp_xmzm_c
        type: u1
      - id: oppsp_ypzp_c
        type: u1
      - id: oppsp_ypzm_c
        type: u1
      - id: oppsp_ymzp_c
        type: u1
      - id: oppsp_ymzm_c
        type: u1
      - id: oppsp_xpzp_v
        type: u1
      - id: oppsp_xpzm_v
        type: u1
      - id: oppsp_xmzp_v
        type: u1
      - id: oppsp_xmzm_v
        type: u1
      - id: oppsp_ypzp_v
        type: u1
      - id: oppsp_ypzm_v
        type: u1
      - id: oppsp_ymzp_v
        type: u1
      - id: oppsp_ymzm_v
        type: u1
      - id: eps_solar_panel_xpzp_temp
        type: u1
      - id: eps_solar_panel_xpzm_temp
        type: u1
      - id: eps_solar_panel_xmzp_temp
        type: u1
      - id: eps_solar_panel_xmzm_temp
        type: u1
      - id: eps_solar_panel_ypzp_temp
        type: u1
      - id: eps_solar_panel_ypzm_temp
        type: u1
      - id: eps_solar_panel_ymzp_temp
        type: u1
      - id: eps_solar_panel_ymzm_temp
        type: u1
      - id: eps_reg_board_temp
        type: u1
      - id: bat1_dod
        type: u1
      - id: bat1_cc
        type: u1
      - id: bat1_dc
        type: u1
      - id: bat1_v
        type: u1
      - id: bat1_temp
        type: u1
      - id: bat2_dod
        type: u1
      - id: bat2_cc
        type: u1
      - id: bat2_dc
        type: u1
      - id: bat2_v
        type: u1
      - id: bat2_temp
        type: u1
      - id: bat3_dod
        type: u1
      - id: bat3_cc
        type: u1
      - id: bat3_dc
        type: u1
      - id: bat3_v
        type: u1
      - id: bat3_temp
        type: u1
      - id: bat4_dod
        type: u1
      - id: bat4_cc
        type: u1
      - id: bat4_dc
        type: u1
      - id: bat4_v
        type: u1
      - id: bat4_temp
        type: u1
      - id: t3_vc
        type: u1
      - id: t3_ic
        type: u1
      - id: t3_iv
        type: u1
      - id: t3_pt
        type: u1
      - id: t3_mt
        type: u1
      - id: t3_pp_1
        type: b12
      - id: t3_pp_2
        type: b12
      - id: t3_pp_3
        type: b12
      - id: t3_pp_4
        type: b12
      - id: t3_pp_5
        type: b12
      - id: t3_pp_6
        type: b12
      - id: t3_pp_7
        type: b12
      - id: t3_pp_8
        type: b12
      - id: t3_pp_9
        type: b12
      - id: t3_pp_10
        type: b12
      - id: t3_pp_11
        type: b12
      - id: t3_pp_12
        type: b12
      - id: t3_pp_13
        type: b12
      - id: t3_pp_14
        type: b12
      - id: t3_pp_15
        type: b12
      - id: t3_pp_16
        type: b12
      - id: t3_pp_17
        type: b12
      - id: t3_pp_18
        type: b12
      - id: t3_pp_19
        type: b12
      - id: t3_pp_20
        type: b12
      - id: t3_pp_21
        type: b12
      - id: t3_pp_22
        type: b12
      - id: t3_pp_23
        type: b12
      - id: t3_pp_24
        type: b12
      - id: t3_pp_25
        type: b12
      - id: t3_pp_26
        type: b12
      - id: t3_pp_27
        type: b12
      - id: t3_pp_28
        type: b12
      - id: t3_pp_29
        type: b12
      - id: t3_pp_30
        type: b12
      - id: t3_pp_31
        type: b12
      - id: t3_pp_32
        type: b12
      - id: t3_pp_33
        type: b12
      - id: t3_pp_34
        type: b12
      - id: t3_pp_35
        type: b12
      - id: t3_pp_36
        type: b12
      - id: t3_pp_37
        type: b12
      - id: t3_pp_38
        type: b12
      - id: t3_pp_39
        type: b12
      - id: t3_pp_40
        type: b12
      - id: t3_pp_41
        type: b12
      - id: t3_pp_42
        type: b12
      - id: t3_pp_43
        type: b12
      - id: t3_pp_44
        type: b12
      - id: t3_pp_45
        type: b12
      - id: t3_pp_46
        type: b12
      - id: t3_pp_47
        type: b12
      - id: t3_pp_48
        type: b12
      - id: t3_pp_49
        type: b12
      - id: t3_pp_50
        type: b12
      - id: t3_pp_51
        type: b12
      - id: t3_pp_52
        type: b12
      - id: t3_pp_53
        type: b12
      - id: t3_pp_54
        type: b12
      - id: t3_pp_55
        type: b12
      - id: t3_pp_56
        type: b12
      - id: t3_pp_57
        type: b12
      - id: t3_pp_58
        type: b12
      - id: t3_pp_59
        type: b12
      - id: t3_pp_60
        type: b12
      - id: sdm_iv_id
        type: b4
      - id: skip
        type: b2
      - id: sdm_status_cell_temp_ym
        type: b1
      - id: sdm_status_cell_temp_yp
        type: b1
      - id: sdm_iv_curve_c1
        type: u2
      - id: sdm_iv_curve_c2
        type: u2
      - id: sdm_iv_curve_c3
        type: u2
      - id: sdm_iv_curve_c4
        type: u2
      - id: sdm_iv_curve_c5
        type: u2
      - id: sdm_iv_curve_c6
        type: u2
      - id: sdm_iv_curve_c7
        type: u2
      - id: sdm_iv_curve_c8
        type: u2
      - id: sdm_iv_curve_v1
        type: u2
      - id: sdm_iv_curve_v2
        type: u2
      - id: sdm_iv_curve_v3
        type: u2
      - id: sdm_iv_curve_v4
        type: u2
      - id: sdm_iv_curve_v5
        type: u2
      - id: sdm_iv_curve_v6
        type: u2
      - id: sdm_iv_curve_v7
        type: u2
      - id: sdm_iv_curve_v8
        type: u2
      - id: sdm_cell_temp_ym
        type: u1
      - id: sdm_cell_temp_yp
        type: u1
    instances:
      payloadsize:
        value: _io.size
      framecounter:
        value: '(frame_ctr_type & 0xFFFFFFFE) >> 1'
      frametype:
        value: 'frame_ctr_type & 0x1'
