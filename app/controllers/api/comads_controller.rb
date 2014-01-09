class Api::ComadsController < ApplicationController
  def get_comads_list
    new_comads = Comad.get_new_comads(@user)
    date_comads = Comad.get_date_comads(@user)
    popular_comads = Comad.get_popular_comads(@user)
    my_comads = Comad.get_my_comads(@user)

    new_comads_json = Comad.to_json(new_comads)
    date_comads_json = Comad.to_json(date_comads)
    popular_comads_json = Comad.to_json(popular_comads)
    my_comads_json = Comad.to_json(my_comads)

    comads = {:new_comads => new_comads_json, 
              :date_comads => date_comads_json,
              :popular_comads => popular_comads_json,
              :my_comads => my_comads_json
    }
    render :json => comads
  end

  def create_comad
    if params[:date_time] == "未定"
      comad = Comad.create(:name => @user.name,
                           :title => params[:title],
                           :user_id => @user.id,
                           :location => params[:location],
                           :image_name => @user.image_name,
                           :tense => params[:tense],
                           :is_active => true
                          )
    else
      comad = Comad.create(:name => @user.name,
                           :title => params[:title],
                           :user_id => @user.id,
                           :location => params[:location],
                           :image_name => @user.image_name,
                           :date_time => params[:date_time].to_datetime.to_time,
                           :tense => params[:tense],
                           :is_active => true
                          )
    end
    comad.conversations.value = '[]' 
    comad.people.value = '[]' 
    render :json => comad 
  end
end
