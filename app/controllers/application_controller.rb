class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
    before_filter :make_profile
  
  def make_profile
    if user_signed_in? && !current_user.profile.present?
      @profile = Profile.new(user_id: current_user.id)
      @profile.save
      redirect_to edit_profile_path(@profile)
    end
  end
  
  def user_auth

    auth = env["omniauth.auth"]
    current_user.update_attributes(
    :provider => auth.provider,
    :uid => auth.uid,
    :oauth_token => auth.credentials.token,
    :oauth_expires_at => Time.at(auth.credentials.expires_at))    
    redirect_to root_url
  end
  
end
