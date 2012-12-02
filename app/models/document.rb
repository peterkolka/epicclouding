class Document < ActiveRecord::Base
  attr_accessible :description, :file, :name, :public #, :user_id
  mount_uploader :file, FileUploader
  belongs_to :user
  has_many :shares
  belongs_to :document_folder
  before_create :default_name
  
  
  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => self.name,
      "size" => file.size,
      "url" => self.file_url,
      "show_url" => document_path(self),
      "edit_url" => edit_document_path(self),
      "delete_url" => document_path(self),
      "delete_type" => "DELETE" 
    }
  end
  
  
  def extension_type
     file.file.extension.downcase
  end
  
  def file_size
     file.file.size
  end  
  


  def default_name
    self.name ||= File.basename(file.filename, '.*').titleize if file
  end
end
