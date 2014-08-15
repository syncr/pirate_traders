require 'pg'

class Port
  attr_accessor :id, :name
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
  end

  def self.create_port(name)
    DB.exec("INSERT INTO ports (name) VALUES ('#{name}');")
  end

  def self.list_ports
    ports = []
    results = DB.exec("SELECT name FROM ports")
    results.each do |result|
      ports << result["name"]
    end
    ports
  end

end
# tortuga = Port.new(1)
# puerto vallarta (2)
# st. kitts (3)
# antigua (4)
# san juan (5)
