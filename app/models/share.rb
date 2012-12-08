require 'bcrypt'
  
class Share < ActiveRecord::Base
  include BCrypt

  attr_accessor :password
  attr_accessible :document_id, :password 
  belongs_to :user
  belongs_to :document
  before_save :set_key
  
  


  
  

  def set_key
    @password = Password.create(self.created_at)
    self.encrypted_password = @password
  end
  
  
end
