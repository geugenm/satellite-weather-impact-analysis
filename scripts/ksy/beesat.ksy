meta:
  id: beesat
  title: Beesat-1 telemetry and digipeater decoder struct
  endian: be

doc-ref: |
  'https://www.tu.berlin/en/raumfahrttechnik/institute/amateur-radio'
  'https://www.static.tu.berlin/fileadmin/www/10002275/Amateur_Radio/BEESAT-1_Digipeater-Format.ods'
  'https://www.static.tu.berlin/fileadmin/www/10002275/Amateur_Radio/BEESAT-1_telemetry_format.pdf'

doc: |
  :field sync: master_frame.sync
  :field contrl0: master_frame.contrl0
  :field contrl1: master_frame.contrl1
  :field calsgn: master_frame.calsgn
  :field crcsgn: master_frame.crcsgn
  :field asm: master_frame.packet_type.transfer_frame0.asm
  :field tfvn: master_frame.packet_type.transfer_frame0.tfvn
  :field scid: master_frame.packet_type.transfer_frame0.scid
  :field vcid: master_frame.packet_type.transfer_frame0.vcid
  :field ocff: master_frame.packet_type.transfer_frame0.ocff
  :field mcfc: master_frame.packet_type.transfer_frame0.mcfc
  :field vcfc: master_frame.packet_type.transfer_frame0.vcfc
  :field tf_shf: master_frame.packet_type.transfer_frame0.tf_shf
  :field sync_flag: master_frame.packet_type.transfer_frame0.sync_flag
  :field pof: master_frame.packet_type.transfer_frame0.pof
  :field slid: master_frame.packet_type.transfer_frame0.slid
  :field fhp: master_frame.packet_type.transfer_frame0.fhp
  :field pvn: master_frame.packet_type.transfer_frame0.source_packet.pvn
  :field pt: master_frame.packet_type.transfer_frame0.source_packet.pt
  :field shf: master_frame.packet_type.transfer_frame0.source_packet.shf
  :field apid: master_frame.packet_type.transfer_frame0.source_packet.apid
  :field sequence_flag: master_frame.packet_type.transfer_frame0.source_packet.sequence_flag
  :field psc: master_frame.packet_type.transfer_frame0.source_packet.psc
  :field pdl: master_frame.packet_type.transfer_frame0.source_packet.pdl
  :field value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused00.value
  :field unused01_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused01.value
  :field unused02_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused02.value
  :field unused03_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused03.value
  :field unused04_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused04.value
  :field unused05_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused05.value
  :field unused06_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused06.value
  :field unused07_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused07.value
  :field unused08_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused08.value
  :field unused09_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused09.value
  :field unused10_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused10.value
  :field unused11_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused11.value
  :field unused12_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused12.value
  :field unused13_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused13.value
  :field unused14_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused14.value
  :field unused15_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused15.value
  :field unused16_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.unused16.value
  :field analog_value_01_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_01.value
  :field psant0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psant0
  :field psant1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psant1
  :field pscom0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pscom0
  :field pscom1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pscom1
  :field analog_value_02_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_02.value
  :field psuhf0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psuhf0
  :field psuhf1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psuhf1
  :field pstnc0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pstnc0
  :field pstnc1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pstnc1
  :field analog_value_03_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_03.value
  :field psgyro: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psgyro
  :field psmcsx: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psmcsx
  :field psmcsy: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psmcsy
  :field psmcsz: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psmcsz
  :field analog_value_04_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_04.value
  :field pswhee: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pswhee
  :field psobc0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psobc0
  :field psobc1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psobc1
  :field pspdh0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pspdh0
  :field analog_value_05_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_05.value
  :field pscam0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pscam0
  :field pssuns: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pssuns
  :field psmfs0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psmfs0
  :field psmfs1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psmfs1
  :field analog_value_06_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_06.value
  :field pstemp: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pstemp
  :field pscan0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pscan0
  :field pscan1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pscan1
  :field psccw0: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psccw0
  :field analog_value_07_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_07.value
  :field psccw1: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.psccw1
  :field ps5vcn: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ps5vcn
  :field reserved00: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved00
  :field pcbobc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcbobc
  :field analog_value_08_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_08.value
  :field pcbext: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcbext
  :field pcch00: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch00
  :field pcch01: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch01
  :field pcch02: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch02
  :field analog_value_09_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_09.value
  :field pcch03: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch03
  :field pcch04: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch04
  :field pcch05: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch05
  :field pcch06: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch06
  :field analog_value_10: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_10
  :field pcch07: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch07
  :field pcch08: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch08
  :field pcch09: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch09
  :field pcch10: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch10
  :field analog_value_11: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_11
  :field pcch11: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch11
  :field pcch12: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch12
  :field pcch13: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch13
  :field pcch14: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch14
  :field analog_value_12_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_12.value
  :field pcch15: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch15
  :field pcch16: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch16
  :field pcch17: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch17
  :field pcch18: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch18
  :field analog_value_13_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_13.value
  :field pcch19: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch19
  :field pcch20: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch20
  :field pcch21: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch21
  :field pcch22: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch22
  :field analog_value_14_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_14.value
  :field pcch23: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch23
  :field pcch24: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch24
  :field pcch25: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch25
  :field pcch26: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch26
  :field analog_value_15_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_15.value
  :field tcrxid: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.tcrxid
  :field obcaid: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.obcaid
  :field tmtxrt: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.tmtxrt
  :field pcch27: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch27
  :field analog_value_16_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_16.value
  :field pcch28: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch28
  :field pcch29: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch29
  :field pcch30: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch30
  :field pcch31: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch31
  :field ccticc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ccticc
  :field cctctt: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.cctctt
  :field ccetcs: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ccetcs
  :field cceimc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.cceimc
  :field ccettc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ccettc
  :field ccettg: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ccettg
  :field ccetcc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ccetcc
  :field tcrxqu_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.tcrxqu.value
  :field tcfrcp: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.tcfrcp
  :field tmhkur: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.tmhkur
  :field cstutc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.cstutc
  :field cstsys: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.cstsys
  :field obcbad: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.obcbad
  :field ceswmc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ceswmc
  :field reserved01: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved01
  :field beacon: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.beacon
  :field obcabc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.obcabc
  :field modobc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.modobc
  :field ccecan: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.ccecan
  :field obccan: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.obccan
  :field pcsyst: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcsyst
  :field pcbcnt: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcbcnt
  :field pctxec: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pctxec
  :field pcrxec: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcrxec
  :field pcoffc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcoffc
  :field pcackc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcackc
  :field pcch32: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch32
  :field pcch33: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch33
  :field pcch34: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch34
  :field pcch35: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch35
  :field pcch36: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch36
  :field pcch37: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch37
  :field pcch38: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch38
  :field pcch39: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch39
  :field pcch40: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch40
  :field pcch41: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.pcch41
  :field reserved02: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved02
  :field analog_value_17_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_17.value
  :field reserved03: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved03
  :field analog_value_18_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_18.value
  :field reserved04: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved04
  :field analog_value_19_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_19.value
  :field reserved05: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved05
  :field acswhx: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acswhx
  :field acswhy: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acswhy
  :field acswhz: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acswhz
  :field acsq00_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsq00.value
  :field acsq01_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsq01.value
  :field acsq02_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsq02.value
  :field acsq03_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsq03.value
  :field acssux_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acssux.value
  :field acssuy_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acssuy.value
  :field acssuz_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acssuz.value
  :field acsm0x_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsm0x.value
  :field acsm0y_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsm0y.value
  :field acsm0z_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsm0z.value
  :field acsm1x_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsm1x.value
  :field acsm1y_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsm1y.value
  :field acsm1z_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsm1z.value
  :field acsmod: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsmod
  :field acsgsc: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsgsc
  :field acsshd: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsshd
  :field reserved06: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved06
  :field acserr: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acserr
  :field acsgyx_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsgyx.value
  :field acsgyy_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsgyy.value
  :field acsgyz_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.acsgyz.value
  :field analog_value_20_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_20.value
  :field reserved07: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved07
  :field analog_value_21_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_21.value
  :field reserved08: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved08
  :field analog_value_22_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_22.value
  :field reserved09: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved09
  :field analog_value_23_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_23.value
  :field reserved10: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved10
  :field analog_value_24_value: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.analog_value_24.value
  :field reserved11: master_frame.packet_type.transfer_frame0.source_packet.telemetry_values.reserved11
  :field fecf: master_frame.packet_type.transfer_frame0.fecf
  :field two_byte_combined: master_frame.packet_type.transfer_frame0.two_byte_combined
  :field transfer_frame1_asm: master_frame.packet_type.transfer_frame1.asm
  :field transfer_frame1_tfvn: master_frame.packet_type.transfer_frame1.tfvn
  :field transfer_frame1_scid: master_frame.packet_type.transfer_frame1.scid
  :field transfer_frame1_vcid: master_frame.packet_type.transfer_frame1.vcid
  :field transfer_frame1_ocff: master_frame.packet_type.transfer_frame1.ocff
  :field transfer_frame1_mcfc: master_frame.packet_type.transfer_frame1.mcfc
  :field transfer_frame1_vcfc: master_frame.packet_type.transfer_frame1.vcfc
  :field transfer_frame1_tf_shf: master_frame.packet_type.transfer_frame1.tf_shf
  :field transfer_frame1_sync_flag: master_frame.packet_type.transfer_frame1.sync_flag
  :field transfer_frame1_pof: master_frame.packet_type.transfer_frame1.pof
  :field transfer_frame1_slid: master_frame.packet_type.transfer_frame1.slid
  :field transfer_frame1_fhp: master_frame.packet_type.transfer_frame1.fhp
  :field transfer_frame1_pvn: master_frame.packet_type.transfer_frame1.source_packet.pvn
  :field transfer_frame1_pt: master_frame.packet_type.transfer_frame1.source_packet.pt
  :field transfer_frame1_shf: master_frame.packet_type.transfer_frame1.source_packet.shf
  :field transfer_frame1_apid: master_frame.packet_type.transfer_frame1.source_packet.apid
  :field transfer_frame1_sequence_flag: master_frame.packet_type.transfer_frame1.source_packet.sequence_flag
  :field transfer_frame1_psc: master_frame.packet_type.transfer_frame1.source_packet.psc
  :field transfer_frame1_pdl: master_frame.packet_type.transfer_frame1.source_packet.pdl
  :field transfer_frame1_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused00.value
  :field transfer_frame1_unused01_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused01.value
  :field transfer_frame1_unused02_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused02.value
  :field transfer_frame1_unused03_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused03.value
  :field transfer_frame1_unused04_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused04.value
  :field transfer_frame1_unused05_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused05.value
  :field transfer_frame1_unused06_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused06.value
  :field transfer_frame1_unused07_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused07.value
  :field transfer_frame1_unused08_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused08.value
  :field transfer_frame1_unused09_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused09.value
  :field transfer_frame1_unused10_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused10.value
  :field transfer_frame1_unused11_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused11.value
  :field transfer_frame1_unused12_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused12.value
  :field transfer_frame1_unused13_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused13.value
  :field transfer_frame1_unused14_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused14.value
  :field transfer_frame1_unused15_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused15.value
  :field transfer_frame1_unused16_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.unused16.value
  :field transfer_frame1_analog_value_01_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_01.value
  :field transfer_frame1_psant0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psant0
  :field transfer_frame1_psant1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psant1
  :field transfer_frame1_pscom0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pscom0
  :field transfer_frame1_pscom1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pscom1
  :field transfer_frame1_analog_value_02_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_02.value
  :field transfer_frame1_psuhf0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psuhf0
  :field transfer_frame1_psuhf1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psuhf1
  :field transfer_frame1_pstnc0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pstnc0
  :field transfer_frame1_pstnc1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pstnc1
  :field transfer_frame1_analog_value_03_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_03.value
  :field transfer_frame1_psgyro: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psgyro
  :field transfer_frame1_psmcsx: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psmcsx
  :field transfer_frame1_psmcsy: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psmcsy
  :field transfer_frame1_psmcsz: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psmcsz
  :field transfer_frame1_analog_value_04_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_04.value
  :field transfer_frame1_pswhee: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pswhee
  :field transfer_frame1_psobc0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psobc0
  :field transfer_frame1_psobc1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psobc1
  :field transfer_frame1_pspdh0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pspdh0
  :field transfer_frame1_analog_value_05_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_05.value
  :field transfer_frame1_pscam0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pscam0
  :field transfer_frame1_pssuns: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pssuns
  :field transfer_frame1_psmfs0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psmfs0
  :field transfer_frame1_psmfs1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psmfs1
  :field transfer_frame1_analog_value_06_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_06.value
  :field transfer_frame1_pstemp: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pstemp
  :field transfer_frame1_pscan0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pscan0
  :field transfer_frame1_pscan1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pscan1
  :field transfer_frame1_psccw0: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psccw0
  :field transfer_frame1_analog_value_07_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_07.value
  :field transfer_frame1_psccw1: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.psccw1
  :field transfer_frame1_ps5vcn: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ps5vcn
  :field transfer_frame1_reserved00: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved00
  :field transfer_frame1_pcbobc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcbobc
  :field transfer_frame1_analog_value_08_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_08.value
  :field transfer_frame1_pcbext: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcbext
  :field transfer_frame1_pcch00: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch00
  :field transfer_frame1_pcch01: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch01
  :field transfer_frame1_pcch02: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch02
  :field transfer_frame1_analog_value_09_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_09.value
  :field transfer_frame1_pcch03: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch03
  :field transfer_frame1_pcch04: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch04
  :field transfer_frame1_pcch05: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch05
  :field transfer_frame1_pcch06: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch06
  :field transfer_frame1_analog_value_10: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_10
  :field transfer_frame1_pcch07: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch07
  :field transfer_frame1_pcch08: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch08
  :field transfer_frame1_pcch09: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch09
  :field transfer_frame1_pcch10: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch10
  :field transfer_frame1_analog_value_11: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_11
  :field transfer_frame1_pcch11: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch11
  :field transfer_frame1_pcch12: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch12
  :field transfer_frame1_pcch13: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch13
  :field transfer_frame1_pcch14: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch14
  :field transfer_frame1_analog_value_12_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_12.value
  :field transfer_frame1_pcch15: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch15
  :field transfer_frame1_pcch16: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch16
  :field transfer_frame1_pcch17: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch17
  :field transfer_frame1_pcch18: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch18
  :field transfer_frame1_analog_value_13_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_13.value
  :field transfer_frame1_pcch19: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch19
  :field transfer_frame1_pcch20: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch20
  :field transfer_frame1_pcch21: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch21
  :field transfer_frame1_pcch22: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch22
  :field transfer_frame1_analog_value_14_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_14.value
  :field transfer_frame1_pcch23: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch23
  :field transfer_frame1_pcch24: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch24
  :field transfer_frame1_pcch25: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch25
  :field transfer_frame1_pcch26: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch26
  :field transfer_frame1_analog_value_15_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_15.value
  :field transfer_frame1_tcrxid: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.tcrxid
  :field transfer_frame1_obcaid: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.obcaid
  :field transfer_frame1_tmtxrt: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.tmtxrt
  :field transfer_frame1_pcch27: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch27
  :field transfer_frame1_analog_value_16_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_16.value
  :field transfer_frame1_pcch28: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch28
  :field transfer_frame1_pcch29: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch29
  :field transfer_frame1_pcch30: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch30
  :field transfer_frame1_pcch31: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch31
  :field transfer_frame1_ccticc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ccticc
  :field transfer_frame1_cctctt: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.cctctt
  :field transfer_frame1_ccetcs: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ccetcs
  :field transfer_frame1_cceimc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.cceimc
  :field transfer_frame1_ccettc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ccettc
  :field transfer_frame1_ccettg: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ccettg
  :field transfer_frame1_ccetcc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ccetcc
  :field transfer_frame1_tcrxqu_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.tcrxqu.value
  :field transfer_frame1_tcfrcp: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.tcfrcp
  :field transfer_frame1_tmhkur: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.tmhkur
  :field transfer_frame1_cstutc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.cstutc
  :field transfer_frame1_cstsys: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.cstsys
  :field transfer_frame1_obcbad: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.obcbad
  :field transfer_frame1_ceswmc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ceswmc
  :field transfer_frame1_reserved01: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved01
  :field transfer_frame1_beacon: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.beacon
  :field transfer_frame1_obcabc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.obcabc
  :field transfer_frame1_modobc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.modobc
  :field transfer_frame1_ccecan: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.ccecan
  :field transfer_frame1_obccan: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.obccan
  :field transfer_frame1_pcsyst: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcsyst
  :field transfer_frame1_pcbcnt: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcbcnt
  :field transfer_frame1_pctxec: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pctxec
  :field transfer_frame1_pcrxec: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcrxec
  :field transfer_frame1_pcoffc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcoffc
  :field transfer_frame1_pcackc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcackc
  :field transfer_frame1_pcch32: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch32
  :field transfer_frame1_pcch33: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch33
  :field transfer_frame1_pcch34: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch34
  :field transfer_frame1_pcch35: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch35
  :field transfer_frame1_pcch36: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch36
  :field transfer_frame1_pcch37: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch37
  :field transfer_frame1_pcch38: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch38
  :field transfer_frame1_pcch39: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch39
  :field transfer_frame1_pcch40: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch40
  :field transfer_frame1_pcch41: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.pcch41
  :field transfer_frame1_reserved02: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved02
  :field transfer_frame1_analog_value_17_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_17.value
  :field transfer_frame1_reserved03: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved03
  :field transfer_frame1_analog_value_18_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_18.value
  :field transfer_frame1_reserved04: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved04
  :field transfer_frame1_analog_value_19_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_19.value
  :field transfer_frame1_reserved05: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved05
  :field transfer_frame1_acswhx: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acswhx
  :field transfer_frame1_acswhy: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acswhy
  :field transfer_frame1_acswhz: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acswhz
  :field transfer_frame1_acsq00_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsq00.value
  :field transfer_frame1_acsq01_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsq01.value
  :field transfer_frame1_acsq02_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsq02.value
  :field transfer_frame1_acsq03_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsq03.value
  :field transfer_frame1_acssux_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acssux.value
  :field transfer_frame1_acssuy_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acssuy.value
  :field transfer_frame1_acssuz_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acssuz.value
  :field transfer_frame1_acsm0x_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsm0x.value
  :field transfer_frame1_acsm0y_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsm0y.value
  :field transfer_frame1_acsm0z_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsm0z.value
  :field transfer_frame1_acsm1x_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsm1x.value
  :field transfer_frame1_acsm1y_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsm1y.value
  :field transfer_frame1_acsm1z_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsm1z.value
  :field transfer_frame1_acsmod: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsmod
  :field transfer_frame1_acsgsc: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsgsc
  :field transfer_frame1_acsshd: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsshd
  :field transfer_frame1_reserved06: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved06
  :field transfer_frame1_acserr: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acserr
  :field transfer_frame1_acsgyx_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsgyx.value
  :field transfer_frame1_acsgyy_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsgyy.value
  :field transfer_frame1_acsgyz_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.acsgyz.value
  :field transfer_frame1_analog_value_20_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_20.value
  :field transfer_frame1_reserved07: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved07
  :field transfer_frame1_analog_value_21_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_21.value
  :field transfer_frame1_reserved08: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved08
  :field transfer_frame1_analog_value_22_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_22.value
  :field transfer_frame1_reserved09: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved09
  :field transfer_frame1_analog_value_23_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_23.value
  :field transfer_frame1_reserved10: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved10
  :field transfer_frame1_analog_value_24_value: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.analog_value_24.value
  :field transfer_frame1_reserved11: master_frame.packet_type.transfer_frame1.source_packet.telemetry_values.reserved11
  :field transfer_frame1_fecf: master_frame.packet_type.transfer_frame1.fecf
  :field transfer_frame1_two_byte_combined: master_frame.packet_type.transfer_frame1.two_byte_combined
  :field transfer_frame2_asm: master_frame.packet_type.transfer_frame2.asm
  :field transfer_frame2_tfvn: master_frame.packet_type.transfer_frame2.tfvn
  :field transfer_frame2_scid: master_frame.packet_type.transfer_frame2.scid
  :field transfer_frame2_vcid: master_frame.packet_type.transfer_frame2.vcid
  :field transfer_frame2_ocff: master_frame.packet_type.transfer_frame2.ocff
  :field transfer_frame2_mcfc: master_frame.packet_type.transfer_frame2.mcfc
  :field transfer_frame2_vcfc: master_frame.packet_type.transfer_frame2.vcfc
  :field transfer_frame2_tf_shf: master_frame.packet_type.transfer_frame2.tf_shf
  :field transfer_frame2_sync_flag: master_frame.packet_type.transfer_frame2.sync_flag
  :field transfer_frame2_pof: master_frame.packet_type.transfer_frame2.pof
  :field transfer_frame2_slid: master_frame.packet_type.transfer_frame2.slid
  :field transfer_frame2_fhp: master_frame.packet_type.transfer_frame2.fhp
  :field transfer_frame2_pvn: master_frame.packet_type.transfer_frame2.source_packet.pvn
  :field transfer_frame2_pt: master_frame.packet_type.transfer_frame2.source_packet.pt
  :field transfer_frame2_shf: master_frame.packet_type.transfer_frame2.source_packet.shf
  :field transfer_frame2_apid: master_frame.packet_type.transfer_frame2.source_packet.apid
  :field transfer_frame2_sequence_flag: master_frame.packet_type.transfer_frame2.source_packet.sequence_flag
  :field transfer_frame2_psc: master_frame.packet_type.transfer_frame2.source_packet.psc
  :field transfer_frame2_pdl: master_frame.packet_type.transfer_frame2.source_packet.pdl
  :field transfer_frame2_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused00.value
  :field transfer_frame2_unused01_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused01.value
  :field transfer_frame2_unused02_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused02.value
  :field transfer_frame2_unused03_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused03.value
  :field transfer_frame2_unused04_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused04.value
  :field transfer_frame2_unused05_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused05.value
  :field transfer_frame2_unused06_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused06.value
  :field transfer_frame2_unused07_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused07.value
  :field transfer_frame2_unused08_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused08.value
  :field transfer_frame2_unused09_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused09.value
  :field transfer_frame2_unused10_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused10.value
  :field transfer_frame2_unused11_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused11.value
  :field transfer_frame2_unused12_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused12.value
  :field transfer_frame2_unused13_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused13.value
  :field transfer_frame2_unused14_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused14.value
  :field transfer_frame2_unused15_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused15.value
  :field transfer_frame2_unused16_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.unused16.value
  :field transfer_frame2_analog_value_01_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_01.value
  :field transfer_frame2_psant0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psant0
  :field transfer_frame2_psant1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psant1
  :field transfer_frame2_pscom0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pscom0
  :field transfer_frame2_pscom1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pscom1
  :field transfer_frame2_analog_value_02_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_02.value
  :field transfer_frame2_psuhf0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psuhf0
  :field transfer_frame2_psuhf1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psuhf1
  :field transfer_frame2_pstnc0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pstnc0
  :field transfer_frame2_pstnc1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pstnc1
  :field transfer_frame2_analog_value_03_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_03.value
  :field transfer_frame2_psgyro: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psgyro
  :field transfer_frame2_psmcsx: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psmcsx
  :field transfer_frame2_psmcsy: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psmcsy
  :field transfer_frame2_psmcsz: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psmcsz
  :field transfer_frame2_analog_value_04_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_04.value
  :field transfer_frame2_pswhee: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pswhee
  :field transfer_frame2_psobc0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psobc0
  :field transfer_frame2_psobc1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psobc1
  :field transfer_frame2_pspdh0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pspdh0
  :field transfer_frame2_analog_value_05_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_05.value
  :field transfer_frame2_pscam0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pscam0
  :field transfer_frame2_pssuns: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pssuns
  :field transfer_frame2_psmfs0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psmfs0
  :field transfer_frame2_psmfs1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psmfs1
  :field transfer_frame2_analog_value_06_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_06.value
  :field transfer_frame2_pstemp: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pstemp
  :field transfer_frame2_pscan0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pscan0
  :field transfer_frame2_pscan1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pscan1
  :field transfer_frame2_psccw0: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psccw0
  :field transfer_frame2_analog_value_07_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_07.value
  :field transfer_frame2_psccw1: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.psccw1
  :field transfer_frame2_ps5vcn: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ps5vcn
  :field transfer_frame2_reserved00: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved00
  :field transfer_frame2_pcbobc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcbobc
  :field transfer_frame2_analog_value_08_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_08.value
  :field transfer_frame2_pcbext: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcbext
  :field transfer_frame2_pcch00: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch00
  :field transfer_frame2_pcch01: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch01
  :field transfer_frame2_pcch02: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch02
  :field transfer_frame2_analog_value_09_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_09.value
  :field transfer_frame2_pcch03: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch03
  :field transfer_frame2_pcch04: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch04
  :field transfer_frame2_pcch05: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch05
  :field transfer_frame2_pcch06: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch06
  :field transfer_frame2_analog_value_10: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_10
  :field transfer_frame2_pcch07: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch07
  :field transfer_frame2_pcch08: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch08
  :field transfer_frame2_pcch09: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch09
  :field transfer_frame2_pcch10: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch10
  :field transfer_frame2_analog_value_11: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_11
  :field transfer_frame2_pcch11: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch11
  :field transfer_frame2_pcch12: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch12
  :field transfer_frame2_pcch13: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch13
  :field transfer_frame2_pcch14: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch14
  :field transfer_frame2_analog_value_12_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_12.value
  :field transfer_frame2_pcch15: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch15
  :field transfer_frame2_pcch16: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch16
  :field transfer_frame2_pcch17: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch17
  :field transfer_frame2_pcch18: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch18
  :field transfer_frame2_analog_value_13_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_13.value
  :field transfer_frame2_pcch19: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch19
  :field transfer_frame2_pcch20: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch20
  :field transfer_frame2_pcch21: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch21
  :field transfer_frame2_pcch22: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch22
  :field transfer_frame2_analog_value_14_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_14.value
  :field transfer_frame2_pcch23: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch23
  :field transfer_frame2_pcch24: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch24
  :field transfer_frame2_pcch25: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch25
  :field transfer_frame2_pcch26: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch26
  :field transfer_frame2_analog_value_15_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_15.value
  :field transfer_frame2_tcrxid: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.tcrxid
  :field transfer_frame2_obcaid: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.obcaid
  :field transfer_frame2_tmtxrt: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.tmtxrt
  :field transfer_frame2_pcch27: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch27
  :field transfer_frame2_analog_value_16_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_16.value
  :field transfer_frame2_pcch28: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch28
  :field transfer_frame2_pcch29: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch29
  :field transfer_frame2_pcch30: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch30
  :field transfer_frame2_pcch31: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch31
  :field transfer_frame2_ccticc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ccticc
  :field transfer_frame2_cctctt: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.cctctt
  :field transfer_frame2_ccetcs: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ccetcs
  :field transfer_frame2_cceimc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.cceimc
  :field transfer_frame2_ccettc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ccettc
  :field transfer_frame2_ccettg: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ccettg
  :field transfer_frame2_ccetcc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ccetcc
  :field transfer_frame2_tcrxqu_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.tcrxqu.value
  :field transfer_frame2_tcfrcp: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.tcfrcp
  :field transfer_frame2_tmhkur: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.tmhkur
  :field transfer_frame2_cstutc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.cstutc
  :field transfer_frame2_cstsys: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.cstsys
  :field transfer_frame2_obcbad: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.obcbad
  :field transfer_frame2_ceswmc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ceswmc
  :field transfer_frame2_reserved01: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved01
  :field transfer_frame2_beacon: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.beacon
  :field transfer_frame2_obcabc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.obcabc
  :field transfer_frame2_modobc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.modobc
  :field transfer_frame2_ccecan: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.ccecan
  :field transfer_frame2_obccan: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.obccan
  :field transfer_frame2_pcsyst: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcsyst
  :field transfer_frame2_pcbcnt: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcbcnt
  :field transfer_frame2_pctxec: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pctxec
  :field transfer_frame2_pcrxec: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcrxec
  :field transfer_frame2_pcoffc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcoffc
  :field transfer_frame2_pcackc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcackc
  :field transfer_frame2_pcch32: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch32
  :field transfer_frame2_pcch33: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch33
  :field transfer_frame2_pcch34: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch34
  :field transfer_frame2_pcch35: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch35
  :field transfer_frame2_pcch36: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch36
  :field transfer_frame2_pcch37: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch37
  :field transfer_frame2_pcch38: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch38
  :field transfer_frame2_pcch39: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch39
  :field transfer_frame2_pcch40: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch40
  :field transfer_frame2_pcch41: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.pcch41
  :field transfer_frame2_reserved02: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved02
  :field transfer_frame2_analog_value_17_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_17.value
  :field transfer_frame2_reserved03: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved03
  :field transfer_frame2_analog_value_18_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_18.value
  :field transfer_frame2_reserved04: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved04
  :field transfer_frame2_analog_value_19_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_19.value
  :field transfer_frame2_reserved05: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved05
  :field transfer_frame2_acswhx: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acswhx
  :field transfer_frame2_acswhy: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acswhy
  :field transfer_frame2_acswhz: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acswhz
  :field transfer_frame2_acsq00_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsq00.value
  :field transfer_frame2_acsq01_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsq01.value
  :field transfer_frame2_acsq02_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsq02.value
  :field transfer_frame2_acsq03_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsq03.value
  :field transfer_frame2_acssux_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acssux.value
  :field transfer_frame2_acssuy_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acssuy.value
  :field transfer_frame2_acssuz_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acssuz.value
  :field transfer_frame2_acsm0x_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsm0x.value
  :field transfer_frame2_acsm0y_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsm0y.value
  :field transfer_frame2_acsm0z_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsm0z.value
  :field transfer_frame2_acsm1x_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsm1x.value
  :field transfer_frame2_acsm1y_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsm1y.value
  :field transfer_frame2_acsm1z_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsm1z.value
  :field transfer_frame2_acsmod: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsmod
  :field transfer_frame2_acsgsc: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsgsc
  :field transfer_frame2_acsshd: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsshd
  :field transfer_frame2_reserved06: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved06
  :field transfer_frame2_acserr: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acserr
  :field transfer_frame2_acsgyx_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsgyx.value
  :field transfer_frame2_acsgyy_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsgyy.value
  :field transfer_frame2_acsgyz_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.acsgyz.value
  :field transfer_frame2_analog_value_20_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_20.value
  :field transfer_frame2_reserved07: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved07
  :field transfer_frame2_analog_value_21_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_21.value
  :field transfer_frame2_reserved08: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved08
  :field transfer_frame2_analog_value_22_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_22.value
  :field transfer_frame2_reserved09: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved09
  :field transfer_frame2_analog_value_23_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_23.value
  :field transfer_frame2_reserved10: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved10
  :field transfer_frame2_analog_value_24_value: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.analog_value_24.value
  :field transfer_frame2_reserved11: master_frame.packet_type.transfer_frame2.source_packet.telemetry_values.reserved11
  :field transfer_frame2_fecf: master_frame.packet_type.transfer_frame2.fecf
  :field transfer_frame2_two_byte_combined: master_frame.packet_type.transfer_frame2.two_byte_combined
  :field transfer_frame3_asm: master_frame.packet_type.transfer_frame3.asm
  :field transfer_frame3_tfvn: master_frame.packet_type.transfer_frame3.tfvn
  :field transfer_frame3_scid: master_frame.packet_type.transfer_frame3.scid
  :field transfer_frame3_vcid: master_frame.packet_type.transfer_frame3.vcid
  :field transfer_frame3_ocff: master_frame.packet_type.transfer_frame3.ocff
  :field transfer_frame3_mcfc: master_frame.packet_type.transfer_frame3.mcfc
  :field transfer_frame3_vcfc: master_frame.packet_type.transfer_frame3.vcfc
  :field transfer_frame3_tf_shf: master_frame.packet_type.transfer_frame3.tf_shf
  :field transfer_frame3_sync_flag: master_frame.packet_type.transfer_frame3.sync_flag
  :field transfer_frame3_pof: master_frame.packet_type.transfer_frame3.pof
  :field transfer_frame3_slid: master_frame.packet_type.transfer_frame3.slid
  :field transfer_frame3_fhp: master_frame.packet_type.transfer_frame3.fhp
  :field transfer_frame3_pvn: master_frame.packet_type.transfer_frame3.source_packet.pvn
  :field transfer_frame3_pt: master_frame.packet_type.transfer_frame3.source_packet.pt
  :field transfer_frame3_shf: master_frame.packet_type.transfer_frame3.source_packet.shf
  :field transfer_frame3_apid: master_frame.packet_type.transfer_frame3.source_packet.apid
  :field transfer_frame3_sequence_flag: master_frame.packet_type.transfer_frame3.source_packet.sequence_flag
  :field transfer_frame3_psc: master_frame.packet_type.transfer_frame3.source_packet.psc
  :field transfer_frame3_pdl: master_frame.packet_type.transfer_frame3.source_packet.pdl
  :field transfer_frame3_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused00.value
  :field transfer_frame3_unused01_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused01.value
  :field transfer_frame3_unused02_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused02.value
  :field transfer_frame3_unused03_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused03.value
  :field transfer_frame3_unused04_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused04.value
  :field transfer_frame3_unused05_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused05.value
  :field transfer_frame3_unused06_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused06.value
  :field transfer_frame3_unused07_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused07.value
  :field transfer_frame3_unused08_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused08.value
  :field transfer_frame3_unused09_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused09.value
  :field transfer_frame3_unused10_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused10.value
  :field transfer_frame3_unused11_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused11.value
  :field transfer_frame3_unused12_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused12.value
  :field transfer_frame3_unused13_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused13.value
  :field transfer_frame3_unused14_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused14.value
  :field transfer_frame3_unused15_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused15.value
  :field transfer_frame3_unused16_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.unused16.value
  :field transfer_frame3_analog_value_01_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_01.value
  :field transfer_frame3_psant0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psant0
  :field transfer_frame3_psant1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psant1
  :field transfer_frame3_pscom0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pscom0
  :field transfer_frame3_pscom1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pscom1
  :field transfer_frame3_analog_value_02_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_02.value
  :field transfer_frame3_psuhf0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psuhf0
  :field transfer_frame3_psuhf1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psuhf1
  :field transfer_frame3_pstnc0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pstnc0
  :field transfer_frame3_pstnc1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pstnc1
  :field transfer_frame3_analog_value_03_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_03.value
  :field transfer_frame3_psgyro: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psgyro
  :field transfer_frame3_psmcsx: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psmcsx
  :field transfer_frame3_psmcsy: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psmcsy
  :field transfer_frame3_psmcsz: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psmcsz
  :field transfer_frame3_analog_value_04_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_04.value
  :field transfer_frame3_pswhee: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pswhee
  :field transfer_frame3_psobc0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psobc0
  :field transfer_frame3_psobc1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psobc1
  :field transfer_frame3_pspdh0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pspdh0
  :field transfer_frame3_analog_value_05_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_05.value
  :field transfer_frame3_pscam0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pscam0
  :field transfer_frame3_pssuns: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pssuns
  :field transfer_frame3_psmfs0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psmfs0
  :field transfer_frame3_psmfs1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psmfs1
  :field transfer_frame3_analog_value_06_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_06.value
  :field transfer_frame3_pstemp: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pstemp
  :field transfer_frame3_pscan0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pscan0
  :field transfer_frame3_pscan1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pscan1
  :field transfer_frame3_psccw0: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psccw0
  :field transfer_frame3_analog_value_07_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_07.value
  :field transfer_frame3_psccw1: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.psccw1
  :field transfer_frame3_ps5vcn: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ps5vcn
  :field transfer_frame3_reserved00: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved00
  :field transfer_frame3_pcbobc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcbobc
  :field transfer_frame3_analog_value_08_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_08.value
  :field transfer_frame3_pcbext: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcbext
  :field transfer_frame3_pcch00: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch00
  :field transfer_frame3_pcch01: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch01
  :field transfer_frame3_pcch02: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch02
  :field transfer_frame3_analog_value_09_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_09.value
  :field transfer_frame3_pcch03: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch03
  :field transfer_frame3_pcch04: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch04
  :field transfer_frame3_pcch05: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch05
  :field transfer_frame3_pcch06: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch06
  :field transfer_frame3_analog_value_10: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_10
  :field transfer_frame3_pcch07: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch07
  :field transfer_frame3_pcch08: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch08
  :field transfer_frame3_pcch09: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch09
  :field transfer_frame3_pcch10: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch10
  :field transfer_frame3_analog_value_11: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_11
  :field transfer_frame3_pcch11: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch11
  :field transfer_frame3_pcch12: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch12
  :field transfer_frame3_pcch13: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch13
  :field transfer_frame3_pcch14: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch14
  :field transfer_frame3_analog_value_12_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_12.value
  :field transfer_frame3_pcch15: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch15
  :field transfer_frame3_pcch16: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch16
  :field transfer_frame3_pcch17: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch17
  :field transfer_frame3_pcch18: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch18
  :field transfer_frame3_analog_value_13_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_13.value
  :field transfer_frame3_pcch19: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch19
  :field transfer_frame3_pcch20: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch20
  :field transfer_frame3_pcch21: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch21
  :field transfer_frame3_pcch22: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch22
  :field transfer_frame3_analog_value_14_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_14.value
  :field transfer_frame3_pcch23: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch23
  :field transfer_frame3_pcch24: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch24
  :field transfer_frame3_pcch25: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch25
  :field transfer_frame3_pcch26: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch26
  :field transfer_frame3_analog_value_15_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_15.value
  :field transfer_frame3_tcrxid: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.tcrxid
  :field transfer_frame3_obcaid: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.obcaid
  :field transfer_frame3_tmtxrt: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.tmtxrt
  :field transfer_frame3_pcch27: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch27
  :field transfer_frame3_analog_value_16_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_16.value
  :field transfer_frame3_pcch28: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch28
  :field transfer_frame3_pcch29: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch29
  :field transfer_frame3_pcch30: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch30
  :field transfer_frame3_pcch31: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch31
  :field transfer_frame3_ccticc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ccticc
  :field transfer_frame3_cctctt: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.cctctt
  :field transfer_frame3_ccetcs: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ccetcs
  :field transfer_frame3_cceimc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.cceimc
  :field transfer_frame3_ccettc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ccettc
  :field transfer_frame3_ccettg: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ccettg
  :field transfer_frame3_ccetcc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ccetcc
  :field transfer_frame3_tcrxqu_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.tcrxqu.value
  :field transfer_frame3_tcfrcp: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.tcfrcp
  :field transfer_frame3_tmhkur: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.tmhkur
  :field transfer_frame3_cstutc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.cstutc
  :field transfer_frame3_cstsys: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.cstsys
  :field transfer_frame3_obcbad: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.obcbad
  :field transfer_frame3_ceswmc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ceswmc
  :field transfer_frame3_reserved01: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved01
  :field transfer_frame3_beacon: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.beacon
  :field transfer_frame3_obcabc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.obcabc
  :field transfer_frame3_modobc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.modobc
  :field transfer_frame3_ccecan: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.ccecan
  :field transfer_frame3_obccan: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.obccan
  :field transfer_frame3_pcsyst: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcsyst
  :field transfer_frame3_pcbcnt: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcbcnt
  :field transfer_frame3_pctxec: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pctxec
  :field transfer_frame3_pcrxec: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcrxec
  :field transfer_frame3_pcoffc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcoffc
  :field transfer_frame3_pcackc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcackc
  :field transfer_frame3_pcch32: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch32
  :field transfer_frame3_pcch33: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch33
  :field transfer_frame3_pcch34: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch34
  :field transfer_frame3_pcch35: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch35
  :field transfer_frame3_pcch36: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch36
  :field transfer_frame3_pcch37: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch37
  :field transfer_frame3_pcch38: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch38
  :field transfer_frame3_pcch39: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch39
  :field transfer_frame3_pcch40: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch40
  :field transfer_frame3_pcch41: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.pcch41
  :field transfer_frame3_reserved02: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved02
  :field transfer_frame3_analog_value_17_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_17.value
  :field transfer_frame3_reserved03: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved03
  :field transfer_frame3_analog_value_18_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_18.value
  :field transfer_frame3_reserved04: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved04
  :field transfer_frame3_analog_value_19_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_19.value
  :field transfer_frame3_reserved05: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved05
  :field transfer_frame3_acswhx: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acswhx
  :field transfer_frame3_acswhy: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acswhy
  :field transfer_frame3_acswhz: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acswhz
  :field transfer_frame3_acsq00_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsq00.value
  :field transfer_frame3_acsq01_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsq01.value
  :field transfer_frame3_acsq02_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsq02.value
  :field transfer_frame3_acsq03_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsq03.value
  :field transfer_frame3_acssux_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acssux.value
  :field transfer_frame3_acssuy_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acssuy.value
  :field transfer_frame3_acssuz_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acssuz.value
  :field transfer_frame3_acsm0x_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsm0x.value
  :field transfer_frame3_acsm0y_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsm0y.value
  :field transfer_frame3_acsm0z_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsm0z.value
  :field transfer_frame3_acsm1x_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsm1x.value
  :field transfer_frame3_acsm1y_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsm1y.value
  :field transfer_frame3_acsm1z_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsm1z.value
  :field transfer_frame3_acsmod: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsmod
  :field transfer_frame3_acsgsc: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsgsc
  :field transfer_frame3_acsshd: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsshd
  :field transfer_frame3_reserved06: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved06
  :field transfer_frame3_acserr: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acserr
  :field transfer_frame3_acsgyx_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsgyx.value
  :field transfer_frame3_acsgyy_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsgyy.value
  :field transfer_frame3_acsgyz_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.acsgyz.value
  :field transfer_frame3_analog_value_20_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_20.value
  :field transfer_frame3_reserved07: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved07
  :field transfer_frame3_analog_value_21_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_21.value
  :field transfer_frame3_reserved08: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved08
  :field transfer_frame3_analog_value_22_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_22.value
  :field transfer_frame3_reserved09: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved09
  :field transfer_frame3_analog_value_23_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_23.value
  :field transfer_frame3_reserved10: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved10
  :field transfer_frame3_analog_value_24_value: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.analog_value_24.value
  :field transfer_frame3_reserved11: master_frame.packet_type.transfer_frame3.source_packet.telemetry_values.reserved11
  :field transfer_frame3_fecf: master_frame.packet_type.transfer_frame3.fecf
  :field transfer_frame3_two_byte_combined: master_frame.packet_type.transfer_frame3.two_byte_combined
  :field count: master_frame.packet_type.digipeater_info_block.count
  :field byte_count: master_frame.packet_type.digipeater_info_block.byte_count
  :field local_time: master_frame.packet_type.digipeater_info_block.local_time
  :field calsgn_snd: master_frame.packet_type.digipeater_info_block.calsgn_snd
  :field long_qth_field: master_frame.packet_type.digipeater_info_block.long_qth_field
  :field lat_qth_field: master_frame.packet_type.digipeater_info_block.lat_qth_field
  :field long_qth_square: master_frame.packet_type.digipeater_info_block.long_qth_square
  :field lat_qth_square: master_frame.packet_type.digipeater_info_block.lat_qth_square
  :field long_qth_subsquare: master_frame.packet_type.digipeater_info_block.long_qth_subsquare
  :field lat_qth_subsquare: master_frame.packet_type.digipeater_info_block.lat_qth_subsquare
  :field message: master_frame.packet_type.digipeater_message.message

seq:
  - id: master_frame
    type: master_frame

types:
  master_frame:
    seq:
      - id: sync
        doc: sync marker
        type: u2
      - id: contrl0
        doc: control first byte
        type: u1
      - id: contrl1
        doc: control last byte
        type: u1
      - id: calsgn
        doc: receive callsign
        type: strz
        encoding: ascii
        size: 6
        valid: '"DP0BEE"'
      - id: crcsgn
        doc: CRC Callsign not used by beesat 1 - reserved bytes
        type: u2
      - id: packet_type
        doc: check wether it is a digipeater frame or a telemetry frame - first byte of contrl decides
        type:
          switch-on: contrl0
          cases:
            0x14 : telemetry_transfer_frames
            0x96 : digipeater_frame


  digipeater_frame:
    doc-ref: 'https://www.static.tu.berlin/fileadmin/www/10002275/Amateur_Radio/BEESAT-1_Digipeater-Format.ods'
    seq:
      - id: digipeater_info_block
        doc: total of 18 bytes
        type: digipeater_info_block
      - id: digipeater_message
        doc: total of 162 bytes
        type: digipeater_message
  
  digipeater_info_block:
    seq:
      - id: count
        doc: counter for sent messages
        type: u2
      - id: byte_count
        doc: number of bytes in this messaged
        type: u2
      - id: local_time
        doc: local time of when sending message (seconds of day)
        type: u4
      - id: calsgn_snd
        doc: callsign of sender
        type: strz
        encoding: ascii
        size: 6
      - id: long_qth_field
        doc: longitude of qth field of sender
        type: b6
      - id: lat_qth_field
        doc: latitude of qth field of sender
        type: b6
      - id: long_qth_square
        doc: longitude of qth square of sender
        type: b4
      - id: lat_qth_square
        doc: latitude of qth square of sender
        type: b4
      - id: long_qth_subsquare
        doc: longitude of qth sub-square of sender
        type: b6
      - id: lat_qth_subsquare
        doc: latitude of qth sub-square of sender
        type: b6
  
  digipeater_message:
    seq:
      - id: message
        doc: message content, if message size is < 162 bytes it gets filled up with 0xFF
        type: b1296

  telemetry_transfer_frames:
    doc-ref: 'https://www.static.tu.berlin/fileadmin/www/10002275/Amateur_Radio/BEESAT-1_telemetry_format.pdf'
    seq:
      - id: transfer_frame0
        doc: transfer frame for online telemetry data
        type: transfer_frame
      - id: transfer_frame1
        doc: transfer frame for offline telemetry data
        type: transfer_frame
      - id: transfer_frame2
        doc: transfer frame for offline telemetry data
        type: transfer_frame
      - id: transfer_frame3
        doc: transfer frame for offline telemetry data
        type: transfer_frame

  transfer_frame:
    seq:
      - id: asm
        doc: attached synchronization marker
        type: b32
        valid: 0x1ACFFC1D
      - id: tfvn
        doc: transfer frame version number, valid - 0
        type: b2
      - id: scid
        doc: spacecraft identifier - valid 0xBE
        type: b10
      - id: vcid
        doc: virtual channel identifier - valid 0x0..0x7
        type: b3
      - id: ocff
        doc: operational control field flag - valid false
        type: b1
      - id: mcfc
        doc: master channel frame count - valid 0..255
        type: u1
      - id: vcfc
        doc: virtual channel frame count - valid 0..255
        type: u1
      - id: tf_shf
        doc: tf secondary header flag
        type: b1
        valid: false
      - id: sync_flag
        doc: synchronization_fag
        type: b1
        valid: false
      - id: pof
        doc: packet order flag
        type: b1
        valid: false
      - id: slid
        doc: segment length identifier
        type: b2
        valid: 0x3
      - id: fhp
        doc: first header pointer
        type: b11
        valid: 0x0
      - id: source_packet
        type: source_packet
      - id: fecf
        doc: frame error control field (ccsds) - unit -
        type: u2
    instances:
      two_byte_combined:
        doc: combine tfvn, scid, vcid and ocff to two bytes in order to check whether offline transfer frame contains any valid data, does not contain any if these bytes are FFFF
        value: tfvn << 14 | scid << 4 | vcid << 1 | ocff.to_i

  source_packet:
    seq:
      - id: pvn
        doc: packet version number
        type: b3
        valid: 0x0
      - id: pt
        doc: packet type
        type: b1
        valid: false
      - id: shf
        doc: secondary header flag
        type: b1
        valid: false
      - id: apid
        doc: application process identifier - valid 0x0..0x7ff
        type: b11le
      - id: sequence_flag
        doc: valid 0x0..0x3
        type: b2
      - id: psc
        doc: packet sequence control - valid 0x0..0x3FFF
        type: b14
      - id: pdl
        doc: packet data length
        type: b16
      - id: telemetry_values
        doc: check whether it contains actual data or is unused (tfvn, scid, vcid and ocff = 0xFFFF)
        type:
          switch-on: _parent.two_byte_combined
          cases:
            0xFFFF: telemetry_values_unused
            _: telemetry_values

  telemetry_values:
    seq:
      - id: analog_value_01
        doc: voltage solar array - unit V
        type: voltage_0
      - id: psant0
        doc: Power state antenna release mechanism 0 - unit On/Off
        type: b1
      - id: psant1
        doc: Power state antenna release mechanism 1 - unit On/Off
        type: b1
      - id: pscom0
        doc: inactive
        type: b1
      - id: pscom1
        doc: inactive
        type: b1
      - id: analog_value_02
        doc: voltage battery 0 - unit V
        type: voltage_1
      - id: psuhf0
        doc: power state trx0 - unit On/Off
        type: b1
      - id: psuhf1
        doc: power state trx1 - unit On/Off
        type: b1
      - id: pstnc0
        doc: power state tnc0 - unit On/Off
        type: b1
      - id: pstnc1
        doc: power state tnc1 - unit On/Off
        type: b1
      - id: analog_value_03
        doc: voltage battery 1 - unit V
        type: voltage_1
      - id: psgyro
        doc: Power state gyro system - unit On/Off
        type: b1
      - id: psmcsx
        doc: power state magnetic coil system x - unit On/Off
        type: b1
      - id: psmcsy
        doc: power state magnetic coil system y - unit On/Off
        type: b1
      - id: psmcsz
        doc: power state magnetic coil system z - unit On/Off
        type: b1
      - id: analog_value_04
        doc: voltage bus 5V - unit V
        type: voltage_0
      - id: pswhee
        doc: power state wheel system - unit On/Off
        type: b1
      - id: psobc0
        doc: power state obc 0 - unit On/Off
        type: b1
      - id: psobc1
        doc: power state obc 1 - unit On/Off
        type: b1
      - id: pspdh0
        doc: power state phd - unit On/Off
        type: b1
      - id: analog_value_05
        doc: voltage bus 3.3V - unit V
        type: voltage_2
      - id: pscam0
        doc: power state payload camera - unit On/Off
        type: b1
      - id: pssuns
        doc: power state sun sensor system - unit On/Off
        type: b1
      - id: psmfs0
        doc: power state magnetic field sensors system 0 - unit On/Off
        type: b1
      - id: psmfs1
        doc: power state magnetic field sensors system 1 - unit On/Off
        type: b1        
      - id: analog_value_06
        doc: current charger 0 output - unit mA
        type: ampere_0
      - id: pstemp
        doc: power state temperature sensors - unit On/Off
        type: b1
      - id: pscan0
        doc: power state can bus 0 - unit On/Off
        type: b1
      - id: pscan1
        doc: power state can bus 1 - unit On/Off
        type: b1
      - id: psccw0
        doc: power state wde can bus 0 - unit On/Off
        type: b1
      - id: analog_value_07
        doc: current charger 1 output - unit mA
        type: ampere_0
      - id: psccw1
        doc: power state wde can bus 1 - unit On/Off
        type: b1
      - id: ps5vcn
        doc: power state 5V main switch - unit On/Off
        type: b1
      - id: reserved00
        doc: reserved - unit -
        type: b1
      - id: pcbobc
        doc: startup obdh id - unit 0/1
        type: b1
      - id: analog_value_08
        doc: temperature battery 0 - unit C
        type: celsius_0
      - id: pcbext
        doc: boot external flash - unit 0/1
        type: b1
      - id: pcch00
        doc: pcdu check channel 00 - unit On/Off
        type: b1
      - id: pcch01
        doc: pcdu check channel 01 - unit On/Off
        type: b1
      - id: pcch02
        doc: pcdu check channel 02 - unit On/Off
        type: b1
      - id: analog_value_09
        doc: temperature battery 1 - unit C
        type: celsius_0
      - id: pcch03
        doc: pcdu check channel 03 - unit On/Off
        type: b1
      - id: pcch04
        doc: pcdu check channel 04 - unit On/Off
        type: b1
      - id: pcch05
        doc: pcdu check channel 05 - unit On/Off
        type: b1
      - id: pcch06
        doc: pcdu check channel 06 - unit On/Off
        type: b1
      - id: analog_value_10
        doc: signal strength tnc 0 - unit s-meter
        type: b12
      - id: pcch07
        doc: pcdu check channel 07 - unit On/Off
        type: b1
      - id: pcch08
        doc: pcdu check channel 08 - unit On/Off
        type: b1
      - id: pcch09
        doc: pcdu check channel 09 - unit On/Off
        type: b1
      - id: pcch10
        doc: pcdu check channel 10 - unit On/Off
        type: b1
      - id: analog_value_11
        doc: signal strength tnc 1 - unit s-meter
        type: b12
      - id: pcch11
        doc: pcdu check channel 11 - unit On/Off
        type: b1
      - id: pcch12
        doc: pcdu check channel 12 - unit On/Off
        type: b1
      - id: pcch13
        doc: pcdu check channel 13 - unit On/Off
        type: b1
      - id: pcch14
        doc: pcdu check channel 14 - unit On/Off
        type: b1
      - id: analog_value_12
        doc: current wheel drive electronics - unit mA
        type: ampere_1
      - id: pcch15
        doc: pcdu check channel 15 - unit On/Off
        type: b1
      - id: pcch16
        doc: pcdu check channel 16 - unit On/Off
        type: b1
      - id: pcch17
        doc: pcdu check channel 17 - unit On/Off
        type: b1
      - id: pcch18
        doc: pcdu check channel 18 - unit On/Off
        type: b1
      - id: analog_value_13
        doc: temperature wheel x - unit C
        type: celsius_1
      - id: pcch19
        doc: pcdu check channel 19 - unit On/Off
        type: b1
      - id: pcch20
        doc: pcdu check channel 20 - unit On/Off
        type: b1
      - id: pcch21
        doc: pcdu check channel 21 - unit On/Off
        type: b1
      - id: pcch22
        doc: pcdu check channel 22 - unit On/Off
        type: b1
      - id: analog_value_14
        doc: temperature wheel y - unit C
        type: celsius_1
      - id: pcch23
        doc: pcdu check channel 23 - unit On/Off
        type: b1
      - id: pcch24
        doc: pcdu check channel 24 - unit On/Off
        type: b1
      - id: pcch25
        doc: pcdu check channel 25 - unit On/Off
        type: b1
      - id: pcch26
        doc: pcdu check channel 26 - unit On/Off
        type: b1
      - id: analog_value_15
        doc: temperature wheel z - unit C
        type: celsius_1
      - id: tcrxid
        doc: receiving tnc id - unit 0/1
        type: b1
      - id: obcaid
        doc: active obdh id - unit 0/1
        type: b1
      - id: tmtxrt
        doc: tx baudrate - if bit=0 -> baudrate=4800; if bit=1 -> baudrate=9600 - unit bps
        type: b1
      - id: pcch27
        doc: pcdu check channel 27 - unit On/Off
        type: b1
      - id: analog_value_16
        doc: current charger 0 input - unit mA
        type: ampere_1
      - id: pcch28
        doc: pcdu check channel 28 - unit On/Off
        type: b1
      - id: pcch29
        doc: pcdu check channel 29 - unit On/Off
        type: b1
      - id: pcch30
        doc: pcdu check channel 30 - unit On/Off
        type: b1
      - id: pcch31
        doc: pcdu check channel 31 - unit On/Off
        type: b1
      - id: ccticc
        doc: immediate command counter - unit 1
        type: u1
      - id: cctctt
        doc: time tagged command counter - unit 1
        type: u1
      - id: ccetcs
        doc: error counter, command checksum - unit 1
        type: u1
      - id: cceimc
        doc: error counter, immediate command - unit 1
        type: u1
      - id: ccettc
        doc: error counter, time tagged command - unit 1
        type: u1
      - id: ccettg
        doc: error counter, time tag - unit 1
        type: u1
      - id: ccetcc
        doc: error counter, unknown command code - unit 1
        type: u1
      - id: tcrxqu
        doc: receiving tnc quality byte - unit dB
        type: db_0
      - id: tcfrcp
        doc: free command pool - unit 1
        type: u2
      - id: tmhkur
        doc: housekeeping update rate - unit sec
        type: u2
      - id: cstutc
        doc: on board time in utc - unit sec
        type: u4
      - id: cstsys
        doc: obc uptime - unit sec
        type: u4
      - id: obcbad
        doc: boot address - unit 0/1/2/3
        type: u1
      - id: ceswmc
        doc: error counter for missing magic code - unit 1
        type: u1
      - id: reserved01
        doc: reserved - unit -
        type: u1
      - id: beacon
        doc: beacon mode - unit On/Off
        type: u1
      - id: obcabc
        doc: active obdh boot counter - unit 1
        type: u1
      - id: modobc
        doc: satellite mode - unit 1
        type: u1
      - id: ccecan
        doc: can error counter - unit 1
        type: u1
      - id: obccan
        doc: can bus id - unit 1
        type: u1
      - id: pcsyst
        doc: pcdu uptime - unit 1
        type: u2
      - id: pcbcnt
        doc: pcdu boot counter - unit 1
        type: u1
      - id: pctxec
        doc: pcdu can msg transmit error counter - unit 1
        type: u1
      - id: pcrxec
        doc: pcdu can msg receive error counter - unit 1
        type: u1
      - id: pcoffc
        doc: pcdu can bus offline error counter - unit 1
        type: u1
      - id: pcackc
        doc: pcdu can bus acknowledge error counter - unit 1
        type: u1
      - id: pcch32
        doc: pcdu check channel 32 - unit On/Off
        type: b1
      - id: pcch33
        doc: pcdu check channel 33 - unit On/Off
        type: b1
      - id: pcch34
        doc: pcdu check channel 34 - unit On/Off
        type: b1
      - id: pcch35
        doc: pcdu check channel 35 - unit On/Off
        type: b1
      - id: pcch36
        doc: pcdu check channel 36 - unit On/Off
        type: b1
      - id: pcch37
        doc: pcdu check channel 37 - unit On/Off
        type: b1
      - id: pcch38
        doc: pcdu check channel 38 - unit On/Off
        type: b1
      - id: pcch39
        doc: pcdu check channel 39 - unit On/Off
        type: b1
      - id: pcch40
        doc: pcdu check channel 40 - unit On/Off
        type: b1
      - id: pcch41
        doc: pcdu check channel 41 - unit On/Off
        type: b1
      - id: reserved02
        doc: reserved - unit -
        type: b14
      - id: analog_value_17
        doc: current charger 1 input - unit mA
        type: ampere_1
      - id: reserved03
        doc: reserved - unit -
        type: b4
      - id: analog_value_18
        doc: temperature pcdu ext. adc 0 - unit C
        type: celsius_2
      - id: reserved04
        doc: reserved - unit -
        type: b4
      - id: analog_value_19
        doc: temperature magnetic field sensor 0 - unit C
        type: celsius_1
      - id: reserved05
        doc: reserved - unit -
        type: b4
      - id: acswhx
        doc: reaction wheel speed x - unit rpm
        type: s2
      - id: acswhy
        doc: reaction wheel speed y - unit rpm
        type: s2
      - id: acswhz
        doc: reaction wheel speed z - unit rpm
        type: s2
      - id: acsq00
        doc: acs quaternion 00 - unit 1
        type: acs_0
      - id: acsq01
        doc: acs quaternion 01 - unit 1
        type: acs_0
      - id: acsq02
        doc: acs quaternion 02 - unit 1
        type: acs_0
      - id: acsq03
        doc: acs quaternion 03 - unit 1
        type: acs_0
      - id: acssux
        doc: acs sun vector x - unit 1
        type: acs_0
      - id: acssuy
        doc: acs sun vector y - unit 1
        type: acs_0
      - id: acssuz
        doc: acs sun vector z - unit 1
        type: acs_0
      - id: acsm0x
        doc: acs magnetic field sensor 0 vector x - unit nT
        type: acs_1
      - id: acsm0y
        doc: acs magnetic field sensor 0 vector y - unit nT
        type: acs_1
      - id: acsm0z
        doc: acs magnetic field sensor 0 vector z - unit nT
        type: acs_1
      - id: acsm1x
        doc: acs magnetic field sensor 1 vector x - unit nT
        type: acs_1
      - id: acsm1y
        doc: acs magnetic field sensor 1 vector y - unit nT
        type: acs_1
      - id: acsm1z
        doc: acs magnetic field sensor 1 vector z - unit nT
        type: acs_1
      - id: acsmod
        doc: acs mode - unit 1
        type: b4
      - id: acsgsc
        doc: ground station contact flag - unit 0/1
        type: b1
      - id: acsshd
        doc: shadow flag - unit 0/1
        type: b1
      - id: reserved06
        doc: reserved - unit -
        type: b2
      - id: acserr
        doc: acs error code - unit 1
        type: u1
      - id: acsgyx
        doc: gyro rate x - unit deg/s
        type: acs_2
      - id: acsgyy
        doc: gyro rate y - unit deg/s
        type: acs_3
      - id: acsgyz
        doc: gyro rate z - unit deg/s
        type: acs_4
      - id: analog_value_20
        doc: temperature obc ext adc 0 - unit C
        type: celsius_2
      - id: reserved07
        doc: reserved - unit -
        type: b4
      - id: analog_value_21
        doc: current solar array x+ - unit mA
        type: ampere_2
      - id: reserved08
        doc: reserved - unit -
        type: b4
      - id: analog_value_22
        doc: current solar array y+ - unit mA
        type: ampere_2
      - id: reserved09
        doc: reserved - unit -
        type: b4
      - id: analog_value_23
        doc: current solar array z+ - unit mA
        type: ampere_2
      - id: reserved10
        doc: reserved - unit -
        type: b4
      - id: analog_value_24
        doc: temperature gyro rate x - unit C
        type: celsius_3
      - id: reserved11
        doc: reserved - unit -
        type: b4

  telemetry_values_unused:
    seq:
      - id: unused00
        doc: does not contain any data
        type: unused8
      - id: unused01
        doc: does not contain any data
        type: unused8
      - id: unused02
        doc: does not contain any data
        type: unused8
      - id: unused03
        doc: does not contain any data
        type: unused8
      - id: unused04
        doc: does not contain any data
        type: unused8
      - id: unused05
        doc: does not contain any data
        type: unused8
      - id: unused06
        doc: does not contain any data
        type: unused8
      - id: unused07
        doc: does not contain any data
        type: unused8
      - id: unused08
        doc: does not contain any data
        type: unused8
      - id: unused09
        doc: does not contain any data
        type: unused8
      - id: unused10
        doc: does not contain any data
        type: unused8
      - id: unused11
        doc: does not contain any data
        type: unused8
      - id: unused12
        doc: does not contain any data
        type: unused8
      - id: unused13
        doc: does not contain any data
        type: unused8
      - id: unused14
        doc: does not contain any data
        type: unused8
      - id: unused15
        doc: does not contain any data
        type: unused4
      - id: unused16
        doc: does not contain any data
        type: unused2

# special type definitions
  voltage_0:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.001619779146 * raw.as<f8>

  voltage_1:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.0033725265168795620437956204379562 * raw.as<f8>

  voltage_2:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.001220703125 * raw.as<f8>

  ampere_0:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.6103515625 * raw.as<f8>
        
  ampere_1:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.30517578125 * raw.as<f8>

  ampere_2:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.152587891 * raw.as<f8>

  celsius_0:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.244140625 * raw.as<f8> - 50

  celsius_1:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.06103515625 * raw.as<f8> - 50

  celsius_2:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.125 * raw.as<f8>

  celsius_3:
    seq:
      - id: raw
        type: b12
    instances:
      value:
        value: 0.48577 * raw.as<f8> - 270.595

  db_0:
    seq:
      - id: raw
        type: u1
    instances:
      value:
        value: 0.0548780487 * raw.as<f8> + 1.573172

  acs_0:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: 0.0001 * raw.as<f8>

  acs_1:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: 10 * raw.as<f8>

  acs_2:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: 0.0573 * raw.as<f8> + 19.7097

  acs_3:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: -0.0573 * raw.as<f8> + 21.9443

  acs_4:
    seq:
      - id: raw
        type: s2
    instances:
      value:
        value: -0.0573 * raw.as<f8> + 2.5210

  unused8:
    seq:
      - id: raw
        type: u8
    instances:
      value:
        value: 0 * raw
  
  unused4:
    seq:
      - id: raw
        type: u4
    instances:
      value:
        value: 0 * raw  

  unused2:
    seq:
      - id: raw
        type: u2
    instances:
      value:
        value: 0 * raw
