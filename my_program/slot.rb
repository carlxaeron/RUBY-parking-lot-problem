class Slot
    attr_accessor :id, :vehicle

    def initialize(id)
        @id = id.to_i
    end
end