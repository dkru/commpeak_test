# frozen_string_literal: true

# service for import messges from CSV file to database
class ImportMessagesService
  require 'csv'

  def initialize(file_path = 'spec/fixtures/files/messages.csv')
    @file = CSV.open(file_path, 'r')
  end

  def write_to_db
    @file.read.each do |row|
      message = MessageSerializer.new(to_json(row))
      message = message.serialize
      message.save if message.valid?
    end
  end

  private

  def to_json(row)
    {
      name: row[0],
      email: row[1],
      subject: row[2],
      contents: row[3]
    }
  end
end
