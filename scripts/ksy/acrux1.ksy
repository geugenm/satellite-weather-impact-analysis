---
meta:
  id: acrux1
  endian: le
doc: |
  :field dest_callsign: ax25_frame.ax25_header.dest_callsign_raw.callsign_ror.callsign
  :field src_callsign: ax25_frame.ax25_header.src_callsign_raw.callsign_ror.callsign
  :field src_ssid: ax25_frame.ax25_header.src_ssid_raw.ssid
  :field dest_ssid: ax25_frame.ax25_header.dest_ssid_raw.ssid
  :field ctl: ax25_frame.ax25_header.ctl
  :field pid: ax25_frame.payload.pid
  :field tx_count: ax25_frame.payload.msp_payload.tx_count
  :field rx_count: ax25_frame.payload.msp_payload.rx_count
  :field rx_valid: ax25_frame.payload.msp_payload.rx_valid
  :field payload_type: ax25_frame.payload.msp_payload.payload_type
  :field comouti1: ax25_frame.payload.msp_payload.comouti1
  :field comoutv1: ax25_frame.payload.msp_payload.comoutv1
  :field comouti2: ax25_frame.payload.msp_payload.comouti2
  :field comoutv2: ax25_frame.payload.msp_payload.comoutv2
  :field comt2: ax25_frame.payload.msp_payload.comt2
  :field epsadcbatv1: ax25_frame.payload.msp_payload.epsadcbatv1
  :field epsloadi1: ax25_frame.payload.msp_payload.epsloadi1
  :field epsadcbatv2: ax25_frame.payload.msp_payload.epsadcbatv2
  :field epsboostini2: ax25_frame.payload.msp_payload.epsboostini2
  :field epsrail1: ax25_frame.payload.msp_payload.epsrail1
  :field epsrail2: ax25_frame.payload.msp_payload.epsrail2
  :field epstoppanelv: ax25_frame.payload.msp_payload.epstoppanelv
  :field epstoppaneli: ax25_frame.payload.msp_payload.epstoppaneli
  :field epst1: ax25_frame.payload.msp_payload.epst1
  :field epst2: ax25_frame.payload.msp_payload.epst2
  :field xposv: ax25_frame.payload.msp_payload.xposv
  :field xposi: ax25_frame.payload.msp_payload.xposi
  :field xpost1: ax25_frame.payload.msp_payload.xpost1
  :field yposv: ax25_frame.payload.msp_payload.yposv
  :field yposi: ax25_frame.payload.msp_payload.yposi
  :field ypost1: ax25_frame.payload.msp_payload.ypost1
  :field xnegv: ax25_frame.payload.msp_payload.xnegv
  :field xnegi: ax25_frame.payload.msp_payload.xnegi
  :field xnegt1: ax25_frame.payload.msp_payload.xnegt1
  :field ynegv: ax25_frame.payload.msp_payload.ynegv
  :field ynegi: ax25_frame.payload.msp_payload.ynegi
  :field ynegt1: ax25_frame.payload.msp_payload.ynegt1
  :field znegv: ax25_frame.payload.msp_payload.znegv
  :field znegi: ax25_frame.payload.msp_payload.znegi
  :field znegt1: ax25_frame.payload.msp_payload.znegt1
  :field zpost: ax25_frame.payload.msp_payload.zpost
  :field cdhtime: ax25_frame.payload.msp_payload.cdhtime
  :field swcdhlastreboot: ax25_frame.payload.msp_payload.swcdhlastreboot
  :field swsequence: ax25_frame.payload.msp_payload.swsequence
  :field outreachmessage: ax25_frame.payload.msp_payload.outreachmessage

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
      - id: msp_payload
        type: msp_payload_t
      - id: zero_padding
        size: 91
      - id: fec8_rs_checksum
        size: 32

  msp_payload_t:
    seq:
      - id: tx_count
        type: u1
      - id: rx_count
        type: u1
      - id: rx_valid
        type: u1
      - id: payload_type
        type: u1
      - id: comouti1
        type: s2
      - id: comoutv1
        type: s2
      - id: comouti2
        type: s2
      - id: comoutv2
        type: s2
      - id: comt2
        type: s2
      - id: epsadcbatv1
        type: s2
      - id: epsloadi1
        type: s2
      - id: epsadcbatv2
        type: s2
      - id: epsboostini2
        type: s2
      - id: epsrail1
        type: s2
      - id: epsrail2
        type: s2
      - id: epstoppanelv
        type: s2
      - id: epstoppaneli
        type: s2
      - id: epst1
        type: s2
      - id: epst2
        type: s2
      - id: xposv
        type: s2
      - id: xposi
        type: s2
      - id: xpost1
        type: s2
      - id: yposv
        type: s2
      - id: yposi
        type: s2
      - id: ypost1
        type: s2
      - id: xnegv
        type: s2
      - id: xnegi
        type: s2
      - id: xnegt1
        type: s2
      - id: ynegv
        type: s2
      - id: ynegi
        type: s2
      - id: ynegt1
        type: s2
      - id: znegv
        type: s2
      - id: znegi
        type: s2
      - id: znegt1
        type: s2
      - id: zpost
        type: s2
      - id: cdhtime
        type: u8
      - id: swcdhlastreboot
        type: u8
      - id: swsequence
        type: u2
      - id: outreachmessage
        type: str
        encoding: ASCII
        size: 48
