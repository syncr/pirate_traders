require 'pg'
require './lib/route'
require './lib/route_steps'
require './lib/port'

DB = PG.connect({:dbname => 'pirate_traders'})

def main_menu
  system 'clear'
  puts 'Yargh. Be welcome!'

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
    puts 'What port be ye addin!?'
    user_input = gets.chomp
    Port.create_port(user_input)
    puts "Yar, ye port #{user_input} be added!"
  when '2'
    puts "Yar, here be ye list'o'ports!"
    Port.list_ports
  when '3'
    puts 'What route be ye addin!?'
    route_name = gets.chomp
    puts 'What island be ye adding to the route!?'
    island_id = gets.chomp
    Route.create_route(route_name, island_id)
    puts "Yar, ye route #{user_input} be added!"
  when '4'
    puts "Yar, here be ye list'o'routes!"
    Route.list_routes

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
    Route_Step.update_route(selected_route, route_from, route_to)


    puts "Argh, your routes port'o'call has been added"
    pirate_ui

  else "Nargh!"
  end
end
main_menu
