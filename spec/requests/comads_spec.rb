require 'spec_helper'

describe 'Api::ComadsController' do
  describe 'GET api/comads/get_comads_list' do
    before do
      @user_with_friends = create(:user_with_friends)
      get 'api/comads/get_comads_list', :user_id=>@user_with_friends.id
    end

    context 'コマドが0件のユーザーの場合' do
      it '何も返ってこないこと' do
      end
    end

    context 'コマドが1件のユーザの場合' do
      before do
        @user = create(:user_with_comad)
        get 'api/comads/get_comads_list', :user_id=>@user.id
      end

      it '200 OK が返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it 'コマド情報が取得できること' do
        json = JSON.parse(response.body)
        binding.pry
        expect(json["new_comads"]['title']).to eq(@user.comads[0].title)
      end
    end

    context 'コマドが2件以上あるユーザーの場合' do
      it 'コマド一覧を取得できる', autodoc: true do
        json = JSON.parse(response.body)
        expect(json["new_comads"].class).to eq(Array)
        expect(json["date_comads"].class).to eq(Hash)
        expect(json["popular_comads"].class).to eq(Array)
        expect(json["my_comads"].class).to eq(Array)
        expect(response.body).to match(/烏丸/)
      end

      it '200 OK が返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it 'activeなのだけが返ってくること' do
      end

      it 'New: 新着順になってること' do
      end

      it 'Date: 開催順になってること(なう, 今日, 明日, 明日以降, いつでも)' do
      end

      it 'Popular: 人気順になってること' do
      end

      it 'Mycomad: 自分の関係しているコマドであること(今関わってる, 履歴)' do
      end
    end

  end

  describe 'POST api/comads/create_comad' do
    context '正しいパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        params = {:user_id => @user.id,
                  :title => 'ノマドしませんか？',
                  :location => '烏丸のスタバ',
                  :date_time => '2013-12-11 10:00',
                  :tense => 'なう'
                 }
        post 'api/comads/create_comad', params
      end

      it 'コマドが1つ増えること' do
        pending 'Comadが増えるの書き方わからん'
      end

      it '200 OKが返ってくること' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context '正しくないパラメータでのリクエストの時' do
      before do
        @user = create(:user)
        get 'api/comads/create_comad'
      end

      it 'コマドが増えてないこと' do
      end

      it '404 が返ってくること' do
        pending '404の出し方わからん'
        expect(response).not_to be_success
        expect(response.status).to eq(404)
      end
    end
  end
end
