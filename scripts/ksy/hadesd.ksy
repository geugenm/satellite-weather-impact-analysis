meta:
  id: hadesd
  endian: le
  bit-endian: be

doc: |
  # General
  :field hadesd_type: cubesat_frame.first_header.type
  :field hadesd_address: cubesat_frame.first_header.address
  # Type1 Frame (Power):
  :field hadesd_power_spa_tmp: cubesat_frame.metadata.spa_tmp
  :field hadesd_power_spb_tmp: cubesat_frame.metadata.spb_tmp
  :field hadesd_power_spc_tmp: cubesat_frame.metadata.spc_tmp
  :field hadesd_power_spd_tmp: cubesat_frame.metadata.spd_tmp
  :field hadesd_power_spe_tmp: cubesat_frame.metadata.spe_tmp
  :field hadesd_power_spf_tmp: cubesat_frame.metadata.spf_tmp
  :field hadesd_power_vbusadc_vbatadc_hi_tmp: cubesat_frame.metadata.vbusadc_vbatadc_hi_tmp
  :field hadesd_power_vbatadc_lo_vcpuadc_hi_tmp: cubesat_frame.metadata.vbatadc_lo_vcpuadc_hi_tmp
  :field hadesd_power_vcpuadc_lo_vbus2_tmp: cubesat_frame.metadata.vcpuadc_lo_vbus2_tmp
  :field hadesd_power_vbus3_vbat2_hi_tmp: cubesat_frame.metadata.vbus3_vbat2_hi_tmp
  :field hadesd_power_vbat2_lo_ibat_hi_tmp: cubesat_frame.metadata.vbat2_lo_ibat_hi_tmp
  :field hadesd_power_ibat_lo_icpu_hi_tmp: cubesat_frame.metadata.ibat_lo_icpu_hi_tmp
  :field hadesd_power_icpu_lo_ipl_tmp: cubesat_frame.metadata.icpu_lo_ipl_tmp
  :field hadesd_power_powerdul_tmp: cubesat_frame.metadata.powerdul_tmp
  :field hadesd_power_powerdul455_tmp: cubesat_frame.metadata.powerdul455_tmp
  :field hadesd_power_vdac_tmp: cubesat_frame.metadata.vdac_tmp
  :field hadesd_power_spa_dec: cubesat_frame.metadata.spa_dec
  :field hadesd_power_spb_dec: cubesat_frame.metadata.spb_dec
  :field hadesd_power_spc_dec: cubesat_frame.metadata.spc_dec
  :field hadesd_power_spd_dec: cubesat_frame.metadata.spd_dec
  :field hadesd_power_vbus1_dec: cubesat_frame.metadata.vbus1_dec
  :field hadesd_power_vbus2_dec: cubesat_frame.metadata.vbus2_dec
  :field hadesd_power_vbus3_dec: cubesat_frame.metadata.vbus3_dec
  :field hadesd_power_vbat1_dec: cubesat_frame.metadata.vbat1_dec
  :field hadesd_power_vbat2_dec: cubesat_frame.metadata.vbat2_dec
  :field hadesd_power_vbus1_vbat1_dec: cubesat_frame.metadata.vbus1_vbat1_dec
  :field hadesd_power_vbus3_vbus2_dec: cubesat_frame.metadata.vbus3_vbus2_dec
  :field hadesd_power_vcpu_dec: cubesat_frame.metadata.vcpu_dec
  :field hadesd_power_icpu_dec: cubesat_frame.metadata.icpu_dec
  :field hadesd_power_ipl_dec: cubesat_frame.metadata.ipl_dec 
  :field hadesd_power_ibat_dec: cubesat_frame.metadata.ibat_dec
  :field hadesd_power_pwrdul1_dec: cubesat_frame.metadata.pwrdul1_dec
  :field hadesd_power_pwrdul4_dec: cubesat_frame.metadata.pwrdul4_dec
  # Type2 Frame (Temp):
  :field hadesd_temp_tpa_tmp: cubesat_frame.metadata.tpa_tmp
  :field hadesd_temp_tpb_tmp: cubesat_frame.metadata.tpb_tmp
  :field hadesd_temp_tpc_tmp: cubesat_frame.metadata.tpc_tmp
  :field hadesd_temp_tpd_tmp: cubesat_frame.metadata.tpd_tmp
  :field hadesd_temp_tpe_tmp: cubesat_frame.metadata.tpe_tmp
  :field hadesd_temp_teps_tmp: cubesat_frame.metadata.teps_tmp
  :field hadesd_temp_ttx_tmp: cubesat_frame.metadata.ttx_tmp
  :field hadesd_temp_ttx2_tmp: cubesat_frame.metadata.ttx2_tmp
  :field hadesd_temp_trx_tmp: cubesat_frame.metadata.trx_tmp
  :field hadesd_temp_tcpu_tmp: cubesat_frame.metadata.tcpu_tmp
  :field hadesd_temp_tpa_dec: cubesat_frame.metadata.tpa_dec
  :field hadesd_temp_tpb_dec: cubesat_frame.metadata.tpb_dec
  :field hadesd_temp_tpc_dec: cubesat_frame.metadata.tpc_dec
  :field hadesd_temp_tpd_dec: cubesat_frame.metadata.tpd_dec
  :field hadesd_temp_teps_dec: cubesat_frame.metadata.teps_dec
  :field hadesd_temp_ttx_dec: cubesat_frame.metadata.ttx_dec
  :field hadesd_temp_ttx2_dec: cubesat_frame.metadata.ttx2_dec
  :field hadesd_temp_trx_dec: cubesat_frame.metadata.trx_dec
  :field hadesd_temp_tcpu_dec: cubesat_frame.metadata.tcpu_dec
  # Type3 Frame (Status):
  :field hadesd_status_sclock_dec: cubesat_frame.metadata.sclock_dec
  :field hadesd_status_uptime_dec: cubesat_frame.metadata.uptime_dec
  :field hadesd_status_nrun_dec: cubesat_frame.metadata.nrun_dec
  :field hadesd_status_npayload_dec: cubesat_frame.metadata.npayload_dec
  :field hadesd_status_nwire_dec: cubesat_frame.metadata.nwire_dec
  :field hadesd_status_nbusdrops_lastreset_tmp: cubesat_frame.metadata.nbusdrops_lastreset_tmp
  :field hadesd_status_bate_mote_tmp: cubesat_frame.metadata.bate_mote_tmp
  :field hadesd_status_ntasksnotexecuted_dec: cubesat_frame.metadata.ntasksnotexecuted_dec
  :field hadesd_status_antennadeployed_dec: cubesat_frame.metadata.antennadeployed_dec
  :field hadesd_status_nexteepromerrors_dec: cubesat_frame.metadata.nexteepromerrors_dec
  :field hadesd_status_failed_task_id_dec: cubesat_frame.metadata.failed_task_id_dec
  :field hadesd_status_orbperiod_dec: cubesat_frame.metadata.orbperiod_dec
  :field hadesd_status_strfwd0_dec: cubesat_frame.metadata.strfwd0_dec
  :field hadesd_status_strfwd1_dec: cubesat_frame.metadata.strfwd1_dec
  :field hadesd_status_strfwd2_dec: cubesat_frame.metadata.strfwd2_dec
  :field hadesd_status_strfwd3_dec: cubesat_frame.metadata.strfwd3_dec
  :field hadesd_status_nbusdrops_dec: cubesat_frame.metadata.nbusdrops_dec
  :field hadesd_status_ntrans_dec: cubesat_frame.metadata.ntrans_dec
  :field hadesd_status_last_reset_cause_dec: cubesat_frame.metadata.last_reset_cause_dec
  :field hadesd_status_battery_dec: cubesat_frame.metadata.battery_dec
  :field hadesd_status_transponder_dec: cubesat_frame.metadata.transponder_dec
  # Type4 Frame (PowerStats):
  :field hadesd_powerstats_minvbusadc_vbatadc_hi_tmp: cubesat_frame.metadata.minvbusadc_vbatadc_hi_tmp
  :field hadesd_powerstats_minvbatadc_lo_vcpuadc_hi_tmp: cubesat_frame.metadata.minvbatadc_lo_vcpuadc_hi_tmp
  :field hadesd_powerstats_minvcpuadc_lo_free_tmp: cubesat_frame.metadata.minvcpuadc_lo_free_tmp
  :field hadesd_powerstats_minvbus2_tmp: cubesat_frame.metadata.minvbus2_tmp
  :field hadesd_powerstats_minvbus3_tmp: cubesat_frame.metadata.minvbus3_tmp
  :field hadesd_powerstats_minvbat2_tmp: cubesat_frame.metadata.minvbat2_tmp
  :field hadesd_powerstats_minibat_tmp: cubesat_frame.metadata.minibat_tmp
  :field hadesd_powerstats_minicpu_dec: cubesat_frame.metadata.minicpu_dec
  :field hadesd_powerstats_minipl_dec: cubesat_frame.metadata.minipl_dec
  :field hadesd_powerstats_minpowerdul_dec: cubesat_frame.metadata.minpowerdul_dec
  :field hadesd_powerstats_minpowerdul455_dec: cubesat_frame.metadata.minpowerdul455_dec
  :field hadesd_powerstats_minvdac_dec: cubesat_frame.metadata.minvdac_dec
  :field hadesd_powerstats_maxvbusadc_vbatadc_hi_tmp: cubesat_frame.metadata.maxvbusadc_vbatadc_hi_tmp
  :field hadesd_powerstats_maxvbatadc_lo_vcpuadc_hi_tmp: cubesat_frame.metadata.maxvbatadc_lo_vcpuadc_hi_tmp
  :field hadesd_powerstats_maxvcpuadc_lo_free_tmp: cubesat_frame.metadata.maxvcpuadc_lo_free_tmp
  :field hadesd_powerstats_maxvbus2_tmp: cubesat_frame.metadata.maxvbus2_tmp
  :field hadesd_powerstats_maxvbus3_tmp: cubesat_frame.metadata.maxvbus3_tmp
  :field hadesd_powerstats_maxvbat2_tmp: cubesat_frame.metadata.maxvbat2_tmp
  :field hadesd_powerstats_maxibat_dec: cubesat_frame.metadata.maxibat_dec
  :field hadesd_powerstats_maxicpu_dec: cubesat_frame.metadata.maxicpu_dec
  :field hadesd_powerstats_maxipl_tmp: cubesat_frame.metadata.maxipl_tmp
  :field hadesd_powerstats_maxpowerdul_dec: cubesat_frame.metadata.maxpowerdul_dec
  :field hadesd_powerstats_maxpowerdul455_dec: cubesat_frame.metadata.maxpowerdul455_dec
  :field hadesd_powerstats_maxvdac_dec: cubesat_frame.metadata.maxvdac_dec
  :field hadesd_powerstats_medvbusadc_vbatadc_hi_tmp: cubesat_frame.metadata.medvbusadc_vbatadc_hi_tmp
  :field hadesd_powerstats_medvbatadc_lo_vcpuadc_hi_tmp: cubesat_frame.metadata.medvbatadc_lo_vcpuadc_hi_tmp
  :field hadesd_powerstats_medvcpuadc_lo_free_tmp: cubesat_frame.metadata.medvcpuadc_lo_free_tmp
  :field hadesd_powerstats_ibat_rx_charging_dec: cubesat_frame.metadata.ibat_rx_charging_dec
  :field hadesd_powerstats_ibat_rx_discharging_dec: cubesat_frame.metadata.ibat_rx_discharging_dec
  :field hadesd_powerstats_ibat_tx_low_power_charging_dec: cubesat_frame.metadata.ibat_tx_low_power_charging_dec
  :field hadesd_powerstats_ibat_tx_low_power_discharging_dec: cubesat_frame.metadata.ibat_tx_low_power_discharging_dec
  :field hadesd_powerstats_ibat_tx_high_power_charging_dec: cubesat_frame.metadata.ibat_tx_high_power_charging_dec
  :field hadesd_powerstats_ibat_tx_high_power_discharging_dec: cubesat_frame.metadata.ibat_tx_high_power_discharging_dec
  :field hadesd_powerstats_medpowerdul_dec: cubesat_frame.metadata.medpowerdul_dec
  :field hadesd_powerstats_medpowerdul455_dec: cubesat_frame.metadata.medpowerdul455_dec
  :field hadesd_powerstats_medvdac_dec: cubesat_frame.metadata.medvdac_dec
  :field hadesd_powerstats_minvbus1_dec: cubesat_frame.metadata.minvbus1_dec
  :field hadesd_powerstats_minvbat1_dec: cubesat_frame.metadata.minvbat1_dec
  :field hadesd_powerstats_minvcpu_dec: cubesat_frame.metadata.minvcpu_dec
  :field hadesd_powerstats_minvbus2_dec: cubesat_frame.metadata.minvbus2_dec
  :field hadesd_powerstats_minvbus3_dec: cubesat_frame.metadata.minvbus3_dec
  :field hadesd_powerstats_minvbat2_dec: cubesat_frame.metadata.minvbat2_dec
  :field hadesd_powerstats_minibat_dec: cubesat_frame.metadata.minibat_dec
  :field hadesd_powerstats_maxvbus1_dec: cubesat_frame.metadata.maxvbus1_dec
  :field hadesd_powerstats_maxvbat1_dec: cubesat_frame.metadata.maxvbat1_dec
  :field hadesd_powerstats_maxvcpu_dec: cubesat_frame.metadata.maxvcpu_dec
  :field hadesd_powerstats_maxvbus2_dec: cubesat_frame.metadata.maxvbus2_dec
  :field hadesd_powerstats_maxvbus3_dec: cubesat_frame.metadata.maxvbus3_dec
  :field hadesd_powerstats_maxvbat2_dec: cubesat_frame.metadata.maxvbat2_dec
  :field hadesd_powerstats_maxipl_dec: cubesat_frame.metadata.maxipl_dec
  # Type 5 Frame (TempStats):
  :field hadesd_tempstats_mintpa_tmp: cubesat_frame.metadata.mintpa_tmp
  :field hadesd_tempstats_mintpb_tmp: cubesat_frame.metadata.mintpb_tmp
  :field hadesd_tempstats_mintpc_tmp: cubesat_frame.metadata.mintpc_tmp
  :field hadesd_tempstats_mintpd_tmp: cubesat_frame.metadata.mintpd_tmp
  :field hadesd_tempstats_mintpe_tmp: cubesat_frame.metadata.mintpe_tmp
  :field hadesd_tempstats_minteps_tmp: cubesat_frame.metadata.minteps_tmp
  :field hadesd_tempstats_minttx_tmp: cubesat_frame.metadata.minttx_tmp
  :field hadesd_tempstats_minttx2_tmp: cubesat_frame.metadata.minttx2_tmp
  :field hadesd_tempstats_mintrx_tmp: cubesat_frame.metadata.mintrx_tmp
  :field hadesd_tempstats_mintcpu_tmp: cubesat_frame.metadata.mintcpu_tmp
  :field hadesd_tempstats_maxtpa_tmp: cubesat_frame.metadata.maxtpa_tmp
  :field hadesd_tempstats_maxtpb_tmp: cubesat_frame.metadata.maxtpb_tmp
  :field hadesd_tempstats_maxtpc_tmp: cubesat_frame.metadata.maxtpc_tmp
  :field hadesd_tempstats_maxtpd_tmp: cubesat_frame.metadata.maxtpd_tmp
  :field hadesd_tempstats_maxtpe_tmp: cubesat_frame.metadata.maxtpe_tmp
  :field hadesd_tempstats_maxteps_tmp: cubesat_frame.metadata.maxteps_tmp
  :field hadesd_tempstats_maxttx_tmp: cubesat_frame.metadata.maxttx_tmp
  :field hadesd_tempstats_maxttx2_tmp: cubesat_frame.metadata.maxttx2_tmp
  :field hadesd_tempstats_maxtrx_tmp: cubesat_frame.metadata.maxtrx_tmp
  :field hadesd_tempstats_maxtcpu_tmp: cubesat_frame.metadata.maxtcpu_tmp
  :field hadesd_tempstats_medtpa_tmp: cubesat_frame.metadata.medtpa_tmp
  :field hadesd_tempstats_medtpb_tmp: cubesat_frame.metadata.medtpb_tmp
  :field hadesd_tempstats_medtpc_tmp: cubesat_frame.metadata.medtpc_tmp
  :field hadesd_tempstats_medtpd_tmp: cubesat_frame.metadata.medtpd_tmp
  :field hadesd_tempstats_medtpe_tmp: cubesat_frame.metadata.medtpe_tmp
  :field hadesd_tempstats_medteps_tmp: cubesat_frame.metadata.medteps_tmp
  :field hadesd_tempstats_medttx_tmp: cubesat_frame.metadata.medttx_tmp
  :field hadesd_tempstats_medttx2_tmp: cubesat_frame.metadata.medttx2_tmp
  :field hadesd_tempstats_medtrx_tmp: cubesat_frame.metadata.medtrx_tmp
  :field hadesd_tempstats_medtcpu_tmp: cubesat_frame.metadata.medtcpu_tmp
  :field hadesd_tempstats_mintpa_dec: cubesat_frame.metadata.mintpa_dec
  :field hadesd_tempstats_mintpb_dec: cubesat_frame.metadata.mintpb_dec
  :field hadesd_tempstats_mintpc_dec: cubesat_frame.metadata.mintpc_dec
  :field hadesd_tempstats_mintpd_dec: cubesat_frame.metadata.mintpd_dec
  :field hadesd_tempstats_minteps_dec: cubesat_frame.metadata.minteps_dec
  :field hadesd_tempstats_minttx_dec: cubesat_frame.metadata.minttx_dec
  :field hadesd_tempstats_minttx2_dec: cubesat_frame.metadata.minttx2_dec
  :field hadesd_tempstats_mintrx_dec: cubesat_frame.metadata.mintrx_dec
  :field hadesd_tempstats_mintcpu_dec: cubesat_frame.metadata.mintcpu_dec
  :field hadesd_tempstats_maxtpa_dec: cubesat_frame.metadata.maxtpa_dec
  :field hadesd_tempstats_maxtpb_dec: cubesat_frame.metadata.maxtpb_dec
  :field hadesd_tempstats_maxtpc_dec: cubesat_frame.metadata.maxtpc_dec
  :field hadesd_tempstats_maxtpd_dec: cubesat_frame.metadata.maxtpd_dec
  :field hadesd_tempstats_maxteps_dec: cubesat_frame.metadata.maxteps_dec
  :field hadesd_tempstats_maxttx_dec: cubesat_frame.metadata.maxttx_dec
  :field hadesd_tempstats_maxttx2_dec: cubesat_frame.metadata.maxttx2_dec
  :field hadesd_tempstats_maxtrx_dec: cubesat_frame.metadata.maxtrx_dec
  :field hadesd_tempstats_maxtcpu_dec: cubesat_frame.metadata.maxtcpu_dec
  :field hadesd_tempstats_medtpa_dec: cubesat_frame.metadata.medtpa_dec
  :field hadesd_tempstats_medtpb_dec: cubesat_frame.metadata.medtpb_dec
  :field hadesd_tempstats_medtpc_dec: cubesat_frame.metadata.medtpc_dec
  :field hadesd_tempstats_medtpd_dec: cubesat_frame.metadata.medtpd_dec
  :field hadesd_tempstats_medteps_dec: cubesat_frame.metadata.medteps_dec
  :field hadesd_tempstats_medttx_dec: cubesat_frame.metadata.medttx_dec
  :field hadesd_tempstats_medttx2_dec: cubesat_frame.metadata.medttx2_dec
  :field hadesd_tempstats_medtrx_dec: cubesat_frame.metadata.medtrx_dec
  :field hadesd_tempstats_medtcpu_dec: cubesat_frame.metadata.medtcpu_dec

seq:
  - id: cubesat_frame
    type: cubesat_frame

types:
  cubesat_frame:
    seq:
      - id: first_header
        type: first_header
      - id: metadata
        type:
          switch-on: first_header.type
          cases:
            0x1: power_frame
            0x2: temp_frame
            0x3: status_frame
            0x4: powerstats_frame
            0x5: tempstats_frame
  
  first_header:
    seq:
      - id: type
        type: b4
        valid:
            min: 0x1
            max: 0x5
      - id: address
        type: b4
        valid: 0x8
    
  power_frame:
    seq:
      - id: spa_tmp
        type: u1
      - id: spb_tmp
        type: u1
      - id: spc_tmp
        type: u1
      - id: spd_tmp
        type: u1
      - id: spe_tmp
        type: u1
      - id: spf_tmp
        type: u1
      - id: vbusadc_vbatadc_hi_tmp
        type: u2
      - id: vbatadc_lo_vcpuadc_hi_tmp
        type: u2
      - id: vcpuadc_lo_vbus2_tmp
        type: u2
      - id: vbus3_vbat2_hi_tmp
        type: u2
      - id: vbat2_lo_ibat_hi_tmp
        type: u2
      - id: ibat_lo_icpu_hi_tmp
        type: u2
      - id: icpu_lo_ipl_tmp
        type: u2
      - id: powerdul_tmp
        type: u1
      - id: powerdul455_tmp
        type: u1
      - id: vdac_tmp
        type: u1
        
    instances:
      spa_dec:
          value: ((spa_tmp << 1))
      spb_dec:
          value: ((spb_tmp << 1))
      spc_dec:
          value: ((spc_tmp << 1))
      spd_dec:
          value: ((spd_tmp << 1))
      vbus1_dec:
          value: ((vbusadc_vbatadc_hi_tmp >> 4)) * 1400 / 1000 
      vbus2_dec:
          value: ((vcpuadc_lo_vbus2_tmp & 0x0fff)) * 4
      vbus3_dec:
          value: ((vbus3_vbat2_hi_tmp >> 4)) * 4
      vbat1_dec:
          value: ((vbatadc_lo_vcpuadc_hi_tmp << 8 ) & 0x0f00 | (vbatadc_lo_vcpuadc_hi_tmp >> 8 ) & 0x0fff )  * 1400 / 1000
      vbat2_dec:
          value: ((vbus3_vbat2_hi_tmp << 8) & 0x0f00 | vbat2_lo_ibat_hi_tmp >> 8) * 4 
      vbus1_vbat1_dec:
          value: ((vbus1_dec - vbat1_dec))
      vbus3_vbus2_dec:
          value: ((vbus3_dec - vbus2_dec))
      vcpu_dec: 
          value: 1210*4096/((vbatadc_lo_vcpuadc_hi_tmp << 4 ) & 0x0ff0 | vcpuadc_lo_vbus2_tmp >> 12 )
      icpu_dec:
          value: (( ibat_lo_icpu_hi_tmp << 4) & 0x0ff0 | icpu_lo_ipl_tmp >> 12)
      ipl_dec:
          value: (( icpu_lo_ipl_tmp & 0x0fff))
      ibat_dec:
        value: "((vbat2_lo_ibat_hi_tmp << 8) & 0x0f00 | (ibat_lo_icpu_hi_tmp >> 8) & 0x0fff) > 2047 ? ((vbat2_lo_ibat_hi_tmp << 8) & 0x0f00 | (ibat_lo_icpu_hi_tmp >> 8) & 0x0fff) - 4096 : ((vbat2_lo_ibat_hi_tmp << 8) & 0x0f00 | (ibat_lo_icpu_hi_tmp >> 8) & 0x0fff)"
      pwrdul1_dec:
          value: ((powerdul_tmp )) * 16
      pwrdul4_dec:
          value: ((powerdul455_tmp )) * 16

  temp_frame:
    seq:
      - id: tpa_tmp
        type: u1
      - id: tpb_tmp
        type: u1
      - id: tpc_tmp
        type: u1
      - id: tpd_tmp
        type: u1
      - id: tpe_tmp
        type: u1
      - id: teps_tmp
        type: u1
      - id: ttx_tmp
        type: u1
      - id: ttx2_tmp
        type: u1
      - id: trx_tmp
        type: u1
      - id: tcpu_tmp
        type: u1

    instances:
      tpa_dec:
        value: (tpa_tmp/2.0) - 40.0
      tpb_dec:
        value: (tpb_tmp/2.0) - 40.0
      tpc_dec:
        value: (tpc_tmp/2.0) - 40.0
      tpd_dec:
        value: (tpd_tmp/2.0) - 40.0
      teps_dec:
        value: (teps_tmp/2.0) - 40.0
      ttx_dec:
        value: (ttx_tmp/2.0) - 40.0
      ttx2_dec:
        value: (ttx2_tmp/2.0) - 40.0
      trx_dec:
        value: (trx_tmp/2.0) - 40.0
      tcpu_dec:
        value: (tcpu_tmp/2.0) - 40.0

  status_frame:
    seq:
      - id: sclock_dec
        type: u4
      - id: uptime_dec
        type: u2
      - id: nrun_dec
        type: u2
      - id: npayload_dec
        type: u1
      - id: nwire_dec
        type: u1
      - id: nbusdrops_lastreset_tmp
        type: u1
      - id: bate_mote_tmp
        type: u1
      - id: ntasksnotexecuted_dec
        type: u1
      - id: antennadeployed_dec
        type: u1
      - id: nexteepromerrors_dec
        type: u1
      - id: failed_task_id_dec
        type: u1
      - id: orbperiod_dec
        type: u1
      - id: strfwd0_dec
        type: u1
      - id: strfwd1_dec
        type: u2
      - id: strfwd2_dec
        type: u2
      - id: strfwd3_dec
        type: u1
    
    instances:
        ntrans_dec:
            value: "nwire_dec <= 25 ? 0 : nwire_dec - 26"
        nbusdrops_dec:
            value: ((nbusdrops_lastreset_tmp >> 4))
        last_reset_cause_dec:
            value: (( nbusdrops_lastreset_tmp & 0x0f ))
        battery_dec:
            value: (( bate_mote_tmp >> 4 ))
        transponder_dec:
            value: (( bate_mote_tmp & 0x0f ))

  powerstats_frame:
    seq:
      - id: minvbusadc_vbatadc_hi_tmp
        type: u2
      - id: minvbatadc_lo_vcpuadc_hi_tmp
        type: u2
      - id: minvcpuadc_lo_free_tmp
        type: u1
      - id: minvbus2_tmp
        type: u1
      - id: minvbus3_tmp
        type: u1
      - id: minvbat2_tmp
        type: u1
      - id: minibat_tmp
        type: u1
      - id: minicpu_dec
        type: u1
      - id: minipl_dec
        type: u1
      - id: minpowerdul_dec
        type: u1
      - id: minpowerdul455_dec
        type: u1
      - id: minvdac_dec
        type: u1
      - id: maxvbusadc_vbatadc_hi_tmp
        type: u2
      - id: maxvbatadc_lo_vcpuadc_hi_tmp
        type: u2
      - id: maxvcpuadc_lo_free_tmp
        type: u1
      - id: maxvbus2_tmp
        type: u1
      - id: maxvbus3_tmp
        type: u1
      - id: maxvbat2_tmp
        type: u1
      - id: maxibat_dec
        type: u1
      - id: maxicpu_dec
        type: u1
      - id: maxipl_tmp
        type: u1
      - id: maxpowerdul_dec
        type: u1
      - id: maxpowerdul455_dec
        type: u1
      - id: maxvdac_dec
        type: u1
      - id: medvbusadc_vbatadc_hi_tmp
        type: u2
      - id: medvbatadc_lo_vcpuadc_hi_tmp
        type: u2
      - id: medvcpuadc_lo_free_tmp
        type: u1
      - id: ibat_rx_charging_dec
        type: u1
      - id: ibat_rx_discharging_dec
        type: u1
      - id: ibat_tx_low_power_charging_dec
        type: u1
      - id: ibat_tx_low_power_discharging_dec
        type: u1
      - id: ibat_tx_high_power_charging_dec
        type: u1
      - id: ibat_tx_high_power_discharging_dec
        type: u1
      - id: medpowerdul_dec
        type: u1
      - id: medpowerdul455_dec
        type: u1
      - id: medvdac_dec
        type: u1

    instances:
      minvbus1_dec:
        value: 1400*((minvbusadc_vbatadc_hi_tmp >> 4)) / 1000
      minvbat1_dec:
        value: 1400*(((minvbusadc_vbatadc_hi_tmp << 8) & 0x0f00) | ((minvbatadc_lo_vcpuadc_hi_tmp >> 8) & 0x00ff))/1000
      minvcpu_dec:
        value: "minvcpuadc_lo_free_tmp > 4 ? 1210*4096/(((minvbatadc_lo_vcpuadc_hi_tmp << 4) & 0x0ff0) | 1) : 1210*4096/(((minvbatadc_lo_vcpuadc_hi_tmp << 4) & 0x0ff0))"
      minvbus2_dec:
        value: minvbus2_tmp*16*4
      minvbus3_dec:
        value: minvbus2_tmp*16*4
      minvbat2_dec:
        value: minvbat2_tmp*16*4
      minibat_dec:
        value: minibat_tmp*-1
      maxvbus1_dec:
        value: 1400*(maxvbusadc_vbatadc_hi_tmp >> 4)/1000
      maxvbat1_dec:
        value: 1400*(((maxvbusadc_vbatadc_hi_tmp << 8) & 0x0f00) | ((maxvbatadc_lo_vcpuadc_hi_tmp >> 8) & 0x00ff))/1000
      maxvcpu_dec:
        value: "maxvcpuadc_lo_free_tmp > 4 ? 1210*4096/(((maxvbatadc_lo_vcpuadc_hi_tmp << 4) & 0x0ff0) | 1) : 1210*4096/(((maxvbatadc_lo_vcpuadc_hi_tmp << 4) & 0x0ff0))"
      maxvbus2_dec:
        value: maxvbus2_tmp*16*4
      maxvbus3_dec:
        value: maxvbus2_tmp*16*4
      maxvbat2_dec:
        value: maxvbat2_tmp*16*4
      maxipl_dec:
        value: maxipl_tmp << 2

  tempstats_frame:
    seq:
      - id: mintpa_tmp
        type: u1
      - id: mintpb_tmp
        type: u1
      - id: mintpc_tmp
        type: u1
      - id: mintpd_tmp
        type: u1
      - id: mintpe_tmp
        type: u1
      - id: minteps_tmp
        type: u1
      - id: minttx_tmp
        type: u1
      - id: minttx2_tmp
        type: u1
      - id: mintrx_tmp
        type: u1
      - id: mintcpu_tmp
        type: u1
      - id: maxtpa_tmp
        type: u1
      - id: maxtpb_tmp
        type: u1
      - id: maxtpc_tmp
        type: u1
      - id: maxtpd_tmp
        type: u1
      - id:  maxtpe_tmp
        type: u1
      - id: maxteps_tmp
        type: u1
      - id: maxttx_tmp
        type: u1
      - id: maxttx2_tmp
        type: u1
      - id: maxtrx_tmp
        type: u1
      - id: maxtcpu_tmp
        type: u1
      - id: medtpa_tmp
        type: u1
      - id: medtpb_tmp
        type: u1
      - id: medtpc_tmp
        type: u1
      - id: medtpd_tmp
        type: u1
      - id: medtpe_tmp
        type: u1
      - id: medteps_tmp
        type: u1
      - id: medttx_tmp
        type: u1
      - id: medttx2_tmp
        type: u1
      - id: medtrx_tmp
        type: u1
      - id: medtcpu_tmp
        type: u1
    
    instances:
      mintpa_dec:
          value: (mintpa_tmp/2.0) - 40.0
      mintpb_dec:
          value: (mintpb_tmp/2.0) - 40.0
      mintpc_dec:
          value: (mintpc_tmp/2.0) - 40.0
      mintpd_dec:
          value: (mintpd_tmp/2.0) - 40.0
      minteps_dec:
          value: (minteps_tmp/2.0) - 40.0
      minttx_dec:
          value: (minttx_tmp/2.0) - 40.0
      minttx2_dec:
          value: (minttx2_tmp/2.0) - 40.0
      mintrx_dec:
          value: (mintrx_tmp/2.0) - 40.0
      mintcpu_dec:
          value: (mintcpu_tmp/2.0) - 40.0
      maxtpa_dec:
          value: (maxtpa_tmp/2.0) - 40.0
      maxtpb_dec:
          value: (maxtpb_tmp/2.0) - 40.0
      maxtpc_dec:
          value: (maxtpc_tmp/2.0) - 40.0
      maxtpd_dec:
          value: (maxtpd_tmp/2.0) - 40.0
      maxteps_dec:
          value: (maxteps_tmp/2.0) - 40.0
      maxttx_dec:
          value: (maxttx_tmp/2.0) - 40.0
      maxttx2_dec:
          value: (maxttx2_tmp/2.0) - 40.0
      maxtrx_dec:
          value: (maxtrx_tmp/2.0) - 40.0
      maxtcpu_dec:
          value: (maxtcpu_tmp/2.0) - 40.0
      medtpa_dec:
          value: (medtpa_tmp/2.0) - 40.0
      medtpb_dec:
          value: (medtpb_tmp/2.0) - 40.0
      medtpc_dec:
          value: (medtpc_tmp/2.0) - 40.0
      medtpd_dec:
          value: (medtpd_tmp/2.0) - 40.0
      medteps_dec:
          value: (medteps_tmp/2.0) - 40.0
      medttx_dec:
          value: (medttx_tmp/2.0) - 40.0
      medttx2_dec:
          value: (medttx2_tmp/2.0) - 40.0
      medtrx_dec:
          value: (medtrx_tmp/2.0) - 40.0
      medtcpu_dec:
          value: (medtcpu_tmp/2.0) - 40.0