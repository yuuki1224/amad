class InsertComadLocation < ActiveRecord::Migration
  def change
    c=ComadLocation.find_or_create_by_id(1);c.update_attributes({ :name => '出町ロッテリア', :latitude => 35.030453 , :longitude => 135.77247 })
    c=ComadLocation.find_or_create_by_id(2);c.update_attributes({ :name => '北大路スタバ', :latitude => 35.043771 , :longitude => 135.75889 })
    c=ComadLocation.find_or_create_by_id(3);c.update_attributes({ :name => '烏丸三条スタバ', :latitude => 35.008744 , :longitude => 135.759333 })
    c=ComadLocation.find_or_create_by_id(4);c.update_attributes({ :name => '三条大橋スタバ', :latitude => 35.009126 , :longitude => 135.771204 })
    c=ComadLocation.find_or_create_by_id(5);c.update_attributes({ :name => 'Campusオフィス', :latitude => 35.029236 , :longitude => 135.750766 })
    c=ComadLocation.find_or_create_by_id(6);c.update_attributes({ :name => '寒梅館', :latitude => 35.031604 , :longitude => 135.759064 })
    c=ComadLocation.find_or_create_by_id(7);c.update_attributes({ :name => '百万遍マクド', :latitude => 35.028997 , :longitude => 135.778548 })
  end
end
