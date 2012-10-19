class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :about, :text
    add_column :users, :city, :string
    add_column :users, :state_id, :integer
    add_column :users, :country_id, :integer
  end
end
