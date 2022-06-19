require './my_program/main'
require './spec/file'

file = Files.new

# create a input file
file.create('hello world
1234
abcdefghijklmnopqrstuvwxyz
')

main(file.filename)

# delete file
file.delete