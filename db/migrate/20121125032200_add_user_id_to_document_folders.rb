class AddUserIdToDocumentFolders < ActiveRecord::Migration
  def change
    add_column :document_folders, :user_id, :integer
  end
end
