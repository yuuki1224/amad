class Comad < ActiveRecord::Base
  attr_accessible :title, :location, :organizer_id,
                  :image_name, :group_id, :date_time, 
                  :tense, :is_group
  has_many :comad_users

  def people_num
    return rand 1..10
  end

  def conversation_num
    return rand(100) 
  end

  def user
    User.find(self.organizer_id) unless self.organizer_id.nil?
  end
end
