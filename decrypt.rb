require './lib/enigma'

enigma = Enigma.new

input = ARGV[0]
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]

decrypted = enigma.decrypt(File.read(input), key, date)
File.open(output, 'w') do |file|
  file.puts decrypted[:decryption]
  puts "created #{output} with the key #{decrypted[:key]} and date #{decrypted[:date]}"
end