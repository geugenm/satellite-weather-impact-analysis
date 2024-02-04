---
meta:
  id: cape1
  endian: be
doc-ref: |
  http://www.dk3wn.info/sat/afu/sat_cape.shtml
  https://www.pe0sat.vgnet.nl/download/CAPE/cape-1_02-07-2020_1940UTC.PNG
  https://www.pe0sat.vgnet.nl/download/CAPE/cape-1_02-07-2020_1940UTC.txt
  https://www.pe0sat.vgnet.nl/download/CAPE/tlm_info.txt
doc: |
  :field callsign: callsign
  :field pkt_type: pkt_type
  :field mpb_voltage: payload.mpb_voltage.as_int
  :field hpb_voltage: payload.hpb_voltage.as_int
  :field battery_1_voltage: payload.battery_1_voltage.as_int
  :field battery_2_voltage: payload.battery_2_voltage.as_int
  :field battery_1_current_generated: payload.battery_1_current_generated.as_int
  :field battery_1_current_absorbed: payload.battery_1_current_absorbed.as_int
  :field battery_2_current_generated: payload.battery_2_current_generated.as_int
  :field battery_2_current_absorbed: payload.battery_2_current_absorbed.as_int
  :field temp_battery_1: payload.temp_battery_1.as_int
  :field temp_px_face: payload.temp_px_face.as_int
  :field temp_nx_face: payload.temp_nx_face.as_int
  :field temp_py_face: payload.temp_py_face.as_int
  :field temp_ny_face: payload.temp_ny_face.as_int
  :field temp_pz_face: payload.temp_pz_face.as_int
  :field temp_nz_face: payload.temp_nz_face.as_int
  :field temp_rf_amp: payload.temp_rf_amp.as_int
  :field temp_battery_2: payload.temp_battery_2.as_int
  :field panel_px_face: payload.panel_px_face.as_int
  :field panel_nx_face: payload.panel_nx_face.as_int
  :field panel_py_face: payload.panel_py_face.as_int
  :field panel_ny_face: payload.panel_ny_face.as_int
  :field panel_pz_face: payload.panel_pz_face.as_int
  :field panel_nz_face: payload.panel_nz_face.as_int
seq:
  - id: check_callsign
    contents: 'K5USL'
  - id: pkt_type
    type: str
    size: 1
    encoding: ascii
  - id: payload
    type:
      switch-on: pkt_type
      cases:
        '"1"': pkt_type_1
        '"2"': pkt_type_2
        '"3"': pkt_type_3
instances:
  callsign:
    pos: 0
    size: 5
    type: str
    encoding: ascii
types:
  pkt_type_1:
    seq:
      - id: mpb_voltage
        type: voltage
      - id: hpb_voltage
        type: voltage
      - id: battery_1_voltage
        type: voltage
      - id: battery_2_voltage
        type: voltage
      - id: battery_1_current_generated
        type: hex_uint
      - id: battery_1_current_absorbed
        type: hex_uint
      - id: battery_2_current_generated
        type: hex_uint
      - id: battery_2_current_absorbed
        type: hex_uint
  pkt_type_2:
    seq:
      - id: temp_battery_1
        type: hex_int
      - id: temp_px_face
        type: hex_int
      - id: temp_nx_face
        type: hex_int
      - id: temp_py_face
        type: hex_int
      - id: temp_ny_face
        type: hex_int
      - id: temp_pz_face
        type: hex_int
      - id: temp_nz_face
        type: hex_int
      - id: temp_rf_amp
        type: hex_int
      - id: temp_battery_2
        type: hex_int
  pkt_type_3:
    seq:
      - id: panel_px_face
        type: solar_current
      - id: panel_nx_face
        type: solar_current
      - id: panel_py_face
        type: solar_current
      - id: panel_ny_face
        type: solar_current
      - id: panel_pz_face
        type: solar_current
      - id: panel_nz_face
        type: solar_current
  hex_int:
    seq:
      - id: as_str
        size: 2
        type: str
        encoding: ASCII
    instances:
      as_int:
        value: 'as_str.to_i(16) < 128 ? as_str.to_i(16) : -((as_str.to_i(16) - 1) ^ 0xFF)'
  hex_uint:
    seq:
      - id: as_str
        size: 2
        type: str
        encoding: ASCII
    instances:
      as_int:
        value: as_str.to_i(16)
  solar_current:
    seq:
      - id: as_str
        size: 2
        type: str
        encoding: ASCII
    instances:
      as_int:
        value: as_str.to_i(16)
        doc: '(I * 10) [mA]'
  voltage:
    seq:
      - id: as_str
        size: 2
        type: str
        encoding: ASCII
    instances:
      as_int:
        value: as_str.to_i(16)
        doc: ' (V * 0.02) [V] despite documentation indicating (V * 0.2)'
