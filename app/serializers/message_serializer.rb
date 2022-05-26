# frozen_string_literal: true

# prepare message to store
class MessageSerializer
  def initialize(data)
    @data = data.stringify_keys
    serialize_message
  end

  def valid?
    @message.valid?
  end

  def serialize
    @message
  end

  private

  def serialize_submiter
    Submiter.find_or_initialize_by(email: @data['email'])
  end

  def serialize_message
    @message = Message.new(submiter: serialize_submiter)
    @message.attributes = @data.except('email')
  end
end
