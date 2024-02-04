---
meta:
  id: suchai2
  endian: be
doc: |
  :field prio: sch.csp_h.prio
  :field source: sch.csp_h.source
  :field dest: sch.csp_h.dest
  :field dest_port: sch.csp_h.dest_port
  :field source_port: sch.csp_h.source_port
  :field flags: sch.csp_h.flags
  :field nframe: sch.nframe
  :field type: sch.type
  :field node: sch.node
  :field ndata: sch.ndata
  :field index: sch.status.index
  :field timestamp: sch.status.timestamp
  :field dat_obc_opmode: sch.status.dat_obc_opmode
  :field dat_rtc_date_time: sch.status.dat_rtc_date_time
  :field dat_obc_last_reset: sch.status.dat_obc_last_reset
  :field dat_obc_hrs_alive: sch.status.dat_obc_hrs_alive
  :field dat_obc_hrs_wo_reset: sch.status.dat_obc_hrs_wo_reset
  :field dat_obc_reset_counter: sch.status.dat_obc_reset_counter
  :field dat_obc_executed_cmds: sch.status.dat_obc_executed_cmds
  :field dat_obc_failed_cmds: sch.status.dat_obc_failed_cmds
  :field dat_com_count_tm: sch.status.dat_com_count_tm
  :field dat_com_count_tc: sch.status.dat_com_count_tc
  :field dat_com_last_tc: sch.status.dat_com_last_tc
  :field dat_fpl_last: sch.status.dat_fpl_last
  :field dat_fpl_queue: sch.status.dat_fpl_queue
  :field dat_ads_tle_epoch: sch.status.dat_ads_tle_epoch
  :field dat_eps_vbatt: sch.status.dat_eps_vbatt
  :field dat_eps_cur_sun: sch.status.dat_eps_cur_sun
  :field dat_eps_cur_sys: sch.status.dat_eps_cur_sys
  :field dat_obc_temp_1: sch.status.dat_obc_temp_1
  :field dat_eps_temp_bat0: sch.status.dat_eps_temp_bat0
  :field dat_drp_mach_action: sch.status.dat_drp_mach_action
  :field dat_drp_mach_state: sch.status.dat_drp_mach_state
  :field dat_drp_mach_payloads: sch.status.dat_drp_mach_payloads
  :field dat_drp_mach_step: sch.status.dat_drp_mach_step
  :field sat_id: sch.sat_id

seq:
  - id: sch
    type: suchai_frame
    doc-ref: 'https://en.wikipedia.org/wiki/Cubesat_Space_Protocol'

types:

  suchai_frame:
    seq:
      - id: csp_h
        type: csp_header
      - id: nframe
        type: u2
      - id: type
        type: u1
      - id: node
        type: u1
      - id: ndata
        type: u4
      - id: status
        type: status
    instances:
      sat_id:
        value: csp_h.dest_port
        enum: sat_name

  csp_header:
    seq:
      - id: prio
        type: b2
      - id: source
        type: b5
      - id: dest
        type: b5
      - id: dest_port
        type: b6
      - id: source_port
        type: b6
      - id: flags
        type: u1

  status:
    seq:
      - id: index
        type: u4
      - id: timestamp
        type: u4
      - id: dat_obc_opmode
        type: u4
      - id: dat_rtc_date_time
        type: u4
      - id: dat_obc_last_reset
        type: u4
      - id: dat_obc_hrs_alive
        type: u4
      - id: dat_obc_hrs_wo_reset
        type: u4
      - id: dat_obc_reset_counter
        type: u4
      - id: dat_obc_executed_cmds
        type: u4
      - id: dat_obc_failed_cmds
        type: u4
      - id: dat_com_count_tm
        type: u4
      - id: dat_com_count_tc
        type: u4
      - id: dat_com_last_tc
        type: u4
      - id: dat_fpl_last
        type: u4
      - id: dat_fpl_queue
        type: u4
      - id: dat_ads_tle_epoch
        type: u4
      - id: dat_eps_vbatt
        type: u4
      - id: dat_eps_cur_sun
        type: u4
      - id: dat_eps_cur_sys
        type: u4
      - id: dat_obc_temp_1
        type: u4
      - id: dat_eps_temp_bat0
        type: u4
      - id: dat_drp_mach_action
        type: u4
      - id: dat_drp_mach_state
        type: u4
      - id: dat_drp_mach_payloads
        type: u4
      - id: dat_drp_mach_step
        type: u4

enums:
  sat_name:
    16: suchai2
    17: suchai3
    18: plantsat
