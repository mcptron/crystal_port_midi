require "./spec_helper"

MESSAGE = 0x00ff8090_u32
STATUS = 0x90_u8
DATA1 = 0x80_u8
DATA2 = 0xff_u8

describe PortMIDI do

  it "creates a PortMidi message from bytes" do
    PortMIDI.message(STATUS, DATA1, DATA2).should eq(MESSAGE)
  end

  it "extracts status byte from a message" do
    PortMIDI.status(MESSAGE).should eq(STATUS)
  end

  it "extracts data1 from a message" do
    PortMIDI.data1(MESSAGE).should eq(DATA1)
  end

  it "extracts data2 from a message" do
    PortMIDI.data2(MESSAGE).should eq(DATA2)
  end

  it "extracts byte array from a message" do
    PortMIDI.bytes(MESSAGE).should eq(StaticArray[STATUS, DATA1, DATA2, 0_u8])
  end

  it "extracts byte array from an event" do
    e = LibPortMIDI::Event.new(message: MESSAGE)
    PortMIDI.bytes(e).should eq(StaticArray[STATUS, DATA1, DATA2, 0_u8])
  end
end
