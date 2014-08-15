require 'pg'
require 'route'
require 'route_steps'
require 'port'
require 'rspec'

DB = PG.connect({:dbname => 'pirate_traders_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM routes *;")
    DB.exec("DELETE FROM route_steps *;")
    DB.exec("DELETE FROM ports *;")
  end
end

