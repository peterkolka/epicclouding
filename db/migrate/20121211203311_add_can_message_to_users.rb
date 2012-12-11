class AddCanMessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :can_message, :boolean
  end
end
