require 'spec_helper'

describe Route_Detail do
  it 'will initialize a Route step join table' do
    new_route_step = Route_Detail.new({:id => 1,:island_id1 => 1,:island_id2 => 2, :route_id => 1})
    expect(new_route_step).to be_an_instance_of Route_Detail
  end

  it "will add a new leg to the current route" do
    Route_Detail.create_route(1, 1, 2)
    expect(DB.exec("SELECT * FROM route_details;").first['route_id']).to eq ("1")
    expect(DB.exec("SELECT * FROM route_details;").first['island_id1']).to eq ("1")
    expect(DB.exec("SELECT * FROM route_details;").first['island_id2']).to eq ("2")
  end
end
