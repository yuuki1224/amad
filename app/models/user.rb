class User < ActiveRecord::Base
  require 'json'
  require 'open-uri'
  require 'pathname'
  require 'digest/md5'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  attr_accessible :name, :image_name, :uid, :password, :email, :access_token, :occupation, :comad_id, :description, :organization

  has_many :from_friend_relations, :foreign_key => "user_id", :class_name => "User::Friend"
  has_many :to_friend_relations, :foreign_key => "friend_user_id", :class_name => "User::Friend"

  # has_many :from_friends, :through => :from_friend_relations, :source => :friend_user
  has_many :friends, :through => :from_friend_relations, :source => :friend_user
  has_many :to_friends, :through => :to_friend_relations, :source => :user

  has_many :comads

  # facebook友達かつコマともでない人一覧
  def acquaintances 
    fb_friends_uids = []
    self.fb_friends.each do |friend|
      fb_friends_uids << friend['id']
    end
    user_in_fb_friends = User.where(:uid => fb_friends_uids).to_a
    self.friends.each do |friend|
      user_in_fb_friends.delete(friend)
    end
    user_in_fb_friends
  end

  # facebookの友達一覧
  def fb_friends
    graph = Koala::Facebook::API.new(self.access_token)
    graph.get_connections("me", "friends")
  end

  # facebookから返ってきたparamsを元にユーザー生成
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

  # userインスタンスをjsonにする
  def self.to_json(user)
    raise ActiveModel::Errors.new(self) unless user.class == User
    user_hash = {:id => user.id,
                 :name => user.name,
                 :comad_id => user.comad_id,
                 :occupation => user.occupation,
                 :detail => user.description,
                 :image_name => user.image_name}
    JSON.generate(user_hash)
  end
end
