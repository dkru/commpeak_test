# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Messages", type: :request do
  let(:message) { { email: Faker::Internet.email, text: Faker::Quote.matz } }
  
  it "GET new" do
    get '/messages/new'
    expect(response).to render_template(:new)
  end

  it 'POST create' do
    post '/messages', params: message
    expect(response).to have_http_status :created
  end
end
