require 'bcrypt'
  
class Share < ActiveRecord::Base
  include BCrypt

  attr_accessor :password
  attr_accessible :document_id, :password 
  belongs_to :user
  belongs_to :document
  before_save :set_encrypted_password
  has_many :user_shares
  
  

  def depassword
     @password ||= Password.new(self.encrypted_password)
   end
  
  

  def set_encrypted_password
    @password = Password.create(self.password)
    self.encrypted_password = @password
  end
  
  
end
