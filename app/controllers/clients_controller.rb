class ClientsController < ApplicationController
  
  # def index
  #   @postcode = Postcode.find(params[:id])
  #   c = Client.new
  #   @clients = c.search_venues_by_tip(:ll => "#{@postcode.latitude},#{@postcode.longitude}", :query => 'hipster', :limit => 20)
  # end

  def index
    # params[:user_id]
    # user = User.find params[:user_id]
    # current_user.find_midpoint(user)
    # interests = current_user.common_interests(user)
    # c = Client.new
    
    # @clients = c.search_venues_by_tip(:ll => 'current_user.find_midpoint(user).lat'+","+'current_user.find_midpoint(user).lng', :query => interests, :limit => 5)
  end

end