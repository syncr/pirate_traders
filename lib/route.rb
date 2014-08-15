require 'pg'

class Route
  attr_accessor :id, :name, :island_ids
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @island_ids = attributes[:island_ids]
  end

  def self.create_route(route_name, island_ids)
    DB.exec("INSERT INTO routes (name, island_ids) VALUES ('#{route_name}', '#{island_ids}');")
  end

  def self.list_routes
    routes = []
    results = DB.exec("SELECT name FROM routes")
    results.each do |result|
      routes << result["name"]
    end
    routes
  end
end
