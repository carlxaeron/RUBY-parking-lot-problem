require './my_program.rb'
require './spec/file.rb'

file = Files.new

# create a input file
file.create('hello world
1234
abcdefghijklmnopqrstuvwxyz
')

# delete file
file.delete