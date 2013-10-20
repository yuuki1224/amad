class InsertGroupGroupUser < ActiveRecord::Migration
  def change
    c=Group::GroupUser.find_or_create_by_id(1);c.update_attributes({ :group_id => 1, :user_id => 1 }, without_protection: true)
    c=Group::GroupUser.find_or_create_by_id(2);c.update_attributes({ :group_id => 2, :user_id => 1 }, without_protection: true)
    c=Group::GroupUser.find_or_create_by_id(3);c.update_attributes({ :group_id => 3, :user_id => 1 }, without_protection: true)
    c=Group::GroupUser.find_or_create_by_id(4);c.update_attributes({ :group_id => 4, :user_id => 1 }, without_protection: true)
    c=Group::GroupUser.find_or_create_by_id(5);c.update_attributes({ :group_id => 5, :user_id => 1 }, without_protection: true)
  end
end
