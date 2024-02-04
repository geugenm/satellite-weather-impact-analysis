---
meta:
  id: eshail2
  title: Es'Hail2 (QO-100) decoder struct
  endian: be
doc-ref: 'https://amsat-dl.org/wp-content/uploads/2019/01/tlmspec.pdf'
doc: |
  :field ao40_beacon_type: ao40_frame.ao40_coding.ao40_beacon_type
  :field ao40_message_line1: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line1
  :field ao40_message_line2: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line2
  :field ao40_message_line3: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line3
  :field ao40_message_line4: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line4
  :field ao40_message_line5: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line5
  :field ao40_message_line6: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line6
  :field ao40_message_line7: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line7
  :field ao40_message_line8: ao40_frame.ao40_coding.ao40_beacon_data.ao40_message_line8
  :field uptime: ao40_frame.ao40_coding.ao40_beacon_data.uptime
  :field commands: ao40_frame.ao40_coding.ao40_beacon_data.commands
  :field leila_req: ao40_frame.ao40_coding.ao40_beacon_data.leila_req
  :field leila_act: ao40_frame.ao40_coding.ao40_beacon_data.leila_act
  :field temperature: ao40_frame.ao40_coding.ao40_beacon_data.temperature
  :field volt_1: ao40_frame.ao40_coding.ao40_beacon_data.volt_1
  :field volt_2: ao40_frame.ao40_coding.ao40_beacon_data.volt_2
  :field volt_3: ao40_frame.ao40_coding.ao40_beacon_data.volt_3
  :field volt_4: ao40_frame.ao40_coding.ao40_beacon_data.volt_4
  :field volt_5: ao40_frame.ao40_coding.ao40_beacon_data.volt_5
  :field volt_6: ao40_frame.ao40_coding.ao40_beacon_data.volt_6
  :field volt_7: ao40_frame.ao40_coding.ao40_beacon_data.volt_7
  :field volt_8: ao40_frame.ao40_coding.ao40_beacon_data.volt_8
  :field volt_9: ao40_frame.ao40_coding.ao40_beacon_data.volt_9

seq:
  - id: ao40_frame
    type: ao40_frame

types:
  ao40_frame:
    seq:
      - id: ao40_coding
        type:
          switch-on: _root.frame_length
          cases:
            256: ao40_frame_fec
            514: ao40_frame_uncoded
  ao40_frame_fec:
    seq:
      - id: ao40_beacon_data
        type:
          switch-on: ao40_beacon_type
          cases:
            0x41: ao40_fec_message_spare
            0x44: ao40_fec_message_spare
            0x45: ao40_fec_message_spare
            0x4b: ao40_fec_message_k
            0x4c: ao40_fec_message_l
            0x4d: ao40_fec_message_spare
            0x4e: ao40_fec_message_spare
            0x58: ao40_fec_message_spare
            _: ao40_fec_command_response
    instances:
      ao40_beacon_type:
        pos: 0x0
        type: u1
  ao40_frame_uncoded:
    seq:
      - id: ao40_beacon_data
        type:
          switch-on: ao40_beacon_type
          cases:
            0x41: ao40_message_spare
            0x44: ao40_message_spare
            0x45: ao40_message_spare
            0x4b: ao40_message_k
            0x4c: ao40_message_l
            0x4d: ao40_message_spare
            0x4e: ao40_message_spare
            0x58: ao40_message_spare
            _: ao40_command_response
      - id: crc
        type: u2
    instances:
      ao40_beacon_type:
        pos: 0x0
        type: u1
  ao40_fec_message_k:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
    instances:
      uptime_dd_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 71
      uptime_hh_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 75
      uptime_mm_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 79
      commands_str:
        type: u1
        repeat: expr
        repeat-expr: 4
        pos: 90
      leila_request_str:
        type: u1
        pos: 110
      leila_active_str:
        type: u1
        pos: 127
      temp_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 134
      volts_str_1:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 150
      volts_str_2:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 154
      volts_str_3:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 158
      volts_str_4:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 162
      volts_str_5:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 166
      volts_str_6:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 170
      volts_str_7:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 174
      volts_str_8:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 178
      volts_str_9:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 182
      tfl_str:
        type: u1
        pos: 201
      tfe_str:
        type: u1
        pos: 212
      tfh_str:
        type: u1
        pos: 222
      hff_str:
        type: u1
        pos: 234
      hth_str:
        type: u1
        pos: 245
      hr_str:
        type: u1
        pos: 255
      uptime:
        value: >-
          (
            (
              (uptime_dd_str[0] > 0x2f ? 1 : 0) * (uptime_dd_str[0] - 0x30) * 10 +
              (uptime_dd_str[1] - 0x30)
            ) * 24 * 60 * 60 +
            (
              (uptime_hh_str[0] > 0x2f ? 1 : 0) * (uptime_hh_str[0] - 0x30) * 10 +
              (uptime_hh_str[1] - 0x30)
            ) * 60 * 60 +
            (
              (uptime_mm_str[0] > 0x2f ? 1 : 0) * (uptime_mm_str[0] - 0x30) * 10 +
              (uptime_mm_str[1] - 0x30)
            ) * 60
          )
      commands:
        value: >-
          (
            (
              (commands_str[0] > 0x2f ? 1 : 0) * (commands_str[0] - 0x30) * 1000 +
              (commands_str[1] > 0x2f ? 1 : 0) * (commands_str[1] - 0x30) * 100 +
              (commands_str[2] > 0x2f ? 1 : 0) * (commands_str[2] - 0x30) * 10 +
              (commands_str[3] - 0x30)
            )
          )
      leila_req:
        value: leila_request_str > 0x30
      leila_act:
        value: leila_active_str > 0x30
      temperature:
        value: >-
          (
            (
              (temp_str[0] > 0x2f ? 1 : 0) * (temp_str[0] - 0x30) * 10 +
              (temp_str[1] - 0x30)
            )
          )
      volt_1:
        value: >-
          (
            (
              (volts_str_1[0] - 0x30) * 1.0 +
              (volts_str_1[2] - 0x30) / 10.0
            )
          )
      volt_2:
        value: >-
          (
            (
              (volts_str_2[0] - 0x30) * 1.0 +
              (volts_str_2[2] - 0x30) / 10.0
            )
          )
      volt_3:
        value: >-
          (
            (
              (volts_str_3[0] - 0x30) * 1.0 +
              (volts_str_3[2] - 0x30) / 10.0
            )
          )
      volt_4:
        value: >-
          (
            (
              (volts_str_4[0] - 0x30) * 1.0 +
              (volts_str_4[2] - 0x30) / 10.0
            )
          )
      volt_5:
        value: >-
          (
            (
              (volts_str_5[0] - 0x30) * 1.0 +
              (volts_str_5[2] - 0x30) / 10.0
            )
          )
      volt_6:
        value: >-
          (
            (
              (volts_str_6[0] - 0x30) * 1.0 +
              (volts_str_6[2] - 0x30) / 10.0
            )
          )
      volt_7:
        value: >-
          (
            (
              (volts_str_7[0] - 0x30) * 1.0 +
              (volts_str_7[2] - 0x30) / 10.0
            )
          )
      volt_8:
        value: >-
          (
            (
              (volts_str_8[0] - 0x30) * 1.0 +
              (volts_str_8[2] - 0x30) / 10.0
            )
          )
      volt_9:
        value: >-
          (
            (
              (volts_str_9[0] - 0x30) * 1.0 +
              (volts_str_9[2] - 0x30) / 10.0
            )
          )
  ao40_message_k:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line5
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line6
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line7
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line8
        type: str
        encoding: ASCII
        size: 64
    instances:
      uptime_dd_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 71
      uptime_hh_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 75
      uptime_mm_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 79
      commands_str:
        type: u1
        repeat: expr
        repeat-expr: 4
        pos: 90
      leila_request_str:
        type: u1
        pos: 110
      leila_active_str:
        type: u1
        pos: 127
      temp_str:
        type: u1
        repeat: expr
        repeat-expr: 2
        pos: 134
      volts_str_1:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 150
      volts_str_2:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 154
      volts_str_3:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 158
      volts_str_4:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 162
      volts_str_5:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 166
      volts_str_6:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 170
      volts_str_7:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 174
      volts_str_8:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 178
      volts_str_9:
        type: u1
        repeat: expr
        repeat-expr: 3
        pos: 182
      tfl_str:
        type: u1
        pos: 201
      tfe_str:
        type: u1
        pos: 212
      tfh_str:
        type: u1
        pos: 222
      hff_str:
        type: u1
        pos: 234
      hth_str:
        type: u1
        pos: 245
      hr_str:
        type: u1
        pos: 255
      uptime:
        value: >-
          (
            (
              (uptime_dd_str[0] > 0x2f ? 1 : 0) * (uptime_dd_str[0] - 0x30) * 10 +
              (uptime_dd_str[1] - 0x30)
            ) * 24 * 60 * 60 +
            (
              (uptime_hh_str[0] > 0x2f ? 1 : 0) * (uptime_hh_str[0] - 0x30) * 10 +
              (uptime_hh_str[1] - 0x30)
            ) * 60 * 60 +
            (
              (uptime_mm_str[0] > 0x2f ? 1 : 0) * (uptime_mm_str[0] - 0x30) * 10 +
              (uptime_mm_str[1] - 0x30)
            ) * 60
          )
      commands:
        value: >-
          (
            (
              (commands_str[0] > 0x2f ? 1 : 0) * (commands_str[0] - 0x30) * 1000 +
              (commands_str[1] > 0x2f ? 1 : 0) * (commands_str[1] - 0x30) * 100 +
              (commands_str[2] > 0x2f ? 1 : 0) * (commands_str[2] - 0x30) * 10 +
              (commands_str[3] - 0x30)
            )
          )
      leila_req:
        value: leila_request_str > 0x30
      leila_act:
        value: leila_active_str > 0x30
      temperature:
        value: >-
          (
            (
              (temp_str[0] > 0x2f ? 1 : 0) * (temp_str[0] - 0x30) * 10 +
              (temp_str[1] - 0x30)
            )
          )
      volt_1:
        value: >-
          (
            (
              (volts_str_1[0] - 0x30) * 1.0 +
              (volts_str_1[2] - 0x30) / 10.0
            )
          )
      volt_2:
        value: >-
          (
            (
              (volts_str_2[0] - 0x30) * 1.0 +
              (volts_str_2[2] - 0x30) / 10.0
            )
          )
      volt_3:
        value: >-
          (
            (
              (volts_str_3[0] - 0x30) * 1.0 +
              (volts_str_3[2] - 0x30) / 10.0
            )
          )
      volt_4:
        value: >-
          (
            (
              (volts_str_4[0] - 0x30) * 1.0 +
              (volts_str_4[2] - 0x30) / 10.0
            )
          )
      volt_5:
        value: >-
          (
            (
              (volts_str_5[0] - 0x30) * 1.0 +
              (volts_str_5[2] - 0x30) / 10.0
            )
          )
      volt_6:
        value: >-
          (
            (
              (volts_str_6[0] - 0x30) * 1.0 +
              (volts_str_6[2] - 0x30) / 10.0
            )
          )
      volt_7:
        value: >-
          (
            (
              (volts_str_7[0] - 0x30) * 1.0 +
              (volts_str_7[2] - 0x30) / 10.0
            )
          )
      volt_8:
        value: >-
          (
            (
              (volts_str_8[0] - 0x30) * 1.0 +
              (volts_str_8[2] - 0x30) / 10.0
            )
          )
      volt_9:
        value: >-
          (
            (
              (volts_str_9[0] - 0x30) * 1.0 +
              (volts_str_9[2] - 0x30) / 10.0
            )
          )
  ao40_fec_message_l:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
  ao40_message_l:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line5
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line6
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line7
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line8
        type: str
        encoding: ASCII
        size: 64
  ao40_fec_message_spare:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
  ao40_message_spare:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line5
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line6
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line7
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line8
        type: str
        encoding: ASCII
        size: 64
  ao40_fec_command_response:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
  ao40_command_response:
    seq:
      - id: ao40_message_line1
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line2
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line3
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line4
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line5
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line6
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line7
        type: str
        encoding: ASCII
        size: 64
      - id: ao40_message_line8
        type: str
        encoding: ASCII
        size: 64
instances:
  frame_length:
    value: _io.size
