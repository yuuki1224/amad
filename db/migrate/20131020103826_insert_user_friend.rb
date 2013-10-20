class InsertUserFriend < ActiveRecord::Migration
  def change
    c=User::Friend.find_or_create_by_id(1);c.update_attributes({:user_id => 1, :friend_user_id => 2}, without_protection: true)
    c=User::Friend.find_or_create_by_id(2);c.update_attributes({:user_id => 1, :friend_user_id => 3}, without_protection: true)
    c=User::Friend.find_or_create_by_id(3);c.update_attributes({:user_id => 1, :friend_user_id => 4}, without_protection: true)
    c=User::Friend.find_or_create_by_id(4);c.update_attributes({:user_id => 1, :friend_user_id => 5}, without_protection: true)
    c=User::Friend.find_or_create_by_id(5);c.update_attributes({:user_id => 1, :friend_user_id => 6}, without_protection: true)
    c=User::Friend.find_or_create_by_id(6);c.update_attributes({:user_id => 1, :friend_user_id => 7}, without_protection: true)
    c=User::Friend.find_or_create_by_id(7);c.update_attributes({:user_id => 1, :friend_user_id => 8}, without_protection: true)
  end
end
