class Message < ActiveRecord::Base
  attr_accessible :content, :read, :recipient_id, :user_id

    belongs_to :user
    belongs_to :recipient, :class_name => 'User'


  
end
