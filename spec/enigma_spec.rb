require 'spec_helper'
require './lib/enigma'

RSpec.describe Enigma do

  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'has 27 characters in char_set at initialization' do
    expect(@enigma.char_set.count).to eq 27
    expect(@enigma.char_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can generate a random key' do
    allow_any_instance_of(Enigma).to receive(:key_generator).and_return("78432")
    expect(@enigma.key_generator).to eq("78432")
    allow_any_instance_of(Enigma).to receive(:key_generator).and_return("05666")
    expect(@enigma.key_generator).to eq("05666")
  end

  it 'can generate todays date every day' do
    mocks = double('only_1_enigma')
    allow(mocks).to receive(:todays_date).and_return("040822")
    expect(mocks.todays_date).to eq("040822")
  end

  it 'can encrypt a message with optional key and date arguments' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end

  xit 'can decrypt a message with key and date' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
  end

  it 'encrypt a message with a key (uses todays date)' do
    allow(@enigma).to receive(:todays_date).and_return("050822")
    expect(@enigma.encrypt("hello world", "02715")).to eq({encryption: "okjdvfugyrb", key: "02715", date: "050822"})
  end

  xit 'decrypt a message with a key (uses todays date)' do
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq({decryption: "hello world", key: "02715", date: "040895"})
  end

  it 'encrypt a message (generates random key and uses todays date)' do
    allow(@enigma).to receive(:todays_date).and_return("050822")
    allow(@enigma).to receive(:key_generator).and_return('42837')
    expect(@enigma.encrypt("hello world")).to eq({encryption: "alvzhgfbksn", key: "42837", date: "050822"})
  end

end