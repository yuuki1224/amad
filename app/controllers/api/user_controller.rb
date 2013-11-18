class Api::UserController < ApplicationController
  def get_add_friends
    comad_users = @user.get_comad_users
    friends = @user.get_friends
    render :json => friends
  end

  def update_settings
    binding.pry
  end

  def update_profile
    comad_id = params[:comadId]
    name = params[:name]
    occupation = params[:occupation]
    detail = params[:detail]
    question1 = params[:question1]
    question2 = params[:question2]
    question3 = params[:question3]
    question4 = params[:question4]
    @user.update_profile(name, comad_id, occupation, detail,
                         question1, question2, question3, question4)
    render :json => @user
  end

  def update_account
  end

  def update_notification
  end

  def update_mail
  end

  def find_user
    comad_id = params[:comad_id]
    @comad_user = User.find_by_comad_id(comad_id)
    render :json => @comad_user
  end
end
