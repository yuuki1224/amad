class Api::FriendsController < ApplicationController
  def get_friends_list
    # render :nothing => true, :status => 404 if params[:user_id].blank?
    @friends = @user.friends
    @user_attributes = @user.attributes
    @user_attributes.delete('access_token')
    @user_attributes.delete('encyped_password')

    @json = {}
    @json[:me] = @user_attributes
    @json[:friends] = @friends

    render :json => @json
  end

  def add_friend
    # not_found unless params[:user_id].blank?
    added_friend = User.find_by_id(params[:friend_id])
    @user.friends << added_friend unless @user.friends.include?(added_friend)
    added_friend.friends << @user unless added_friend.friends.include?(@user)
    render :json => @user 
  end

  def block_person
    # blockする処理追加
    render :json => @user 
  end
end
