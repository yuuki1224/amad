class Api::FriendsController < ApplicationController
  def index
    @hoge = ["baz","piyo"] 
    render :json => @hoge
  end

  def get_friends_list
    # @user = User.find(params[:user_id])
    @user = User.find(1)
    @friend_ids = User::Friend.where( :user_id => @user.id )
    @friends = []
    @friend_ids.each do |id|
      @friend = User.find(id.friend_user_id)
      @friends.push(@friend)
    end
    # 上から2個を消す
    @new = @friends.slice(0,2)
    @friends = @friends.slice(2,6)

    @group_ids = Group::GroupUser.where( :user_id => @user.id )
    @groups = []
    @group_ids.each do |id|
      @group = Group.find(id.group_id)
      @groups.push(@group)
    end

    @json = {}
    @json[:me] = @user
    @json[:new] = @new
    @json[:friends] = @friends
    @json[:groups] = @groups

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
