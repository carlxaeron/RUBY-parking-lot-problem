require './my_program/main'

main = Main.new

while (command = gets) != "exit"
    main.process_cmd(command)
end


