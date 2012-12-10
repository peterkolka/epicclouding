class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :messages
  has_one :profile
  has_many :documents
  has_many :shares
  has_many :document_folders
  has_many :comments
  has_many :user_shares
  
  has_many :speakers
  has_many :discussions, :through => :speakers  
  
  has_many :messages
  has_many :recieved_messages, :class_name => "Message", :foreign_key => "recipient_id"
  

  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :about, :amount, :provider, :oauth_token, :uid, :oauth_expires_at
  # attr_accessible :title, :body
  
  def amount_used
    filesizes = []
    documents.each do |document|
      filesizes << document.file_size
    end
    ((filesizes.sum.to_f)/1000000000).round(4)
  end
  
  def percent_used
    "#{((amount_used/amount) *100).round(0)}"
  end
  
  def new_message_count
    recieved_messages.where(read: 0).count
  end
  
  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end  
  
end
