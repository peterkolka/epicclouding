class Profile < ActiveRecord::Base
  attr_accessible :about, :avatar, :name, :user_id
  
  belongs_to :user
  
  def avatar_url
    unless avatar.blank?
      avatar.url
    else
      "http://placehold.it/250x250"
    end
  end
  
end
