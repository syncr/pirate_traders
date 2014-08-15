require 'spec_helper'

describe Port do
  it 'will initialize a Port' do
    new_port = Port.new({:id => 1, :name => "Tortuga"})
    expect(new_port).to be_an_instance_of Port
  end

  it 'will add a new instance of Port to the DB' do
    Port.create_port("Tortuga")
    expect(DB.exec("SELECT * FROM ports;").first['name']).to eq 'Tortuga'
  end

end
