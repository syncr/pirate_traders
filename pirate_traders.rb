require 'pg'
require './lib/route'
require './lib/route_steps'
require './lib/port'

DB = PG.connect({:dbname => 'pirate_traders'})

def main_menu
  system 'clear'
  puts 'Press 1 to add a port'
  puts 'Press 2 to view all ports'
  puts 'Press 3 to add a route'
  puts 'Press 4 to view all routes'
  puts 'Press 5 to add a leg to a route'
  puts 'Press 6 to show all lines associated with a port'
  puts 'Press 7 to show all stations associted with a route'

  choice = gets.chomp
  pirate_ui(choice)
end

def pirate_ui(choice)
  puts choice
  puts 'Yargh. Be welcome!'
  case choice
  when '1'
    puts 'What port be ye addin!?'
    user_input = gets.chomp
    Port.create_port(user_input)
    puts "Yar, ye port #{user_input} be added!"
  when '3'
    puts 'What route be ye addin!?'
    user_input = gets.chomp
    Route.create_route(user_input)
    puts "Yar, ye route #{user_input} be added!"
  else "Nargh!"
  end
end
main_menu
