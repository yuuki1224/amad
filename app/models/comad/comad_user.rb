class Comad::ComadUser < ActiveRecord::Base
  attr_accessible :comad_id, :user_id

  def self.table_name
    return :comad_users
  end
end
