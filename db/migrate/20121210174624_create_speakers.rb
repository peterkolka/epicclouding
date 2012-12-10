class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.integer :user_id
      t.integer :discussion_id

      t.timestamps
    end
  end
end
