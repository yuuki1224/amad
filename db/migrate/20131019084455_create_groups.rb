class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :image_name
      t.text :description

      t.timestamps
    end
  end
end
