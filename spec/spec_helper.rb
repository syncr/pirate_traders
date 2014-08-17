require 'pg'
require 'port'
require 'route'
require 'route_details'
require 'rspec'

DB = PG.connect({:dbname => 'pirate_traders_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM routes *;")
    DB.exec("DELETE FROM route_details *;")
    DB.exec("DELETE FROM ports *;")
  end
end

