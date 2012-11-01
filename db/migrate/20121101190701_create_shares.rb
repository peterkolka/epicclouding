class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.integer :document_id
      t.string :encrypted_password

      t.timestamps
    end
  end
end
