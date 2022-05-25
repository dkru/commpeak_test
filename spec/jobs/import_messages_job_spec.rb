# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportMessagesJob, type: :job do
  it 'import message service as enqueued' do
    ActiveJob::Base.queue_adapter = :test
    expect do
      ImportMessagesJob.perform_later.to have_enqueued_job
    end
  end
end
