require 'spec_helper'

describe Route_Step do
  it 'will initialize a Route step join table' do
    new_route_step = Route_Step.new()
    expect(new_route_step).to be_an_instance_of Route_Step
  end
end
