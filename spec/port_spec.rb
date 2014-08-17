require 'spec_helper'

describe Port do
  it 'will initialize a Port' do
    new_port = Port.new({:id => 1, :name => "Tortuga"})
    expect(new_port).to be_an_instance_of Port
  end

  it 'will add a new instance of Port to the DB(CREATE)' do
    Port.create_port("Tortuga")
    expect(DB.exec("SELECT * FROM ports;").first['name']).to eq 'Tortuga'
  end

  it 'will list all ports(READ)' do
    Port.create_port("Tortuga")
    Port.create_port("Puerto Vallarta")
    list = Port.read_ports
    expect(list).to eq ["Tortuga", "Puerto Vallarta"]
  end

  it 'will allow user to edit port name (UPDATE)' do
    Port.create_port("Tortilla")
    Port.update_port("Tortilla","Tortuga")
    list = Port.read_ports
    expect(list).to eq ["Tortuga"]
  end

  it 'will allow user to delete a port (DELETE)' do
    Port.create_port("Tortuga")
    Port.create_port("Puerto Vallarta")
    Port.delete_port("Puerto Vallarta")
    list = Port.read_ports
    expect(list).to eq ["Tortuga"]
  end

  it 'will convert port name to port ID' do
    Port.create_port("Tortuga")
    expect(Port.get_ID("Tortuga")).to eq "1"
  end
end
