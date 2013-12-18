class User < ActiveRecord::Base
  require 'json'
  require 'open-uri'
  require 'pathname'
  require 'digest/md5'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :friends
  has_many :group_users, :class_name => 'Group::GroupUser'
  has_many :groups, :class_name => 'Group', through: :group_users, :source => :group
  attr_accessible :group_ids

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  attr_accessible :name, :image_name, :uid, :password, :email, :access_token, :occupation, :comad_id, :description

  def get_comad_users
    facebook_friends = self.get_friends
    comad_users = []

    facebook_friends.each do |friend|
      is_comad_user = User.confirm_using_comad(friend['id'])
      if is_comad_user
        comad_users << is_comad_user
      end
    end
    return comad_users
  end

  def get_friends
    access_token = self.access_token
    graph = Koala::Facebook::API.new(access_token)
    friends = graph.get_connections("me", "friends")
  end

  def update_profile(name, comad_id, occupation, detail,
                     question1, question2, question3, question4)
    self.name = name
    self.comad_id = comad_id
    self.occupation = occupation
    self.description = detail
    self.question1 = question1
    self.question2 = question2
    self.question3 = question3
    self.question4 = question4
    self.save
  end

  def self.find_for_facebook_oauth(auth)
    user = User.where(:uid => auth.uid).first
    unless user
      image_url = auth[:info].image
      dir = Pathname.new './public/images/profile'
      filename = Digest::MD5.hexdigest(image_url) + '.jpg'
      filepath = dir + filename
      FileUtils.mkdir_p(dir) unless FileTest.exist?(dir)
      open(filepath, 'wb') do |output|
        open(image_url) do |data|
          output.write(data.read)
        end
      end
      user = User.create(name: auth.extra.raw_info.name,
                         image_name: filename,
                         uid: auth.uid,
                         email: auth.extra.raw_info.email,
                         access_token: auth.credentials.token,
                         password: Devise.friendly_token[0,20]
                        )
    else
      user[:access_token] = auth.credentials.token
      user.save!
    end
    user
  end

  def self.confirm_using_comad(id)
    comad_user = User.where(:uid => id).first
    comad_user.presence
  end

  def self.to_json(user)
    raise ActiveModel::Errors.new(self) unless user.class == User
    user_hash = {:id => user.id,
                 :name => user.name,
                 :comadId => user.comad_id,
                 :occupation => user.occupation,
                 :detail => user.description,
                 :image_name => user.image_name}
    JSON.generate(user_hash)
  end
end
