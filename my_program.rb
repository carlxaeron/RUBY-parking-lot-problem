def main
    # when command does not have input file argument then default to file_inputs.txt
    fileObj = File.open(ARGV[0] || "file_inputs.txt", "r")
    fileObj.each_line do |line|
            puts line
        end
    fileObj.close
end

main()