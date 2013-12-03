class Conversation < ActiveRecord::Base
  attr_accessible :younger_user_id, :older_user_id
end
