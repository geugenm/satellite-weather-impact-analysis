---
meta:
  id: diy1
  endian: be
doc: |
  :field timestamp: diy1_frame.timestamp
  :field nn1: diy1_frame.nn1
  :field nn2: diy1_frame.nn2
  :field nn3: diy1_frame.nn3
  :field nn4: diy1_frame.nn4
  :field nn5: diy1_frame.nn5
  :field nn6: diy1_frame.nn6
  :field nn7: diy1_frame.nn7
  :field nn8: diy1_frame.nn8
  :field nn9: diy1_frame.nn9
  :field ssb: diy1_frame.ssb

seq:
  - id: diy1_frame
    type: diy1_frame_t
types:
  diy1_frame_t:
    meta:
      encoding: ASCII
    seq:
      - id: control
        size: 5
        doc: 'control bytes to skip'
      - id: sentence_init
        type: str
        size: 1
        valid: '"$"'
        doc: 'sentence initiated'
      - id: ts_hh_str
        type: str
        size: 2
      - id: ts_mm_str
        type: str
        size: 2
      - id: ts_ss_str
        type: str
        terminator: 0x2c
      - id: nn1_str
        type: str
        terminator: 0x2c
      - id: nn2_str
        type: str
        terminator: 0x2c
      - id: nn3_str
        type: str
        terminator: 0x2c
      - id: nn4_str
        type: str
        terminator: 0x2c
      - id: nn5_str
        type: str
        terminator: 0x2c
      - id: nn6_str
        type: str
        terminator: 0x2c
      - id: nn7_str
        type: str
        terminator: 0x2c
      - id: nn8_str
        type: str
        terminator: 0x2c
      - id: nn9_str
        type: str
        terminator: 0x2c
      - id: ssb_raw
        size: 2
      - id: sentence_end
        type: str
        size: 1
        valid: '"*"'
        doc: 'sentence end'
    instances:
      timestamp:
        value: |
          (ts_hh_str.to_i * 60 * 60) +
          (ts_mm_str.to_i * 60) +
          ts_ss_str.to_i
        doc: 'time since last reset (DL4PD: in [s])'
      nn1:
        value: nn1_str.to_i
        doc: 'solar charger current [mA]'
      nn2:
        value: nn2_str.to_i
        doc: 'logic current [mA]'
      nn3:
        value: nn3_str.to_i
        doc: 'transceiver current in RX mode [mA]'
      nn4:
        value: nn4_str.to_i
        doc: 'transceiver current in TX mode [mA]'
      nn5:
        value: nn5_str.to_i
        doc: 'battery voltage [cV]'
      nn6:
        value: nn6_str.to_i
        doc: 'RSSI value [dBm]'
      nn7:
        value: nn7_str.to_i
        doc: 'OBC temperature [cdegC]'
      nn8:
        value: nn8_str.to_i
        doc: 'temperature of transceiver PA [cdegC]'
      nn9:
        value: nn9_str.to_i
        doc: 'resets numbers'
      ssb:
        value: |
          (ssb_raw[0] - 0x30) * 16 +
          (ssb_raw[1] - 0x30)
        doc: |
          status bits hex numbers
          bit state                          state
          0     1    = PA Mediam Power         0    = PA High Power (bit 5 = 0) OPERATIVE MODE
          1     1    = ROBOT logger full       0    = logger ROBOT free
          2     1    = ROBOT CALLSIGN change   0    = Robot CALLSIGN not change
          3     1    = ROBOT OP ON             0    = ROBOT OP OFF
          4     1    = logger full             0    = logger empty
          5     1    = PA Low Power            0    = disable  (bit 1 = 0) RECOVERY MODE
          6     1    = RTC setted              0    = RTC no setted
          7     1    = command received        0    = command not received
