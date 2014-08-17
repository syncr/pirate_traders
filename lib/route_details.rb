require 'pg'

class Route_Detail
  attr_accessor :id, :island_id1, :island_id2, :route_id
  def initialize(attributes)
    @id = attributes[:id]
    @island_id1 = attributes[:island_id1]
    @island_id2 = attributes[:island_id2]
    @route_id = attributes[:route_id]
  end

  def self.create_route(selected_route, route_from, route_to)
    DB.exec("INSERT INTO route_details (island_id1, island_id2, route_id) VALUES ('#{route_from}', '#{route_to}', '#{selected_route}');")
  end
end
