require './my_program.rb'

filename = rand(1..100)
output = File.new("#{filename}.txt", "w")
output.puts("test")
output.close
