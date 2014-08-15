require 'pg'

class Route_Step
  attr_accessor :id, :island_id1, :island_id2
  def initialize(attributes)
    @id = attributes[:id]
    @island_id1 = attributes[:island_id1]
    @island_id2 = attributes[:island_id2]
  end
end
