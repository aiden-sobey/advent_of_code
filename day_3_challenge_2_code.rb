require 'byebug'

class Cutter
  def initialize(dimension)
    @squares = []
    @map = init_map(dimension)

    square_parser
    populate_map
  end

  def populate_map
    @squares.each do |entry|
      y_shift = entry[:y_start]

      entry[:y_len].times do
        x_shift = entry[:x_start]
        entry[:x_len].times do
          @map[x_shift][y_shift] += 1
          x_shift += 1
        end
        y_shift += 1
      end
    end
  end

  def init_map(dim)
    map = Array.new
    dim.times { map << Array.new(dim, 0) }
    map
  end

  def hash_entry(id, x_start, y_start, x_len, y_len)
    {
      id: id,
      x_start: x_start.to_i,
      y_start: y_start.to_i,
      x_len: x_len.to_i,
      y_len: y_len.to_i
    }
  end

  def square_parser
    data = File.open('day_3_input.txt').read.split("\n")

    data.each do |entry|
      entry = entry.split(' ')
      start_point = entry[2].sub(':', '').split(',')
      len = entry.last.split('x')

      @squares << hash_entry(entry[0], start_point[0], start_point[1], len.first, len.last)
    end
  end

  def find_lone_wolf
    @squares.each do |entry|
      if solo? entry
        puts entry[:id]
        return
      end
    end
  end

  def solo?(entry)
    y_shift = entry[:y_start]

    entry[:y_len].times do
      x_shift = entry[:x_start]
      entry[:x_len].times do
        return false if @map[x_shift][y_shift] > 1
        x_shift += 1
      end
      y_shift += 1
    end

    true
  end
end

cloth = Cutter.new(1000)
puts cloth.find_lone_wolf
