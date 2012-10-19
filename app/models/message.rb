class Message < ActiveRecord::Base
  attr_accessible :content, :read, :recipient_id, :user_id
end
