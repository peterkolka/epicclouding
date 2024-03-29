class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.string :name
      t.string :file
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
