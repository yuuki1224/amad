class InsertConversation < ActiveRecord::Migration
  def change
    c=Conversation.find_or_create_by_id(1);c.update_attributes({ :younger_user_id => 1, :older_user_id => 2})
    c=Conversation.find_or_create_by_id(2);c.update_attributes({ :younger_user_id => 1, :older_user_id => 3})
    c=Conversation.find_or_create_by_id(3);c.update_attributes({ :younger_user_id => 1, :older_user_id => 4})
    c=Conversation.find_or_create_by_id(4);c.update_attributes({ :younger_user_id => 1, :older_user_id => 5})
    c=Conversation.find_or_create_by_id(5);c.update_attributes({ :younger_user_id => 1, :older_user_id => 6})
    c=Conversation.find_or_create_by_id(6);c.update_attributes({ :younger_user_id => 1, :older_user_id => 7})
    c=Conversation.find_or_create_by_id(7);c.update_attributes({ :younger_user_id => 1, :older_user_id => 8})
    c=Conversation.find_or_create_by_id(8);c.update_attributes({ :younger_user_id => 1, :older_user_id => 9})
  end
end
