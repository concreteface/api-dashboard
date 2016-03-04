require 'spec_helper'

describe 'ThingsToDo', vcr: true do
  let(:thing){ThingsToDo.new("MA")}
  it 'intializes with a state' do
    expect(thing.state).to eq('MA')
  end
  it 'initializes with an empty array of events' do
    expect(thing.events).to be_a(Array)
    expect(thing.events.empty?).to eq(true)
  end
  it 'initializes with a url' do
    expect(thing.url).to be_a(URI)
  end
  describe '#get events' do
    it 'retrieves events and populates the events array' do
      thing.get_events
      expect(thing.events.empty?).to eq(false)
    end

  end
end
