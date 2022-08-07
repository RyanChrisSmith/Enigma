require './lib/enigma'

enigma = Enigma.new

encrypted = enigma.encrypt(File.read(ARGV[0]))
File.open(ARGV[1], 'w') do |file|
  file.puts encrypted[:encryption]
  puts "created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]} "
end