---
meta:
  id: foresail1
  title: FORESAIL-1
  endian: be
doc-ref: 'https://foresail.github.io/docs/FS1_Space_Ground_Interface_Control_Sheet.pdf'
doc: |
  :field timestamp: pus.obc_housekeeping.timestamp.timestamp
  :field obc_side: pus.obc_housekeeping.side
  :field obc_fdir: pus.obc_housekeeping.fdir
  :field obc_scheduler: pus.obc_housekeeping.scheduler
  :field obc_sw_revision: pus.obc_housekeeping.software_revision
  :field obc_uptime: pus.obc_housekeeping.uptime
  :field obc_heap_free: pus.obc_housekeeping.heap_free
  :field obc_cpu_load: pus.obc_housekeeping.cpu_load
  :field obc_fs_free_space: pus.obc_housekeeping.fs_free_space
  :field arbiter_uptime: pus.obc_housekeeping.arbiter_uptime
  :field arbiter_age: pus.obc_housekeeping.arbiter_age
  :field arbiter_bootcount: pus.obc_housekeeping.arbiter_bootcount
  :field arbiter_temperature: pus.obc_housekeeping.arbiter_temperature
  :field side_a_bootcount: pus.obc_housekeeping.side_a_bootcount
  :field side_a_heartbeat: pus.obc_housekeeping.side_a_heartbeat
  :field side_a_fail_counter: pus.obc_housekeeping.side_a_fail_counter
  :field side_a_fail_reason: pus.obc_housekeeping.side_a_fail_reason
  :field side_b_bootcount: pus.obc_housekeeping.side_b_bootcount
  :field side_b_heartbeat: pus.obc_housekeeping.side_b_heartbeat
  :field side_b_fail_counter: pus.obc_housekeeping.side_b_fail_counter
  :field side_b_fail_reason: pus.obc_housekeeping.side_b_fail_reason

  :field timestamp: pus.eps_housekeeping.timestamp.timestamp
  :field pcdu_uptime: pus.eps_housekeeping.pcdu_uptime
  :field pcdu_boot_count: pus.eps_housekeeping.pcdu_boot_count
  :field pdm_expected: pus.eps_housekeeping.pdm_expected
  :field pdm_faulted: pus.eps_housekeeping.pdm_faulted
  :field pcdu_peak_detect_index: pus.eps_housekeeping.pcdu_peak_detect_index
  :field panel_x_minus_voltage: pus.eps_housekeeping.v_in_x_minus
  :field panel_x_plus_voltage: pus.eps_housekeeping.v_in_x_plus
  :field panel_y_minus_voltage: pus.eps_housekeeping.v_in_y_minus
  :field panel_y_plus_voltage: pus.eps_housekeeping.v_in_y_plus
  :field panel_x_minus_max_voltage: pus.eps_housekeeping.v_in_max_x_minus
  :field panel_x_plus_max_voltage: pus.eps_housekeeping.v_in_max_x_plus
  :field panel_y_minus_max_voltage: pus.eps_housekeeping.v_in_max_y_minus
  :field panel_y_plus_max_voltage: pus.eps_housekeeping.v_in_max_y_plus
  :field panel_x_minus_current: pus.eps_housekeeping.i_in_x_minus
  :field panel_x_plus_current: pus.eps_housekeeping.i_in_x_plus
  :field panel_y_minus_current: pus.eps_housekeeping.i_in_y_minus
  :field panel_y_plus_current: pus.eps_housekeeping.i_in_y_plus
  :field panel_x_minus_max_current: pus.eps_housekeeping.i_in_max_x_minus
  :field panel_x_plus_max_current: pus.eps_housekeeping.i_in_max_x_plus
  :field panel_y_minus_max_current: pus.eps_housekeeping.i_in_max_y_minus
  :field panel_y_plus_max_current: pus.eps_housekeeping.i_in_max_y_plus
  :field v_batt_bus: pus.eps_housekeeping.v_batt_bus
  :field temp_x_minus: pus.eps_housekeeping.temp_x_minus
  :field temp_x_plus: pus.eps_housekeeping.temp_x_plus
  :field temp_y_minus: pus.eps_housekeeping.temp_y_minus
  :field temp_y_plus: pus.eps_housekeeping.temp_y_plus
  :field temp_pcdu: pus.eps_housekeeping.temp_pcdu
  :field v_3v6_uhd_adcs: pus.eps_housekeeping.v_3v6_uhd_adcs
  :field v_3v6_mag_obc: pus.eps_housekeeping.v_3v6_mag_obc
  :field v_3v6_epb_cam: pus.eps_housekeeping.v_3v6_epb_cam
  :field i_pate_batt: pus.eps_housekeeping.i_pate_batt
  :field pb_batt_current: pus.eps_housekeeping.i_pb_batt
  :field pb_3v6_current: pus.eps_housekeeping.i_pb_3v6
  :field cam_3v6_current: pus.eps_housekeeping.i_cam_3v6
  :field mag_3v6_current: pus.eps_housekeeping.i_mag_3v6
  :field obc_3v6_current: pus.eps_housekeeping.i_obc_3v6
  :field uhf_3v6_current: pus.eps_housekeeping.i_uhf_3v6
  :field adcs_3v6_current: pus.eps_housekeeping.i_adcs_3v6
  :field pate_batt_current_max: pus.eps_housekeeping.i_pate_batt_max
  :field pb_batt_current_max: pus.eps_housekeeping.i_pb_batt_max
  :field pb_3v6_current_max: pus.eps_housekeeping.i_pb_3v6_max
  :field cam_3v6_current_max: pus.eps_housekeeping.i_cam_3v6_max
  :field mag_3v6_current_max: pus.eps_housekeeping.i_mag_3v6_max
  :field obc_3v6_current_max: pus.eps_housekeeping.i_obc_3v6_max
  :field uhf_3v6_current_max: pus.eps_housekeeping.i_uhf_3v6_max
  :field adcs_3v6_current_max: pus.eps_housekeeping.i_adcs_3v6_max
  :field pate_batt_current_min: pus.eps_housekeeping.i_pate_batt_min
  :field pb_batt_current_min: pus.eps_housekeeping.i_pb_batt_min
  :field pb_3v6_current_min: pus.eps_housekeeping.i_pb_3v6_min
  :field cam_3v6_current_min: pus.eps_housekeeping.i_cam_3v6_min
  :field mag_3v6_current_min: pus.eps_housekeeping.i_mag_3v6_min
  :field obc_3v6_current_min: pus.eps_housekeeping.i_obc_3v6_min
  :field uhf_3v6_current_min: pus.eps_housekeeping.i_uhf_3v6_min
  :field adcs_3v6_current_min: pus.eps_housekeeping.i_adcs_3v6_min
  :field batt_status: pus.eps_housekeeping.batt_status
  :field batt_boot_count: pus.eps_housekeeping.batt_boot_count
  :field batt_wdt_reset_count: pus.eps_housekeeping.batt_wdt_reset_count
  :field batt_bus_timeout_count: pus.eps_housekeeping.batt_bus_timeout_count
  :field batt_bpc_fail_count: pus.eps_housekeeping.batt_bpc_fail_count
  :field batt_pack_voltage: pus.eps_housekeeping.batt_pack_voltage
  :field batt_pack_lower_voltage: pus.eps_housekeeping.batt_pack_lower_voltage
  :field batt_pack_current: pus.eps_housekeeping.batt_pack_current
  :field batt_pack_min_current: pus.eps_housekeeping.batt_pack_min_current
  :field batt_pack_max_current: pus.eps_housekeeping.batt_pack_max_current
  :field batt_pack_temp: pus.eps_housekeeping.batt_pack_temp
  :field batt_board_temp: pus.eps_housekeeping.batt_board_temp
  :field batt_heater_pwm_on_time: pus.eps_housekeeping.heater_pwm_on_time

  :field timestamp: pus.uhf_housekeeping.timestamp.timestamp
  :field uhf_uptime: pus.uhf_housekeeping.uptime
  :field uhf_bootcount: pus.uhf_housekeeping.bootcount
  :field uhf_wdt_resets: pus.uhf_housekeeping.wdt_reset_count
  :field uhf_sbe_count: pus.uhf_housekeeping.sbe_count
  :field uhf_mbe_count: pus.uhf_housekeeping.mbe_count
  :field uhf_total_tx_frames: pus.uhf_housekeeping.total_tx_frames
  :field uhf_total_rx_frames: pus.uhf_housekeeping.total_rx_frames
  :field uhf_total_ham_tx_frames: pus.uhf_housekeeping.total_ham_tx_frames
  :field uhf_total_ham_rx_frames: pus.uhf_housekeeping.total_ham_rx_frames
  :field uhf_side: pus.uhf_housekeeping.side
  :field uhf_rx_mode: pus.uhf_housekeeping.rx_mode
  :field uhf_tx_mode: pus.uhf_housekeeping.tx_mode
  :field uhf_mcu_temperature: pus.uhf_housekeeping.mcu_temperature
  :field uhf_pa_temperature: pus.uhf_housekeeping.pa_temperature
  :field uhf_background_rssi: pus.uhf_housekeeping.backogrund_rssi
  :field uhf_last_rssi: pus.uhf_housekeeping.last_rssi
  :field uhf_last_freq_offset: pus.uhf_housekeeping.last_freq_offset

  :field timestamp: pus.adcs_housekeeping.timestamp.timestamp
  :field determination_mode: pus.adcs_housekeeping.determination_mode
  :field control_mode: pus.adcs_housekeeping.control_mode
  :field mjd: pus.adcs_housekeeping.mjd
  :field position_x: pus.adcs_housekeeping.position_x
  :field position_y: pus.adcs_housekeeping.position_y
  :field position_z: pus.adcs_housekeeping.position_z
  :field velocity_x: pus.adcs_housekeeping.velocity_x
  :field velocity_y: pus.adcs_housekeeping.velocity_y
  :field velocity_z: pus.adcs_housekeeping.velocity_z
  :field quaternion_x: pus.adcs_housekeeping.quaternion_x
  :field quaternion_y: pus.adcs_housekeeping.quaternion_y
  :field quaternion_z: pus.adcs_housekeeping.quaternion_z
  :field quaternion_w: pus.adcs_housekeeping.quaternion_w
  :field angular_rate_x: pus.adcs_housekeeping.angular_rate_x
  :field angular_rate_y: pus.adcs_housekeeping.angular_rate_y
  :field angular_rate_z: pus.adcs_housekeeping.angular_rate_z

  :field timestamp: pus.event.timestamp.timestamp
  :field event_severity: pus.event.severity
  :field event_rid: pus.event.rid
  :field event_info: pus.event.info

  :field repeater_dest_callsign: repeater.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field repeater_dest_ssid: repeater.ax25_header.dest_ssid_raw.ssid
  :field repeater_src_callsign: repeater.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field repeater_src_ssid: repeater.ax25_header.src_ssid_raw.ssid
  :field repeater_payload: repeater.payload


seq:
  - id: skylink
    type: skylink_frame
  - id: pus
    if: ((skylink.vc == 0) or (skylink.vc == 1))
    type: foresail_pus_frame
    size: _io.size - _io.pos - 8 * skylink.is_authenticated
  - id: repeater
    if: (skylink.vc == 3)
    type: ax25_frame
    size: _io.size - _io.pos - 8 * skylink.is_authenticated
  - id: auth
    if: (skylink.is_authenticated == 1)
    size: 8


types:
  skylink_frame:
    doc-ref: 'Skylink Protocol Specification.pdf'
    seq:
      - id: start_byte
        size: 1
        contents: [0x66]
      - id: identity
        size: 6  # identifier_len
        contents: [0x4f, 0x48, 0x32, 0x46, 0x31, 0x53]
      - id: control
        type: u1
      - id: extension_length
        type: u1
      - id: sequence_number
        type: u2
      - id: extensions
        size: extension_length

    instances:
      has_payload:
        value: (control & 0b00100000) >> 5
      arq_on:
        value: (control & 0b00010000) >> 4
      is_authenticated:
        value: (control & 0b00001000) >> 3
      vc:
        value: (control & 0b00000111) >> 0

  pus_header:
    doc: 'CCSDS PUS header'
    seq:
      - id: packet_id
        type: u2
      - id: sequence
        type: u2
      - id: length
        type: u2
      - id: secondary_header
        type: u1
      - id: service_type
        type: u1
      - id: service_subtype
        type: u1

  foresail_pus_frame:
    seq:
      - id: header
        type: pus_header
      - id: obc_housekeeping
        type: obc_housekeeping
        if: (header.service_type == 3) and (header.service_subtype == 2)
      - id: eps_housekeeping
        type: eps_housekeeping
        if: (header.service_type == 3) and (header.service_subtype == 3)
      - id: uhf_housekeeping
        type: uhf_housekeeping
        if: (header.service_type == 3) and (header.service_subtype == 4)
      - id: adcs_housekeeping
        type: adcs_housekeeping
        if: (header.service_type == 3) and (header.service_subtype == 5)
      - id: event
        type: event
        if: (header.service_type == 4) and (header.service_subtype == 1 or header.service_subtype == 2 or header.service_subtype == 3 or header.service_subtype == 4)

  pdms:
    seq:
      - id: val
        type: u1
    instances:
      pate_batt:
        value: '((val & 0x01) >> 0)'
      pb_batt:
        value: '((val & 0x02) >> 1)'
      pb_3v6:
        value: '((val & 0x04) >> 2)'
      cam_3v6:
        value: '((val & 0x08) >> 3)'
      mag_3v6:
        value: '((val & 0x10) >> 4)'
      obc_3v6:
        value: '((val & 0x20) >> 5)'
      uhf_3v6:
        value: '((val & 0x40) >> 6)'
      adcs_3v6:
        value: '((val & 0x80) >> 7)'

  unix_timestamp:
    meta:
      endian: be
    doc: 'Unix timestamp'
    seq:
      - id: timestamp
        type: u4

  obc_housekeeping:
    meta:
      endian: le
    seq:
      - id: timestamp
        type: unix_timestamp
      - id: side
        type: u1
        doc: |
          OBC Redundancy side:
          0 = Side A
          1 = Side B
      - id: fdir
        type: u1
      - id: scheduler
        type: u1
      - id: software_revision
        type: u1
      - id: uptime
        type: u4
        doc: '[seconds]'

      - id: heap_free
        type: u1
        doc: 'value = 0.39215686274509803 * heap [%]'
      - id: cpu_load
        type: u1
        doc: 'value = 0.39215686274509803 * heap [%]'
      - id: fs_free_space
        type: u2
        doc: 'value = 4 * fs_used [kBytes]'

      - id: arbiter_uptime
        type: u2
        doc: '[seconds]'
      - id: arbiter_age
        type: u2
      - id: arbiter_bootcount
        type: u2
      - id: arbiter_temperature
        type: s2
        doc: 'value = arbiter_temperature / 10 [°C]'

      - id: side_a_bootcount
        type: u1
      - id: side_a_heartbeat
        type: u1
      - id: side_a_fail_counter
        type: u1
      - id: side_a_fail_reason
        type: u1

      - id: side_b_bootcount
        type: u1
      - id: side_b_heartbeat
        type: u1
      - id: side_b_fail_counter
        type: u1
      - id: side_b_fail_reason
        type: u1

      - id: arbiter_log_1
        type: u1
      - id: arbiter_log_2
        type: u1
      - id: arbiter_log_3
        type: u1
      - id: arbiter_log_4
        type: u1


  eps_housekeeping:
    meta:
      endian: le
    seq:
      - id: timestamp
        type: unix_timestamp
      - id: pcdu_uptime
        type: u4
        doc: 'PCDU uptime in seconds'
      - id: pcdu_boot_count
        type: u1
      - id: pdm_expected
        type: u1
        doc: 'Power delivery switch expected states'
      - id: pdm_faulted
        type: u1
        doc: 'Power delivery switch fault states'
      - id: pcdu_peak_detect_index
        type: u1

      - id: v_in_x_minus
        type: u2
        doc: 'value = v_in_x_minus / 1000 [V]'
      - id: v_in_x_plus
        type: u2
        doc: 'value = v_in_x_plus / 1000 [V]'
      - id: v_in_y_minus
        type: u2
        doc: 'value = v_in_y_minus / 1000 [V]'
      - id: v_in_y_plus
        type: u2
        doc: 'value = v_in_y_plus / 1000 [V]'

      - id: v_in_max_x_minus
        type: u2
        doc: 'value = v_in_max_x_minus / 1000 [V]'
      - id: v_in_max_x_plus
        type: u2
        doc: 'value = v_in_max_x_plus / 1000 [V]'
      - id: v_in_max_y_minus
        type: u2
        doc: 'value = v_in_max_y_minus / 1000 [V]'
      - id: v_in_max_y_plus
        type: u2
        doc: 'value = v_in_max_y_plus / 1000 [V]'

      - id: i_in_x_minus
        type: u2
        doc: 'value = i_in_x_minus [mA]'
      - id: i_in_x_plus
        type: u2
        doc: 'value = i_in_x_plus [mA]'
      - id: i_in_y_minus
        type: u2
        doc: 'value = i_in_y_minus [mA]'
      - id: i_in_y_plus
        type: u2
        doc: 'value = i_in_y_plus [mA]'

      - id: i_in_max_x_minus
        type: u2
        doc: 'value = i_in_max_x_minus [mA]'
      - id: i_in_max_x_plus
        type: u2
        doc: 'value = i_in_max_x_plus [mA]'
      - id: i_in_max_y_minus
        type: u2
        doc: 'value = i_in_max_y_minus [mA]'
      - id: i_in_max_y_plus
        type: u2
        doc: 'value = i_in_max_y_plus [mA]'

      - id: v_batt_bus
        type: u2
        doc: 'value = v_batt_bus / 1000 [V]'

      - id: temp_x_minus
        type: s2
        doc: 'value = temp_x_minus / 10 [°C]'
      - id: temp_x_plus
        type: s2
        doc: 'value = temp_x_plus / 10 [°C]'
      - id: temp_y_minus
        type: s2
        doc: 'value = temp_y_minus / 10 [°C]'
      - id: temp_y_plus
        type: s2
        doc: 'value = temp_y_plus / 10 [°C]'

      - id: temp_pcdu
        type: s2
        doc: 'value = temp_pcdu / 10 [°C]'

      - id: v_3v6_uhd_adcs
        type: u2
        doc: 'value = v_3v6_uhd_adcs / 1000 [V]'
      - id: v_3v6_mag_obc
        type: u2
        doc: 'value = v_3v6_uhd_adcs / 1000 [V]'
      - id: v_3v6_epb_cam
        type: u2
        doc: 'value = v_3v6_uhd_adcs / 1000 [V]'

      - id: i_pate_batt
        type: u2
        doc: 'Particle Telescope Batt current consumption [mA]'
      - id: i_pb_batt
        type: u2
        doc: 'Plasma Brake Batt current consumption [mA]'
      - id: i_pb_3v6
        type: u2
        doc: 'Plasma Brake 3.6V current consumption [mA]'
      - id: i_cam_3v6
        type: u2
        doc: 'Camera 3.6V current consumption [mA]'
      - id: i_mag_3v6
        type: u2
        doc: 'Magnetometer 3.6V current consumption  [mA]'
      - id: i_obc_3v6
        type: u2
        doc: 'OBC 3.6V current consumption [mA]'
      - id: i_uhf_3v6
        type: u2
        doc: 'UHF 3.6V current consumption [mA]'
      - id: i_adcs_3v6
        type: u2
        doc: 'ADCS 3.6V current consumption [mA]'

      - id: i_pate_batt_max
        type: u2
        doc: 'Particle Telescope maximum current consumption [mA]'
      - id: i_pb_batt_max
        type: u2
        doc: 'Plasma Brake Batt maximum current consumption [mA]'
      - id: i_pb_3v6_max
        type: u2
        doc: 'Plasma Brake 3.6V maximum current consumption [mA]'
      - id: i_cam_3v6_max
        type: u2
        doc: 'Camera 3.6V maximum current consumption [mA]'
      - id: i_mag_3v6_max
        type: u2
        doc: 'Magnetometer 3.6V maximum current consumption [mA]'
      - id: i_obc_3v6_max
        type: u2
        doc: 'OBC 3.6V maximum current consumption [mA]'
      - id: i_uhf_3v6_max
        type: u2
        doc: 'UHF 3.6V maximum current consumption [mA]'
      - id: i_adcs_3v6_max
        type: u2
        doc: 'ADCS 3.6V maximum current consumption [mA]'

      - id: i_pate_batt_min
        type: u2
        doc: 'Particle Telescope Batt minimum current consumption [mA]'
      - id: i_pb_batt_min
        type: u2
        doc: 'Plasma Brake Batt minimum current consumption [mA]'
      - id: i_pb_3v6_min
        type: u2
        doc: 'Plasma Brake 3.6V minimum current consumption [mA]'
      - id: i_cam_3v6_min
        type: u2
        doc: 'Camera 3.6V minimum current consumption [mA]'
      - id: i_mag_3v6_min
        type: u2
        doc: 'Magnetometer 3.6V minimum current consumption [mA]'
      - id: i_obc_3v6_min
        type: u2
        doc: 'OBC 3.6V minimum current consumption [mA]'
      - id: i_uhf_3v6_min
        type: u2
        doc: 'UHF 3.6V minimum current consumption [mA]'
      - id: i_adcs_3v6_min
        type: u2
        doc: 'ADCS 3.6V minimum current consumption [mA]'

      - id: batt_status
        type: u2
      - id: batt_boot_count
        type: u1
        doc: 'Battery board MCU bootcount'
      - id: batt_wdt_reset_count
        type: u1
        doc: 'Battery board WDT reset count'
      - id: batt_bus_timeout_count
        type: u1
        doc: 'Battery board bus timeout count'
      - id: batt_bpc_fail_count
        type: u1
        doc: 'Battery board protection circuit fail count'

      - id: batt_pack_voltage
        type: u2
        doc: 'value = batt_pack_voltage / 1000 [V]'
      - id: batt_pack_lower_voltage
        type: u2
        doc: 'value = batt_pack_voltage / 1000 [V]'

      - id: batt_pack_current
        type: s2
        doc: 'value = batt_pack_current [mA]'
      - id: batt_pack_min_current
        type: s2
        doc: 'value = batt_pack_min_current [mA]'
      - id: batt_pack_max_current
        type: s2
        doc: 'value = batt_pack_max_current [mA]'

      - id: batt_pack_temp
        type: s2
        doc: 'value = batt_pack_temp / 10 [°C]'
      - id: batt_board_temp
        type: s2
        doc: 'value = batt_board_temp / 10 [°C]'
      - id: heater_pwm_on_time
        type: u2

  uhf_housekeeping:
    meta:
      endian: le
    seq:
      - id: timestamp
        type: unix_timestamp
      - id: uptime
        type: u4
        doc: '[seconds]'
      - id: bootcount
        type: u2

      - id: wdt_reset_count
        type: u1
      - id: sbe_count
        type: u1
      - id: mbe_count
        type: u1
      - id: bus_sync_errors
        type: u1
      - id: bus_len_errors
        type: u1
      - id: bus_crc_errors
        type: u1
      - id: bus_bug_errors
        type: u1
      - id: total_tx_frames
        type: u4
      - id: total_rx_frames
        type: u4
      - id: total_ham_tx_frames
        type: u4
      - id: total_ham_rx_frames
        type: u4
      - id: side
        type: u1

      - id: rx_mode
        type: u1
      - id: tx_mode
        type: u1

      - id: mcu_temperature
        type: s2
        doc: 'value = batt_board_temp / 10 [°C]'
      - id: pa_temperature
        type: s2
        doc: 'value = batt_board_temp / 10 [°C]'

      - id: background_rssi
        type: s1
        doc: 'value = last_rssi - 111 [dBm]'
      - id: last_rssi
        type: s1
        doc: 'value = last_rssi - 111 [dBm]'
      - id: last_freq_offset
        type: s2
        doc: 'value = 19.07 * last_freq_offset [Hz]'


  adcs_housekeeping:
    meta:
      endian: le
    seq:
      - id: timestamp
        type: unix_timestamp
      - id: determination_mode
        type: u1
      - id: control_mode
        type: u1
      - id: mjd
        type: f4
        doc: 'Modified Julian Date'
      - id: position_x
        type: f4
        doc: 'Satellite position in ECI frame [km]'
      - id: position_y
        type: f4
        doc: 'Satellite position in ECI frame [km]'
      - id: position_z
        type: f4
        doc: 'Satellite position in ECI frame [km]'
      - id: velocity_x
        type: f4
        doc: 'Satellite velocity in ECI frame [km/s]'
      - id: velocity_y
        type: f4
        doc: 'Satellite velocity in ECI frame [km/s]'
      - id: velocity_z
        type: f4
        doc: 'Satellite velocity in ECI frame [km/s]'
      - id: angular_rate_x
        type: f4
        doc: '[rad/s]'
      - id: angular_rate_y
        type: f4
        doc: '[rad/s]'
      - id: angular_rate_z
        type: f4
        doc: '[rad/s]'
      - id: quaternion_x
        type: f4
        doc: 'Satellite attitude estimate in ECI-frame'
      - id: quaternion_y
        type: f4
        doc: 'Satellite attitude estimate in ECI-frame'
      - id: quaternion_z
        type: f4
        doc: 'Satellite attitude estimate in ECI-frame'
      - id: quaternion_w
        type: f4
        doc: 'Satellite attitude estimate in ECI-frame'

  event:
    seq:
      - id: timestamp
        type: unix_timestamp
      - id: rid
        type: u2
      - id: info
        size-eos: true

  ax25_frame:
    doc-ref: 'https://www.tapr.org/pdf/AX25.2.2.pdf'
    seq:
      - id: start_flag
        size: 1
        contents: [0x7E]
      - id: ax25_header
        type: ax25_header
      - id: payload
        type: strz
        encoding: ascii
        size: _io.size - _io.pos - 3 - 8 * _root.skylink.is_authenticated
      - id: fcs
        type: u2
      - id: end_flag
        size: 1
        contents: [0x7E]

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
      - id: pid
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
      - id: ax25_info
        size-eos: true

  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        size-eos: true
