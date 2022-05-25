class MessagesController < ApplicationController
  require 'csv'

  def new
  end

  def create
    CSV.open("storage/messages.csv", 'a') do |f| 
      f << message_params.to_hash.fetch_values('email', 'text')
    end
    head :created
  end

  private

  def message_params
    params.permit(:email, :text)
  end
end
