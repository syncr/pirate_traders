require 'pg'

class Route
  attr_accessor :id, :name, :island_ids
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @island_ids = attributes[:island_ids]
  end
end
