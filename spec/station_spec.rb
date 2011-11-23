require File.join(File.dirname(__FILE__), 'spec_helper')

describe NOAA::Station do
  
  before :all do
    NOAA::Station.stations_file = File.join(File.dirname(__FILE__), 'data', 'stations.yml')
  end

  after :all do
    NOAA::Station.stations_file = nil
  end

  it 'should load station by id' do
    NOAA::Station.find('KNYC').id.should == 'KNYC'
  end

  it 'should find closest to coordinates' do
    NOAA::Station.closest_to(GeoKit::LatLng.new(40.8, -73.96)).id.should == 'KNYC'
  end

  it 'should find closest to lat/lng' do
    NOAA::Station.closest_to(40.8, -73.96).id.should == 'KNYC'
  end

  it 'should find closest to lat/lng passed as array' do
    NOAA::Station.closest_to([40.8, -73.96]).id.should == 'KNYC'
  end

  it 'should throw ArgumentError if bad argument passed into #closest_to()' do
    lambda { NOAA::Station.closest_to('hey') }.should raise_error(ArgumentError)
  end

  it 'should throw ArgumentError if more than two arguments passed into #closest_to()' do
    lambda { NOAA::Station.closest_to(1, 2, 3) }.should raise_error(ArgumentError)
  end

  it 'should return name' do
    station.name.should == 'New York City, Central Park'
  end

  it 'should return state' do
    station.state.should == 'NY'
  end

  it 'should return XML URL' do
    station.xml_url.should == 'http://weather.gov/xml/current_obs/KNYC.xml'
  end

  it 'should return latitude' do
    station.latitude.should == 40.783
  end

  it 'should return longitude' do
    station.longitude.should == -73.967
  end

  it 'should return coordinates' do
    station.coordinates.should == GeoKit::LatLng.new(40.783, -73.967)
  end

  private

  def station
    NOAA::Station.find('KNYC')
  end
end
