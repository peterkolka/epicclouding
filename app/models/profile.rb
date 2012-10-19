class Profile < ActiveRecord::Base
  attr_accessible :about, :avatar, :name, :user_id
end
