require 'pg'
require './lib/port'
require './lib/route'
require './lib/route_details'

DB = PG.connect({:dbname => 'pirate_traders'})

def start
  puts "Yargh. Be welcome to the High Seas Pirate Union! "
  puts "We offer protection to those seeking to trade in these Pirate infested waters..."
  puts "ar-har-har. \n"
  main_menu
end

def main_menu
  puts "\n"
  puts 'Tell us what ports and routes be needin protection...'
  puts "\n"
  puts "Press 1 to add a port"
  puts "Press 2 to delete a port"
  puts "Press 3 to view all ports\n"

  puts "Press 4 to add a route"
  puts "Press 5 to view all routes"
  puts "Press 6 to add a port to a route\n"

  puts "Press 7 to show all lines associated with a port"
  puts "Press 8 to show all stations associated with a route"

  choice = gets.chomp
  pirate_ui(choice)
end

def pirate_ui(choice)
  case choice
  when '1'
    system 'clear'
    puts 'What port be ye addin!?'
    user_input = gets.chomp
    Port.create_port(user_input)
    puts "Yar, #{user_input} be added to the list oo' ports!"
    sleep(2)
  when '2'
    system 'clear'
    puts 'What port be ye removin!?'
    user_input = gets.chomp
    Port.delete_port(user_input)
    puts "Yar, #{user_input} be removed from yer list o' ports!"
    sleep(2)
  when '3'
    puts "Yar, here be ye list'o'ports!"
    puts "\n"
    puts Port.read_ports
    puts "\n"
  when '4'
    puts 'What route be ye addin!?'
    route_name = gets.chomp
    Route.create_route(route_name)
    puts "Yar, ye route #{route_name} be added!"
  when '5'
    puts "Yar, here be ye list'o'routes!"
    puts Route.read_routes

  when '6'
    puts "Yar, here be ye list'o'routes!"
    puts Route.read_routes

    puts "Yar, enter the name of the route yee be changin!?"
    route = gets.chomp
    route_id = Route.get_ID(route)

    puts "\nHere are the ports youv got us watchin:"
    puts Port.read_ports
    puts "\nWhich of these ports be yee addin to this route?"
    port = gets.chomp
    port_id = Port.get_ID(port)

    puts "Alrighty. We've added #{port} to yer #{route} route!"
    Route_Detail.create_route_step(route_id, port_id)
    sleep(3)

  when '7'
    puts "Yar, here be ye list'o'routes!"
    puts Route.read_routes

    puts "which route would you like to view!?"
    route = gets.chomp
    puts "Here be all the ports you've secured in the #{route} route:"
    puts Route.list(route)
    sleep(7)
  else "Nargh! Try again!"
end
system 'clear'
main_menu
end
system 'clear'
start