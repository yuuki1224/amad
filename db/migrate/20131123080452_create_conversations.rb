class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :younger_user_id
      t.integer :older_user_id

      t.timestamps
    end
  end
end
