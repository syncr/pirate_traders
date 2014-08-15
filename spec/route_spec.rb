require 'spec_helper'

describe Route do
  it 'will initialize a route' do
    new_route = Route.new({:id => 1,:name => "West Winds Loop"})
    expect(new_route).to be_an_instance_of Route
  end

  it 'will create a new route in the DB' do
    Route.create_route("West Winds Loop")
    expect(DB.exec("SELECT * FROM routes;").first['name']).to eq 'West Winds Loop'
  end

  it 'will list all routes' do
    Route.create_route("West Winds Loop")
    Route.create_route("East Winds Loop")
    list = Route.list_routes
    expect(list).to eq ["West Winds Loop", "East Winds Loop"]
  end
end
