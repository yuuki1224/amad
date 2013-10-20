class CreateComads < ActiveRecord::Migration
  def change
    create_table :comads do |t|
      t.string :name
      t.string :location
      t.integer :organizer_id
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :wifi
      t.boolean :power_source
      t.integer :limit
      t.boolean :is_group

      t.timestamps
    end
  end
end
