---
meta:
  id: grizu263a
  endian: le
doc: |
  :field teamid: header.teamid
  :field year: header.year
  :field month: header.month
  :field date: header.date
  :field hour: header.hour
  :field minute: header.minute
  :field second: header.second
  :field temp: header.temp
  :field epstoobcina1_current: header.epstoobcina1_current
  :field epstoobcina1_busvoltage: header.epstoobcina1_busvoltage
  :field epsina2_current: header.epsina2_current
  :field epsina2_busvoltage: header.epsina2_busvoltage
  :field baseina3_current: header.baseina3_current
  :field baseina3_busvoltage: header.baseina3_busvoltage
  :field topina4_current: header.topina4_current
  :field topina4_busvoltage: header.topina4_busvoltage
  :field behindantenina5_current: header.behindantenina5_current
  :field behindantenina5_busvoltage: header.behindantenina5_busvoltage
  :field rightsideina6_current: header.rightsideina6_current
  :field rightsideina6_busvoltage: header.rightsideina6_busvoltage
  :field leftsideina7_current: header.leftsideina7_current
  :field leftsideina7_busvoltage: header.leftsideina7_busvoltage
  :field imumx: header.imumx
  :field imumy: header.imumy
  :field imumz: header.imumz
  :field imuax: header.imuax
  :field imuay: header.imuay
  :field imuaz: header.imuaz
  :field imugx: header.imugx
  :field imugy: header.imugy
  :field imugz: header.imugz

seq:
  - id: header
    type: header

types:
  header:
    seq:
      - id: pad
        size: 1
      - id: teamid
        type: str
        size: 6
        encoding: ASCII
        valid:
          any-of:
            - '"YM2VRZ"'
      - id: year
        type: u1
      - id: month
        type: u1
      - id: date
        type: u1
      - id: hour
        type: u1
      - id: minute
        type: u1
      - id: second
        type: u1
      - id: temp
        type: s2
      - id: epstoobcina1_current
        type: u2
      - id: epstoobcina1_busvoltage
        type: u2
      - id: epsina2_current
        type: u2
      - id: epsina2_busvoltage
        type: u2
      - id: baseina3_current
        type: u2
      - id: baseina3_busvoltage
        type: u2
      - id: topina4_current
        type: u2
      - id: topina4_busvoltage
        type: u2
      - id: behindantenina5_current
        type: u2
      - id: behindantenina5_busvoltage
        type: u2
      - id: rightsideina6_current
        type: u2
      - id: rightsideina6_busvoltage
        type: u2
      - id: leftsideina7_current
        type: u2
      - id: leftsideina7_busvoltage
        type: u2
      - id: imumx
        type: s2
      - id: imumy
        type: s2
      - id: imumz
        type: s2
      - id: imuax
        type: s2
      - id: imuay
        type: s2
      - id: imuaz
        type: s2
      - id: imugx
        type: s2
      - id: imugy
        type: s2
      - id: imugz
        type: s2
