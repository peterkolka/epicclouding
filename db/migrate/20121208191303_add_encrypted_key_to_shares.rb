class AddEncryptedKeyToShares < ActiveRecord::Migration
  def change
    add_column :shares, :encrypted_key, :string
  end
end
