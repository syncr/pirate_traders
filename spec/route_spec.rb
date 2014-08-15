require 'spec_helper'

describe Route do
  it 'will initialize a route' do
    new_route = Route.new()
    expect(new_route).to be_an_instance_of Route
  end
end
