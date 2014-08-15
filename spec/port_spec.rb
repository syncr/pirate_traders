require 'spec_helper'

describe Port do
  it 'will initialize a Port' do
    new_port = Port.new()
    expect(new_port).to be_an_instance_of Port
  end
end
