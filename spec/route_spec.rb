require 'spec_helper'

describe Route do
  it 'will initialize a route' do
    new_route = Route.new({:id => 1,:name => "West Winds Loop",:island_ids => [1,2,3,4,5]})
    expect(new_route).to be_an_instance_of Route
  end

  it 'will add a new instance of Port to the DB' do
    Route.create_route("West Winds Loop", [1,2,3,4,5])
    expect(DB.exec("SELECT * FROM routes;").first['name']).to eq 'West Winds Loop'
    expect(DB.exec("SELECT * FROM routes;").first['island_ids']).to eq ("[1, 2, 3, 4, 5]")
  end

  it 'will list all routes' do
    Route.create_route("West Winds Loop", [1,2,3,4,5])
    Route.create_route("East Winds Loop", [5,4,3,2,1])
    list = Route.list_routes
    expect(list).to eq ["West Winds Loop", "East Winds Loop"]
  end

end
