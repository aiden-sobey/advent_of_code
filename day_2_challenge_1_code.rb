require 'byebug'

def parse_input(file_name)
  File.open(file_name).read.split("\n")
end

def empty_hash
  {
    a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0, i: 0,
    j: 0, k: 0, l: 0, m: 0, n: 0, o: 0, p: 0, q: 0, r: 0,
    s: 0, t: 0, u: 0, v: 0, w: 0, x: 0, y: 0, z: 0
  }
end

def count_occurences(chars)
  freq_table = empty_hash

  chars.each { |c| freq_table[c.to_sym] += 1 }
  freq_table
end

def has_multiple?(table, goal)
  table.values.each { |val| return true if val == goal }
  false
end

ids = parse_input('day_2_input.txt')
num_doubles = num_triples = 0

ids.each do |id|
  freq_table = count_occurences(id.chars)
  num_doubles += 1 if has_multiple?(freq_table, 2)
  num_triples += 1 if has_multiple?(freq_table, 3)
end

puts "Answer = #{num_doubles * num_triples}"
