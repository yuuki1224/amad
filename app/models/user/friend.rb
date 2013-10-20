class User::Friend < ActiveRecord::Base
  attr_accessible :user_id, :friend_user_id
end
