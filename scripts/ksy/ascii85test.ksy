---
meta:
  id: ascii85test
doc: |
  :field encoded: textstring.b85encstring.encoded
  :field decoded: b85string.b85decstring.decoded
seq:
  - id: textstring
    type: b85enc
    terminator: 0x0a
  - id: b85string
    type: b85dec
    terminator: 0x0a
types:
  b85enc:
    seq:
      - id: b85encstring
        process: satnogsdecoders.process.b85encode
        type: base85string
        size-eos: true
  b85dec:
    seq:
      - id: b85decstring
        process: satnogsdecoders.process.b85decode
        type: textstring
        size-eos: true
  base85string:
    seq:
      - id: encoded
        type: str
        encoding: ASCII
        size-eos: true
  textstring:
    seq:
      - id: decoded
        type: str
        encoding: ASCII
        size-eos: true
