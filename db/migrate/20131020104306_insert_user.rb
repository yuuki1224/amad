class InsertUser < ActiveRecord::Migration
  def change
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '浅野友希', :email => 'yuuki.1224.softtennis@gmail.com', :password => 'yuuki1224', :image_name => 'asano.png' }, without_protection: true)
    c=User.find_or_create_by_id(2);c.update_attributes({ :name => '足立壮大', :email => 'takehiro@gmail.com', :password => 'adachi1224', :image_name => 'adachi.png' }, without_protection: true)
    c=User.find_or_create_by_id(3);c.update_attributes({ :name => '中川峰志', :email => 'nakagawa@gmail.com', :password => 'nakagawa1224', :image_name => 'nakagawa.png'  }, without_protection: true)
    c=User.find_or_create_by_id(4);c.update_attributes({ :name => '吉田万輝', :email => 'yoshida@gmail.com', :password => 'yoshida1224', :image_name => 'yoshida.png' }, without_protection: true)
    c=User.find_or_create_by_id(5);c.update_attributes({ :name => '佐藤大輔', :email => 'sato@gmail.com', :password => 'sato1224', :image_name => 'sato.png' }, without_protection: true)
    c=User.find_or_create_by_id(6);c.update_attributes({ :name => '松本凌', :email => 'matsumoto@gmail.com', :password => 'matsumoto1224', :image_name => 'matsumoto.png' }, without_protection: true)
    c=User.find_or_create_by_id(7);c.update_attributes({ :name => '村田温美', :email => 'murata@gmail.com', :password => 'murata1224', :image_name => 'murata.png' }, without_protection: true)
    c=User.find_or_create_by_id(8);c.update_attributes({ :name => '小林大志', :email => 'kobayashi@gmail.com', :password => 'kobayashi1224', :image_name => 'kobayashi.png' }, without_protection: true)
  end
end
