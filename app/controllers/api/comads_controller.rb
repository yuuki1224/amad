class Api::ComadsController < ApplicationController

  def get_comads_list
    @comads = Comad.find(:all)
    @group_comads = [] 
    @will_comads = []
    @normal_comads = []

    @comads.each do |comad|
      if comad.is_group
        @group_comads.push(comad)
      else
        @attend_comad_list = Comad::ComadUser.find(:all)
        @attend_comad_list.each do |attend|
          if attend.user_id == @user.id && comad.id == attend.comad_id
            @will_comads.push(comad)
          end
        end
        @normal_comads.push(comad)
      end
    end

    @json = {}
    @json[:will] = @will_comads
    @json[:group] = @group_comads
    @json[:comad] = @normal_comads

    render :json => @json
  end

  def create_comad
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
