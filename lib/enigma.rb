class Enigma
  attr_reader :message

  def initialize(message)
    @message = message
  end

  # def make_message_lowercase
  #   @message.downcase
  # end

  def transform_message_to_ordinal_values
    array_form = @message.downcase.chars
    ordinal_values = array_form.map do |letter|
      letter.ord
    end
    ordinal_values
  end

  # def encrypt(@message)
  #   alphabet_size = 27
  #   letters_to_nums = @message.chars.map(&:ord)
  # end
end
