# frozen_string_literal: true

# queued job for import messages
class ImportMessagesJob < ApplicationJob
  queue_as :default

  def perform(*)
    import_service = ImportMessagesService.new('storage/messages.csv')
    import_service.write_to_db
  end
end
