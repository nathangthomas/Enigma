class Enigma
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def make_message_lowercase
    @message.downcase
  end
end
