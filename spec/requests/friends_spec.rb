require 'spec_helper'

describe 'Api::FriendsController' do
  describe 'GET api/friends/get_friends_list' do
    context '正しいパラメータでのリクエストの時' do
      before do
        @user_with_friends = create(:user_with_friends)
        get 'api/friends/get_friends_list', :user_id=>@user_with_friends.id
      end

      it '自分の情報が返ってくること' do
        expect(response.body).to be_include @user_with_friends.name 
      end

      it '正しい友達リストが返ってくること' do
        @user_with_friends.friends.each do |friend|
          expect(response.body).to be_include friend.name
        end
      end

      it '200 OKであること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context '正しくないパラメータでのリクエストの時' do
      before do
        get 'api/friends/get_friends_list'
      end

      it '404 が返ってくること' do
        expect(response).not_to be_success
        # expect(response.status).to eq(404)
      end
    end
  end

  describe 'GET api/friends/add_friend' do
    context '正しいパラメータでのリクエストの時' do
      before do
        @user_with_friends = create(:user_with_friends)
        @friend = create(:user)
        get 'api/friends/add_friend', 
          :user_id=>@user_with_friends.id, 
          :friend_id=>@friend.id
      end

      it '友達が一人増えること' do
        expect(@user_with_friends).to have(3).friends
      end

      it '相手の方も自分が一人増えてること' do
        expect(@friend).to have(1).friends
      end

      it '200 OKが返ってきてること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context '既に友達を追加するパラメータでのリクエストの時' do
      before do
        @user_with_friends = create(:user_with_friends)
        get 'api/friends/add_friend', 
          :user_id=>@user_with_friends.id, 
          :friend_id=>@user_with_friends.friends.first.id
      end

      it '既に友達なので増えていないこと' do
        expect(@user_with_friends).to have(2).friends
      end
    end

    context 'パラメータなしでのリクエストの時' do
      before do
        get 'api/friends/add_friend'
      end

      it '404 が返ってきてること' do
        expect(response).not_to be_success
        expect(response.status).to eq(404)
      end
    end
  end
end
