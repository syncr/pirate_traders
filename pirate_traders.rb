require 'pg'
require './lib/route'
require './lib/route_steps'
require './lib/port'

DB = PG.connect({:dbname => 'pirate_traders'})
