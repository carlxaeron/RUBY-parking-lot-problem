require './my_program/main'

main = Main.new

while (command = gets.chomp) != "exit"
    main.process_cmd(command)
end


