require 'bunlder'

Bundler.require


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :databse => "db/development.sqlite"
)

require_all 'app'