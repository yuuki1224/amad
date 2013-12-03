class User::Friend < ActiveRecord::Base
  attr_accessible :user_id, :friend_user_id
  belongs_to :user

  def self.add_friend(user_id, friend_id)
    younger_id = user_id < friend_id ? user_id : friend_id
    older_id = user_id < friend_id ? friend_id : user_id
    # user_idのfriendの中にいないか確認
    user_friend = User::Friend.create(user_id: user_id,
                        friend_user_id: friend_id)
    user_friend.save!
    friend_user = User::Friend.create(user_id: friend_id,
                        friend_user_id: user_id)
    friend_user.save!

    conversation = Conversation.create(younger_user_id: younger_id, older_user_id: older_id)
    conversation.save!
  end
  
end
