require 'byebug'

def parse_input(file_name)
  File.open(file_name).read.split("\n")
end

def different_letter(id_1, id_2)
  id_1.each_with_index do |char, i|
    if char != id_2[i]
      id_2.delete_at(i)
      return id_2.join()
    end
  end

  raise 'No diff.'
end

def diff_by_one?(id_1, id_2)
  num_diff = 0

  id_1.each_with_index do |char, ind|
    num_diff +=1 if char != id_2[ind]
  end

  return true if num_diff == 1
end

def find_similar(ids)
  ids.each do |id|
    ids.each do |comparator|
      next if id == comparator
      return different_letter(id.chars, comparator.chars) if diff_by_one?(id.chars, comparator.chars)
    end
  end

  raise 'No match found.'
  nil
end

puts find_similar(parse_input('day_2_input.txt'))
