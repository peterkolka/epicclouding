class Discussion < ActiveRecord::Base
  # attr_accessible :title, :body

  # creater
   has_many :messages, :dependent => :destroy


   # participants of discussion (speakers)
   has_many :speakers, :dependent => :destroy
   has_many :users, :through => :speakers
  
   def with_user(current_user)
    (users - users.where(id: current_user ))
   end
   
   def self.find_between_users(user, user2)
     dialog = nil
     discussions = self.joins(:speakers).includes(:users).where("speakers.user_id = ?", user.id)
     Rails.logger.info "Searching for ids: #{user.id}, #{user2.id}"
     discussions.each do |discussion|
       dialog = discussion if ([discussion.users.first, discussion.users.last] - [user, user2]).empty?
     end
     dialog
   end
   
end