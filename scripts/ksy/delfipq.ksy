---
meta:
  id: delfipq
  endian: be
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packet: ax25_frame.payload.ax25_info.packet
  :field destination: ax25_frame.payload.ax25_info.delfipq.destination
  :field size: ax25_frame.payload.ax25_info.delfipq.size
  :field beacon_source: ax25_frame.payload.ax25_info.delfipq.beacon_source
  :field service: ax25_frame.payload.ax25_info.delfipq.service
  :field message_type: ax25_frame.payload.ax25_info.delfipq.message_type
  :field message_outcome: ax25_frame.payload.ax25_info.delfipq.message_outcome
  :field tlm_source: ax25_frame.payload.ax25_info.delfipq.tlm_source
  :field pad: ax25_frame.payload.ax25_info.delfipq.telemetry_header.status.pad
  :field software_image: ax25_frame.payload.ax25_info.delfipq.telemetry_header.status.software_image
  :field boot_counter: ax25_frame.payload.ax25_info.delfipq.telemetry_header.boot_counter
  :field soft_reset_wdt_timerexpiration: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.soft_reset_wdt_timerexpiration
  :field cpu_lock_up: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.cpu_lock_up
  :field por_power_settle: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.por_power_settle
  :field por_clock_settle: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.por_clock_settle
  :field voltage_anomaly: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.voltage_anomaly
  :field hard_reset_wdt_wrong_password: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.hard_reset_wdt_wrong_password
  :field hard_reset_wdt_timerexpiration: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.hard_reset_wdt_timerexpiration
  :field system_reset_output: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.system_reset_output
  :field sys_ctl_reboot: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.sys_ctl_reboot
  :field nmi_pin: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.nmi_pin
  :field exit_lpm4p5: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.exit_lpm4p5
  :field exit_lpm3p5: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.exit_lpm3p5
  :field bad_band_gap_reference: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.bad_band_gap_reference
  :field supply_supervisor_vcc_trip: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.supply_supervisor_vcc_trip
  :field vcc_detector_trip: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.vcc_detector_trip
  :field soft_reset_wdt_wrong_password: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.soft_reset_wdt_wrong_password
  :field padding: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.padding
  :field dco_short_circuit_fault: ax25_frame.payload.ax25_info.delfipq.telemetry_header.reset_cause.dco_short_circuit_fault
  :field uptime: ax25_frame.payload.ax25_info.delfipq.telemetry_header.uptime
  :field total_uptime: ax25_frame.payload.ax25_info.delfipq.telemetry_header.total_uptime
  :field tlm_version: ax25_frame.payload.ax25_info.delfipq.telemetry_header.tlm_version
  :field mcu_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mcu_temperature
  :field ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.sensors_status.ina_status
  :field tmp_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.sensors_status.tmp_status
  :field telemetry_sensors_status_padding: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.sensors_status.padding
  :field bus_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus_voltage
  :field bus_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus_current
  :field battery_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.battery_ina_status
  :field battery_gg_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.battery_gg_status
  :field internal_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.internal_ina_status
  :field unregulated_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.unregulated_ina_status
  :field bus1_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus1_ina_status
  :field bus2_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus2_ina_status
  :field bus3_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus3_ina_status
  :field bus4_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus4_ina_status
  :field bus4_error: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus4_error
  :field bus3_error: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus3_error
  :field bus2_error: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus2_error
  :field bus1_error: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus1_error
  :field bus4_state: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus4_state
  :field bus3_state: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus3_state
  :field bus2_state: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus2_state
  :field bus1_state: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.bus1_state
  :field panel_yp_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_yp_ina_status
  :field panel_ym_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_ym_ina_status
  :field panel_xp_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_xp_ina_status
  :field panel_xm_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_xm_ina_status
  :field panel_yp_tmp_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_yp_tmp_status
  :field panel_ym_tmp_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_ym_tmp_status
  :field panel_xp_tmp_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_xp_tmp_status
  :field panel_xm_tmp_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.panel_xm_tmp_status
  :field mppt_yp_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.mppt_yp_ina_status
  :field mppt_ym_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.mppt_ym_ina_status
  :field mppt_xp_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.mppt_xp_ina_status
  :field mppt_xm_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.mppt_xm_ina_status
  :field cell_yp_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.cell_yp_ina_status
  :field cell_ym_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.cell_ym_ina_status
  :field cell_xp_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.cell_xp_ina_status
  :field cell_xm_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.status.cell_xm_ina_status
  :field internal_ina_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.internal_ina_current
  :field internal_ina_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.internal_ina_voltage
  :field unregulated_ina_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.unregulated_ina_current
  :field unregulated_ina_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.unregulated_ina_voltage
  :field battery_gg_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.battery_gg_voltage
  :field battery_ina_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.battery_ina_voltage
  :field battery_ina_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.battery_ina_current
  :field battery_gg_capacity: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.battery_gg_capacity
  :field battery_gg_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.battery_gg_temperature
  :field battery_tmp20_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.battery_tmp20_temperature
  :field bus4_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus4_current
  :field bus3_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus3_current
  :field bus2_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus2_current
  :field bus1_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus1_current
  :field bus4_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus4_voltage
  :field bus3_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus3_voltage
  :field bus2_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus2_voltage
  :field bus1_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.bus1_voltage
  :field panel_yp_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_yp_current
  :field panel_ym_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_ym_current
  :field panel_xp_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_xp_current
  :field panel_xm_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_xm_current
  :field panel_yp_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_yp_voltage
  :field panel_ym_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_ym_voltage
  :field panel_xp_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_xp_voltage
  :field panel_xm_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_xm_voltage
  :field panel_yp_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_yp_temperature
  :field panel_ym_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_ym_temperature
  :field panel_xp_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_xp_temperature
  :field panel_xm_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.panel_xm_temperature
  :field mppt_yp_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_yp_current
  :field mppt_ym_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_ym_current
  :field mppt_xp_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_xp_current
  :field mppt_xm_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_xm_current
  :field mppt_yp_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_yp_voltage
  :field mppt_ym_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_ym_voltage
  :field mppt_xp_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_xp_voltage
  :field mppt_xm_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.mppt_xm_voltage
  :field cell_yp_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.cell_yp_current
  :field cell_ym_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.cell_ym_current
  :field cell_xp_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.cell_xp_current
  :field cell_xm_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.cell_xm_current
  :field cell_yp_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.cell_yp_voltage
  :field cell_ym_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.cell_ym_voltage
  :field cell_xp_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.cell_xp_voltage
  :field current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.current
  :field voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.voltage
  :field temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.temperature
  :field transmit_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.sensors_status.transmit_ina_status
  :field amplifier_ina_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.sensors_status.amplifier_ina_status
  :field phasing_tmp_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.sensors_status.phasing_tmp_status
  :field amplifier_tmp_status: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.sensors_status.amplifier_tmp_status
  :field receiver_rssi: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.receiver_rssi
  :field transmit_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.transmit_voltage
  :field transmit_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.transmit_current
  :field amplifier_voltage: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.amplifier_voltage
  :field amplifier_current: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.amplifier_current
  :field phasing_board_temperature: ax25_frame.payload.ax25_info.delfipq.telemetry_header.telemetry.phasing_board_temperature
  :field frametype: frametype

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pub_ax25.html'
instances:
  frametype:
    pos: 16
    type: u1
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
      - id: repeater
        type: repeater
        if: (src_ssid_raw.ssid_mask & 0x01) == 0
        doc: 'Repeater flag is set!'
      - id: ctl
        type: u1
  repeater:
    seq:
      - id: rpt_instance
        type: repeaters
        repeat: until
        repeat-until: ((_.rpt_ssid_raw.ssid_mask & 0x1) == 0x1)
        doc: 'Repeat until no repeater flag is set!'
  repeaters:
    seq:
      - id: rpt_callsign_raw
        type: callsign_raw
      - id: rpt_ssid_raw
        type: ssid_mask
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
            - '"GROUND"'
            - '"DLFIPQ"'
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
      - id: packet
        type: u1
      - id: delfipq
        type:
          switch-on: packet
          cases:
            0x0: delfipq_beacon_t
        size-eos: true
        doc-ref: 'https://github.com/DelfiSpace/gr-satellites/blob/master/python/telemetry/delfipq.py'
        doc: |
          Conversions (val = m * x + b):
          All currents: val = m * 0.001 + 0.0
          All temperatures: val = m * 0.01 + 0.0
          RSSI: val = m * 1.0 + 21.0
          Capacity: val = m * 0.01 + 0.0
  delfipq_beacon_t:
    seq:
      - id: destination
        type: u1
        doc: |
          OBC = 1
          EPS = 2
          ADB = 3
          COMMS = 4
          ADCS = 5
          GROUND = 8
          LOBE = 9
          OBC2 = 10
      - id: size
        type: u1
      - id: beacon_source
        type: u1
        doc: |
          OBC = 1
          EPS = 2
          ADB = 3
          COMMS = 4
          ADCS = 5
          GROUND = 8
          LOBE = 9
          OBC2 = 10
      - id: service
        type: u1
        doc: |
          Telemetry = 80
          Ping = 17
      - id: message_type
        type: u1
        doc: |
          Request = 1
          Reply = 2
      - id: message_outcome
        type: u1
        doc: |
          OK = 0
          Error = 1
      - id: tlm_source
        type: u1
        doc: |
          OBC = 1
          EPS = 2
          ADB = 3
          COMMS = 4
          ADCS = 5
          GROUND = 8
          LOBE = 9
          OBC2 = 10
      - id: telemetry_header
        type:
          switch-on: tlm_source
          cases:
            1: obctlm_t
            2: epstlm_t
            3: adbtlm_t
            4: commstlm_t
        doc: |
          OBC = 1
          EPS = 2
          ADB = 3
          COMMS = 4
  obctlmv2_t:
    seq:
      - id: mcu_temperature
        type: s2
        doc: |
            unit: degC
      - id: sensors_status
        type: obc_sensor_status_t
      - id: bus_voltage
        type: u2
        doc: |
          unit: V
      - id: bus_current
        type: s2
        doc: |
          unit: A
#      - id: board_temperature
#        type: s2
  obc_sensor_status_t:
    seq:
      - id: ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: padding
        type: b6
  obctlm_t:
    seq:
      - id: status
        type: subsystem_status_t
      - id: boot_counter
        type: u1
      - id: reset_cause
        type: reset_cause_t
      - id: uptime
        type: u4
        doc: |
          unit: s
      - id: total_uptime
        type: u4
      - id: tlm_version
        type: u1
      - id: telemetry
        type:
          switch-on: tlm_version
          cases:
            2: obctlmv2_t
  epstlm_t:
    seq:
      - id: status
        type: subsystem_status_t
      - id: boot_counter
        type: u1
      - id: reset_cause
        type: reset_cause_t
      - id: uptime
        type: u4
        doc: |
          unit: s
      - id: total_uptime
        type: u4
      - id: tlm_version
        type: u1
      - id: telemetry
        type:
          switch-on: tlm_version
          cases:
            2: epstlmv2_t
  adbtlm_t:
    seq:
      - id: status
        type: subsystem_status_t
      - id: boot_counter
        type: u1
      - id: reset_cause
        type: reset_cause_t
      - id: uptime
        type: u4
        doc: |
          unit: s
      - id: total_uptime
        type: u4
      - id: tlm_version
        type: u1
      - id: telemetry
        type:
          switch-on: tlm_version
          cases:
            2: adbtlmv2_t
  commstlm_t:
    seq:
      - id: status
        type: subsystem_status_t
      - id: boot_counter
        type: u1
      - id: reset_cause
        type: reset_cause_t
      - id: uptime
        type: u4
        doc: |
          unit: s
      - id: total_uptime
        type: u4
      - id: tlm_version
        type: u1
      - id: telemetry
        type:
          switch-on: tlm_version
          cases:
            2: commstlmv2_t
  commstlmv2_t:
    seq:
      - id: mcu_temperature
        type: s2
        doc: |
          unit: degC
      - id: sensors_status
        type: comms_sensor_status_t
      - id: voltage
        type: u2
        doc: |
          unit: V
      - id: current
        type: s2
        doc: |
          unit: A
      - id: temperature
        type: s2
        doc: |
          unit: degC
      - id: receiver_rssi
        type: s2
        doc: |
          unit: dBm
      - id: transmit_voltage
        type: u2
        doc: |
          unit: V
      - id: transmit_current
        type: s2
        doc: |
          unit: A
      - id: amplifier_voltage
        type: u2
        doc: |
          unit: V
      - id: amplifier_current
        type: s2
        doc: |
          unit: A
      - id: phasing_board_temperature
        type: s2
        doc: |
          unit: degC
#      - id: amplifier_temperature
#        type: s2
#        doc: |
#          unit: degC
  comms_sensor_status_t:
    seq:
      - id: ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: transmit_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: amplifier_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: phasing_tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: amplifier_tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: padding
        type: b2
  subsystem_status_t:
    seq:
      - id: pad
        type: b4
      - id: software_image
        type: b4
  reset_cause_t:
    seq:
      - id: soft_reset_wdt_timerexpiration
        type: b1
      - id: cpu_lock_up
        type: b1
      - id: por_power_settle
        type: b1
      - id: por_clock_settle
        type: b1
      - id: voltage_anomaly
        type: b1
      - id: hard_reset_wdt_wrong_password
        type: b1
      - id: hard_reset_wdt_timerexpiration
        type: b1
      - id: system_reset_output
        type: b1
      - id: sys_ctl_reboot
        type: b1
      - id: nmi_pin
        type: b1
      - id: exit_lpm4p5
        type: b1
      - id: exit_lpm3p5
        type: b1
      - id: bad_band_gap_reference
        type: b1
      - id: supply_supervisor_vcc_trip
        type: b1
      - id: vcc_detector_trip
        type: b1
      - id: soft_reset_wdt_wrong_password
        type: b1
      - id: padding
        type: b7
      - id: dco_short_circuit_fault
        type: b1
  epstlmv2_t:
    seq:
      - id: mcu_temperature
        type: s2
        doc: |
          unit: degC
      - id: status
        type: eps_sensor_status_t
      - id: internal_ina_current
        type: s2
        doc: |
          unit: A
      - id: internal_ina_voltage
        type: u2
        doc: |
          unit: V
      - id: unregulated_ina_current
        type: s2
        doc: |
          unit: A
      - id: unregulated_ina_voltage
        type: u2
        doc: |
          unit: V
      - id: battery_gg_voltage
        type: u2
        doc: |
          unit: V
      - id: battery_ina_voltage
        type: u2
        doc: |
          unit: V
      - id: battery_ina_current
        type: s2
        doc: |
          unit: A
      - id: battery_gg_capacity
        type: u2
        doc: |
          unit: mAh
      - id: battery_gg_temperature
        type: s2
        doc: |
          unit: degC
      - id: battery_tmp20_temperature
        type: s2
        doc: |
          unit: degC
      - id: bus4_current
        type: s2
        doc: |
          unit: A
      - id: bus3_current
        type: s2
        doc: |
          unit: A
      - id: bus2_current
        type: s2
        doc: |
          unit: A
      - id: bus1_current
        type: s2
        doc: |
          unit: A
      - id: bus4_voltage
        type: u2
        doc: |
          unit: V
      - id: bus3_voltage
        type: u2
        doc: |
          unit: V
      - id: bus2_voltage
        type: u2
        doc: |
          unit: V
      - id: bus1_voltage
        type: u2
        doc: |
          unit: V
      - id: panel_yp_current
        type: s2
        doc: |
          unit: A
      - id: panel_ym_current
        type: s2
        doc: |
          unit: A
      - id: panel_xp_current
        type: s2
        doc: |
          unit: A
      - id: panel_xm_current
        type: s2
        doc: |
          unit: A
      - id: panel_yp_voltage
        type: u2
        doc: |
          unit: V
      - id: panel_ym_voltage
        type: u2
        doc: |
          unit: V
      - id: panel_xp_voltage
        type: u2
        doc: |
          unit: V
      - id: panel_xm_voltage
        type: u2
        doc: |
          unit: V
      - id: panel_yp_temperature
        type: s2
        doc: |
          unit: degC
      - id: panel_ym_temperature
        type: s2
        doc: |
          unit: degC
      - id: panel_xp_temperature
        type: s2
        doc: |
          unit: degC
      - id: panel_xm_temperature
        type: s2
        doc: |
          unit: degC
      - id: mppt_yp_current
        type: s2
        doc: |
          unit: A
      - id: mppt_ym_current
        type: s2
        doc: |
          unit: A
      - id: mppt_xp_current
        type: s2
        doc: |
          unit: A
      - id: mppt_xm_current
        type: s2
        doc: |
          unit: A
      - id: mppt_yp_voltage
        type: u2
        doc: |
          unit: V
      - id: mppt_ym_voltage
        type: u2
        doc: |
          unit: V
      - id: mppt_xp_voltage
        type: u2
        doc: |
          unit: V
      - id: mppt_xm_voltage
        type: u2
        doc: |
          unit: V
      - id: cell_yp_current
        type: s2
        doc: |
          unit: A
      - id: cell_ym_current
        type: s2
        doc: |
          unit: A
      - id: cell_xp_current
        type: s2
        doc: |
          unit: A
      - id: cell_xm_current
        type: s2
        doc: |
          unit: A
      - id: cell_yp_voltage
        type: u2
        doc: |
          unit: V
      - id: cell_ym_voltage
        type: u2
        doc: |
          unit: V
      - id: cell_xp_voltage
        type: u2
        doc: |
          unit: V
#      - id: cell_xm_voltage
#        type: u2
#        doc: |
#          unit: V
  eps_sensor_status_t:
    seq:
      - id: battery_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: battery_gg_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: internal_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: unregulated_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus1_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus2_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus3_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus4_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus4_error
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus3_error
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus2_error
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus1_error
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: bus4_state
        type: b1
        doc: |
          OFF = 0
          ON = 1
      - id: bus3_state
        type: b1
        doc: |
          OFF = 0
          ON = 1
      - id: bus2_state
        type: b1
        doc: |
          OFF = 0
          ON = 1
      - id: bus1_state
        type: b1
        doc: |
          OFF = 0
          ON = 1
      - id: panel_yp_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: panel_ym_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: panel_xp_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: panel_xm_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: panel_yp_tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: panel_ym_tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: panel_xp_tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: panel_xm_tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: mppt_yp_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: mppt_ym_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: mppt_xp_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: mppt_xm_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: cell_yp_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: cell_ym_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: cell_xp_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: cell_xm_ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
  adbtlmv2_t:
    seq:
      - id: mcu_temperature
        type: s2
        doc: |
          unit: degC
      - id: sensors_status
        type: adb_sensor_status_t
      - id: current
        type: s2
        doc: |
          unit: A
      - id: voltage
        type: u2
        doc: |
          unit: V
      - id: temperature
        type: s2
        doc: |
          unit: degC
  adb_sensor_status_t:
    seq:
      - id: ina_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: tmp_status
        type: b1
        doc: |
          ERROR = 0
          ACTIVE = 1
      - id: padding
        type: b6
