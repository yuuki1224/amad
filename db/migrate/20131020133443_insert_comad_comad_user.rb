class InsertComadComadUser < ActiveRecord::Migration
  def change
    c=Comad::ComadUser.find_or_create_by_id(1);c.update_attributes({ :comad_id => 1, :user_id => 1})
    c=Comad::ComadUser.find_or_create_by_id(2);c.update_attributes({ :comad_id => 2, :user_id => 1})
  end
end
