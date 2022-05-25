# frozen_string_literal: true

class Message < ApplicationRecord
  validates_presence_of :name, :email, :subject, :contents
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
