require 'pg'

class Route_Detail
  attr_accessor :id, :route_name, :port_id1, :port_id2, 
  def initialize(attributes)
    @id = attributes[:id]
    @route_name = attributes[:route_name]
    @port_id1 = attributes[:port_id1]
    @port_id2 = attributes[:port_id2]
  end

  def self.create_route_step(route_name, port_id1, port_id2)
    DB.exec("INSERT INTO route_details (route_name, port_id1, port_id2) VALUES ('#{route_name}','#{port_id1}', '#{port_id2}');")
  end
end
