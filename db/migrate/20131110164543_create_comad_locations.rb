class CreateComadLocations < ActiveRecord::Migration
  def change
    create_table :comad_locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
