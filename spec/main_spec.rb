require './my_program/main'
require './spec/file'

file = Files.new

# create an input file and read and delete
file.create('create_parking_lot 6')
main = Main.new("#{file.filename}.txt")

describe Main do
    describe 'Parking' do
        context "slots" do
            it "returns 6" do
                expect(main.Parking.slots.length).to eq 6
            end
        end
    end
end

file.delete()