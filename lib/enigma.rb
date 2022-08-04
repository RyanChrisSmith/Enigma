class Enigma
  attr_reader :char_set

  def initialize
    @char_set = ('a'..'z').to_a << ' '
  end

  def key_generator
    rand(99999).to_s.rjust(5, "0")
  end

end