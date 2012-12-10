class Message < ActiveRecord::Base
  attr_accessible :discussion_id, :user_id, :content
    belongs_to :user
  #  belongs_to :recipient, :class_name => 'User'


    belongs_to :discussion, :counter_cache => true, :touch => true

end
