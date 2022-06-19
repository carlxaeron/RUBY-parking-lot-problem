# create an input file and read and delete
file = Files.new
file.create('create_parking_lot 6')
main = Main.new("#{file.filename}.txt")
describe 'Test2' do
    describe 'Parking' do
        context "slots" do
            it "returns 6" do
                expect(main.Parking.slots.length).to eq 6
            end
        end
        context 'Slot #1' do
            it "returns id 1" do
                expect(main.Parking.slots[0].id).to eq Slot.new(1).id
            end
            it "returns vehicle null" do
                expect(main.Parking.slots[0].vehicle).to eq nil
            end
        end
    end
    # delete file
    file.delete()
end