class Group < ActiveRecord::Base
  attr_accessible :name, :image_name, :description

  has_many :group_users, :class_name => 'Group::GroupUser'
  has_many :users, :class_name => 'User', through: :group_users, :source => :user
  attr_accessible :user_ids
end
