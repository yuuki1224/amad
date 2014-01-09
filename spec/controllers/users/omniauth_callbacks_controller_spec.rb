require 'spec_helper'

describe Users::OmniauthCallbacksController do
  describe 'facebook' do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      @user =  create(:asano, :as_using_comad)
    end
    it 'test' do
      get '/users/auth/facebook'
      binding.pry
    end
  end
end
