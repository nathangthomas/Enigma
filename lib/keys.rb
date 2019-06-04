class Keys
  attr_reader :num, :random_numbers, :rand_keys

  def initialize(random_numbers = random_number_generator)
    @random_numbers = random_numbers.to_s.split(//).map {|char| char.to_i}
    @rand_keys = {}
  end

  def random_number_generator
    num_array = ""
    5.times{num_array << rand(10).to_s}
    num_array
  end

  def key_generator
    @rand_keys["A"] = @random_numbers[0] + @random_numbers[1]
    @rand_keys["B"] = @random_numbers[1] + @random_numbers[2]
    @rand_keys["C"] = @random_numbers[2] + @random_numbers[3]
    @rand_keys["D"] = @random_numbers[3] + @random_numbers[4]
    @rand_keys
  end
end
