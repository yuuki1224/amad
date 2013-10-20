class Comad < ActiveRecord::Base
  attr_accessible :name, :location, :organizer_id,
                  :organizer_id, :start_time, :end_time,
                  :wifi, :power_source, :limit,
                  :is_group
end
