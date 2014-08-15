require 'spec_helper'

describe Port do
  it 'will initialize a Port' do
    new_port = Port.new({:id => 1, :name => "Tortuga"})
    expect(new_port).to be_an_instance_of Port
  end
end
