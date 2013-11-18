class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    comad_users = @user.get_comad_users
    @user_json = User.to_json(@user)

    binding.pry
    if @user.persisted?
      session[:hoge] = @user.id 
      # 認証成功ページ
      # flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      @status = 200
      render :file => "users/success_login" 
      # redirect_to "index/success_login" 
      # render :json => comad_users
      # sign_in_and_redirect @user, :event => :authentication
    else
      # session["devise.facebook_data"] = request.env["omniauth.auth"]
      render :file => "users/success_login" 
      # redirect_to "index/success_login" 
      # redirect_to new_user_registration_url
    end
  end
end
