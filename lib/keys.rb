class Keys
  attr_reader :random_numbers, :rand_keys

  def initialize(random_numbers = number_generator)
    @random_numbers = random_numbers
    @rand_keys = key_generator
  end

  def number_generator
    num_array = ""
    5.times{num_array << rand(10).to_s}
    num_array
  end

  def key_generator
    rand_keys = {}
    rand_keys["A"] = (@random_numbers[0] + @random_numbers[1]).to_i
    rand_keys["B"] = (@random_numbers[1] + @random_numbers[2]).to_i
    rand_keys["C"] = (@random_numbers[2] + @random_numbers[3]).to_i
    rand_keys["D"] = (@random_numbers[3] + @random_numbers[4]).to_i
    rand_keys
  end
end
