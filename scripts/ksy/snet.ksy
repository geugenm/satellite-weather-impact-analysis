meta:
  id: snet
  endian: le

doc: |
  :field fsync: pdu_header.fsync
  :field crc: pdu_header.crc
  :field fcid_major: pdu_header.fcid_major
  :field fcid_sub: pdu_header.fcid_sub
  :field urgent: pdu_header.control_1.urgent
  :field extended: pdu_header.control_1.extended
  :field crc_check: pdu_header.control_1.crc_check
  :field multi_frame: pdu_header.control_1.multi_frame
  :field time_tag_setting: pdu_header.control_1.time_tag_setting
  :field time_tagged: pdu_header.control_1.time_tagged
  :field data_length: pdu_header.data_length
  :field time_tag: pdu_header.time_tag
  :field versno: pdu_header_extension.extension.versno
  :field dfcid: pdu_header_extension.extension.dfcid
  :field rfu: pdu_header_extension.extension.rfu
  :field channel_info: pdu_header_extension.channel_info
  :field qos: pdu_header_extension.control_2.qos
  :field pdu_type_id: pdu_header_extension.control_2.pdu_type_id
  :field arq: pdu_header_extension.control_2.arq
  :field control_2_rfu: pdu_header_extension.control_2.rfu
  :field time_tag_sub: pdu_header_extension.time_tag_sub
  :field scid: pdu_header_extension.scid
  :field seqno: pdu_header_extension.seqno
  :field adcs_pget_imodechklistthisstepactive: payload.adcs_pget_imodechklistthisstepactive
  :field adcs_pget_iattdetfinalstate: payload.adcs_pget_iattdetfinalstate
  :field adcs_pget_isensorarrayavailstatusga: payload.adcs_pget_isensorarrayavailstatusga
  :field adcs_pget_isensorarrayavailstatusmfsa: payload.adcs_pget_isensorarrayavailstatusmfsa
  :field adcs_pget_isensorarrayavailstatussusea: payload.adcs_pget_isensorarrayavailstatussusea
  :field adcs_pget_iactarrayavailstatusrwa: payload.adcs_pget_iactarrayavailstatusrwa
  :field adcs_pget_iactarrayavailstatusmata: payload.adcs_pget_iactarrayavailstatusmata
  :field adcs_pget_attdetmfsdistcorrmode: payload.adcs_pget_attdetmfsdistcorrmode
  :field adcs_pget_attdetsusedistcorrmode: payload.adcs_pget_attdetsusedistcorrmode
  :field adcs_pget_attdettrackigrfdeltab: payload.adcs_pget_attdettrackigrfdeltab
  :field adcs_pget_attdetsusealbedotracking: payload.adcs_pget_attdetsusealbedotracking
  :field adcs_pget_suse1albedoflag: payload.adcs_pget_suse1albedoflag
  :field adcs_pget_suse2albedoflag: payload.adcs_pget_suse2albedoflag
  :field adcs_pget_suse3albedoflag: payload.adcs_pget_suse3albedoflag
  :field adcs_pget_suse4albedoflag: payload.adcs_pget_suse4albedoflag
  :field adcs_pget_suse5albedoflag: payload.adcs_pget_suse5albedoflag
  :field adcs_pget_suse6albedoflag: payload.adcs_pget_suse6albedoflag
  :field adcs_pget_attdetautovirtualizemfsa: payload.adcs_pget_attdetautovirtualizemfsa
  :field adcs_pget_attdetautovirtualizesusea: payload.adcs_pget_attdetautovirtualizesusea
  :field adcs_pget_attdetnarrowvectors: payload.adcs_pget_attdetnarrowvectors
  :field adcs_pget_attdetmismatchingvectors: payload.adcs_pget_attdetmismatchingvectors
  :field raw: payload.adcs_pget_omegaxoptimal_sat.raw
  :field value: payload.adcs_pget_omegaxoptimal_sat.value
  :field adcs_pget_omegayoptimal_sat_raw: payload.adcs_pget_omegayoptimal_sat.raw
  :field adcs_pget_omegayoptimal_sat_value: payload.adcs_pget_omegayoptimal_sat.value
  :field adcs_pget_omegazoptimal_sat_raw: payload.adcs_pget_omegazoptimal_sat.raw
  :field adcs_pget_omegazoptimal_sat_value: payload.adcs_pget_omegazoptimal_sat.value
  :field adcs_pget_magxoptimal_sat_raw: payload.adcs_pget_magxoptimal_sat.raw
  :field adcs_pget_magxoptimal_sat_value: payload.adcs_pget_magxoptimal_sat.value
  :field adcs_pget_magyoptimal_sat_raw: payload.adcs_pget_magyoptimal_sat.raw
  :field adcs_pget_magyoptimal_sat_value: payload.adcs_pget_magyoptimal_sat.value
  :field adcs_pget_magzoptimal_sat_raw: payload.adcs_pget_magzoptimal_sat.raw
  :field adcs_pget_magzoptimal_sat_value: payload.adcs_pget_magzoptimal_sat.value
  :field adcs_pget_sunxoptimal_sat_raw: payload.adcs_pget_sunxoptimal_sat.raw
  :field adcs_pget_sunxoptimal_sat_value: payload.adcs_pget_sunxoptimal_sat.value
  :field adcs_pget_sunyoptimal_sat_raw: payload.adcs_pget_sunyoptimal_sat.raw
  :field adcs_pget_sunyoptimal_sat_value: payload.adcs_pget_sunyoptimal_sat.value
  :field adcs_pget_sunzoptimal_sat_raw: payload.adcs_pget_sunzoptimal_sat.raw
  :field adcs_pget_sunzoptimal_sat_value: payload.adcs_pget_sunzoptimal_sat.value
  :field adcs_pget_dctrltorquerwax_sat_lr_raw: payload.adcs_pget_dctrltorquerwax_sat_lr.raw
  :field adcs_pget_dctrltorquerwax_sat_lr_value: payload.adcs_pget_dctrltorquerwax_sat_lr.value
  :field adcs_pget_dctrltorquerway_sat_lr_raw: payload.adcs_pget_dctrltorquerway_sat_lr.raw
  :field adcs_pget_dctrltorquerway_sat_lr_value: payload.adcs_pget_dctrltorquerway_sat_lr.value
  :field adcs_pget_dctrltorquerwaz_sat_lr_raw: payload.adcs_pget_dctrltorquerwaz_sat_lr.raw
  :field adcs_pget_dctrltorquerwaz_sat_lr_value: payload.adcs_pget_dctrltorquerwaz_sat_lr.value
  :field adcs_pget_dctrlmagmomentmatax_sat_lr_raw: payload.adcs_pget_dctrlmagmomentmatax_sat_lr.raw
  :field adcs_pget_dctrlmagmomentmatax_sat_lr_value: payload.adcs_pget_dctrlmagmomentmatax_sat_lr.value
  :field adcs_pget_dctrlmagmomentmatay_sat_lr_raw: payload.adcs_pget_dctrlmagmomentmatay_sat_lr.raw
  :field adcs_pget_dctrlmagmomentmatay_sat_lr_value: payload.adcs_pget_dctrlmagmomentmatay_sat_lr.value
  :field adcs_pget_dctrlmagmomentmataz_sat_lr_raw: payload.adcs_pget_dctrlmagmomentmataz_sat_lr.raw
  :field adcs_pget_dctrlmagmomentmataz_sat_lr_value: payload.adcs_pget_dctrlmagmomentmataz_sat_lr.value
  :field adcs_pget_ireadtorquerwx_mfr_raw: payload.adcs_pget_ireadtorquerwx_mfr.raw
  :field adcs_pget_ireadtorquerwx_mfr_value: payload.adcs_pget_ireadtorquerwx_mfr.value
  :field adcs_pget_ireadtorquerwy_mfr_raw: payload.adcs_pget_ireadtorquerwy_mfr.raw
  :field adcs_pget_ireadtorquerwy_mfr_value: payload.adcs_pget_ireadtorquerwy_mfr.value
  :field adcs_pget_ireadtorquerwz_mfr_raw: payload.adcs_pget_ireadtorquerwz_mfr.raw
  :field adcs_pget_ireadtorquerwz_mfr_value: payload.adcs_pget_ireadtorquerwz_mfr.value
  :field adcs_pget_ireadrotspeedrwx_mfr: payload.adcs_pget_ireadrotspeedrwx_mfr
  :field adcs_pget_ireadrotspeedrwy_mfr: payload.adcs_pget_ireadrotspeedrwy_mfr
  :field adcs_pget_ireadrotspeedrwz_mfr: payload.adcs_pget_ireadrotspeedrwz_mfr
  :field adcs_pget_sgp4latxpef_raw: payload.adcs_pget_sgp4latxpef.raw
  :field adcs_pget_sgp4latxpef_value: payload.adcs_pget_sgp4latxpef.value
  :field adcs_pget_sgp4longypef_raw: payload.adcs_pget_sgp4longypef.raw
  :field adcs_pget_sgp4longypef_value: payload.adcs_pget_sgp4longypef.value
  :field adcs_pget_sgp4altpef_raw: payload.adcs_pget_sgp4altpef.raw
  :field adcs_pget_sgp4altpef_value: payload.adcs_pget_sgp4altpef.value
  :field adcs_pget_attitudeerrorangle_raw: payload.adcs_pget_attitudeerrorangle.raw
  :field adcs_pget_attitudeerrorangle_value: payload.adcs_pget_attitudeerrorangle.value
  :field adcs_pget_targetdata_distance: payload.adcs_pget_targetdata_distance
  :field adcs_pget_targetdata_controlisactive: payload.adcs_pget_targetdata_controlisactive
  :field eps_pget_s00_cur_solx_pos_raw: payload.eps_pget_s00_cur_solx_pos.raw
  :field eps_pget_s00_cur_solx_pos_value: payload.eps_pget_s00_cur_solx_pos.value
  :field eps_pget_s01_cur_solx_neg_raw: payload.eps_pget_s01_cur_solx_neg.raw
  :field eps_pget_s01_cur_solx_neg_value: payload.eps_pget_s01_cur_solx_neg.value
  :field eps_pget_s02_cur_soly_pos_raw: payload.eps_pget_s02_cur_soly_pos.raw
  :field eps_pget_s02_cur_soly_pos_value: payload.eps_pget_s02_cur_soly_pos.value
  :field eps_pget_s03_cur_soly_neg_raw: payload.eps_pget_s03_cur_soly_neg.raw
  :field eps_pget_s03_cur_soly_neg_value: payload.eps_pget_s03_cur_soly_neg.value
  :field eps_pget_s04_cur_solz_pos_raw: payload.eps_pget_s04_cur_solz_pos.raw
  :field eps_pget_s04_cur_solz_pos_value: payload.eps_pget_s04_cur_solz_pos.value
  :field eps_pget_s05_cur_solz_neg_raw: payload.eps_pget_s05_cur_solz_neg.raw
  :field eps_pget_s05_cur_solz_neg_value: payload.eps_pget_s05_cur_solz_neg.value
  :field eps_pget_s06_v_sol: payload.eps_pget_s06_v_sol
  :field eps_pget_s24_v_bat0_raw: payload.eps_pget_s24_v_bat0.raw
  :field eps_pget_s24_v_bat0_value: payload.eps_pget_s24_v_bat0.value
  :field eps_pget_s26_a_in_charger0_raw: payload.eps_pget_s26_a_in_charger0.raw
  :field eps_pget_s26_a_in_charger0_value: payload.eps_pget_s26_a_in_charger0.value
  :field eps_pget_s25_a_out_charger0_raw: payload.eps_pget_s25_a_out_charger0.raw
  :field eps_pget_s25_a_out_charger0_value: payload.eps_pget_s25_a_out_charger0.value
  :field eps_pget_s13_v_bat1_raw: payload.eps_pget_s13_v_bat1.raw
  :field eps_pget_s13_v_bat1_value: payload.eps_pget_s13_v_bat1.value
  :field eps_pget_s23_a_in_charger1_raw: payload.eps_pget_s23_a_in_charger1.raw
  :field eps_pget_s23_a_in_charger1_value: payload.eps_pget_s23_a_in_charger1.value
  :field eps_pget_s14_a_out_charger1_raw: payload.eps_pget_s14_a_out_charger1.raw
  :field eps_pget_s14_a_out_charger1_value: payload.eps_pget_s14_a_out_charger1.value
  :field eps_pget_s22_v_sum_raw: payload.eps_pget_s22_v_sum.raw
  :field eps_pget_s22_v_sum_value: payload.eps_pget_s22_v_sum.value
  :field eps_pget_s44_v_3v3_raw: payload.eps_pget_s44_v_3v3.raw
  :field eps_pget_s44_v_3v3_value: payload.eps_pget_s44_v_3v3.value
  :field eps_pget_s45_v_5v_raw: payload.eps_pget_s45_v_5v.raw
  :field eps_pget_s45_v_5v_value: payload.eps_pget_s45_v_5v.value
  :field thm_pget_s31_th_bat0_raw: payload.thm_pget_s31_th_bat0.raw
  :field thm_pget_s31_th_bat0_value: payload.thm_pget_s31_th_bat0.value
  :field thm_pget_s15_th_bat1_raw: payload.thm_pget_s15_th_bat1.raw
  :field thm_pget_s15_th_bat1_value: payload.thm_pget_s15_th_bat1.value
  :field thm_pget_th_obc: payload.thm_pget_th_obc
  :field eps_pget_a_obc: payload.eps_pget_a_obc
  :field eps_pget_v_obc: payload.eps_pget_v_obc
  :field eps_pget_s30_a_in_bat0_raw: payload.eps_pget_s30_a_in_bat0.raw
  :field eps_pget_s30_a_in_bat0_value: payload.eps_pget_s30_a_in_bat0.value
  :field eps_pget_s29_a_out_bat0_raw: payload.eps_pget_s29_a_out_bat0.raw
  :field eps_pget_s29_a_out_bat0_value: payload.eps_pget_s29_a_out_bat0.value
  :field eps_pget_s12_a_in_bat1_raw: payload.eps_pget_s12_a_in_bat1.raw
  :field eps_pget_s12_a_in_bat1_value: payload.eps_pget_s12_a_in_bat1.value
  :field eps_pget_s20_a_out_bat1_raw: payload.eps_pget_s20_a_out_bat1.raw
  :field eps_pget_s20_a_out_bat1_value: payload.eps_pget_s20_a_out_bat1.value
  :field com0_pget_systime: payload.contents.com0_pget_systime
  :field com0_pget_memdatatype: payload.contents.com0_pget_memdatatype
  :field com0_pget_memdata32: payload.contents.com0_pget_memdata32
  :field com1_pget_systime: payload.contents.com1_pget_systime
  :field com1_pget_memdatatype: payload.contents.com1_pget_memdatatype
  :field com1_pget_memdata32: payload.contents.com1_pget_memdata32

  
seq:
  - id: pdu_header
    type: pdu_header
  - id: pdu_header_extension
    type: pdu_header_extension
    if: pdu_header.control_1.extended
  - id: payload
    type: 
      switch-on: pdu_header.fcid_major
      cases:
        0: adcs_standard_telemetry
        9: eps_standard_telemetry
        54: fcid54
    
enums:
  versno:
    0: salsat
  scid:
    0: snet_a
    1: snet_b
    2: snet_c
    3: snet_d
    4: salsat
    
types:
  pdu_header:
    seq:
      - id: fsync
        type: b18
        valid: 0x3cd40
      - id: crc
        type: b14
      - id: fcid_major
        type: b6
      - id: fcid_sub
        type: b10
      - id: control_1
        type: control_1
      - id: data_length
        type: b10
      - id: time_tag
        type: u4le
        if: control_1.time_tagged == true
  
  control_1:
    seq:
      - id: urgent
        type: b1
      - id: extended
        type: b1
      - id: crc_check
        type: b1
      - id: multi_frame
        type: b1
      - id: time_tag_setting
        type: b1
      - id: time_tagged
        type: b1
    
  pdu_header_extension:
    seq:
      - id: extension
        type: extension
      - id: channel_info
        type: b8
      - id: control_2
        type: control_2
      - id: time_tag_sub
        type: b16
      - id: scid
        type: b10
        enum: scid
      - id: seqno
        type: b14

  extension:
    seq: 
      - id: versno
        type: b2
        enum: versno
      - id: dfcid
        type: b2
      - id: rfu
        type: b4
        
  control_2:
    seq:
      - id: qos
        type: b1
      - id: pdu_type_id
        type: b1
      - id: arq
        type: b1
      - id: rfu
        type: b5
  
  eps_standard_telemetry:
    seq:
      - id: eps_pget_s00_cur_solx_pos
        type: solarcurrent
      - id: eps_pget_s01_cur_solx_neg
        type: solarcurrent
      - id: eps_pget_s02_cur_soly_pos
        type: solarcurrent
      - id: eps_pget_s03_cur_soly_neg
        type: solarcurrent
      - id: eps_pget_s04_cur_solz_pos
        type: solarcurrent
      - id: eps_pget_s05_cur_solz_neg
        type: solarcurrent
      - id: eps_pget_s06_v_sol
        type: s2
      - id: eps_pget_s24_v_bat0
        type: batvoltage
      - id: eps_pget_s26_a_in_charger0
        type: chargecurr
      - id: eps_pget_s25_a_out_charger0
        type: outcurr
      - id: eps_pget_s13_v_bat1
        type: batvoltage
      - id: eps_pget_s23_a_in_charger1
        type: chargecurr
      - id: eps_pget_s14_a_out_charger1
        type: outcurr
      - id: eps_pget_s22_v_sum
        type: batvoltage
      - id: eps_pget_s44_v_3v3
        type: v3voltage
      - id: eps_pget_s45_v_5v
        type: v5voltage
      - id: thm_pget_s31_th_bat0
        type: battemp
      - id: thm_pget_s15_th_bat1
        type: battemp
      - id: thm_pget_th_obc
        type: s2
      - id: eps_pget_a_obc
        type: u2
      - id: eps_pget_v_obc
        type: u2
      - id: eps_pget_s30_a_in_bat0
        type: chargecurr
      - id: eps_pget_s29_a_out_bat0
        type: chargecurr
      - id: eps_pget_s12_a_in_bat1
        type: chargecurr
      - id: eps_pget_s20_a_out_bat1
        type: chargecurr
  
  solarcurrent:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 50
        
  batvoltage:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 2
        
  chargecurr:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 12
        
  outcurr:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 6
        
  v3voltage:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 8
  
  v5voltage:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 5
  
  battemp:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 256
  
  adcs_standard_telemetry:
    seq:
      - id: adcs_pget_imodechklistthisstepactive
        type: s1
      - id: adcs_pget_iattdetfinalstate
        type: u1
      - id: adcs_pget_isensorarrayavailstatusga
        type: u1
      - id: adcs_pget_isensorarrayavailstatusmfsa
        type: u1
      - id: adcs_pget_isensorarrayavailstatussusea
        type: u1
      - id: adcs_pget_iactarrayavailstatusrwa
        type: u1
      - id: adcs_pget_iactarrayavailstatusmata
        type: u1
      - id: adcs_pget_attdetmfsdistcorrmode
        type: u1
      - id: adcs_pget_attdetsusedistcorrmode
        type: u1
      - id: adcs_pget_attdettrackigrfdeltab
        type: b1
      - id: adcs_pget_attdetsusealbedotracking
        type: b1
      - id: adcs_pget_suse1albedoflag
        type: b1
      - id: adcs_pget_suse2albedoflag
        type: b1
      - id: adcs_pget_suse3albedoflag
        type: b1
      - id: adcs_pget_suse4albedoflag
        type: b1
      - id: adcs_pget_suse5albedoflag
        type: b1
      - id: adcs_pget_suse6albedoflag
        type: b1
      - id: adcs_pget_attdetautovirtualizemfsa
        type: b1
      - id: adcs_pget_attdetautovirtualizesusea
        type: b1
      - id: adcs_pget_attdetnarrowvectors
        type: b1
      - id: adcs_pget_attdetmismatchingvectors
        type: b1
      - id: adcs_pget_omegaxoptimal_sat
        type: angularrate
      - id: adcs_pget_omegayoptimal_sat
        type: angularrate
      - id: adcs_pget_omegazoptimal_sat
        type: angularrate
      - id: adcs_pget_magxoptimal_sat
        type: magfield
      - id: adcs_pget_magyoptimal_sat
        type: magfield
      - id: adcs_pget_magzoptimal_sat
        type: magfield
      - id: adcs_pget_sunxoptimal_sat
        type: sunvect
      - id: adcs_pget_sunyoptimal_sat
        type: sunvect
      - id: adcs_pget_sunzoptimal_sat
        type: sunvect
      - id: adcs_pget_dctrltorquerwax_sat_lr
        type: torquerw
      - id: adcs_pget_dctrltorquerway_sat_lr
        type: torquerw
      - id: adcs_pget_dctrltorquerwaz_sat_lr
        type: torquerw
      - id: adcs_pget_dctrlmagmomentmatax_sat_lr
        type: torquemag
      - id: adcs_pget_dctrlmagmomentmatay_sat_lr
        type: torquemag
      - id: adcs_pget_dctrlmagmomentmataz_sat_lr
        type: torquemag
      - id: adcs_pget_ireadtorquerwx_mfr
        type: measuredtorque
      - id: adcs_pget_ireadtorquerwy_mfr
        type: measuredtorque
      - id: adcs_pget_ireadtorquerwz_mfr
        type: measuredtorque
      - id: adcs_pget_ireadrotspeedrwx_mfr
        type: s2
      - id: adcs_pget_ireadrotspeedrwy_mfr
        type: s2
      - id: adcs_pget_ireadrotspeedrwz_mfr
        type: s2
      - id: adcs_pget_sgp4latxpef
        type: lat
      - id: adcs_pget_sgp4longypef
        type: lon
      - id: adcs_pget_sgp4altpef
        type: alt
      - id: adcs_pget_attitudeerrorangle
        type: attitude
      - id: adcs_pget_targetdata_distance
        type: u2
      - id: adcs_pget_targetdata_controlisactive
        type: b1
        
  angularrate:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 260
  
  magfield:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 0.1
        
  sunvect:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 32000

  torquerw:
    seq:
      - id: raw
        type: s1
    instances:
      value:
        value: 1000000 * raw.as<f8> / 38484
        
  torquemag:
    seq:
      - id: raw
        type: s1
    instances:
      value:
        value: raw.as<f8> / 127
        
  measuredtorque:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: 1000000 * raw.as<f8> / 9696969
        
  lat:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 355
  
  lon:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: raw.as<f8> / 177
  
  alt:
    seq:
      - id: raw
        type: u1
    instances:
      value:
        value: raw.as<f8> / 0.25
        
  attitude:
    seq:
      - id: raw
        type: u2
    instances:
      value:
        value: raw.as<f8> / 177
        
  fcid54:
    seq:
      - id: contents
        type:
          switch-on: _parent.pdu_header.fcid_major
          cases:
            17: mailbox0
            117: mailbox1
            
  mailbox0:
    seq:
      - id: com0_pget_systime
        type: u4
      - id: com0_pget_memdatatype
        type: u1
      - id: com0_pget_memdata32
        size: 32
  
  mailbox1:
    seq:
      - id: com1_pget_systime
        type: u4
      - id: com1_pget_memdatatype
        type: u1
      - id: com1_pget_memdata32
        size: 32
  