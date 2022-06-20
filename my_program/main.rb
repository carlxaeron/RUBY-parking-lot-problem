require './my_program/parking_lot'

class Main
    attr_accessor :Parking
    attr_accessor :output

    def initialize
        @Parking = ParkingLot.new
        @output = []
    end
    
    def init(file = nil, cmd = nil)
        if(file != nil)
            main(file)
        else
            process_cmd(cmd)
        end
    end
    
    def process_cmd(txt)
        cmd = nil
        if(defined?(txt.split))
            cmd = txt.split ' '
        else
            cmd = txt
        end

        if(cmd.nil?)
        else
            case cmd[0]
                when "create_parking_lot"
                    @Parking.create_parking_lot(cmd[1])
                    @output.push(puts "Created a parking lot with #{cmd[1]} slots")
                when "park"
                    slot = @Parking.park(plate: cmd[1], color: cmd[2])
                    slot ? @output.push(puts "Allocated slot number: #{slot}") : @output.push(puts(@Parking.slots.length > 0 ? "Sorry, parking lot is full" : "Please create parking lot first."))
                when "leave"
                    _exists = @Parking.leave(cmd[1])
                    _exists ? @output.push(puts "Slot number #{cmd[1]} is free") : puts("Slot number not exists")
                when "status"
                    @output.push(puts "")
                    @output.push(puts "Slot No. | Plate No | Colour")
                    @Parking.slots.each do |slot|
                        if(slot && slot.vehicle != nil)
                            @output.push(puts "#{slot.id} | #{slot.vehicle.plate} | #{slot.vehicle.color}")
                        end
                    end
                    @output.push(puts "")
                when "plate_numbers_for_cars_with_colour"
                    _txt = []
                    @Parking.slots.each do |slot|
                        if(slot && slot.vehicle != nil)
                            if(slot.vehicle.color == cmd[1])
                                _txt.push(slot.vehicle.plate)
                            end
                        end
                    end
                    @output.push(puts _txt.length > 0 ? _txt.join(", ") : "Not found")
                when "slot_numbers_for_cars_with_colour"
                    _txt = []
                    @Parking.slots.each do |slot|
                        if(slot && slot.vehicle != nil)
                            if(slot.vehicle.color == cmd[1])
                                _txt.push(slot.id)
                            end
                        end
                    end
                    @output.push(puts _txt.length > 0 ? _txt.join(", ") : "Not found")
                when "slot_number_for_registration_number"
                    _txt = []
                    @Parking.slots.each do |slot|
                        if(slot && slot.vehicle != nil)
                            if(slot.vehicle.plate == cmd[1])
                                _txt.push(slot.id)
                            end
                        end
                    end
                    @output.push(puts _txt.length > 0 ? _txt.join(", ") : "Not found")
                when "help"
                    puts "\ncreate_parking_lot {number}\npark {pleate number} {color}\nleave {slot number}\nstatus"
                else
                    puts "unknown command. to check all available commands type 'help'. to exit type 'exit'."
            end
        end
    end
    
    def main(file)
        # when command does not have input file argument then default to file_inputs.txt
        fileObj = File.open(file || ARGV[0] || "file_inputs.txt", "r")
        fileObj.each_line do |line|
                process_cmd(line)
            end
        fileObj.close

        puts @output
    end
end