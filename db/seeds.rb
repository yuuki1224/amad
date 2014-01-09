# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
yml = File.read("#{Rails.root}/db/seeds/#{User.to_s.tableize}.yml")
list = YAML.load(yml).symbolize_keys

list[User.to_s.tableize.to_sym].each_with_index do |r, index|
  User.create do |t|
    r.each do |i, v|
      t.send "#{i}=",v
    end
  end
end

yml = File.read("#{Rails.root}/db/seeds/#{Comad.to_s.tableize}.yml")
list = YAML.load(yml).symbolize_keys

list[Comad.to_s.tableize.to_sym].each_with_index do |r, index|
  Comad.create do |t|
    r.each do |i, v|
      t.send "#{i}=",v
    end
  end
end

yml = File.read("#{Rails.root}/db/seeds/#{Conversation.to_s.tableize}.yml")
list = YAML.load(yml).symbolize_keys

list[Conversation.to_s.tableize.to_sym].each_with_index do |r, index|
  Conversation.create do |t|
    r.each do |i, v|
      t.send "#{i}=",v
    end
  end
end

yml = File.read("#{Rails.root}/db/seeds/#{User::Friend.to_s.tableize}.yml")
list = YAML.load(yml).symbolize_keys

list[User::Friend.to_s.tableize.to_sym].each do |r|
  User::Friend.create do |t|
    r.each do |i, v|
      t.send "#{i}=",v
    end
  end
end
