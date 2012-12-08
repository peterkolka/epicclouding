class Profile < ActiveRecord::Base
  attr_accessible :about, :avatar, :name, :crop_x, :crop_y, :crop_w, :crop_h, :user_id
  belongs_to :user
  mount_uploader :avatar, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  before_update :set_name
  validates :name, :uniqueness => true
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
  
  
  def set_name
    if self.name.blank?
      self.name = "user205#{user.id}"
    end
  end
  

  
#  def avatar_url
#    unless avatar.blank?
#      avatar.url
#    else
#      "http://placehold.it/250x250"
#    end
#  end
  
end
