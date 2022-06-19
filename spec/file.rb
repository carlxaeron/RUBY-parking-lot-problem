class Files
    attr_accessor :filename

    def initialize(file = nil)
        @filename = file || rand(1..100)
    end

    def create(txt)
        output = File.new("#{@filename}.txt", "w")
        txt.each_line do |line|
            output.puts(line)
        end
        output.close
    end

    def delete
        File.delete("#{@filename}.txt")
    end

    def read
        f = File.open("#{@filename}.txt", "r")
        f.each_line do |line|
            puts line
        end
        f.close
    end
end