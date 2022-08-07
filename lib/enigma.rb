require './lib/todays_datable'
require './lib/key_generatable'

class Enigma
  include TodaysDatable
  include KeyGeneratable
  attr_reader :char_set,
              :key,
              :date

  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key = key_generator, date = todays_date)

    characters = message.chars
    offset = (date.to_i ** 2).to_s.slice(-4..-1)
    a_shift = (offset[0].to_i) + (key[0..1].to_i)
    b_shift = (offset[1].to_i) + (key[1..2].to_i)
    c_shift = (offset[2].to_i) + (key[2..3].to_i)
    d_shift = (offset[3].to_i) + (key[3..4].to_i)

    encrypted_message = []
    characters.each_with_index do |character, index|
      character.downcase!
      if @char_set.include?(character) == false
        encrypted_message << character
      elsif
        index % 4 == 0
        encrypted_message << @char_set.rotate(a_shift)[@char_set.index(character)]
      elsif
        index % 4 == 1
        encrypted_message << @char_set.rotate(b_shift)[@char_set.index(character)]
      elsif
        index % 4 == 2
        encrypted_message << @char_set.rotate(c_shift)[@char_set.index(character)]
      elsif
        index % 4 == 3
        encrypted_message << @char_set.rotate(d_shift)[@char_set.index(character)]
      end
    end
     encrypted = {encryption: encrypted_message.join, key: key, date: date}
  end

  def decrypt(message, key, date = todays_date)
    characters = message.chars
    offset = (date.to_i ** 2).to_s.slice(-4..-1)
    a_shift = (offset[0].to_i) + (key[0..1].to_i)
    b_shift = (offset[1].to_i) + (key[1..2].to_i)
    c_shift = (offset[2].to_i) + (key[2..3].to_i)
    d_shift = (offset[3].to_i) + (key[3..4].to_i)

    decrypted_message = []
    characters.each_with_index do |character, index|
      character.downcase!
      if @char_set.include?(character) == false
        decrypted_message << character
      elsif
        index % 4 == 0
        decrypted_message << @char_set.rotate((a_shift)*-1)[@char_set.index(character)]
      elsif
        index % 4 == 1
        decrypted_message << @char_set.rotate((b_shift)*-1)[@char_set.index(character)]
      elsif
        index % 4 == 2
        decrypted_message << @char_set.rotate((c_shift)*-1)[@char_set.index(character)]
      elsif
        index % 4 == 3
        decrypted_message << @char_set.rotate((d_shift)*-1)[@char_set.index(character)]
      end
    end
    decrypted = {decryption: decrypted_message.join, key: key, date: date}
  end

end