class Comad < ActiveRecord::Base
  attr_accessible :name, :location, :organizer_id,
                  :image_name, :group_id, :start_time, 
                  :end_time, :wifi, :power_source,
                  :limit, :is_group
  has_many :comad_users
end
