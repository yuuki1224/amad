class User::Friend < ActiveRecord::Base
  attr_accessible :user_id, :friend_user_id
  belongs_to :user
  
end
