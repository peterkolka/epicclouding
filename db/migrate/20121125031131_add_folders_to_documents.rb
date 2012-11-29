class AddFoldersToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :document_folder_id, :integer
  end
end
