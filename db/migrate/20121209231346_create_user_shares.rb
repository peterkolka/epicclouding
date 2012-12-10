class CreateUserShares < ActiveRecord::Migration
  def change
    create_table :user_shares do |t|
      t.integer :user_id
      t.integer :share_id
      t.datetime :approved_at

      t.timestamps
    end
  end
end
