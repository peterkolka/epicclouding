class Comment < ActiveRecord::Base
  attr_accessible :comment, :document_folder_id, :document_id, :user_id
  belongs_to :document
  belongs_to :user
end
