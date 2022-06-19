# create an input file and read and delete
file = Files.new
file.create('create_parking_lot 7
park ABC-1234 White
park ABC-9999 White
park ABC-0001 Black
park ABC-7777 Red
park ABC-2701 Blue
park ABC-3141 Black')
main = Main.new("#{file.filename}.txt")
describe Main do
    describe 'Parking' do
        context "slots" do
            it "returns 7" do
                expect(main.Parking.slots.length).to eq 7
            end
        end
        context 'Slot #1' do
            it "returns id 1" do
                expect(main.Parking.slots[0].id).to eq Slot.new(1).id
            end
            context 'Vehicle' do
                it "returns vehicle not null" do
                    expect(main.Parking.slots[0].vehicle).not_to eq nil
                end
                it "returns vehicle plate" do
                    expect(main.Parking.slots[0].vehicle.plate).to eq 'ABC-1234'
                end
                it "returns vehicle color" do
                    expect(main.Parking.slots[0].vehicle.color).to eq 'White'
                end
            end
        end
    end
    # delete file
    file.delete()
end