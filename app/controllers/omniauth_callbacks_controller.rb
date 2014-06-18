class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?

      user.fb_likes.map{|l| l['name']}.each do |name|
        user.interests << Interest.find_or_create_by_name(name)
      end

      flash.notice = "Signed in Through Facebook!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account because: #{user.errors.full_messages.to_sentence}"
      redirect_to new_user_registration_url
    end
  end
  
end