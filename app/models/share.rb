class Share < ActiveRecord::Base
  attr_accessible :document_id, :encrypted_password, :user_id
  belongs_to :user
  belongs_to :document
end
