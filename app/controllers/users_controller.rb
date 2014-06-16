class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @clients = get_user_interests @user
   end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      if params[:stripeToken] != nil
        customer = Stripe::Customer.create(
          :email => @user.email,
          :card => params[:stripeToken],
          :plan => "paid"
          )
      end
      redirect_to root_path, :notice => "Signed up!"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

private
  def get_user_interests(user)
    c = Client.new
    interests = current_user.common_interests(user)
    midpoint = current_user.find_midpoint(user)
    response = c.search_venues_by_tip(:ll => [midpoint.lat, midpoint.lng].join(", "), :query => interests.first, :limit => 5)
    {interests: interests, venues: response}
  end
end