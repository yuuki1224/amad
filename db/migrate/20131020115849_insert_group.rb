class InsertGroup < ActiveRecord::Migration
  def change
    c=Group.find_or_create_by_id(1);c.update_attributes({ :name => '楽洛堂',  :description => 'シェアハウスだよ〜〜', :image_name => 'bosscolle.png' }, without_protection: true)
    c=Group.find_or_create_by_id(2);c.update_attributes({ :name => 'Campus',  :description => 'Campusだおー', :image_name => 'campus.png' }, without_protection: true)
    c=Group.find_or_create_by_id(3);c.update_attributes({ :name => 'カンファー',  :description => 'カンファー', :image_name => 'picola.png' }, without_protection: true)
    c=Group.find_or_create_by_id(4);c.update_attributes({ :name => '猛者会',  :description => ':sushi', :image_name => 'arduino.png' }, without_protection: true)
    c=Group.find_or_create_by_id(5);c.update_attributes({ :name => 'あんさんぶる',  :description => 'HappyElementsエンジニア', :image_name => 'kimisaki.png' }, without_protection: true)
  end
end
