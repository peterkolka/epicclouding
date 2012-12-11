require 'bcrypt'
class Document < ActiveRecord::Base
  include BCrypt
  attr_accessible :description, :file, :name, :public, :document_folder_id
  mount_uploader :file, FileUploader
  belongs_to :user
  has_many :shares
  has_many :comments
  belongs_to :document_folder
  before_create :default_name
  before_create :generate_encrypted_path  
  
  include Rails.application.routes.url_helpers


  def type_icon
    file_type = self.file.file.extension.downcase
    if ["jpeg", "png", "jpg"].include?(file_type)
     self.file.url
  
   else
      "/assets/projects/png/Documents.png"
    end
  end


  def authorized?(user_id)
    if shares.where("encrypted_password is not null").any? 
      if UserShare.find_by_user_id_and_share_id(user_id, self.shares.first.id).present?
       true
      else
        false
      end
    else
      true
    end
  end


  def to_jq_upload
    {
      "type_icon" => self.type_icon,      
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
    if self.name.blank?
      self.name ||= File.basename(file.filename, '.*').titleize if file
    end
  end
  

    def generate_encrypted_path
      if self.encrypted_path.blank?
        @password = "#{Time.now.strftime('%M%y%d%I%m')}#{user.created_at.strftime('%M%y%d%I%m')}"
        self.encrypted_path = @password
      end
    end
  
end
