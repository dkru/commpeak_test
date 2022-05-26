# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :submiter

  validates_presence_of :name, :subject, :contents
  validates_associated :submiter
end
