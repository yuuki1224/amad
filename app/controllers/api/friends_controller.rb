class Api::FriendsController < ApplicationController
  def index
  end

  def get_friends_list
    @user_friends = @user.friends
    @friends = []
    @user_friends.each do |id|
      @friend = User.find(id.friend_user_id)
      @friends.push(@friend)
    end
    # 上から2個を消す
    @new = @friends.slice(0,2)
    @friends = @friends.slice(0,6)

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

  def add_friend
    friend = User.find_by_id(params[:friend_id])
    User::Friend.add_friend(@user.id, friend.id)
    render :json => @user 
  end

  def get_groups_list
  end
end
