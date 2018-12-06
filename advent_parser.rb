class AdventParser
  def self.read(file_name)
    File.open(file_name).read.split("\n")
  end
end
