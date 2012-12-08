class AddEncryptedPathToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :encrypted_path, :string
  end
end
