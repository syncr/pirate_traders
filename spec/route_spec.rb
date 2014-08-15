require 'spec_helper'

describe Route do
  it 'will initialize a route' do
    new_route = Route.new({:id => 1,:name => "West Winds Left Loop",:island_ids =>[1,2,3,4,5]})
    expect(new_route).to be_an_instance_of Route
  end
end
