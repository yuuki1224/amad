class Api::ComadsController < ApplicationController

  def get_comads_list
    # comadを全部取ってくる
    user_friend_ids = []
    @user.friends.each do |user_friend|
      user_friend_ids << user_friend.friend_user_id
    end

    groups = @user.groups
    group_ids = []
    groups.each do |group|
      group_ids << group.id
    end

    comads = Comad.where(organizer_id: user_friend_ids)
    group_comads = Comad.where(group_id: group_ids)

    new_comads = comads.order('created_at DESC')
    date_comads = comads.order('date_time DESC')

    new_jsons = []
    new_comads.each do |new_comad|
      if new_comad.date_time.present?
        date_time = new_comad.date_time.strftime("%Y-%m-%d %H:%M")
      else
        date_time = ''
      end
      
      new_json = {
        name: new_comad.user.name,
        imageName: new_comad.user.image_name,
        comadId: new_comad.user.comad_id,
        title: new_comad.title,
        dateTime: date_time,
        location: new_comad.location,
        tense: new_comad.tense,
        people: new_comad.people_num,
        comments: new_comad.conversation_num,
        created_at: new_comad.created_at.strftime("%Y-%m-%d %H:%M")
      }
      new_jsons << new_json
    end

    date_jsons = []
    date_comads.each do |date_comad|
      if date_comad.date_time.present?
        date_time = date_comad.date_time.strftime("%Y-%m-%d %H:%M")
      else
        date_time = ''
      end
      
      date_json = {
        name: date_comad.user.name,
        imageName: date_comad.user.image_name,
        comadId: date_comad.user.comad_id,
        title: date_comad.title,
        dateTime: date_time,
        location: date_comad.location,
        tense: date_comad.tense,
        people: date_comad.people_num,
        comments: date_comad.conversation_num,
        created_at: date_comad.created_at.strftime("%Y-%m-%d %H:%M")
      }
      date_jsons << date_json
    end

    popular_comad = date_jsons.sort_by {|comad| comad[:people] }
    popular_comad.reverse!

    my_comad = []
    my_comad << popular_comad[1]
    my_comad << popular_comad[2]

    comads = {
      new_comad: new_jsons,
      date_comad: date_jsons,
      popular_comad: popular_comad,
      my_comad: my_comad
    }

    render :json => comads
  end

  def create_comad
    binding.pry
    @start_time = params[:start_time]
    @until_time = params[:end_time]
    @location = params[:location]
    @limit = params[:limit]
    @detail = params[:detail]
    @wifi = params[:wifi] == '1' ? true : false
    @power = params[:power_source] == '1' ? true : false

    comad = Comad.create(:name => @user.name,
                         :location => @location,
                         :organizer_id => @user.id,
                         :image_name => @user.image_name,
                         :start_time => @start_time.to_datetime,
                         :end_time => @until_time.to_datetime,
                         :limit => @limit[0],
                         :is_group => false,
                         :wifi => @wifi,
                         :power_source => @power)
    render :json => comad 
  end

  # attendボタンが押された時
  def attend_comad
    exist_comad = Comad::ComadUser.where(:comad_id => params[:comad_id],
                                         :user_id => @user.id).presence
    unless exist_comad
      Comad::ComadUser.create(:comad_id => params[:comad_id],
                              :user_id => @user.id)
      @json = ['baz']
      render :json => @json
    else
      @json = ['hoge']
      render :json => @json
    end
  end
end
