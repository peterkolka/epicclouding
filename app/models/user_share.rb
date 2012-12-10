 #   require 'bcrypt'
class UserShare < ActiveRecord::Base
  attr_accessible :approved_at, :share_id, :password 
  belongs_to :user
  belongs_to :share
  
    attr_accessor :password
    
    

end
