class InsertUser < ActiveRecord::Migration
  def change
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '浅野友希', :email => 'yuuki.1224.softtennis@gmail.com', :password => 'yuuki1224' }, without_protection: true)
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '足立壮大', :email => 'takehiro@gmail.com', :password => 'adachi1224' }, without_protection: true)
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '中川峰志', :email => 'nakagawa@gmail.com', :password => 'nakagawa1224' }, without_protection: true)
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '吉田万輝', :email => 'yoshida@gmail.com', :password => 'yoshida1224' }, without_protection: true)
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '佐藤大輔', :email => 'sato@gmail.com', :password => 'sato1224' }, without_protection: true)
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '松本凌', :email => 'matsumoto@gmail.com', :password => 'matsumoto1224' }, without_protection: true)
    c=User.find_or_create_by_id(1);c.update_attributes({ :name => '村田温美', :email => 'murata@gmail.com', :password => 'murata1224' }, without_protection: true)
  end
end
