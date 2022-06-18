require './my_program/slot'

class ParkingLot
    attr_accessor :slots

    def create_parking_lot(num)
        @slots = []
        num.to_i.times do |i|
            slot_num = i + 1
            @slots[i] = Slot.new(slot_num)
        end
    end
end