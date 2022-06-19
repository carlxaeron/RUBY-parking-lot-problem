require './my_program/slot'
require './my_program/vehicle'

class ParkingLot
    attr_accessor :slots

    def initialize
        @slots = []
    end

    def create_parking_lot(num)
        @slots = []
        num.to_i.times do |i|
            slot_num = i + 1
            @slots[i] = Slot.new(slot_num)
        end
    end

    def park(plate: nil, color: nil)
        id = false
        @slots.each do |slot|
            if slot.vehicle == nil && id == false
                slot.vehicle = Vehicle.new(plate, color)
                id = slot.id
            end
        end
        return id
    end
end