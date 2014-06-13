class ClientsController < ApplicationController
  
  # def index
  #   @postcode = Postcode.find(params[:id])
  #   c = Client.new
  #   @clients = c.search_venues_by_tip(:ll => "#{@postcode.latitude},#{@postcode.longitude}", :query => 'hipster', :limit => 20)
  # end

  def index
    @postcode = Postcode.find(params[:id])
    c = Client.new
    @clients = c.search_venues_by_tip(:ll => midpoint.ll, :query => 'user.likes_in_common', :limit => 5)
  end

end