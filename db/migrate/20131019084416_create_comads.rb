class CreateComads < ActiveRecord::Migration
  def change
    create_table :comads do |t|
      t.string :title
      t.integer :organizer_id
      t.string :location
      t.integer :group_id
      t.string :image_name
      t.datetime :date_time
      t.string :tense
      t.boolean :is_group

      t.timestamps
    end
  end
end
