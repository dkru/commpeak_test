# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:messages) { file_fixtures('messages.csv').read }

  describe 'DB schema' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:subject).of_type(:string) }
    it { is_expected.to have_db_column(:contents).of_type(:string) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:contents) }
    it { should validate_uniqueness_of(:email) }
  end
end
