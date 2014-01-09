class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
    @user_json = @user.attributes.to_json 

    if @user.persisted?
      @status = 200
      render :file => "users/success_login" 
    else
      # session["devise.facebook_data"] = request.env["omniauth.auth"]
      render :file => "users/success_login" 
      # redirect_to "index/success_login" 
      # redirect_to new_user_registration_url
    end
  end
end
