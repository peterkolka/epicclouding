class Document < ActiveRecord::Base
  attr_accessible :description, :file, :name, :public #, :user_id
  mount_uploader :file, FileUploader
  belongs_to :user
  has_many :shares
  
  def extension_type
     file.file.extension.downcase
  end
end
