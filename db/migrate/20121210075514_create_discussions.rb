class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :message_count

      t.timestamps
    end
  end
end
