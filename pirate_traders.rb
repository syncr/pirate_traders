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
  puts 'Press 1 to add a port'
  puts 'Press 2 to view all ports'
  puts 'Press 3 to add a route'
  puts 'Press 4 to view all routes'
  puts 'Press 5 to add a leg to a route'
  puts 'Press 6 to show all lines associated with a port'
  puts 'Press 7 to show all stations associated with a route'

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
    puts "Yar, #{user_input} be added to the list of ports!"
    sleep(2)
  when '2'
    puts "Yar, here be ye list'o'ports!"
    puts "\n"
    puts Port.read_ports
    puts "\n"
  when '3'
    puts 'What route be ye addin!?'
    route_name = gets.chomp
    puts 'What island be ye adding to the route!?'
    island_id = gets.chomp
    Route.create_route(route_name, island_id)
    puts "Yar, ye route #{user_input} be added!"
  when '4'
    puts "Yar, here be ye list'o'routes!"
    Route.read_routes

  when '5'
    routes = Route.all
    routes.each do |route|
      p "Route ##{route.id}: #{route.name} "
    end

    puts "Yar, select the number of the route yee be changin!?"
    selected_route = gets.chomp
    puts "Where be the ship be startin?"
    route_from = gets.chomp
    puts "Where the ship be endin?"
    route_to = gets.chomp
    Route_Detail.update_route(selected_route, route_from, route_to)


    puts "Argh, your routes port'o'call has been added"
    pirate_ui

  else "Nargh!"
  end
  main_menu
end
system 'clear'
start