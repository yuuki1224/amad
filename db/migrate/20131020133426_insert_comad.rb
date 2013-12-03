class InsertComad < ActiveRecord::Migration
  def change
    c=Comad.find_or_create_by_id(1);c.update_attributes({ :title => 'ノマドしませんか?', :location => '烏丸のスタバ', :organizer_id => 2, :image_name => 'adachi.png',  :date_time => '2013-10-20 13:00:00', :tense => 'うぃる', :is_group => false})
    c=Comad.find_or_create_by_id(2);c.update_attributes({ :title => '熱海で温泉ハッカソン!!', :location => '熱海', :organizer_id => 3, :image_name => 'nakagawa.png',  :date_time => '2013-12-03 13:00:00', :tense => 'うぃる', :is_group => false})
    c=Comad.find_or_create_by_id(3);c.update_attributes({ :title => '兵庫県でノマドしませんか?', :location => '兵庫県', :organizer_id => 9, :image_name => 'hayashi.png',  :date_time => '2013-12-20 13:00:00', :tense => 'うぃる', :is_group => false})
    c=Comad.find_or_create_by_id(4);c.update_attributes({ :title => 'オフィスううう！！', :location => 'Campusオフィス', :organizer_id => 8, :image_name => 'kobayashi.png', :tense => 'なう', :is_group => false})
    c=Comad.find_or_create_by_id(5);c.update_attributes({ :title => '鴨川鍋パ', :group_id => 1, :image_name => 'bosscolle.png', :tense => 'いつでも', :is_group => true})
  end
end
