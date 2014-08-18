require 'pg'

class Route_Detail
  attr_accessor :id, :route_id, :port_id
  def initialize(attributes)
    @id = attributes[:id]
    @route_id = attributes[:route_name]
    @port_id = attributes[:port_id]
  end

  def self.create_route_step(route_id, port_id)
    DB.exec("INSERT INTO route_details (route_id, port_id) VALUES ('#{route_id}', '#{port_id}');")
  end
end
