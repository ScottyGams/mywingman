class Client < Foursquare2::Client
  # attr_accessible :lat, :lon

  def initialize
    super(:client_id => 'wm_fsq_id', :client_secret => 'wm_fsq_secret', :api_version => '20120505')
  end

end