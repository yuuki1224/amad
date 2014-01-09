class ApplicationController < ActionController::Base
  before_action :set_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def set_user
    @user = User.find(params[:user_id]) unless params[:user_id].nil?
    @user = User.find(params[:id]) unless params[:id].nil?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
