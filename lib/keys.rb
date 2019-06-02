class Keys
  attr_reader :num, :random_numbers, :rand_keys

  def initialize
    @random_numbers = []
    @rand_keys = {}
  end

  def random_number_generator
    5.times{random_numbers << rand(10)}
  end

  def key_generator
    @rand_keys["A"] = @random_numbers[0] + @random_numbers[1]
    @rand_keys["B"] = @random_numbers[1] + @random_numbers[2]
    @rand_keys["C"] = @random_numbers[2] + @random_numbers[3]
    @rand_keys["D"] = @random_numbers[3] + @random_numbers[4]
  end

  def the_keys
    random_number_generator
    key_generator
  end

end
