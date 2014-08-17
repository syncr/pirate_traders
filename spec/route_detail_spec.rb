require 'spec_helper'

describe Route_Detail do
  it "will add a new leg to the current route" do
    Route_Detail.create_route_step(1, 1)
    expect(DB.exec("SELECT * FROM route_details;").first['route_id']).to eq ("1")
    expect(DB.exec("SELECT * FROM route_details;").first['port_id']).to eq ("1")
  end
end
