require './my_program/parking_lot'
Parking = ParkingLot.new

def process_cmd(cmd)
    puts Parking
    case cmd
        when "create_parking_lot"
    end
            
end

# START HERE
def main
    # when command does not have input file argument then default to file_inputs.txt
    fileObj = File.open(ARGV[0] || "file_inputs.txt", "r")
    fileObj.each_line do |line|
            process_cmd(line)
        end
    fileObj.close
end

main()