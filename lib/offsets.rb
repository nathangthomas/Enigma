require 'date'
class Offsets
  attr_reader :date, :numbers, :offset_keys

  def initialize(date)
    @date = Time.now.strftime("%d%m%y")
    @numbers = last_4_digits_of_squared_date
    @offset_keys = {}
  end

  def date_squared
    square_of_date = @date.to_i ** 2
  end

  def last_4_digits_of_squared_date
    last_4 = date_squared.to_s[-4..-1]
    last_4.split(//).map{|num| num.to_i}
  end
  
    def offset_generator
      @offset_keys["A"] = @numbers[0]
      @offset_keys["B"] = @numbers[1]
      @offset_keys["C"] = @numbers[2]
      @offset_keys["D"] = @numbers[3]
    end
end
