require 'todays_datable'
require 'key_generatable'

class Enigma
  include TodaysDatable
  include KeyGeneratable
  attr_reader :char_set,
              :message,
              :key,
              :date

  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key = key_generator, date = todays_date)
require 'pry' ; binding.pry
  end

end