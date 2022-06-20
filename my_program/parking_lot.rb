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
        if(@slots.length != 0)
            @slots.each do |slot|
                if slot && slot.vehicle == nil && id == false
                    slot.vehicle = Vehicle.new(plate, color)
                    id = slot.id
                end
            end
        end
        return id
    end

    def leave(num)
        if(@slots[num.to_i - 1].nil?)
            return false
        else
            @slots[num.to_i - 1] = Slot.new(num)
            return true
        end
    end
end