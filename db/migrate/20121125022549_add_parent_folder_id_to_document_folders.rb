class AddParentFolderIdToDocumentFolders < ActiveRecord::Migration
  def change
    add_column :document_folders, :parent_folder_id, :integer
  end
end
