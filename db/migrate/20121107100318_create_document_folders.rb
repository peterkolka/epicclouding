class CreateDocumentFolders < ActiveRecord::Migration
  def change
    create_table :document_folders do |t|
      t.string :name

      t.timestamps
    end
  end
end
