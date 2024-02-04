---
meta:
  id: ksu
  title: KSU-CUBESAT Telemetry Decoder
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field rpt_callsign: ax25_frame.ax25_header.repeater.rpt_instance[0].rpt_callsign_raw.callsign_ror.callsign
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field beacon_type: ax25_frame.payload.ax25_info.beacon_type
  :field usb1: ax25_frame.payload.ax25_info.body.usb1
  :field usb2: ax25_frame.payload.ax25_info.body.usb2
  :field usb3: ax25_frame.payload.ax25_info.body.usb3
  :field isb1: ax25_frame.payload.ax25_info.body.isb1
  :field isb2: ax25_frame.payload.ax25_info.body.isb2
  :field isb3: ax25_frame.payload.ax25_info.body.isb3
  :field iab: ax25_frame.payload.ax25_info.body.iab
  :field ich1: ax25_frame.payload.ax25_info.body.ich1
  :field ich2: ax25_frame.payload.ax25_info.body.ich2
  :field ich3: ax25_frame.payload.ax25_info.body.ich3
  :field ich4: ax25_frame.payload.ax25_info.body.ich4
  :field t1_pw: ax25_frame.payload.ax25_info.body.t1_pw
  :field t2_pw: ax25_frame.payload.ax25_info.body.t2_pw
  :field t3_pw: ax25_frame.payload.ax25_info.body.t3_pw
  :field t4_pw: ax25_frame.payload.ax25_info.body.t4_pw
  :field uab_crit: ax25_frame.payload.ax25_info.body.uab_crit
  :field uab_min: ax25_frame.payload.ax25_info.body.uab_min
  :field heater2_manual: ax25_frame.payload.ax25_info.body.heater2_manual
  :field heater1_manual: ax25_frame.payload.ax25_info.body.heater1_manual
  :field heater2_on: ax25_frame.payload.ax25_info.body.heater2_on
  :field heater1_on: ax25_frame.payload.ax25_info.body.heater1_on
  :field tab_max: ax25_frame.payload.ax25_info.body.tab_max
  :field tab_min: ax25_frame.payload.ax25_info.body.tab_min
  :field channelon4: ax25_frame.payload.ax25_info.body.channelon4
  :field channelon3: ax25_frame.payload.ax25_info.body.channelon3
  :field channelon2: ax25_frame.payload.ax25_info.body.channelon2
  :field channelon1: ax25_frame.payload.ax25_info.body.channelon1
  :field ich_limit4: ax25_frame.payload.ax25_info.body.ich_limit4
  :field ich_limit3: ax25_frame.payload.ax25_info.body.ich_limit3
  :field ich_limit2: ax25_frame.payload.ax25_info.body.ich_limit2
  :field ich_limit1: ax25_frame.payload.ax25_info.body.ich_limit1
  :field reserved0: ax25_frame.payload.ax25_info.body.reserved0
  :field charger: ax25_frame.payload.ax25_info.body.charger
  :field reserved1: ax25_frame.payload.ax25_info.body.reserved1
  :field uab: ax25_frame.payload.ax25_info.body.uab
  :field reg_tel_id: ax25_frame.payload.ax25_info.body.reg_tel_id
  :field pss_time: ax25_frame.payload.ax25_info.body.pss_time
  :field pss_nres: ax25_frame.payload.ax25_info.body.pss_nres
  :field psdd_fl: ax25_frame.payload.ax25_info.body.psdd_fl
  :field t_amp: ax25_frame.payload.ax25_info.body.t_amp
  :field t_uhf: ax25_frame.payload.ax25_info.body.t_uhf
  :field rssirx: ax25_frame.payload.ax25_info.body.rssirx
  :field rssiidle: ax25_frame.payload.ax25_info.body.rssiidle
  :field pf: ax25_frame.payload.ax25_info.body.pf
  :field pb: ax25_frame.payload.ax25_info.body.pb
  :field uhf_nres: ax25_frame.payload.ax25_info.body.uhf_nres
  :field uhf_fl: ax25_frame.payload.ax25_info.body.uhf_fl
  :field uhf_time: ax25_frame.payload.ax25_info.body.uhf_time
  :field uptime: ax25_frame.payload.ax25_info.body.uptime
  :field current: ax25_frame.payload.ax25_info.body.current
  :field uuhf: ax25_frame.payload.ax25_info.body.uuhf
  :field t_mb: ax25_frame.payload.ax25_info.body.t_mb
  :field mx: ax25_frame.payload.ax25_info.body.mx
  :field my: ax25_frame.payload.ax25_info.body.my
  :field mz: ax25_frame.payload.ax25_info.body.mz
  :field vx: ax25_frame.payload.ax25_info.body.vx
  :field vy: ax25_frame.payload.ax25_info.body.vy
  :field vz: ax25_frame.payload.ax25_info.body.vz
  :field nres: ax25_frame.payload.ax25_info.body.nres
  :field rcon: ax25_frame.payload.ax25_info.body.rcon
  :field fl: ax25_frame.payload.ax25_info.body.fl
  :field time: ax25_frame.payload.ax25_info.body.time
  :field payload_flags: ax25_frame.payload.ax25_info.body.payload_flags
  :field timesend: ax25_frame.payload.ax25_info.body.timesend
  :field t_plate: ax25_frame.payload.ax25_info.body.t_plate
  :field t_cpu: ax25_frame.payload.ax25_info.body.t_cpu
  :field cursens1: ax25_frame.payload.ax25_info.body.cursens1
  :field cursens2: ax25_frame.payload.ax25_info.body.cursens2
  :field nrst: ax25_frame.payload.ax25_info.body.nrst
  :field timerst: ax25_frame.payload.ax25_info.body.timerst
  :field ch1rate: ax25_frame.payload.ax25_info.body.ch1rate
  :field ch2rate: ax25_frame.payload.ax25_info.body.ch2rate
  :field ch3rate: ax25_frame.payload.ax25_info.body.ch3rate
  :field ch4rate: ax25_frame.payload.ax25_info.body.ch4rate
  :field ch5rate: ax25_frame.payload.ax25_info.body.ch5rate
  :field ch6rate: ax25_frame.payload.ax25_info.body.ch6rate
  :field ptrend1: ax25_frame.payload.ax25_info.body.ptrend1
  :field ptrcrt1: ax25_frame.payload.ax25_info.body.ptrcrt1
  :field ptrend2: ax25_frame.payload.ax25_info.body.ptrend2
  :field ptrcrt2: ax25_frame.payload.ax25_info.body.ptrcrt2
  :field ptrend3: ax25_frame.payload.ax25_info.body.ptrend3
  :field ptrcrt3: ax25_frame.payload.ax25_info.body.ptrcrt3
  :field lastevent_ch1_1: ax25_frame.payload.ax25_info.body.lastevent_ch1_1
  :field lastevent_ch1_2: ax25_frame.payload.ax25_info.body.lastevent_ch1_2
  :field lastevent_ch1_3: ax25_frame.payload.ax25_info.body.lastevent_ch1_3
  :field lastevent_ch2_1: ax25_frame.payload.ax25_info.body.lastevent_ch2_1
  :field lastevent_ch2_2: ax25_frame.payload.ax25_info.body.lastevent_ch2_2
  :field lastevent_ch2_3: ax25_frame.payload.ax25_info.body.lastevent_ch2_3

  Attention: `rpt_callsign` cannot be accessed because `rpt_instance` is an
  array of unknown size at the beginning of the parsing process! Left an
  example in here.

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
        type: tlm
        size-eos: true
  ui_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type: tlm
        size-eos: true
  tlm:
    seq:
      - id: beacon_type
        type: u1
      - id: unknown1
        size: 7
      - id: body
        type:
          switch-on: beacon_type
          cases:
            22: beacon
            23: extendedbeacon
  beacon:
    seq:
      - id: usb1
        type: u2
        doc: "Solar Panel 1 Voltage(mV)"
      - id: usb2
        type: u2
        doc: "Solar Panel 2 Voltage(mV)"
      - id: usb3
        type: u2
        doc: "Solar Panel 3 Voltage(mV)"
      - id: isb1
        type: u2
        doc: "Solar Panel 1 Current(mA)"
      - id: isb2
        type: u2
        doc: "Solar Panel 2 Current(mA)"
      - id: isb3
        type: u2
        doc: "Solar Panel 3 Current(mA)"
      - id: iab
        type: s2
        doc: "Battery Current(mA)"
      - id: ich1
        type: u2
        doc: "Channel 1 Current(mA)"
      - id: ich2
        type: u2
        doc: "Channel 2 Current(mA)"
      - id: ich3
        type: u2
        doc: "Channel 3 Current(mA)"
      - id: ich4
        type: u2
        doc: "Channel 4 Current(mA)"
      - id: t1_pw
        type: s2
        doc: "Battery temperature 1(deg. С)"
      - id: t2_pw
        type: s2
        doc: "Battery temperature 2(deg. С)"
      - id: t3_pw
        type: s2
        doc: "Battery temperature 3(deg. С)"
      - id: t4_pw
        type: s2
        doc: "Battery temperature 4(deg. С)"
      - id: uab_crit
        type: b1
        doc: "Flag: Critical battery voltage"
      - id: uab_min
        type: b1
        doc: "Flag: Minimal battery voltage"
      - id: heater2_manual
        type: b1
        doc: "Flag: Heater 2 manual control"
      - id: heater1_manual
        type: b1
        doc: "Flag: Heater 1 manual control"
      - id: heater2_on
        type: b1
        doc: "Flag: Heater 2 is on"
      - id: heater1_on
        type: b1
        doc: "Flag: Heater 1 is on"
      - id: tab_max
        type: b1
        doc: "Flag: Battery overtemperature"
      - id: tab_min
        type: b1
        doc: "Flag: Battery undertemperature"
      - id: channelon4
        type: b1
        doc: "Flag: Channel 4 is on"
      - id: channelon3
        type: b1
        doc: "Flag: Channel 3 is on"
      - id: channelon2
        type: b1
        doc: "Flag: Channel 2 is on"
      - id: channelon1
        type: b1
        doc: "Flag: Channel 1 is on"
      - id: ich_limit4
        type: b1
        doc: "Flag: Channel 4 current limit"
      - id: ich_limit3
        type: b1
        doc: "Flag: Channel 3 current limit"
      - id: ich_limit2
        type: b1
        doc: "Flag: Channel 2 current limit"
      - id: ich_limit1
        type: b1
        doc: "Flag: Channel 1 current limit"
      - id: reserved0
        type: b7
        doc: "Reserved"
      - id: charger
        type: b1
        doc: "Flag: Charging voltage"
      - id: reserved1
        type: u1
        doc: "Reserved"
      - id: uab
        type: s2
        doc: "Battery voltage(mV)"
      - id: reg_tel_id
        type: u4
        doc: "PSS telemetry number"
      - id: pss_time
        type: s4
        doc: "PSS last telemetry timestamp"
      - id: pss_nres
        type: u1
        doc: "PSS reset counter"
      - id: psdd_fl
        type: u1
        doc: "PS flags"
      - id: t_amp
        type: s1
        doc: "UHF amp temperatur(deg. С)"
      - id: t_uhf
        type: s1
        doc: "UHF temperature(deg. С)"
      - id: rssirx
        type: u1
        doc: "RX RSSI"
      - id: rssiidle
        type: u1
        doc: "idle RSSI"
      - id: pf
        type: s1
        doc: "Forward wave power(dBm)"
      - id: pb
        type: s1
        doc: "Reflected wave power(dBm)"
      - id: uhf_nres
        type: u1
        doc: "UHF reset counter"
      - id: uhf_fl
        type: u1
        doc: "UHF flags"
      - id: uhf_time
        type: s4
        doc: "UHF telemetry timestamp"
      - id: uptime
        type: u4
        doc: "Uptime(sec)"
      - id: current
        type: u2
        doc: "UHF consumption current"
      - id: uuhf
        type: s2
        doc: "UHF voltage(mV)"
  extendedbeacon:
    seq:
      - id: t_mb
        type: s2
        doc: "Carrier board temperature (deg. С)"
      - id: mx
        type: f4
        doc: "Magnetic field X(nanotesla)"
      - id: my
        type: f4
        doc: "Magnetic field Y(nanotesla)"
      - id: mz
        type: f4
        doc: "Magnetic field Z(nanotesla)"
      - id: vx
        type: f4
        doc: "Angular velocity X(dps)"
      - id: vy
        type: f4
        doc: "Angular velocity Y(dps)"
      - id: vz
        type: f4
        doc: "Angular velocity Z(dps)"
      - id: nres
        type: u1
        doc: "Reset counter"
      - id: rcon
        type: u1
        doc: "Last reset reason"
      - id: fl
        type: u1
        doc: "Flags"
      - id: time
        type: s4
        doc: "Last telemetry timestamp"
      - id: payload_flags
        type: u1
        doc: "Payload flags"
      - id: timesend
        type: s4
        doc: "Last payload telemetry timestamp"
      - id: t_plate
        type: s2
        doc: "Payload board temperature"
      - id: t_cpu
        type: s2
        doc: "Payload MPU temperature"
      - id: cursens1
        type: u2
        doc: "Payload current sensor 1"
      - id: cursens2
        type: u2
        doc: "Payload current sensor 2"
      - id: nrst
        type: u1
        doc: "Payload reset counter"
      - id: timerst
        type: s4
        doc: "Payload last reset timestamp"
      - id: ch1rate
        type: u2
        doc: "Channel 1 count rate"
      - id: ch2rate
        type: u2
        doc: "Channel 2 count rate"
      - id: ch3rate
        type: u2
        doc: "Channel 3 count rate"
      - id: ch4rate
        type: u2
        doc: "Channel 4 count rate"
      - id: ch5rate
        type: u2
        doc: "Channel 5 count rate"
      - id: ch6rate
        type: u2
        doc: "Channel 6 count rate"
      - id: ptrend1
        type: u2
        doc: "Last transmitted buffer from segment 1 pointer"
      - id: ptrcrt1
        type: u2
        doc: "Write pointer from segment 1"
      - id: ptrend2
        type: u2
        doc: "Last transmitted buffer from segment 2 pointer"
      - id: ptrcrt2
        type: u2
        doc: "Write pointer from segment 2"
      - id: ptrend3
        type: u2
        doc: "Last transmitted buffer from segment 3 pointer"
      - id: ptrcrt3
        type: u2
        doc: "Write pointer from segment 3"
      - id: lastevent_ch1_1
        type: u1
        doc: "Last event channel 1 M1L1."
      - id: lastevent_ch1_2
        type: u1
        doc: "Last event channel 1 L2H1."
      - id: lastevent_ch1_3
        type: u1
        doc: "Last event channel 1 H2M2."
      - id: lastevent_ch2_1
        type: u1
        doc: "Last event channel 2 M1L1."
      - id: lastevent_ch2_2
        type: u1
        doc: "Last event channel 2 L2H1."
      - id: lastevent_ch2_3
        type: u1
        doc: "Last event channel 2 H2M2."
