class DocumentFolder < ActiveRecord::Base
  attr_accessible :name, :user_id, :parent_folder_id
  has_many :documents
  belongs_to :user
 # has_many :subfolders, :class_name => "Friendship", :foreign_key => "parent_"
 has_many :document_folders, :foreign_key => "parent_folder_id"
 belongs_to :document_folder, :foreign_key => "parent_folder_id"
end
