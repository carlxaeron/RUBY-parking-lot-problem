require './my_program/parking_lot'

class Main
    attr_accessor :Parking
    attr_accessor :output
    
    def initialize(file = nil)
        @Parking = ParkingLot.new
        @output = []

        main(file)
    end
    
    def process_cmd(txt)
        cmd = txt.split ' '
        case cmd[0]
            when "create_parking_lot"
                @Parking.create_parking_lot(cmd[1])
                @output.push("Created a parking lot with #{cmd[1]} slots")
            when "park"
                slot = @Parking.park(plate: cmd[1], color: cmd[2])
                slot ? @output.push("Allocated slot number: #{slot}") : @output.push("Sorry, parking lot is full")
            when "leave"
                @Parking.leave(cmd[1])
                @output.push("Slot number #{cmd[1]} is free")
            when "status"
                @output.push("")
                @output.push("Slot No. | Plate No | Colour")
                @Parking.slots.each do |slot|
                    if(slot.vehicle != nil)
                        @output.push("#{slot.id} | #{slot.vehicle.plate} | #{slot.vehicle.color}")
                    end
                end
                @output.push("")
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