require 'pg'

class Route
  attr_accessor :id, :name
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
  end

  def name
    @name
  end

  def self.all
    all = []
    results = DB.exec("SELECT * FROM routes")
    results.each do |result|
      p "yargh!"
      all << Route.new({:id => result["id"], :name => result['name']})
    end
    all
  end

  def self.create_route(route_name)
    DB.exec("INSERT INTO routes (name) VALUES ('#{route_name}');")
  end

  def self.read_routes
    routes = []
    results = DB.exec("SELECT * FROM routes")
    results.each do |result|
      routes << result["name"]
    end
    routes
  end

  def self.update_route(old_name, new_name)
    DB.exec("UPDATE routes SET name = '#{new_name}' WHERE name = '#{old_name}';")

  end

  def self.delete_route(name)
    DB.exec("DELETE FROM routes WHERE name = '#{name}';")
  end

end
