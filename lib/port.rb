require 'pg'

class Port
  attr_accessor :id, :name
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
  end

  def create_port(user_input)
    DB.exec("INSERT INTO ports (name) VALUES ('#{user_input}');")
  end
end

# tortuga = Port.new(1)
# puerto vallarta (2)
# st. kitts (3)
# antigua (4)
# san juan (5)
