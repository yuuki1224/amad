require 'spec_helper'

describe User do
  describe '#get_comad_users' do
    context 'facebook友達がコマドをやってるとき' do
      it '友達のリストが返ってくる' do
      end
    end
    context 'facebook友達がコマドをやってないとき' do
      it '友達のリストがかえってこない' do
      end
    end
  end

  describe '#get_friends' do
    it '友達のリストが返ってくる' do
    end
  end

  describe '#update_profile' do
    context '正しい引数で呼ばれたとき' do
      it '値が変わっていること' do
      end
    end
    context '正しくない引数で呼ばれたとき' do
      it '値が変わっていないこと' do
      end
    end
  end

  describe '.find_for_facebook_oauth' do
    context 'ユーザーが既に登録されてるとき' do
    end
    context 'ユーザーがまだ登録されていないとき' do
    end
  end

  describe '.confirm_using_comad' do
    let(:user) do
      FG.create(:asano, :as_using_comad)
    end
    context '引数に渡すidの友達がコマドを使ってるとき' do
      it 'trueと返ってくる' do
        user
        result = User.confirm_using_comad('100001962590247')
        expect(result.class).to eql(User)
      end
    end
    context '引数に渡すidの友達がコマドを使ってるとき' do
      it 'nilが返ってくる' do
        result = User.confirm_using_comad('100001962590247')
        expect(result).to eql(nil)
      end
    end
  end

  describe '.to_json' do
    let(:user) do
      FG.create(:asano, :as_using_comad)
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
