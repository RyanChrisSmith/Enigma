require './lib/enigma'

enigma = Enigma.new


# encryption = enigma.encrypt(File.read(ARGV[0]))
# File.open(ARGV[1], "w") do |file|
#   file.puts encryption[:message]
#   puts "created #{ARGV[1]} with the key #{ecnryption[:key]} and date #{encryption[:date]} "
# end