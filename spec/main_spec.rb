require './my_program.rb'

# create a input file
filename = rand(1..100)
output = File.new("#{filename.hash}.txt", "w")
output.puts("test")
output.close

# delete file
File.delete("#{filename}.txt")