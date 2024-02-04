---
meta:
  id: gt1
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packet_type: ax25_frame.payload.data_payload.packet_type
  :field sys_time1: ax25_frame.payload.data_payload.data_payload.sys_time1
  :field switch_status: ax25_frame.payload.data_payload.data_payload.switch_status
  :field currentstate: ax25_frame.payload.data_payload.data_payload.currentstate
  :field startingstate: ax25_frame.payload.data_payload.data_payload.startingstate
  :field kissnuminvaliddownlinks: ax25_frame.payload.data_payload.data_payload.kissnuminvaliddownlinks
  :field kissnuminvaliduplinks: ax25_frame.payload.data_payload.data_payload.kissnuminvaliduplinks
  :field commandsdispatched: ax25_frame.payload.data_payload.data_payload.commandsdispatched
  :field commanderrors: ax25_frame.payload.data_payload.data_payload.commanderrors
  :field raw_value_atmega: ax25_frame.payload.data_payload.data_payload.raw_value_atmega
  :field raw_value_sp1: ax25_frame.payload.data_payload.data_payload.raw_value_sp1
  :field raw_value_sp2: ax25_frame.payload.data_payload.data_payload.raw_value_sp2
  :field raw_value_sp3: ax25_frame.payload.data_payload.data_payload.raw_value_sp3
  :field raw_value_sp4: ax25_frame.payload.data_payload.data_payload.raw_value_sp4
  :field time_remaining_0: ax25_frame.payload.data_payload.data_payload.time_remaining_0
  :field time_remaining_1: ax25_frame.payload.data_payload.data_payload.time_remaining_1
  :field timer_length_0: ax25_frame.payload.data_payload.data_payload.timer_length_0
  :field timer_length_1: ax25_frame.payload.data_payload.data_payload.timer_length_1
  :field atmegarobot_interactions: ax25_frame.payload.data_payload.data_payload.atmegarobot_interactions
  :field beacon_interval: ax25_frame.payload.data_payload.data_payload.beacon_interval
  :field beacon_separation: ax25_frame.payload.data_payload.data_payload.beacon_separation
  :field burn_wire_duration: ax25_frame.payload.data_payload.data_payload.burn_wire_duration
  :field burn_wire_attempts: ax25_frame.payload.data_payload.data_payload.burn_wire_attempts
  :field timer_length: ax25_frame.payload.data_payload.data_payload.timer_length
  :field magfield_x: ax25_frame.payload.data_payload.data_payload.magfield_x
  :field magfield_y: ax25_frame.payload.data_payload.data_payload.magfield_y
  :field magfield_z: ax25_frame.payload.data_payload.data_payload.magfield_z
  :field scale_factor: ax25_frame.payload.data_payload.data_payload.scale_factor
  :field reference_voltage: ax25_frame.payload.data_payload.data_payload.reference_voltage
  :field rgmaxtime_1hz: ax25_frame.payload.data_payload.data_payload.rgmaxtime_1hz
  :field rgcycleslips_1hz: ax25_frame.payload.data_payload.data_payload.rgcycleslips_1hz
  :field rgmaxtime_2hz: ax25_frame.payload.data_payload.data_payload.rgmaxtime_2hz
  :field rgcycleslips_2hz: ax25_frame.payload.data_payload.data_payload.rgcycleslips_2hz
  :field rgmaxtime_10hz: ax25_frame.payload.data_payload.data_payload.rgmaxtime_10hz
  :field rgcycleslips_10hz: ax25_frame.payload.data_payload.data_payload.rgcycleslips_10hz
  :field uart0_bytes_sent: ax25_frame.payload.data_payload.data_payload.uart0_bytes_sent
  :field uart0_bytes_recv: ax25_frame.payload.data_payload.data_payload.uart0_bytes_recv
  :field shiftregdata: ax25_frame.payload.data_payload.data_payload.shiftregdata
  :field eps_i2c_errors: ax25_frame.payload.data_payload.data_payload.eps_i2c_errors
  :field eps_vbatt_critical: ax25_frame.payload.data_payload.data_payload.eps_vbatt_critical
  :field config2_batt_maxvoltage: ax25_frame.payload.data_payload.data_payload.config2_batt_maxvoltage
  :field config2_batt_safevoltage: ax25_frame.payload.data_payload.data_payload.config2_batt_safevoltage
  :field config2_batt_criticalvoltage: ax25_frame.payload.data_payload.data_payload.config2_batt_criticalvoltage
  :field config2_batt_normalvoltage: ax25_frame.payload.data_payload.data_payload.config2_batt_normalvoltage
  :field sys_time2: ax25_frame.payload.data_payload.data_payload.sys_time2
  :field hk1_vboost1: ax25_frame.payload.data_payload.data_payload.hk1_vboost1
  :field hk1_vboost2: ax25_frame.payload.data_payload.data_payload.hk1_vboost2
  :field hk1_vboost3: ax25_frame.payload.data_payload.data_payload.hk1_vboost3
  :field hk1_vbatt: ax25_frame.payload.data_payload.data_payload.hk1_vbatt
  :field hk1_vcurin1: ax25_frame.payload.data_payload.data_payload.hk1_vcurin1
  :field hk1_vcurin2: ax25_frame.payload.data_payload.data_payload.hk1_vcurin2
  :field hk1_vcurin3: ax25_frame.payload.data_payload.data_payload.hk1_vcurin3
  :field hk1_vcursun: ax25_frame.payload.data_payload.data_payload.hk1_vcursun
  :field hk1_vcursys: ax25_frame.payload.data_payload.data_payload.hk1_vcursys
  :field hk1_vcurout1: ax25_frame.payload.data_payload.data_payload.hk1_vcurout1
  :field hk1_vcurout2: ax25_frame.payload.data_payload.data_payload.hk1_vcurout2
  :field hk1_vcurout3: ax25_frame.payload.data_payload.data_payload.hk1_vcurout3
  :field hk1_vcurout4: ax25_frame.payload.data_payload.data_payload.hk1_vcurout4
  :field hk1_vcurout5: ax25_frame.payload.data_payload.data_payload.hk1_vcurout5
  :field hk1_vcurout6: ax25_frame.payload.data_payload.data_payload.hk1_vcurout6
  :field hk1_output1: ax25_frame.payload.data_payload.data_payload.hk1_output1
  :field hk1_output2: ax25_frame.payload.data_payload.data_payload.hk1_output2
  :field hk1_output3: ax25_frame.payload.data_payload.data_payload.hk1_output3
  :field hk1_output4: ax25_frame.payload.data_payload.data_payload.hk1_output4
  :field hk1_output5: ax25_frame.payload.data_payload.data_payload.hk1_output5
  :field hk1_output6: ax25_frame.payload.data_payload.data_payload.hk1_output6
  :field hk1_output7: ax25_frame.payload.data_payload.data_payload.hk1_output7
  :field hk1_output8: ax25_frame.payload.data_payload.data_payload.hk1_output8
  :field hk1_latchup1: ax25_frame.payload.data_payload.data_payload.hk1_latchup1
  :field hk1_latchup2: ax25_frame.payload.data_payload.data_payload.hk1_latchup2
  :field hk1_latchup3: ax25_frame.payload.data_payload.data_payload.hk1_latchup3
  :field hk1_latchup4: ax25_frame.payload.data_payload.data_payload.hk1_latchup4
  :field hk1_latchup5: ax25_frame.payload.data_payload.data_payload.hk1_latchup5
  :field hk1_latchup6: ax25_frame.payload.data_payload.data_payload.hk1_latchup6
  :field hk1_wdt_i2c_time_left: ax25_frame.payload.data_payload.data_payload.hk1_wdt_i2c_time_left
  :field hk1_wdt_gnd_time_left: ax25_frame.payload.data_payload.data_payload.hk1_wdt_gnd_time_left
  :field hk1_counter_wdt_i2c: ax25_frame.payload.data_payload.data_payload.hk1_counter_wdt_i2c
  :field hk1_counter_wdt_gnd: ax25_frame.payload.data_payload.data_payload.hk1_counter_wdt_gnd
  :field hk1_counter_boot: ax25_frame.payload.data_payload.data_payload.hk1_counter_boot
  :field hk1_temp1: ax25_frame.payload.data_payload.data_payload.hk1_temp1
  :field hk1_temp2: ax25_frame.payload.data_payload.data_payload.hk1_temp2
  :field hk1_temp3: ax25_frame.payload.data_payload.data_payload.hk1_temp3
  :field hk1_temp4: ax25_frame.payload.data_payload.data_payload.hk1_temp4
  :field hk1_temp5: ax25_frame.payload.data_payload.data_payload.hk1_temp5
  :field hk1_temp6: ax25_frame.payload.data_payload.data_payload.hk1_temp6
  :field hk1_bootcause: ax25_frame.payload.data_payload.data_payload.hk1_bootcause
  :field hk1_battmode: ax25_frame.payload.data_payload.data_payload.hk1_battmode
  :field hk1_pptmode: ax25_frame.payload.data_payload.data_payload.hk1_pptmode
  :field hk1_config1_ppt_mode: ax25_frame.payload.data_payload.data_payload.hk1_config1_ppt_mode
  :field hk1_config1_battheater_mode: ax25_frame.payload.data_payload.data_payload.hk1_config1_battheater_mode
  :field hk1_config1_battheater_low: ax25_frame.payload.data_payload.data_payload.hk1_config1_battheater_low
  :field hk1_config1_battheater_high: ax25_frame.payload.data_payload.data_payload.hk1_config1_battheater_high

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
        encoding: ASCII
        size: 6
        valid:
          any-of:
            - '"KK4UVG"'
            - '"KN4ZNS"'
            - '"W4AQL "'

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
      - id: data_payload
        type: gt1_payload

  gt1_payload:
    seq:
      - id: packet_type
        type: u1
        doc: 'Spacecraft packet type'
      - id: data_payload
        type:
          switch-on: packet_type
          cases:
            1: gt1payload1
            2: gt1payload2
  gt1payload1:
    seq:
      - id: sys_time1
        type: u4
        doc: 'Spacecraft current system time'
      - id: switch_status
        type: u1
        doc: 'The current status of the onboard switches'
      - id: currentstate
        type: u4
        doc: 'Current Spacecraft State'
      - id: startingstate
        type: u4
        doc: 'Spacecraft Starting State'
      - id: kissnuminvaliddownlinks
        type: u4
        doc: 'Number of invalid KISS packets downlinked'
      - id: kissnuminvaliduplinks
        type: u4
        doc: 'Number of invalid KISS packets uplinked'
      - id: commandsdispatched
        type: u4
        doc: 'Number of commands dispatched'
      - id: commanderrors
        type: u4
        doc: 'Number of command errors'
      - id: raw_value_atmega
        type: u2
        doc: 'Raw Value Atmega'
      - id: raw_value_sp1
        type: u2
        doc: 'Raw value sp1'
      - id: raw_value_sp2
        type: u2
        doc: 'Raw value sp2'
      - id: raw_value_sp3
        type: u2
        doc: 'Raw value sp3'
      - id: raw_value_sp4
        type: u2
        doc: 'Raw value sp4'
      - id: time_remaining_0
        type: u4
        doc: 'Time remaining 0'
      - id: time_remaining_1
        type: u4
        doc: 'Time remaining 1'
      - id: timer_length_0
        type: u4
        doc: 'Timer length 0'
      - id: timer_length_1
        type: u4
        doc: 'Timer length 1'
      - id: atmegarobot_interactions
        type: u4
        doc: 'Atmega robot interactions'
      - id: beacon_interval
        type: u2
        doc: 'Beacon interval'
      - id: beacon_separation
        type: u2
        doc: 'Beacon seperation'
      - id: burn_wire_duration
        type: u1
        doc: 'Burn wire duration'
      - id: burn_wire_attempts
        type: u1
        doc: 'Burn wire attempts'
      - id: timer_length
        type: u2
        doc: 'Number of times parameters have been saved'
      - id: magfield_x
        type: f4
        doc: 'X component of magnetic field'
      - id: magfield_y
        type: f4
        doc: 'Y component of magnetic field'
      - id: magfield_z
        type: f4
        doc: 'Z component of magnetic field'
      - id: scale_factor
        type: f4
        doc: 'Scale factor'
      - id: reference_voltage
        type: f4
        doc: 'Reference Voltage'
      - id: rgmaxtime_1hz
        type: u4
        doc: 'rgmaxtime_1hz'
      - id: rgcycleslips_1hz
        type: u4
        doc: 'rgcycleslips_1hz'
      - id: rgmaxtime_2hz
        type: u4
        doc: 'rgmaxtime_2hz'
      - id: rgcycleslips_2hz
        type: u4
        doc: 'rgcycleslips_2hz'
      - id: rgmaxtime_10hz
        type: u4
        doc: '10Hz_RgMaxTime'
      - id: rgcycleslips_10hz
        type: u4
        doc: '10Hz_RgCycleSlips'
      - id: uart0_bytes_sent
        type: u4
        doc: 'UART 0 bytes sent'
      - id: uart0_bytes_recv
        type: u4
        doc: 'UART0 bytes recieved'
      - id: shiftregdata
        type: u4
        doc: 'Shift Register Data'
      - id: eps_i2c_errors
        type: u2
        doc: 'number of i2c errors with i2c'
      - id: eps_vbatt_critical
        type: u2
        doc: 'EPS vbatt critical'
      - id: config2_batt_maxvoltage
        type: u2
        doc: 'Max battery voltage'
      - id: config2_batt_safevoltage
        type: u2
        doc: 'Battery Safe Voltage'
      - id: config2_batt_criticalvoltage
        type: u2
        doc: 'Battery critical voltage'
      - id: config2_batt_normalvoltage
        type: u2
        doc: 'battery normal voltage'

  gt1payload2:
    seq:
      - id: sys_time2
        type: u4
        doc: 'Spacecraft current system time'
      - id: hk1_vboost1
        type: u2
        doc: 'Housekeeping Vboost 1'
      - id: hk1_vboost2
        type: u2
        doc: 'Housekeeping Vboost 2'
      - id: hk1_vboost3
        type: u2
        doc: 'Housekeeping Vboost 3'
      - id: hk1_vbatt
        type: u2
        doc: 'Housekeeping voltage of battery'
      - id: hk1_vcurin1
        type: u2
        doc: 'Housekeeping V current in 1'
      - id: hk1_vcurin2
        type: u2
        doc: 'Housekeeping V current in 2'
      - id: hk1_vcurin3
        type: u2
        doc: 'Housekeeping V current in 3'
      - id: hk1_vcursun
        type: u2
        doc: 'Housekeeping V current sun'
      - id: hk1_vcursys
        type: u2
        doc: 'Housekeeping V current system'
      - id: hk1_vcurout1
        type: u2
        doc: 'Housekeeping V current out 1'
      - id: hk1_vcurout2
        type: u2
        doc: 'Housekeeping V current out 2'
      - id: hk1_vcurout3
        type: u2
        doc: 'Housekeeping V current out 3'
      - id: hk1_vcurout4
        type: u2
        doc: 'Housekeeping V current out 4'
      - id: hk1_vcurout5
        type: u2
        doc: 'Housekeeping V current out 5'
      - id: hk1_vcurout6
        type: u2
        doc: 'Housekeeping V current out 6'
      - id: hk1_output1
        type: u1
        doc: 'Housekeeping output 1'
      - id: hk1_output2
        type: u1
        doc: 'Housekeeping output 2'
      - id: hk1_output3
        type: u1
        doc: 'Housekeeping output 3'
      - id: hk1_output4
        type: u1
        doc: 'Housekeeping output 4'
      - id: hk1_output5
        type: u1
        doc: 'Housekeeping output 5'
      - id: hk1_output6
        type: u1
        doc: 'Housekeeping output 6'
      - id: hk1_output7
        type: u1
        doc: 'Housekeeping output 7'
      - id: hk1_output8
        type: u1
        doc: 'Housekeeping output 8'
      - id: hk1_latchup1
        type: u2
        doc: 'Housekeeping latchup 1'
      - id: hk1_latchup2
        type: u2
        doc: 'Housekeeping latchup 2'
      - id: hk1_latchup3
        type: u2
        doc: 'Housekeeping latchup 3'
      - id: hk1_latchup4
        type: u2
        doc: 'Housekeeping latchup 4'
      - id: hk1_latchup5
        type: u2
        doc: 'Housekeeping latchup 5'
      - id: hk1_latchup6
        type: u2
        doc: 'Housekeeping latchup 6'
      - id: hk1_wdt_i2c_time_left
        type: u4
        doc: 'Time left in watchdog timer on i2c'
      - id: hk1_wdt_gnd_time_left
        type: u4
        doc: 'Time left in watchdog timer on gnd'
      - id: hk1_counter_wdt_i2c
        type: u4
        doc: 'counter left in watchdog timer on i2c'
      - id: hk1_counter_wdt_gnd
        type: u4
        doc: 'counter left in watchdog timer on i2c'
      - id: hk1_counter_boot
        type: u4
        doc: 'Number of times booted'
      - id: hk1_temp1
        type: s2
        doc: 'Temperature 1'
      - id: hk1_temp2
        type: s2
        doc: 'Temperature 2'
      - id: hk1_temp3
        type: s2
        doc: 'Temperature 3'
      - id: hk1_temp4
        type: s2
        doc: 'Temperature 4'
      - id: hk1_temp5
        type: s2
        doc: 'Temperature 5'
      - id: hk1_temp6
        type: s2
        doc: 'Temperature 6'
      - id: hk1_bootcause
        type: u1
        doc: 'Cause of Boot'
      - id: hk1_battmode
        type: u1
        doc: 'Battery Mode'
      - id: hk1_pptmode
        type: u1
        doc: 'ppt mode'
      - id: hk1_config1_ppt_mode
        type: u1
        doc: 'config ppt mode'
      - id: hk1_config1_battheater_mode
        type: u1
        doc: 'config battery heater mode'
      - id: hk1_config1_battheater_low
        type: s1
        doc: 'config battery heater low threshold'
      - id: hk1_config1_battheater_high
        type: s1
        doc: 'config battery heater high threshold'
