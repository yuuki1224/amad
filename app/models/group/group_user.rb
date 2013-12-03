class Group::GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id

  belongs_to :user
  belongs_to :group

  def self.table_name
    return :group_users
  end
end
