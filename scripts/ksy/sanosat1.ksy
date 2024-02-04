---
meta:
  id: sanosat1
  title: Sanosat-1 GFSK, RTTY, CW beacon + digi message decoder
  endian: le
#  2023-12-03, DL7NDR (extension for RTTY, CW and Digipeater)
#  2023-12-17, DL7NDR (revised: battery math (/100) removed, RTTY and CW checksum verification added)
doc: |
  :field callsign: sanosat1_telemetry.body.callsign
  :field packet_type: sanosat1_telemetry.body.packet_type
  :field com_temperature: sanosat1_telemetry.body.com_temperature
  :field battery_voltage: sanosat1_telemetry.body.battery_voltage
  :field charging_current: sanosat1_telemetry.body.charging_current
  :field battery_temperature: sanosat1_telemetry.body.battery_temperature
  :field radiation_level: sanosat1_telemetry.body.radiation_level
  :field no_of_resets: sanosat1_telemetry.body.no_of_resets
  :field antenna_deployment_status: sanosat1_telemetry.body.antenna_deployment_status
  :field beacon_type: sanosat1_telemetry.body.beacon_type
  :field digimessage: sanosat1_telemetry.body.decision.digimessage
  :field cwmessage: sanosat1_telemetry.body.decision.cwmessage
  :field com_temperature: sanosat1_telemetry.body.decision.com_temperature
  :field battery_temperature: sanosat1_telemetry.body.decision.battery_temperature
  :field charging_current: sanosat1_telemetry.body.decision.charging_current
  :field battery_voltage: sanosat1_telemetry.body.decision.battery_voltage
  :field antenna_deployment_status: sanosat1_telemetry.body.decision.antenna_deployment_status
  :field beacon_type: sanosat1_telemetry.body.decision.beacon_type
  :field callsign: sanosat1_telemetry.body.decision.callsign

seq:
  - id: sanosat1_telemetry
    type: sanosat1_telemetry_t

types:
  sanosat1_telemetry_t:
    seq:
      - id: body
        type:
          switch-on: check
          cases:
            0x4e394d410000ffff: with_delimiter
            0x010051504e394d41: without_delimiter
            0x242c51504e394d41: rtty # AM9NPQ,$
            0x242c71706e396d61: rtty # am9npq,$
            _: decision_digi_or_cw

    instances:
        check:
              type: u8
              pos: 0

  with_delimiter:
        seq:
            - id: delimiter
              type: s4
              valid:
                any-of:
                  - 0x0000ffff
            - id: callsign
              type: strz
              size: 7
              encoding: ASCII
              valid:
               any-of:
                 - '"AM9NPQ"'
            - id: packet_type
              type: s2
            - id: com_temperature
              type: s2
            - id: battery_voltage # got back to let grafana do the math (/100)
              type: s2
              doc: '[/100 for V]'
            - id: charging_current
              type: s2
              doc: '[mA]'
            - id: battery_temperature
              type: s2
            - id: radiation_level
              type: s2
              doc: '[µSv/hr]'
            - id: no_of_resets
              type: s2
            - id: antenna_deployment_status
              type: u1

        instances:
               beacon_type:
                 value:  '0 == 0 ? "GFSK" : "GFSK"' # you cannot just write a string here

  without_delimiter:
         seq:
            - id: callsign
              type: strz # has to be strZ (=terminator 0), else ide.kaitai.io gripes
              size: 7
              encoding: ASCII
              valid:
               any-of:
                 - '"AM9NPQ"'
            - id: packet_type
              type: s2
            - id: com_temperature
              type: s2
            - id: battery_voltage # got back to let grafana do the math (/100)
              type: s2
              doc: '[/100 for V]'
            - id: charging_current
              type: s2
              doc: '[mA]'
            - id: battery_temperature
              type: s2
            - id: radiation_level
              type: s2
              doc: '[µSv/hr]'
            - id: no_of_resets
              type: s2
            - id: antenna_deployment_status
              type: u1

         instances:
               beacon_type:
                 value:  '0 == 0 ? "GFSK" : "GFSK"'

  rtty:
         seq:
            - id: callsign
              type: str
              terminator: 0x2C
              encoding: ASCII
              valid:
               any-of:
                 - '"AM9NPQ"'
                 - '"am9npq"'
            - id: skip_dollar
              type: s1
            - id: battery_temperature_raw
              type: str
              terminator: 0x2C
              encoding: UTF-8
            - id: charging_current_raw
              type: str
              terminator: 0x2C
              encoding: UTF-8
            - id: battery_voltage_before_dot_raw
              type: str
              encoding: UTF-8
              terminator: 0x2E
            - id: battery_voltage_after_dot_raw
              type: str
              encoding: UTF-8
              terminator: 0x2C
            - id: no_of_resets_raw
              type: str
              terminator: 0x2C
              encoding: UTF-8
            - id: antenna_deployment_status_raw
              type: str
              terminator: 0x2C
              encoding: UTF-8
            - id: radiation_level_raw
              type: str
              terminator: 0x3F
              encoding: UTF-8
            - id: checksum_rtty_raw # NMEA checksum from battery_temperature to radiation_level
              size: 2
              type: str
              encoding: UTF-8
              valid:
                any-of:
                  - checksum_compare # which is equal to checksum_rtty_raw in case of a valid checksum

         instances: # NMEA Checksum can be calculated from left to right or right to left, even order of single character doesn't matter
               checksum_battery_temperature_0: # "-" prefixcheck
                 value: '(battery_temperature_raw.substring(0,1)) == "-" ? 0x2D : battery_temperature_raw.substring(0,1).to_i(16) + 0x30'
               checksum_battery_temperature_1:
                 value: '(battery_temperature_raw.substring(1,2)) == "" ? 0 : battery_temperature_raw.substring(1,2).to_i(16) + 0x30'
               checksum_battery_temperature_2:
                 value: '(battery_temperature_raw.substring(2,3)) == "" ? 0 : battery_temperature_raw.substring(2,3).to_i(16) + 0x30'
               checksum_battery_temperature_3:
                 value: '(battery_temperature_raw.substring(3,4)) == "" ? 0 : battery_temperature_raw.substring(3,4).to_i(16) + 0x30'

               checksum_charging_current_0: # we expect at least one digit
                 value: charging_current_raw.substring(0,1).to_i(16) + 0x30
               checksum_charging_current_1: # we ask, if another digit is there. if not (== ""), we get value 0 (doesn't change checksum), else add 0x30 to the actual value
                 value: '(charging_current_raw.substring(1,2)) == "" ? 0 : charging_current_raw.substring(1,2).to_i(16) + 0x30'
               checksum_charging_current_2:
                 value: '(charging_current_raw.substring(2,3)) == "" ? 0 : charging_current_raw.substring(2,3).to_i(16) + 0x30'

               checksum_battery_voltage_before_dot:
                 value: battery_voltage_before_dot_raw.to_i(16) + 0x30
               checksum_battery_voltage_after_dot_0:
                 value: battery_voltage_after_dot_raw.substring(0,1).to_i(16) + 0x30
               checksum_battery_voltage_after_dot_1:
                 value: battery_voltage_after_dot_raw.substring(1,2).to_i(16) + 0x30

               checksum_no_of_resets_raw_0:
                 value: no_of_resets_raw.substring(0,1).to_i(16) + 0x30
               checksum_no_of_resets_raw_1:
                 value: '(no_of_resets_raw.substring(1,2)) == "" ? 0 : no_of_resets_raw.substring(1,2).to_i(16) + 0x30'
               checksum_no_of_resets_raw_2:
                 value: '(no_of_resets_raw.substring(2,3)) == "" ? 0 : no_of_resets_raw.substring(2,3).to_i(16) + 0x30'

               checksum_antenna_deployment_status_raw:
                 value: antenna_deployment_status_raw.substring(0,1).to_i(16) + 0x30

               checksum_radiation_level_raw_0:
                 value: radiation_level_raw.substring(0,1).to_i(16) + 0x30
               checksum_radiation_level_raw_1:
                 value: '(radiation_level_raw.substring(1,2)) == "" ? 0 : radiation_level_raw.substring(1,2).to_i(16) + 0x30'
               checksum_radiation_level_raw_2:
                 value: '(radiation_level_raw.substring(2,3)) == "" ? 0 : radiation_level_raw.substring(2,3).to_i(16) + 0x30'

               checksum_five_commata_and_one_dot: # value from XOR of "," and "." (the remaining 4x "," [an even number] doesn't change checksum)
                 value: 0x02

               checksum_calculation:
                 value: '(checksum_battery_temperature_0 ^ checksum_battery_temperature_1 ^ checksum_battery_temperature_2 ^ checksum_battery_temperature_3 ^ checksum_charging_current_0 ^ checksum_charging_current_1 ^ checksum_charging_current_2 ^ checksum_battery_voltage_before_dot ^ checksum_battery_voltage_after_dot_0 ^ checksum_battery_voltage_after_dot_1 ^ checksum_no_of_resets_raw_0 ^ checksum_no_of_resets_raw_1 ^ checksum_no_of_resets_raw_2 ^ checksum_antenna_deployment_status_raw ^ checksum_radiation_level_raw_0 ^ checksum_radiation_level_raw_1 ^ checksum_radiation_level_raw_2 ^ checksum_five_commata_and_one_dot)'

               checksum_compare:
                 value: 'checksum_calculation == checksum_rtty_raw.to_i(16) ? checksum_rtty_raw : "checksum invalid"'

               battery_temperature:
                 value: battery_temperature_raw.to_i
               charging_current:
                 value: charging_current_raw.to_i
               battery_voltage_before_dot:
                 value: battery_voltage_before_dot_raw.to_i
               battery_voltage_after_dot:
                 value: battery_voltage_after_dot_raw.to_i
               battery_voltage:
                 value: battery_voltage_after_dot + (battery_voltage_before_dot * 100)
               no_of_resets:
                 value: no_of_resets_raw.to_i
               antenna_deployment_status:
                 value: antenna_deployment_status_raw.to_i
               radiation_level:
                 value: radiation_level_raw.to_i

               beacon_type:
                 value:  '0 == 0 ? "RTTY" : "RTTY"'

  decision_digi_or_cw:
        seq:
            - id: decision
              type:
                switch-on: check
                cases:
                  0xffff: digi_with_delimiter
                  0x4d41: cw # AM
                  0x6d61: cw # am
                  _: digi_without_delimiter 

        instances:
             check:
                   type: u2
                   pos: 0

  digi_with_delimiter:
        seq:
            - id: delimiter
              type: s4
              valid:
                any-of:
                  - 0x0000ffff
            - id: header
              type: str
              size: 3
              encoding: ASCII
              valid:
               any-of:
                 - '"NPQ"'
            - id: digimessage
              type: str
              size-eos: true
              encoding: UTF-8

        instances:
               beacon_type:
                 value:  '0 == 0 ? "DIGI" : "DIGI"'

  digi_without_delimiter:
        seq:
            - id: header
              type: str
              size: 3
              encoding: ASCII
              valid:
               any-of:
                 - '"NPQ"'
            - id: digimessage
              type: str
              size-eos: true
              encoding: UTF-8

        instances:
            beacon_type:
                 value:  '0 == 0 ? "DIGI" : "DIGI"'

  cw:
        seq:
            - id: callsign
              type: str
              size: 6
              encoding: ASCII
              valid:
               any-of:
                 - '"AM9NPQ"'
                 - '"am9npq"'
            - id: cwmessage
              type: str
              encoding: UTF-8
              terminator: 0x3F
            - id: checksum_cw_raw
              size: 2
              type: str
              encoding: UTF-8
              valid:
                any-of:
                  - checksum_compare # which is equal to checksum_cw_raw in case of a valid checksum

        instances:
             residuals:
                   value: cwmessage.substring(cwmessage.length-2,cwmessage.length).to_i(16)
             length_of_bat_temp:
                   value: (residuals & 0b00000011) >> 0 # don't forget "(" ... ")"
             length_of_current:
                   value: (residuals & 0b00011100) >> 2
             sign_of_bat_temp:
                   value: '((residuals & 0b00100000) >> 5) == 0 ? "+" : "-"'
             sign_of_obc_temp:
                   value: '((residuals & 0b01000000) >> 6) == 0 ? "+" : "-"'
             antenna_deployment_status:
                   value: '((residuals & 0b10000000) >> 7) == 1 ? 1 : 0'
             length_of_obc_temp: # results in the remaining digits of max. 9
                   value: cwmessage.length-4-length_of_current-length_of_bat_temp # "-4" = length of bat_temp (fix 2) + length of residuals (fix 2)
             com_temperature:
                   value: '(sign_of_obc_temp) == "-" ? (cwmessage.substring(0,length_of_obc_temp).to_i) * (-1) : cwmessage.substring(0,length_of_obc_temp).to_i'
             battery_temperature:
                   value: '(sign_of_bat_temp) == "-" ? (cwmessage.substring(length_of_obc_temp,length_of_obc_temp+length_of_bat_temp).to_i) * (-1) : cwmessage.substring(length_of_obc_temp,length_of_obc_temp+length_of_bat_temp).to_i'
             charging_current:
                   value: cwmessage.substring(length_of_obc_temp+length_of_bat_temp,length_of_obc_temp+length_of_bat_temp+length_of_current).to_i
             battery_voltage:
                   value: cwmessage.substring(length_of_obc_temp+length_of_bat_temp+length_of_current,length_of_obc_temp+length_of_bat_temp+length_of_current+2).to_i * 10

             calc_checksum_cw_0:
                   value: '(cwmessage.substring(0,1).to_i(16)) < 0x0a ? (cwmessage.substring(0,1).to_i(16) + 0x30) : (cwmessage.substring(0,1).to_i(16) + 0x57)'
             calc_checksum_cw_1:
                   value: '(cwmessage.substring(1,2).to_i(16)) < 0x0a ? (cwmessage.substring(1,2).to_i(16) + 0x30) : (cwmessage.substring(1,2).to_i(16) + 0x57)'
             calc_checksum_cw_2:
                   value: '(cwmessage.substring(2,3).to_i(16)) < 0x0a ? (cwmessage.substring(2,3).to_i(16) + 0x30) : (cwmessage.substring(2,3).to_i(16) + 0x57)'
             calc_checksum_cw_3:
                   value: '(cwmessage.substring(3,4).to_i(16)) < 0x0a ? (cwmessage.substring(3,4).to_i(16) + 0x30) : (cwmessage.substring(3,4).to_i(16) + 0x57)'
             calc_checksum_cw_4:
                   value: '(cwmessage.substring(4,5).to_i(16)) < 0x0a ? (cwmessage.substring(4,5).to_i(16) + 0x30) : (cwmessage.substring(4,5).to_i(16) + 0x57)'
             calc_checksum_cw_5:
                   value: '(cwmessage.substring(5,6).to_i(16)) < 0x0a ? (cwmessage.substring(5,6).to_i(16) + 0x30) : (cwmessage.substring(5,6).to_i(16) + 0x57)'
             calc_checksum_cw_6: # there are at least 6 digits
                   value: '(cwmessage.substring(6,7).to_i(16)) < 0x0a ? (cwmessage.substring(6,7).to_i(16) + 0x30) : (cwmessage.substring(6,7).to_i(16) + 0x57)'
             calc_checksum_cw_7: # from now on we check first if another digit exists
                   value: '(cwmessage.substring(7,8)) == "" ? 0 : ((cwmessage.substring(7,8).to_i(16)) < 0x0a ? (cwmessage.substring(7,8).to_i(16) + 0x30) : (cwmessage.substring(7,8).to_i(16) + 0x57))'
             calc_checksum_cw_8:
                   value: '(cwmessage.substring(8,9)) == "" ? 0 : ((cwmessage.substring(8,9).to_i(16)) < 0x0a ? (cwmessage.substring(8,9).to_i(16) + 0x30) : (cwmessage.substring(8,9).to_i(16) + 0x57))'
             calc_checksum_cw_9:
                   value: '(cwmessage.substring(9,10)) == "" ? 0 : ((cwmessage.substring(9,10).to_i(16)) < 0x0a ? (cwmessage.substring(9,10).to_i(16) + 0x30) : (cwmessage.substring(9,10).to_i(16) + 0x57))'
             calc_checksum_cw_10:
                   value: '(cwmessage.substring(10,11)) == "" ? 0 : ((cwmessage.substring(10,11).to_i(16)) < 0x0a ? (cwmessage.substring(10,11).to_i(16) + 0x30) : (cwmessage.substring(10,11).to_i(16) + 0x57))'
             calc_checksum_cw_11:
                   value: '(cwmessage.substring(11,12)) == "" ? 0 : ((cwmessage.substring(11,12).to_i(16)) < 0x0a ? (cwmessage.substring(11,12).to_i(16) + 0x30) : (cwmessage.substring(11,12).to_i(16) + 0x57))'
             calc_checksum_cw_12:
                   value: '(cwmessage.substring(12,13)) == "" ? 0 : ((cwmessage.substring(12,13).to_i(16)) < 0x0a ? (cwmessage.substring(12,13).to_i(16) + 0x30) : (cwmessage.substring(12,13).to_i(16) + 0x57))'

             checksum_calculation:
                   value: 'calc_checksum_cw_0 ^ calc_checksum_cw_1 ^ calc_checksum_cw_2 ^ calc_checksum_cw_3 ^ calc_checksum_cw_4 ^ calc_checksum_cw_5 ^ calc_checksum_cw_6 ^ calc_checksum_cw_7 ^ calc_checksum_cw_8 ^ calc_checksum_cw_9 ^ calc_checksum_cw_10 ^ calc_checksum_cw_11 ^ calc_checksum_cw_12'

             checksum_compare:
                   value: 'checksum_calculation == checksum_cw_raw.to_i(16) ? checksum_cw_raw : "checksum invalid"'

             beacon_type:
                   value:  '0 == 0 ? "CW" : "CW"'

