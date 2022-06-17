fileObj = File.open("file_inputs.txt", "r")
fileObj.each_line do |line|
        puts line
    end
fileObj.close