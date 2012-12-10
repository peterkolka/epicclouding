class AddDiscussionIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :discussion_id, :integer
  end
end
