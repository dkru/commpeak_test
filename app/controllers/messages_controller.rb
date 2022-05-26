# frozen_string_literal: true

# messages request machine
class MessagesController < ApplicationController
  require 'csv'

  def index
    @messages = Message.all
  end

  def create
    message = MessageSerializer.new(message_params)
    message = message.serialize
    if message.valid?
      CSV.open('storage/messages.csv', 'a') do |f|
        f << message_params.to_hash.fetch_values('name', 'email', 'subject', 'contents')
      end
      head :created
    else
      head :unprocessable_entity
    end
  end

  def import
    if Rails.env.production?
      ImportMessagesJob.perform_later
    else
      import_service = ImportMessagesService.new('storage/messages.csv')
      import_service.write_to_db
    end
  end

  def destroy
    message = Message.find_by_id(params[:id])
    message.try(:destroy)
    redirect_to messages_path
  end

  private

  def message_params
    params.permit(:id, :name, :email, :subject, :contents)
  end
end
