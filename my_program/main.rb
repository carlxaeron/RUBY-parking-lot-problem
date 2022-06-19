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
                @output.push("Allocated slot number: #{slot}")
            when "leave"
                @Parking.leave(cmd[1])
                @output.push("Slot number #{cmd[1]} is free")
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