class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :document_id
      t.integer :document_folder_id
      t.text :comment

      t.timestamps
    end
  end
end
