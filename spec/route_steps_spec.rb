require 'spec_helper'

describe Route_Step do
  it 'will initialize a Route step join table' do
    new_route_step = Route_Step.new({:id => 1,:island_id1 => 1,:island_id2 => 2})
    expect(new_route_step).to be_an_instance_of Route_Step
  end
end
