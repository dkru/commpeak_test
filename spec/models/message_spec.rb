# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { JSON.parse(File.read('spec/fixtures/message.json')) }

  describe 'DB schema' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:subject).of_type(:string) }
    it { is_expected.to have_db_column(:contents).of_type(:string) }
  end

  describe 'relations' do
    it { should belong_to(:submiter) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:contents) }
  end
end
