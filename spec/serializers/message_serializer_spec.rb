# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageSerializer do
  subject { MessageSerializer.new(message_json) }
  let(:message_json) { JSON.parse(File.read('spec/fixtures/message.json')) }

  it { is_expected.to respond_to(:serialize) }
  it { is_expected.to respond_to(:valid?) }

  describe 'serialize' do
    it { expect(subject.serialize).to be_instance_of(Message) }
  end

  describe 'exception' do
    it 'email' do
      message_json[:email] = '111'
      serialized = MessageSerializer.new(message_json)
      expect(serialized.valid?).to be false
    end

    it 'subject' do
      message_json[:subject] = ''
      serialized = MessageSerializer.new(message_json)
      expect(serialized.valid?).to be false
    end
  end
end
