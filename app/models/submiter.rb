# frozen_string_literal: true

class Submiter < ApplicationRecord
  has_many :messages
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
