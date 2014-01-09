require 'spec_helper'

describe User do
  describe '#acquaintances' do
    context 'facebook友達がコマドをやってるとき' do
      before do
        @user = create(:user, :as_using_comad)
        User.stub(:fb_friends).and_return('hoge') 
        @user.stub(:fb_friends).and_return('baz')
        binding.pry
        # fb_friendsをスタブしとくべき
        @user.acquaintances
      end

      it '友達のリストが返ってくる' do
      end
    end

    context 'facebook友達がコマドをやってないとき' do
      it '友達のリストがかえってこない' do
      end
    end
  end

  describe '#fb_friends' do
    before do
      binding.pry
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end
    let(:user){ create(:asano, :access_token => request.env["omniauth.auth"]["credentials"].token) }

    it '友達のリストが返ってくる' do
      friends = user.fb_friends
      binding.pry
    end
  end

  describe '.find_for_facebook_oauth' do
    context 'ユーザーが既に登録されてるとき' do
    end
    context 'ユーザーがまだ登録されていないとき' do
    end
  end

  describe '.to_json' do
    let(:user) do
      create(:asano, :as_using_comad)
    end

    context '正しい引数で呼ばれたとき' do
      it '正しい値が返ってくる' do
        json = User.to_json user
        expect(json.class).to eql(String)
      end
    end

    context '間違った引数で呼ばれたとき' do
      it 'Userモデルじゃなかったら' do
        proc {
          User.to_json 'aaa'
        }.should raise_error(TypeError)
      end
      it '値を渡さなかったら例外が発生する' do
        proc {
          User.to_json
        }.should raise_error(ArgumentError)
      end
    end
  end
end
