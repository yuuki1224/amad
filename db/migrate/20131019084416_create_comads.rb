class CreateComads < ActiveRecord::Migration
  def change
    create_table :comads do |t|
      t.string :title
      t.integer :user_id
      t.string :location
      t.string :image_name
      t.datetime :date_time
      t.string :tense
      t.boolean :is_active

      t.timestamps
    end
  end
end
