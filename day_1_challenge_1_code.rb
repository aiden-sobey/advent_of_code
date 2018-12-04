def parse_input(file_name)
  text = File.open(file_name).read.split("\n")
  text.map { |s| s.to_i }
end

def sum_array(input)
  input.inject(0, :+)
end

puts "Day 1 Answer: " + sum_array(parse_input('day_1_input.txt')).to_s

# Alternative one line solution:
#puts File.open('day_1_input.txt').read.split("\n").map { |s| s.to_i }.inject(0, :+).to_s
