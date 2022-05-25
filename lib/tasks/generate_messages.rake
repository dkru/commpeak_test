desc 'message generator'
task :generate_messages do
  require 'csv'
  require 'faker'
  CSV.open('spec/fixtures/files/messages.csv', 'a') do |csv|
    10000.times do 
      entity = { 
                 name: Faker::Name.name,
                 email: Faker::Internet.email,
                 subject: Faker::Book.title,
                 contents: Faker::Quote.matz
      }
      csv << entity.fetch_values(:name, :email, :subject, :contents)
    end
  end
end
