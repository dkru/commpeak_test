# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version 3.1.2

* Configuration
Populate messages.csv in spec/fixtures/files/
```
rake generate_messages
```

* Database creation
```
rails db:create
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
Job queues manager is Sidekiq. Run sidekiq service before execute import service.
```
bundle exec sidekiq --daemon
```
