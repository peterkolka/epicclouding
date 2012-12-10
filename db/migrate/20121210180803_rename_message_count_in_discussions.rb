class RenameMessageCountInDiscussions < ActiveRecord::Migration
  def change
    rename_column :discussions, :message_count, :messages_count
  end
end
