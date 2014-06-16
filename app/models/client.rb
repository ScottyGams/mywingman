class Client < Foursquare2::Client
  # attr_accessible :lat, :lon

  def initialize
    super(:client_id => 'S2CNVVPGEYULVP4PUB3CBBL2QP5QNGBMGLBLLSBUQLHQRZ5Q', :client_secret => 'PRQKNEUOFJYNHXCKNKJH3DIKAL0EJJ0J55WCFENLCDGSADWO', :api_version => '20120505')
  end

end