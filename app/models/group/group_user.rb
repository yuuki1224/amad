class Group::GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id

  def self.table_name
    return :group_users
  end
end
