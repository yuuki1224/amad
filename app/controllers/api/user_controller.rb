class Api::UserController < ApplicationController
  def get_add_friends
    comad_users = @user.acquaintances
    render :json => comad_users 
  end

  def update_profile
    @user.update_attributes(
      :name => params[:name],
      :comad_id => params[:comad_id],
      :occupation => params[:occupation],
      :description => params[:description],
      :organization => params[:organization]
    )
    render :json => @user
  end

  def update_image
    if File.exist?("./public/images/profile/" + @user.image_name)
      FileUtils.rm("./public/images/profile/" + @user.image_name)
    end
    FileUtils.cp(params["profileImage"].tempfile.path, "./public/images/profile/" + @user.image_name)
    render :json => @user
  end

  def update_account
  end

  def update_notification
  end

  def update_mail
  end

  def update_settings
  end

  def find_user
    comad_id = params[:comad_id]
    @comad_user = User.find_by_comad_id(comad_id)
    if @user.friends.include?(@comad_user) || @user.eql?(@comad_user)
      render :json => nil
    else
      render :json => @comad_user
    end
  end
end
