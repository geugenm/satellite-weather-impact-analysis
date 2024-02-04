---
meta:
  id: us6
  title: Unisat-6 Telemetry Decoder
  file-extension: us6
  endian: le
doc-ref: 'https://www.gaussteam.com/radio-amateur-information-for-unisat-6/'
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field packetindex: ax25_frame.payload.ax25_info.packetindex
  :field groundindexack: ax25_frame.payload.ax25_info.groundindexack
  :field payloadsize: ax25_frame.payload.ax25_info.payloadsize
  :field rebootcounter: ax25_frame.payload.ax25_info.rebootcounter
  :field uptime: ax25_frame.payload.ax25_info.uptime
  :field unixtime: ax25_frame.payload.ax25_info.unixtime
  :field tempmcu: ax25_frame.payload.ax25_info.tempmcu
  :field tempfpga: ax25_frame.payload.ax25_info.tempfpga
  :field magnetometerx: ax25_frame.payload.ax25_info.magnetometerx
  :field magnetometery: ax25_frame.payload.ax25_info.magnetometery
  :field magnetometerz: ax25_frame.payload.ax25_info.magnetometerz
  :field gyroscopex: ax25_frame.payload.ax25_info.gyroscopex
  :field gyroscopey: ax25_frame.payload.ax25_info.gyroscopey
  :field gyroscopez: ax25_frame.payload.ax25_info.gyroscopez
  :field cpucurrent: ax25_frame.payload.ax25_info.cpucurrent
  :field tempradio: ax25_frame.payload.ax25_info.tempradio
  :field payloadreserved1: ax25_frame.payload.ax25_info.payloadreserved1
  :field payloadreserved2: ax25_frame.payload.ax25_info.payloadreserved2
  :field tempbottom: ax25_frame.payload.ax25_info.tempbottom
  :field tempupper: ax25_frame.payload.ax25_info.tempupper
  :field payloadreserved3: ax25_frame.payload.ax25_info.payloadreserved3
  :field epsvbat: ax25_frame.payload.ax25_info.epsvbat
  :field epscurrent_sun: ax25_frame.payload.ax25_info.epscurrent_sun
  :field epscurrent_out: ax25_frame.payload.ax25_info.epscurrent_out
  :field epsvpanel01: ax25_frame.payload.ax25_info.epsvpanel01
  :field epsvpanel02: ax25_frame.payload.ax25_info.epsvpanel02
  :field epsvpanel03: ax25_frame.payload.ax25_info.epsvpanel03
  :field epscurrent01: ax25_frame.payload.ax25_info.epscurrent01
  :field epscurrent02: ax25_frame.payload.ax25_info.epscurrent02
  :field epscurrent03: ax25_frame.payload.ax25_info.epscurrent03
  :field epsbatttemp: ax25_frame.payload.ax25_info.epsbatttemp
  :field payloadreserved4: ax25_frame.payload.ax25_info.payloadreserved4
  :field saterrorflags: ax25_frame.payload.ax25_info.saterrorflags
  :field satoperationstatus: ax25_frame.payload.ax25_info.satoperationstatus
  :field crc: ax25_frame.payload.ax25_info.crc

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
        type: us6_frame

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

  ssid_mask:
    seq:
      - id: ssid_mask
        type: u1
    instances:
      ssid:
        value: (ssid_mask & 0x0f) >> 1

  us6_frame:
    seq:
      - id: pid
        type: u1
      - id: ax25_info
        type: frame

  frame:
    seq:
      - id: syncpacket
        size: 3
        contents: [0x55, 0x53, 0x36]
      - id: packetindex
        type: u2
      - id: groundindexack
        type: u2
      - id: packettype
        size: 1
        contents: [0x01]
      - id: payloadsize
        type: u1
      - id: rebootcounter
        type: u2
      - id: uptime
        type: u4
      - id: unixtime
        type: u4
      - id: tempmcu
        type: s1
      - id: tempfpga
        type: s1
      - id: magnetometerx
        type: s2
      - id: magnetometery
        type: s2
      - id: magnetometerz
        type: s2
      - id: gyroscopex
        type: s2
      - id: gyroscopey
        type: s2
      - id: gyroscopez
        type: s2
      - id: cpucurrent
        type: u2
      - id: tempradio
        type: s1
      - id: payloadreserved1
        type: u1
      - id: payloadreserved2
        type: u1
      - id: tempbottom
        type: u1
      - id: tempupper
        type: u1
      - id: payloadreserved3
        type: u1
      - id: epsvbat
        type: u2
      - id: epscurrent_sun
        type: u2
      - id: epscurrent_out
        type: u2
      - id: epsvpanel01
        type: u2
      - id: epsvpanel02
        type: u2
      - id: epsvpanel03
        type: u2
      - id: epscurrent01
        type: u2
      - id: epscurrent02
        type: u2
      - id: epscurrent03
        type: u2
      - id: epsbatttemp
        type: u2
      - id: payloadreserved4
        type: u1
      - id: saterrorflags
        type: u2
      - id: satoperationstatus
        type: u1
      - id: crc
        type: u1
