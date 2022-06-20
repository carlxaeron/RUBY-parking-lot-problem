describe 'Test4' do
    # create an input file and read and delete
    file = Files.new()
    file.create('create_parking_lot 6
    park ABC-1234 White
    park ABC-1234 White
    park ABC-1234 White
    park ABC-1234 White
    park ABC-1234 White
    leave 4
    status')
    main = Main.new
    main.init("#{file.filename}.txt")
    describe 'Parking2' do
        context "slots" do
            it "returns 6" do
                expect(main.Parking.slots.length).to eq 6
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
        context 'Slot #4' do
            it "returns id 4" do
                expect(main.Parking.slots[3].id).to eq Slot.new(4).id
            end
            context 'Vehicle' do
                it "returns vehicle null" do
                    expect(main.Parking.slots[3].vehicle).to eq nil
                end
            end
        end
        # context 'Output' do
        #     it "returns not []" do
        #         expect(main.output).not_to eq []
        #     end
        #     it "return true on Created" do
        #         expect(main.output.join("\n")).to match(/Created/)
        #     end
        # end
    end
    # delete file
    file.delete()    
end