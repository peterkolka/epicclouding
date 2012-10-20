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
  
end
