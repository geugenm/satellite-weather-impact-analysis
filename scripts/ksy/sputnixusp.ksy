---
meta:
  id: sputnixusp
  title: Sputnix Unified Protocol decoder
  endian: le

doc: |
  :field callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field ssid_mask: ax25_frame.ax25_header.dest_ssid_raw.ssid_mask
  :field ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field src_callsign_raw_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid_raw_ssid_mask: ax25_frame.ax25_header.src_ssid_raw.ssid_mask
  :field src_ssid_raw_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.ax25_header.pid
  :field packet_type: ax25_frame.payload.packet_type
  :field skip1: ax25_frame.payload.tlm.skip1
  :field skip2: ax25_frame.payload.tlm.skip2
  :field skip3: ax25_frame.payload.tlm.skip3
  :field usb1: ax25_frame.payload.tlm.usb1
  :field usb2: ax25_frame.payload.tlm.usb2
  :field usb3: ax25_frame.payload.tlm.usb3
  :field isb1: ax25_frame.payload.tlm.isb1
  :field isb2: ax25_frame.payload.tlm.isb2
  :field isb3: ax25_frame.payload.tlm.isb3
  :field iab: ax25_frame.payload.tlm.iab
  :field ich1: ax25_frame.payload.tlm.ich1
  :field ich2: ax25_frame.payload.tlm.ich2
  :field ich3: ax25_frame.payload.tlm.ich3
  :field ich4: ax25_frame.payload.tlm.ich4
  :field t1_pw: ax25_frame.payload.tlm.t1_pw
  :field t2_pw: ax25_frame.payload.tlm.t2_pw
  :field t3_pw: ax25_frame.payload.tlm.t3_pw
  :field t4_pw: ax25_frame.payload.tlm.t4_pw
  :field flags1: ax25_frame.payload.tlm.flags1
  :field flags2: ax25_frame.payload.tlm.flags2
  :field flags3: ax25_frame.payload.tlm.flags3
  :field reserved1: ax25_frame.payload.tlm.reserved1
  :field uab: ax25_frame.payload.tlm.uab
  :field reg_tel_id: ax25_frame.payload.tlm.reg_tel_id
  :field time: ax25_frame.payload.tlm.time
  :field nres_ps: ax25_frame.payload.tlm.nres_ps
  :field fl_ps: ax25_frame.payload.tlm.fl_ps
  :field t_amp: ax25_frame.payload.tlm.t_amp
  :field t_uhf: ax25_frame.payload.tlm.t_uhf
  :field rssi_rx: ax25_frame.payload.tlm.rssi_rx
  :field pf: ax25_frame.payload.tlm.pf
  :field pb: ax25_frame.payload.tlm.pb
  :field nres_uhf: ax25_frame.payload.tlm.nres_uhf
  :field fl_uhf: ax25_frame.payload.tlm.fl_uhf
  :field time_uhf: ax25_frame.payload.tlm.time_uhf
  :field uptime_uhf: ax25_frame.payload.tlm.uptime_uhf
  :field current_uhf: ax25_frame.payload.tlm.current_uhf
  :field uuhf: ax25_frame.payload.tlm.uuhf
  :field t_mb: ax25_frame.payload.tlm.t_mb
  :field mx: ax25_frame.payload.tlm.mx
  :field my: ax25_frame.payload.tlm.my
  :field mz: ax25_frame.payload.tlm.mz
  :field vx: ax25_frame.payload.tlm.vx
  :field vy: ax25_frame.payload.tlm.vy
  :field vz: ax25_frame.payload.tlm.vz
  :field nres_ext: ax25_frame.payload.tlm.nres_ext
  :field rcon: ax25_frame.payload.tlm.rcon
  :field fl_ext: ax25_frame.payload.tlm.fl_ext
  :field time_ext: ax25_frame.payload.tlm.time_ext
  :field fl_payload: ax25_frame.payload.tlm.fl_payload
  :field time_send: ax25_frame.payload.tlm.time_send
  :field t_plate: ax25_frame.payload.tlm.t_plate
  :field t_cpu: ax25_frame.payload.tlm.t_cpu
  :field cursens1: ax25_frame.payload.tlm.cursens1
  :field cursens2: ax25_frame.payload.tlm.cursens2
  :field nrst: ax25_frame.payload.tlm.nrst
  :field time_rst: ax25_frame.payload.tlm.time_rst
  :field ch1rate: ax25_frame.payload.tlm.ch1rate
  :field ch2rate: ax25_frame.payload.tlm.ch2rate
  :field ch3rate: ax25_frame.payload.tlm.ch3rate
  :field ch4rate: ax25_frame.payload.tlm.ch4rate
  :field ch5rate: ax25_frame.payload.tlm.ch5rate
  :field ch6rate: ax25_frame.payload.tlm.ch6rate
  :field ptrend1: ax25_frame.payload.tlm.ptrend1
  :field ptrctl1: ax25_frame.payload.tlm.ptrctl1
  :field ptrend2: ax25_frame.payload.tlm.ptrend2
  :field ptrctl2: ax25_frame.payload.tlm.ptrctl2
  :field ptrend3: ax25_frame.payload.tlm.ptrend3
  :field ptrctl3: ax25_frame.payload.tlm.ptrctl3
  :field lastevent_ch1_1: ax25_frame.payload.tlm.lastevent_ch1_1
  :field lastevent_ch1_2: ax25_frame.payload.tlm.lastevent_ch1_2
  :field lastevent_ch1_3: ax25_frame.payload.tlm.lastevent_ch1_3
  :field lastevent_ch2_1: ax25_frame.payload.tlm.lastevent_ch2_1
  :field lastevent_ch2_2: ax25_frame.payload.tlm.lastevent_ch2_2
  :field lastevent_ch2_3: ax25_frame.payload.tlm.lastevent_ch2_3

seq:
  - id: ax25_frame
    type: ax25_frame
    doc-ref: 'https://www.tapr.org/pdf/AX25.2.2.pdf'
types:
  ax25_frame:
    seq:
      - id: ax25_header
        type: ax25_header
      - id: payload
        type: beacon_tlm

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

  beacon_tlm:
    seq:
      - id: packet_type
        type: u2
      - id: tlm
        type:
          switch-on: packet_type
          cases:
            0x4216: general_tlm
            0x4217: extended_tlm

  general_tlm:
    seq:
      - id: skip1
        type: u2
      - id: skip2
        type: u2
      - id: skip3
        type: u2
      - id: usb1
        type: u2
        doc: |
          Voltage SB 1 (mV)
      - id: usb2
        type: u2
        doc: |
          Voltage SB 2 (mV)
      - id: usb3
        type: u2
        doc: |
          Voltage SB 3 (mV)
      - id: isb1
        type: u2
        doc: |
          SB1 current (mA)
      - id: isb2
        type: u2
        doc: |
          SB2 current (mA)
      - id: isb3
        type: u2
        doc: |
          SB3 current (mA)
      - id: iab
        type: u2
        doc: |
          Battery current (mA)
      - id: ich1
        type: u2
        doc: |
          Channel 1 current (mA)
      - id: ich2
        type: u2
        doc: |
          Channel 2 current (mA)
      - id: ich3
        type: u2
        doc: |
          Channel 3 current (mA)
      - id: ich4
        type: u2
        doc: |
          Channel 4 current (mA)
      - id: t1_pw
        type: u2
        doc: |
          Battery temperature 1 (degree C)
      - id: t2_pw
        type: u2
        doc: |
          Battery temperature 1 (degree C)
      - id: t3_pw
        type: u2
        doc: |
          Battery temperature 1 (degree C)
      - id: t4_pw
        type: u2
        doc: |
          Battery temperature 1 (degree C)
      - id: flags1
        type: u1
        doc: |
          uab_crit:
            Flag "The battery is discharged to a critical level"
          uab_min:
            Flag "The battery is discharged to a minimal level"
          heater2_manual:
            Heater manual control flag 2
          heater1_manual:
            Heater manual control flag 1
          heater2_on:
            Heater enable flag 2
          heater1_on:
            Heater enable flag 1
          tab_max:
            Maximum temperature exceeded flag
          tab_min:
            "Low battery temperature" flag
      - id: flags2
        type: u1
        doc: |
          channelon4:
            Channel 4 status flag
          channelon3:
            Channel 3 status flag
          channelon2:
            Channel 2 status flag
          channelon1:
            Channel 1 status flag
          ich_limit4:
            Excess current flag for channel 4
          ich_limit3:
            Excess current flag for channel 3
          ich_limit2:
            Excess current flag for channel 2
          ich_limit1:
            Excess current flag for channel 1
      - id: flags3
        type: u1
        doc: |
          0-6 bit - reserved:
          7 bit - charger:
            Flag of presence of voltage at the charging connector
      - id: reserved1
        type: u1
        doc: |
      - id: uab
        type: u2
        doc: |
          Battery voltage (mV)
      - id: reg_tel_id
        type: u4
        doc: |
          PS telemetry number
      - id: time
        type: u4
        doc: |
          time of last PS telemetry
      - id: nres_ps
        type: u1
        doc: |
          Number of PS reboots
      - id: fl_ps
        type: u1
        doc: |
          ps flags
      - id: t_amp
        type: u1
        doc: |
          UHF amplifier temperature (degree C)
      - id: t_uhf
        type: u1
        doc: |
          UHF temperature (degree C)
      - id: rssi_rx
        type: s2be
        doc: |
          RX rssi
      - id: pf
        type: u1
        doc: |
          Direct radiation power
      - id: pb
        type: u1
        doc: |
          Back radiation power
      - id: nres_uhf
        type: u1
        doc: |
          Number of UHF reboots
      - id: fl_uhf
        type: u1
        doc: |
          UHF flags
      - id: time_uhf
        type: u4
        doc: |
          Time of last UHF telemetry
      - id: uptime_uhf
        type: u4
        doc: |
          UHF Uptime in seconds
      - id: current_uhf
        type: u2
        doc: |
          UHF current consumption
      - id: uuhf
        type: u2
        doc: |
          UHF voltage (mV)

  extended_tlm:
    seq:
      - id: t_mb
        type: u2
        doc: |
          motherboard temperature (degree C)
      - id: mx
        type: u4
        doc: |
          Magnetic field vector along the X axis
      - id: my
        type: u4
        doc: |
          Magnetic field vector along the Y axis
      - id: mz
        type: u4
        doc: |
          Magnetic field vector along the Z axis
      - id: vx
        type: u4
        doc: |
          X-axis speed
      - id: vy
        type: u4
        doc: |
          Y-axis speed
      - id: vz
        type: u4
        doc: |
          Z-axis speed
      - id: nres_ext
        type: u1
        doc: |
          Number of reboots
      - id: rcon
        type: u1
        doc: |
          Reason for last reboot
      - id: fl_ext
        type: u1
        doc: |
          flags
      - id: time_ext
        type: u4
        doc: |
          Time of last telemetry
      - id: fl_payload
        type: u1
        doc: |
          Payload flags
      - id: time_send
        type: u4
        doc: |
          Time of last payload telemetry
      - id: t_plate
        type: u2
        doc: |
          Payload board temperature
      - id: t_cpu
        type: u2
        doc: |
          CPU temperature
      - id: cursens1
        type: u2
        doc: |
          Current sensor 1
      - id: cursens2
        type: u2
        doc: |
          Current sensor 2
      - id: nrst
        type: u1
        doc: |
          Number of reboots
      - id: time_rst
        type: u4
        doc: |
          Last reboot time
      - id: ch1rate
        type: u2
        doc: |
          Counting speed in channel 1
      - id: ch2rate
        type: u2
        doc: |
          Counting speed in channel 2
      - id: ch3rate
        type: u2
        doc: |
          Counting speed in channel 3
      - id: ch4rate
        type: u2
        doc: |
          Counting speed in channel 4
      - id: ch5rate
        type: u2
        doc: |
          Counting speed in channel 5
      - id: ch6rate
        type: u2
        doc: |
          Counting speed in channel 6
      - id: ptrend1
        type: u2
        doc: |
          Pointer to the last block transferred from segment 1
      - id: ptrctl1
        type: u2
        doc: |
          Write block pointer from segment 1
      - id: ptrend2
        type: u2
        doc: |
          Pointer to the last block transferred from segment 2
      - id: ptrctl2
        type: u2
        doc: |
          Write block pointer from segment 2
      - id: ptrend3
        type: u2
        doc: |
          Pointer to the last block transferred from segment 3
      - id: ptrctl3
        type: u2
        doc: |
          Write block pointer from segment 3
      - id: lastevent_ch1_1
        type: u1
        doc: |
          Latest event channel 1 M1L1
      - id: lastevent_ch1_2
        type: u1
        doc: |
          Latest event channel 1 L2H1
      - id: lastevent_ch1_3
        type: u1
        doc: |
          Latest event channel 1 H2M2
      - id: lastevent_ch2_1
        type: u1
        doc: |
          Latest event channel 2 M1L1
      - id: lastevent_ch2_2
        type: u1
        doc: |
          Latest event channel 2 L2H1
      - id: lastevent_ch2_3
        type: u1
        doc: |
          Latest event channel 2 H2M2

