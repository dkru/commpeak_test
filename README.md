# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version 3.1.2
* Rails 7.0.3

* Configuration
Populate messages.csv in spec/fixtures/files/
```
rake generate_messages
```

* Database initialization
Project uses SQLite3 database
```
rails db:migrate
```

* How to run the test suite
```
rspec
```

* Services (job queues, cache servers, search engines, etc.)
Job queues manager is Sidekiq, but require to run sidekiq service before execute import, 
Job service working only in Production environment
```
bundle exec sidekiq --daemon
```
