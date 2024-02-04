---
meta:
  id: alsat1n
  endian: le
doc: |
  :field callsign: callsign
  :field strx_header_seq: alsat1n_payload.strx_header.strx_header_seq
  :field strx_header_len: alsat1n_payload.strx_header.strx_header_len
  :field strx_header_id: alsat1n_payload.strx_header.strx_header_id
  :field payload_id: alsat1n_payload.ssc_header.payload_id
  :field msg_id: alsat1n_payload.ssc_header.msg_id
  :field response_code: alsat1n_payload.ssc_header.response_code
  :field p8_state: alsat1n_payload.ssc_channel.payload_type.msg_type.p8_state
  :field p8_current: alsat1n_payload.ssc_channel.payload_type.msg_type.p8_current
  :field p8_voltage: alsat1n_payload.ssc_channel.payload_type.msg_type.p8_voltage
  :field p7_state: alsat1n_payload.ssc_channel.payload_type.msg_type.p7_state
  :field p7_current: alsat1n_payload.ssc_channel.payload_type.msg_type.p7_current
  :field p7_voltage: alsat1n_payload.ssc_channel.payload_type.msg_type.p7_voltage
  :field ipcm5v: alsat1n_payload.ssc_channel.payload_type.msg_type.ipcm5v
  :field ipcm3v3: alsat1n_payload.ssc_channel.payload_type.msg_type.ipcm3v3
  :field ipcmbatv: alsat1n_payload.ssc_channel.payload_type.msg_type.ipcmbatv
  :field vpcmbatv: alsat1n_payload.ssc_channel.payload_type.msg_type.vpcmbatv
  :field eps_temperature: alsat1n_payload.ssc_channel.payload_type.msg_type.eps_temperature
  :field s1_state_3v3: alsat1n_payload.ssc_channel.payload_type.msg_type.s1_state_3v3
  :field s1_current_3v3: alsat1n_payload.ssc_channel.payload_type.msg_type.s1_current_3v3
  :field s1_voltage_3v3: alsat1n_payload.ssc_channel.payload_type.msg_type.s1_voltage_3v3
  :field s2_state_5v: alsat1n_payload.ssc_channel.payload_type.msg_type.s2_state_5v
  :field s2_current_5v: alsat1n_payload.ssc_channel.payload_type.msg_type.s2_current_5v
  :field s2_voltage_5v: alsat1n_payload.ssc_channel.payload_type.msg_type.s2_voltage_5v
  :field pdm_uptime_payload_h: alsat1n_payload.ssc_channel.payload_type.msg_type.pdm_uptime_payload_h
  :field pdm_uptime_payload_l: alsat1n_payload.ssc_channel.payload_type.msg_type.pdm_uptime_payload_l
  :field pdm_uptime_platform_h: alsat1n_payload.ssc_channel.payload_type.msg_type.pdm_uptime_platform_h
  :field pdm_uptime_platform_l: alsat1n_payload.ssc_channel.payload_type.msg_type.pdm_uptime_platform_l
  :field software_ident: alsat1n_payload.ssc_channel.payload_type.msg_type.software_ident
  :field uptime: alsat1n_payload.ssc_channel.payload_type.msg_type.uptime
  :field eps_voltage_battery: alsat1n_payload.ssc_channel.payload_type.msg_type.eps_voltage_battery
  :field eps_current_battery: alsat1n_payload.ssc_channel.payload_type.msg_type.eps_current_battery
  :field safe_mode: alsat1n_payload.ssc_channel.payload_type.msg_type.safe_mode
  :field safe_reason: alsat1n_payload.ssc_channel.payload_type.msg_type.safe_reason
  :field unix_time: alsat1n_payload.ssc_channel.payload_type.msg_type.unix_time
  :field reboot_num: alsat1n_payload.ssc_channel.payload_type.msg_type.reboot_num
  :field reboot_cause: alsat1n_payload.ssc_channel.payload_type.msg_type.reboot_cause
  :field i2c_traffic_cnt: alsat1n_payload.ssc_channel.payload_type.msg_type.i2c_traffic_cnt
  :field watchdog_time_remaining: alsat1n_payload.ssc_channel.payload_type.msg_type.watchdog_time_remaining
  :field amrad: alsat1n_payload.ssc_channel.payload_type.msg_type.amrad
  :field current_packet: alsat1n_payload.ssc_channel.payload_type.msg_type.current_packet
  :field block_id: alsat1n_payload.ssc_channel.payload_type.msg_type.block_id
  :field file_data: alsat1n_payload.ssc_channel.payload_type.msg_type.bin_file_data.file_data
  :field file_store: alsat1n_payload.ssc_channel.payload_type.msg_type.file_store
  :field file_type: alsat1n_payload.ssc_channel.payload_type.msg_type.file_type
  :field file_count: alsat1n_payload.ssc_channel.payload_type.msg_type.file_count
seq:
  - id: callsign
    type: strz
    encoding: ASCII
    size: 5
    -orig-id: Callsign
  - id: alsat1n_payload
    type:
      switch-on: callsign
      cases:
        '"AL1N"': alsat1n_payload_t
types:
  alsat1n_payload_t:
    doc-ref: 'https://amsat-uk.org/2016/09/24/alsat-1n-pratham-launch/'
    seq:
      - id: strx_header
        type: strx_header_t
      - id: ssc_header
        type: ssc_header_t
      - id: ssc_channel
        type: ssc_channel_t
  strx_header_t:
    seq:
      - id: strx_header_seq
        type: u1
        -orig-id: STRX Header - Sequence
      - id: strx_header_len
        type: u2
        -orig-id: STRX Header - Length
      - id: strx_header_id
        type: u2
        -orig-id: STRX Header - STCVR ID
  ssc_header_t:
    seq:
      - id: payload_id
        type: u1
        -orig-id: Payload ID
      - id: msg_id
        type: u1
      - id: response_code
        type: u1
        doc: 'Parse error free frames only! 0x12 == No Error'
  ssc_channel_t:
    seq:
      - id: payload_type
        type:
          switch-on: _parent.ssc_header.payload_id
          cases:
            5: obc
            19: file
            46: eps
  file:
    seq:
      - id: msg_type
        type:
          switch-on: _parent._parent.ssc_header.msg_id
          cases:
            21: download_data
            30: file_count
  eps:
    seq:
      - id: msg_type
        type:
          switch-on: _parent._parent.ssc_header.msg_id
          cases:
            63: eps_psu_current_5v
            65: eps_psu_current_3v3
            122: pdm_platform
            166: p8_psu
            161: p7_psu
            175: pdm_payload
            240: eps_sys
            244: eps_platform
  obc:
    seq:
      - id: msg_type
        type:
          switch-on: _parent._parent.ssc_header.msg_id
          cases:
            1: obc_health
            32: i2c_traffic
            127: watchdog_time_remaining
            176: amrad_msg
  p8_psu:
    seq:
      - id: p8_state
        type: u1
        -orig-id: P8_State
      - id: p8_current
        type: u2
        -orig-id: P8_Current
        doc: "value = p8_current / 1.5848 [mA]"
      - id: p8_voltage
        type: u2
        -orig-id: P8_Voltage
        doc: "value = 0.001953 * p8_voltage [mV]"
  p7_psu:
    seq:
      - id: p7_state
        type: u1
        -orig-id: P7_State
      - id: p7_current
        type: u2
        -orig-id: P7_Current
        doc: "value = p7_current / 1.5743 [mA]"
      - id: p7_voltage
        type: u2
        -orig-id: P7_Voltage
        doc: "value = 0.001895 * p8_voltage [mV]"
  eps_psu_current_5v:
    seq:
      - id: ipcm5v
        type: u2
        -orig-id: IPCM5V
        doc: "value = 0.005237 * ipcm5v [A]"
  eps_psu_current_3v3:
    seq:
      - id: ipcm3v3
        type: u2
        -orig-id: IPCM3V3
        doc: "value = 0.005237 * ipcm3v3 [A]"
  eps_sys:
    seq:
      - id: ipcmbatv
        type: u2
        doc: "value = ipcmbatv * 0.005237 [A]"
        -orig-id: IPCMBATV
      - id: vpcmbatv
        type: u2
        doc: "value = vpcmbatv * 0.0039931 [V]"
        -orig-id: VPCMBATV
      - id: eps_temperature
        type: u2
        doc: "value = (0.372434 * temperature) - 273.15 [C]"
        -orig-id: TLM_TBRD
  eps_platform:
    seq:
      - id: s1_state_3v3
        type: u1
        -orig-id: S1_State
      - id: s1_current_3v3
        type: u2
        doc: "s1_current_3v3 / 1.5702 [mA]"
        -orig-id: S1_Current
      - id: s1_voltage_3v3
        type: u2
        doc: "s1_voltage_3v3 * 0.0019 [mV]"
        -orig-id: S1_Voltage
      - id: s2_state_5v
        type: u1
        -orig-id: S2_State
      - id: s2_current_5v
        type: u2
        doc: "s2_current_5v / 1.581 [mA]"
        -orig-id: S2_Current
      - id: s2_voltage_5v
        type: u2
        doc: "s2_voltage_5v * 0.001901 [mV]"
        -orig-id: S2_Voltage
  pdm_payload:
    seq:
      - id: pdm_uptime_payload_h
        type: u4
        doc: "value = pdm_uptime_payload_h / 49 [Days]"
        -orig-id: PDM_UPTIME_Payload_H
      - id: pdm_uptime_payload_l
        type: u4
        doc: "value = pdm_uptime_payload_l * 2 / 1000 [s]"
        -orig-id: PDM_UPTIME_Payload_L
  pdm_platform:
    seq:
      - id: pdm_uptime_platform_h
        type: u4
        doc: "value = pdm_uptime_platform_h / 49 [Days]"
        -orig-id: PDM_UPTIME_Platform_H
      - id: pdm_uptime_platform_l
        type: u4
        doc: "value = pdm_uptime_platform_l * 2 / 1000 [s]"
        -orig-id: PDM_UPTIME_Platform_L
  obc_health:
    seq:
      - id: software_ident
        type: u1
        -orig-id: software_ident
      - id: uptime
        type: u4
        doc: 'uptime counter [s]'
        -orig-id: uptime
      - id: eps_voltage_battery
        type: u2
        -orig-id: eps_battery
      - id: eps_current_battery
        type: u2
        -orig-id: eps_current
      - id: safe_mode
        type: u1
        -orig-id: safe_mode
      - id: safe_reason
        type: u1
        -orig-id: safe_reason
      - id: unix_time
        type: u4
        doc: "Unix time in [s]"
        -orig-id: unixtime
      - id: reboot_num
        type: u1
        -orig-id: reboot_number
      - id: reboot_cause
        type: u1
        -orig-id: reboot_cause
  i2c_traffic:
    seq:
      - id: i2c_traffic_cnt
        type: u4
        -orig-id: i2c_traffic_counter
  watchdog_time_remaining:
    seq:
      - id: watchdog_time_remaining
        type: u4
        doc: "Time remaining on watchdog before it expires in [s]"
        -orig-id: watchdog_time_remaining
  amrad_msg:
    seq:
      - id: amrad
        type: str
        encoding: ASCII
        size: 40
        -orig-id: AMRAD_message
  download_data:
    seq:
      - id: current_packet
        type: u2
        -orig-id: current_packet
      - id: block_id
        type: u2
        -orig-id: block_id
      - id: bin_file_data
        process: satnogsdecoders.process.b85encode
        size-eos: true
        type: encoded_data_t
        -orig-id: file_data
  file_count:
    seq:
      - id: file_store
        type: u1
        -orig-id: file_store
      - id: file_type
        type: u1
        -orig-id: file_type
      - id: file_count
        type: u2
        -orig-id: filecount
  encoded_data_t:
    seq:
      - id: file_data
        type: str
        encoding: ASCII
        size-eos: true
