---
meta:
  id: qbee
  endian: le

doc: |
  :field wod_time: beacon_data.wod.wod_time
  :field wod_mode: beacon_data.wod.wod_mode
  :field wod_voltage_battery: beacon_data.wod.wod_voltage_battery
  :field wod_current_battery: beacon_data.wod.wod_current_battery
  :field wod_current_3v3: beacon_data.wod.wod_current_3v3
  :field wod_current_5v: beacon_data.wod.wod_current_5v
  :field wod_temperature_comms: beacon_data.wod.wod_temperature_comms
  :field wod_temperature_eps: beacon_data.wod.wod_temperature_eps
  :field wod_temperature_battery: beacon_data.wod.wod_temperature_battery
  :field pwr_info_adcs: beacon_data.power_info.pwr_info_adcs
  :field pwr_info_fipex: beacon_data.power_info.pwr_info_fipex
  :field pwr_info_gps: beacon_data.power_info.pwr_info_gps
  :field pwr_info_ocobc: beacon_data.power_info.pwr_info_ocobc
  :field service_enabled_adcs: beacon_data.service_enabled.service_enabled_adcs
  :field service_enabled_fipex: beacon_data.service_enabled.service_enabled_fipex
  :field service_enabled_ocobc: beacon_data.service_enabled.service_enabled_ocobc
  :field service_running_adcs: beacon_data.service_running.service_running_adcs
  :field service_running_fipex: beacon_data.service_running.service_running_fipex
  :field service_running_ocobc: beacon_data.service_running.service_running_ocobc

seq:
  - id: ax_header
    type: ax_header

  - id: csp_header
    size: 4

  - id: beacon_data
    type: beacon_data
    doc-ref: https://github.com/opencosmos/qb01-beacon-decoder/blob/master/QB50%20SE01%20beacon%20description%20-%20Open%20Cosmos.pdf

  - id: rs_parity
    size: 32

types:
  ax_header:
    seq:
      - id: destination
        type: str
        encoding: ASCII
        size: 6

      - id: destination_ssid
        type: u1

      - id: source
        type: str
        encoding: ASCII
        size: 6

      - id: source_ssid
        type: u1

      - id: control
        type: u1

      - id: pid
        type: u1

  beacon_data:
    seq:
      - id: wod
        type: wod

      - id: power_info
        type: power_info

      - id: service_enabled
        type: service_enabled

      - id: service_running
        type: service_running

      - id: reserved
        size: 14

  wod:
    seq:
      - id: wod_time
        type: u4
        doc-ref: https://www.qb50.eu/index.php/tech-docs/category/QB50%20Whole%20Orbit%20Data%20-%20Iss42aac.pdf?download=80:whole-orbital-data-issue-4

      - id: wod_mode
        type: u1

      - id: wod_voltage_battery
        type: u1

      - id: wod_current_battery
        type: u1

      - id: wod_current_3v3
        type: u1

      - id: wod_current_5v
        type: u1

      - id: wod_temperature_comms
        type: u1

      - id: wod_temperature_eps
        type: u1

      - id: wod_temperature_battery
        type: u1


  power_info:
    seq:
      - id: pwr_info_adcs
        type: b1

      - id: pwr_info_fipex
        type: b1

      - id: pwr_info_gps
        type: b1

      - id: pwr_info_ocobc
        type: b1

      - id: pwr_info_reserved
        type: b4

  service_enabled:
    seq:
      - id: service_enabled_adcs
        type: b1

      - id: service_enabled_fipex
        type: b1

      - id: service_enabled_ocobc
        type: b1

      - id: service_enabled_reserved
        type: b5

  service_running:
    seq:
      - id: service_running_adcs
        type: b1

      - id: service_running_fipex
        type: b1

      - id: service_running_ocobc
        type: b1

      - id: service_running_reserved
        type: b5
