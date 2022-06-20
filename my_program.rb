require './my_program/main'

main = Main.new

while (command = gets) != "exit"
    if(command == "\n" || command.nil?)
        exit
    end
    main.process_cmd(command)
end
