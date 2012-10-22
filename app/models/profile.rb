class Profile < ActiveRecord::Base
  attr_accessible :about, :avatar, :name, :user_id, :crop_x, :crop_y, :crop_w, :crop_h
  belongs_to :user
  mount_uploader :avatar, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
  
#  def avatar_url
#    unless avatar.blank?
#      avatar.url
#    else
#      "http://placehold.it/250x250"
#    end
#  end
  
end
