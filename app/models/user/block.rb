class User::Block < ActiveRecord::Base
  attr_accessible :user_id, :block_user_id
    belongs_to :user, :class_name => "User"
    belongs_to :block_user, :class_name => "User"

end
