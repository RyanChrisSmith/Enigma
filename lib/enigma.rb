require 'todays_datable'
require 'key_generatable'

class Enigma
  include TodaysDatable
  include KeyGeneratable
  attr_reader :char_set

  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

end