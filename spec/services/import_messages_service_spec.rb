# frozen_string_literal: true

RSpec.describe ImportMessagesService do
  subject(:import_service) { ImportMessagesService.new }

  it 'instance is created' do
    expect { import_service.write_to_db }.to change(Message, :count)
  end
end
