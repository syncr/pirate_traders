require 'pg'

class Route_Step
  attr_accessor :id, :island_id_1, :island_id_2, :route_id
  def initialize(attributes)
    @id = attributes[:id]
    @island_id_1 = attributes[:island_id_1]
    @island_id_2 = attributes[:island_id_2]
    @route_id = attributes[:route_id]
  end

  def self.create_route(selected_route, route_from, route_to)
    DB.exec("INSERT INTO route_steps (island_id_1, island_id_2, route_id) VALUES ('#{route_from}', '#{route_to}', '#{selected_route}');")
  end
end
