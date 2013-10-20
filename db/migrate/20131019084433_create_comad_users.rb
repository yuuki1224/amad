class CreateComadUsers < ActiveRecord::Migration
  def change
    create_table :comad_users do |t|
      t.integer :comad_id
      t.integer :user_id

      t.timestamps
    end
  end
end
