class FriendshipsController < ApplicationController

	def create
		@friendship = Friendship.new(params[:friendship])
		if @friendship.save
			flash[:notice] = "Succesfully added Wingman."
			redirect_to root_url
		else
			render :action => 'new'
		end
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		@friendship.destroy
		flash[:notice] = "Lost your Wingman"
		redirect_to root_url
	end



end
