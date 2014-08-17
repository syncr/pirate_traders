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

  def self.read_ports
    ports = []
    results = DB.exec("SELECT name FROM ports")
    results.each do |result|
      ports << result["name"]
    end
    ports
  end

  def self.update_port(old_name, new_name)
    DB.exec("UPDATE ports SET name = '#{new_name}' WHERE name = '#{old_name}';")
  end

  def self.delete_port(name)
    DB.exec("DELETE FROM ports WHERE name = '#{name}';")
  end
end
