require 'spec_helper'

describe 'Api::UserController' do
  describe 'GET api/user/get_add_friends' do
    context '正しいパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        get 'api/user/get_add_friends', :user_id=>@user.id
      end

      it '友達かもリストが返ってくること' do
        pending "テストからFacebookAPIたたきにいかないといけない"
      end

      it '200 OK が返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context '正しくないパラメータでのリクエストの時' do
      before do
        get 'api/user/get_add_friends'
      end
      it '404 が返ってくること' do
        expect(response).not_to be_success
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'PUT api/user/update_profile' do
    context '正しいパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        params = { :user_id=>@user.id,
                   :name=>'hoge',
                   :comad_id=>'baz',
                   :occupation=>'教師',
                   :description=>'こんにちは', 
                   :organization=>'京都工芸繊維大学'
                 }
        put 'api/user/update_profile', params
      end

      it '更新されること' do
        expect(@user.name).to eql('hoge')
        expect(@user.comad_id).to eql('baz')
        expect(@user.occupation).to eql('教師')
        expect(@user.description).to eql('こんにちは')
        expect(@user.organization).to eql('京都工芸繊維大学')
      end

      it '更新されたユーザーの情報が返ってくること' do
        binding.pry
        expect(response.body).to be_include 'hoge'
        expect(response.body).to be_include 'baz'
        expect(response.body).to be_include '教師'
        expect(response.body).to be_include 'こんにちは'
        expect(response.body).to be_include '京都工芸繊維大学'
      end

      it '200 OK が返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context '空のパラメーターでのリクエストの時' do
      before do
        @user = create(:user)
        params = {:user_id=>@user.id, :name=>'hoge', :comad_id=>'baz'}
        put 'api/user/update_profile', params
      end

      it '更新されないこと' do
        # expect(@user).to eq(@user) 
      end

      it '404 が返ってくること' do
        expect(response).not_to be_success
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'GET api/user/find_user' do
    context '友達ではない人を検索するパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        @no_friend = create(:user)
        get 'api/user/find_user', :user_id=>@user.id, :comad_id=>@no_friend.comad_id
      end

      it 'その友達の情報が返ってくること' do
        expect(response.body).to be_include(@no_friend.name)
        expect(response.body).to be_include(@no_friend.comad_id)
        expect(response.body).to be_include(@no_friend.occupation)
        expect(response.body).to be_include(@no_friend.description)
        expect(response.body).to be_include(@no_friend.organization)
      end

      it '200 OKが返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context 'でたらめなコマドIDを検索するパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        get 'api/user/find_user', :user_id=>@user.id, :comad_id=>'piyopiyopiyo'
      end

      it '何も返ってこないこと' do
        expect(response.body).to be_include('null')
      end

      it '200 OKが返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context '既に友達でその友達を検索するパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        @friend = create(:user, :comad_id=>'hoge')
        @user.friends << @friend
        get 'api/user/find_user', :user_id=>@user.id, :comad_id=>'hoge'
      end

      it '何も返ってこないこと' do
        expect(response.body).to be_include('null') 
      end

      it '200 OKが返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context '自分を検索するパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        get 'api/user/find_user', :user_id=>@user.id, :comad_id=>@user.comad_id
      end

      it '何も返ってこないこと' do
        expect(response.body).to be_include('null') 
      end

      it '200 OKが返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context 'パラメータなしでのリクエストの時' do
      before do
        get 'api/user/find_user'
      end

      it '404 が返ってくること' do
        expect(response).not_to be_success
        expect(response.status).to eq(404)
      end
    end
  end
end
