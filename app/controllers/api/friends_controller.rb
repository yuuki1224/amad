class Api::FriendsController < ApplicationController
  def index
    @hoge = ["baz","piyo"] 
    render :json => @hoge
  end

  def get_friends_list
    @user_id = params[:user_id]

    @me_name = "浅野友希"
    @me_image = "asano.png"

    @new_user_names = ["足立壮大","中川峰志"]
    @new_user_images = ["adachi.png","nakagawa.png"]

    @user_names = ["吉田万輝","佐藤大輔","松本凌","村田温美","小林大志"]
    @user_images = ["yoshida.png","sato.png","matsumoto.png","murata.png","kobayashi.png"]

    @group_names = ["楽洛堂","Campus","カンファー","猛者会","あんさんぶる"]
    @group_images = ["bosscolle.png","campus.png","picola.png","arduino.png","kimisaki.png"]

    @json = {}
    @json[:me] = {:name => @me_name, :userId => 1, :imageName => @me_image}

    @json[:new] = [] 
    2.times do |i|
      user_id = i + 1
      @user = {:name => @new_user_names[i], :userId => user_id, :imageName => @new_user_images[i]}
      @json[:new].push(@user)
    end

    @json[:groups] = []
    5.times do |i|
      group_id = i + 1
      @group = {:name => @group_names[i], :groupId => group_id, :imageName => @group_images[i]}
      @json[:groups].push(@group)
    end

    @json[:friends] = []
    5.times do |i|
      user_id = i + 4 
      @user = {:name => @user_names[i], :userId => user_id, :imageName => @user_images[i]}
      @json[:friends].push(@user)
    end

    render :json => @json
  end

  def get_groups_list
    @user1 = {
      :user_id => 2,
      :name => 'Adachi Takehiro',
      :image_url => 'http://campus-inc.org/img/logo_off.png',
      :friend => true
    }
    @user2 = {
      :user_id => 4,
      :name => 'Nakagawa Takashi',
      :image_url => 'http://campus-inc.org/img/logo_off.png',
      :friend => true
    }
    @user3 = {
      :user_id => 5,
      :name => 'Sato Daisuke',
      :image_url => 'http://campus-inc.org/img/logo_off.png',
      :friend => false 
    }
    @group = {
      :group_id => 12,
      :name => '楽洛堂',
      :image_url => 'http://campus-inc.org/img/logo_off.png',
      :people => [ 
      ] 
    }
    @group[:people].push(@user1)
    @group[:people].push(@user2)
    @group[:people].push(@user3)

    @groups = []
    3.times do
      @groups.push(@group)
    end
    render :json => @groups
  end
end
