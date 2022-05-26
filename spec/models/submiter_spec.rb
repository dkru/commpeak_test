# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Submiter, type: :model do
  describe 'table schema' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:messages) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
