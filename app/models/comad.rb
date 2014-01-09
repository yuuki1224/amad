class Comad < ActiveRecord::Base
  include Redis::Objects
  value :people
  value :conversations

  attr_accessible :title, :location, :user_id,
                  :image_name, :date_time, 
                  :tense, :is_active
  belongs_to :user

  def people_num
    return 0 if self.people.value.nil?
    people = JSON.parse(self.people.value)
    people.count
  end

  def conversation_num
    return 0 if self.conversations.value.nil?
    conversations = JSON.parse(self.conversations.value)
    conversations.count
  end

  def user
    User.find(self.user_id) unless self.user_id.nil?
  end

  def self.get_new_comads(user)
    comads = []
    comads << user.comads
    user.friends.each do |friend|
      comads << friend.comads
    end
    comads.flatten!
    comads.select! {|comad| comad.is_active}
    new_comads = comads.sort {|a,b|a.created_at <=> b.created_at}
    new_comads.reverse
  end

  def self.get_date_comads(user)
    comads = []
    comads << user.comads
    user.friends.each do |friend|
      comads << friend.comads
    end
    comads.flatten!
    comads.select! {|comad| comad.is_active}
    date_comads = { :now => [], 
                    :today => [], 
                    :tomorrow => [], 
                    :day_after_tomorrow => [], 
                    :any_time => []}
    comads.each do |comad|
      case comad.tense
        when 'なう'
          date_comads[:now] << comad
        when '今日'
          date_comads[:today] << comad
        when '明日'
          date_comads[:tomorrow] << comad
        when '明日以降'
          date_comads[:day_after_tomorrow] << comad
        when 'いつでも'
          date_comads[:any_time] << comad
      end
    end
    date_comads
  end

  def self.get_popular_comads(user)
    comads = []
    comads << user.comads
    user.friends.each do |friend|
      comads << friend.comads
    end
    comads.flatten!
    comads.select! {|comad| comad.is_active}
    comads.sort! {|a,b| a.conversation_num <=> b.conversation_num }
    comads.reverse
  end

  def self.get_my_comads(user)
    user.comads.target
  end

  def self.to_json(comads)
    if comads.is_a?(Array)
      comads_array = []
      comads.each do |comad|
        comad_hash = comad.attributes
        comad_hash[:people_num] = comad.people_num
        comad_hash[:conversation_num] = comad.conversation_num
        comads_array << comad_hash
      end
      comads_array
    elsif comads.is_a?(Hash)
      comads_hash = {:now => [], 
                     :today => [], 
                     :tomorrow => [], 
                     :day_after_tomorrow => [], 
                     :any_time => []
      }
      comads[:now].each do |comad|
        comad_hash = comad.attributes
        comad_hash[:people_num] = comad.people_num
        comad_hash[:conversation_num] = comad.conversation_num
        comads_hash[:now] << comad_hash
      end
      comads[:today].each do |comad|
        comad_hash = comad.attributes
        comad_hash[:people_num] = comad.people_num
        comad_hash[:conversation_num] = comad.conversation_num
        comads_hash[:today] << comad_hash
      end
      comads[:tomorrow].each do |comad|
        comad_hash = comad.attributes
        comad_hash[:people_num] = comad.people_num
        comad_hash[:conversation_num] = comad.conversation_num
        comads_hash[:tomorrow] << comad_hash
      end
      comads[:day_after_tomorrow].each do |comad|
        comad_hash = comad.attributes
        comad_hash[:people_num] = comad.people_num
        comad_hash[:conversation_num] = comad.conversation_num
        comads_hash[:day_after_tomorrow] << comad_hash
      end
      comads[:any_time].each do |comad|
        comad_hash = comad.attributes
        comad_hash[:people_num] = comad.people_num
        comad_hash[:conversation_num] = comad.conversation_num
        comads_hash[:any_time] << comad_hash
      end
      comads_hash
    end
  end
end
