class AddEncryptedPasswordToUserShares < ActiveRecord::Migration
  def change
    add_column :user_shares, :encrypted_password, :string
  end
end
