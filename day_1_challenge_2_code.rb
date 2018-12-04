class Frequencer
  def initialize
    @old_frequencies = []
  end

  def solve_challenge(file_input)
    list = parse_input(file_input)
    output = frequency_modulator(0, list)

    while !output.nil?
      output = frequency_modulator(output, list)
    end
  end

  def frequency_modulator(current, input)
    @old_frequencies << current

    input.each do |f|
      current += f
      if @old_frequencies.include? current
        puts "Duplicate found: #{current}"
        return nil
      end
      @old_frequencies << current
    end

    current
  end

  def parse_input(file_name)
    text = File.open(file_name).read.split("\n")
    text.map { |s| s.to_i }
  end
end

Frequencer.new.solve_challenge('day_1_input.txt')
