class Files
    attr_accessor :filename

    def initialize()
        @filename = rand(1..100)
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
end