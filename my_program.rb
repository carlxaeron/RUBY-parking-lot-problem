require './my_program/parking_lot'
Parking = ParkingLot.new

def process_cmd(txt)
    cmd = txt.split ' '
    case cmd[0]
        when "create_parking_lot"
            Parking.create_parking_lot(cmd[1])
    end
end

def main
    # when command does not have input file argument then default to file_inputs.txt
    fileObj = File.open(ARGV[0] || "file_inputs.txt", "r")
    fileObj.each_line do |line|
            process_cmd(line)
        end
    fileObj.close

    puts Parking.inspect
end

main()