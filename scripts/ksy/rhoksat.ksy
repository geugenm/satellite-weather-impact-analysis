meta:
  id: rhoksat
  endian: le
doc: |
  :field panel_temp: sp_telemetry.panel0.panel_temp
  :field panel_status: sp_telemetry.panel0.panel_status
  :field panel_voltage: sp_telemetry.panel0.panel_voltage
  :field panel_photodiode: sp_telemetry.panel0.panel_photodiode
  :field panel1_panel_temp: sp_telemetry.panel1.panel_temp
  :field panel1_panel_status: sp_telemetry.panel1.panel_status
  :field panel1_panel_voltage: sp_telemetry.panel1.panel_voltage
  :field panel1_panel_photodiode: sp_telemetry.panel1.panel_photodiode
  :field panel2_panel_temp: sp_telemetry.panel2.panel_temp
  :field panel2_panel_status: sp_telemetry.panel2.panel_status
  :field panel2_panel_voltage: sp_telemetry.panel2.panel_voltage
  :field panel2_panel_photodiode: sp_telemetry.panel2.panel_photodiode
  :field panel3_panel_temp: sp_telemetry.panel3.panel_temp
  :field panel3_panel_status: sp_telemetry.panel3.panel_status
  :field panel3_panel_voltage: sp_telemetry.panel3.panel_voltage
  :field panel3_panel_photodiode: sp_telemetry.panel3.panel_photodiode
  :field panel4_panel_temp: sp_telemetry.panel4.panel_temp
  :field panel4_panel_status: sp_telemetry.panel4.panel_status
  :field panel4_panel_voltage: sp_telemetry.panel4.panel_voltage
  :field panel4_panel_photodiode: sp_telemetry.panel4.panel_photodiode
  :field volt_brdsup: eps_telemetry.volt_brdsup
  :field volt: eps_telemetry.dist_input.volt
  :field current: eps_telemetry.dist_input.current
  :field power: eps_telemetry.dist_input.power
  :field batt_input_volt: eps_telemetry.batt_input.volt
  :field batt_input_current: eps_telemetry.batt_input.current
  :field batt_input_power: eps_telemetry.batt_input.power
  :field stat_obc_on: eps_telemetry.stat_obc_on
  :field stat_obc_ocf: eps_telemetry.stat_obc_ocf
  :field bat_stat: eps_telemetry.bat_stat
  :field temp: eps_telemetry.temp
  :field temp2: eps_telemetry.temp2
  :field temp3: eps_telemetry.temp3
  :field stid: eps_telemetry.status.reply_header.stid
  :field ivid: eps_telemetry.status.reply_header.ivid
  :field rc: eps_telemetry.status.reply_header.rc
  :field bid: eps_telemetry.status.reply_header.bid
  :field cmderrstat: eps_telemetry.status.reply_header.cmderrstat
  :field mode: eps_telemetry.status.mode
  :field conf: eps_telemetry.status.conf
  :field reset_cause: eps_telemetry.status.reset_cause
  :field uptime: eps_telemetry.status.uptime
  :field error: eps_telemetry.status.error
  :field rc_cnt_pwron: eps_telemetry.status.rc_cnt_pwron
  :field rc_cnt_wdg: eps_telemetry.status.rc_cnt_wdg
  :field rc_cnt_cmd: eps_telemetry.status.rc_cnt_cmd
  :field rc_cnt_pweron_mcu: eps_telemetry.status.rc_cnt_pweron_mcu
  :field rc_cnt_emlopo: eps_telemetry.status.rc_cnt_emlopo
  :field prevcmd_elapsed: eps_telemetry.status.prevcmd_elapsed
  :field ants_temperature: anta_telemetry.ants_temperature
  :field ants_deployment: anta_telemetry.ants_deployment
  :field ants_uptime: anta_telemetry.ants_uptime
  :field antb_telemetry_ants_temperature: antb_telemetry.ants_temperature
  :field antb_telemetry_ants_deployment: antb_telemetry.ants_deployment
  :field antb_telemetry_ants_uptime: antb_telemetry.ants_uptime
  :field imtq_system_state_mode: imtq_system_state.mode
  :field err: imtq_system_state.err
  :field imtq_system_state_conf: imtq_system_state.conf
  :field imtq_system_state_uptime: imtq_system_state.uptime
  :field x: imtq_magnetometer.cal_magf.x
  :field y: imtq_magnetometer.cal_magf.y
  :field z: imtq_magnetometer.cal_magf.z
  :field coilact: imtq_magnetometer.coilact
  :field last_detumble_time: last_detumble_time
  :field acc_x: acc.x
  :field acc_y: acc.y
  :field acc_z: acc.z
  :field gyro_x: gyro.x
  :field gyro_y: gyro.y
  :field gyro_z: gyro.z
  :field trxvu_mode: trxvu_mode
  :field onboard_time: onboard_time
  :field obc_up_time: obc_up_time
  :field num_reboots: num_reboots
  :field rtcok: rtcok
  :field storage_available_ram: storage_available_ram
  :field storage_available_sd: storage_available_sd
  
types:
  panel:
    seq: 
      - id: panel_temp
        type: f4
      - id: panel_status
        type: u1
      - id: panel_voltage
        type: u2
      - id: panel_photodiode
        type: u2
  sp_telemetry:
    seq:
      - id: panel0
        type: panel
      - id: panel1
        type: panel
      - id: panel2
        type: panel
      - id: panel3
        type: panel
      - id: panel4
        type: panel
        
  isis_eps__vipdeng_t:
    seq:
      - id: volt
        type: u2
      - id: current
        type: u2
      - id: power
        type: u2
        
  isis_eps__replyheader_t:
    seq: 
      - id: stid
        type: u1 
      - id: ivid
        type: u1 
      - id: rc
        type: u1 
      - id: bid
        type: u1 
      - id: cmderrstat
        type: u1
        
  isis_eps__getsystemstatus__from_t:
    seq: 
      - id: reply_header
        type: isis_eps__replyheader_t
      - id: mode
        type: u1
        doc: "Indicates the current mode of the system."
      - id: conf
        type: u1 
        doc: "Read/write configuration parameters have been changed by the EPS master since the last parameters load/save operation "
      - id: reset_cause
        type: u1 
        doc: "Cause of last reset. "
      - id: uptime
        type: u4
      - id: error
        type: u2 
      - id: rc_cnt_pwron
        type: u2 
      - id: rc_cnt_wdg
        type: u2 
      - id: rc_cnt_cmd
        type: u2 
      - id: rc_cnt_pweron_mcu
        type: u2 
      - id: rc_cnt_emlopo
        type: u2 
      - id: prevcmd_elapsed
        type: u2 
        
  eps_telemetry:
    seq: 
      - id: volt_brdsup
        type: s2
        doc: "Voltage of internal board supply in raw form"
      - id: dist_input
        type: isis_eps__vipdeng_t 
        doc: "Input V, I and P data taken at the input of the distribution part of the unit in raw form. Negative values indicate output flow."
      - id: batt_input 
        type: isis_eps__vipdeng_t
        doc: "Input V, I and P data taken at the input of the battery part of the unit in raw form. Negative values indicate output flow. "
      - id: stat_obc_on
        type: b16
        doc: "Bitflag field indicating channel-on status for the output bus channels."
      - id: stat_obc_ocf
        type: u2
        doc: "Bitflag field indicating overcurrent latch-off fault status for the output bus channels."
      - id: bat_stat
        type: u2
        doc: "Bitflag field indicating BP board"
      - id: temp
        type: s2
        doc: "Measured temperature provided by a sensor internal to the MCU in raw form"
      - id: temp2
        type: s2 
        doc: "2 and 4 cell battery pack: Battery pack temperature in between the center battery cells. "
      - id: temp3
        type: s2 
        doc: "2 cell battery pack: not used 4 cell battery pack: Battery pack temperature on the front of the battery pack."
      - id: status
        type: isis_eps__getsystemstatus__from_t
        
  isis_ants_telemetry: 
    seq: 
      - id: ants_temperature
        type: u2 
      - id: ants_deployment
        type: u2 
        doc: "Indicates bitfield value containing status of each antenna"
      - id: ants_uptime
        type: u4 
        
  imtq_systemstate_t:
    seq: 
      - id: mode
        type: u1
        doc: "iMTQ system state mode."
      - id: err
        type: u1
        doc: "iMTQ system state error."
      - id: conf
        type: u1
        doc: "iMTQ system state configuration."
      - id: uptime
        type: u4
        doc: "iMTQ system state uptime."
        
  axis:
    seq: 
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
  vec3:
    seq: 
      - id: x
        type: s4
      - id: y
        type: s4
      - id: z
        type: s4
        
  imtq_cal_magf_t: 
    seq: 
      - id: cal_magf
        type: vec3 
        doc: " iMTQ calibrated magnetometer vector."
      - id: coilact
        type: u1
        doc: "iMTQ coil was actuating during measurement."
       
seq:
  - id:  sp_telemetry
    type: sp_telemetry
  - id:  eps_telemetry
    type: eps_telemetry
  - id:  anta_telemetry
    type: isis_ants_telemetry
  - id:  antb_telemetry
    type: isis_ants_telemetry
  - id:  imtq_system_state
    type: imtq_systemstate_t
  - id: imtq_magnetometer
    type: imtq_cal_magf_t 
  - id: last_detumble_time
    type: u4
  - id: acc
    type: axis
  - id: gyro
    type: axis
  - id: trxvu_mode
    type: u1
  - id: onboard_time
    type: u4
  - id: obc_up_time
    type: u4
  - id: num_reboots
    type: u1
  - id: rtcok
    type: u1
  - id: storage_available_ram
    type: u4
  - id: storage_available_sd
    type: u4