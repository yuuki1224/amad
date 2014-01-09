# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    image_name ['adachi.png', 'nakagawa.png', 'yoshida.png'].sample
    occupation ['エンジニア', 'デザイナー', '学生', 'プランナー'].sample
    comad_id { Faker::Internet.user_name }
    description ['hoge', 'piyo', 'baz'].sample
    organization { Faker::Company.name }

    factory :user_with_friends do
      friends {
        [create(:user_with_comad), create(:user_with_comad)]
      }
    end

    factory :user_with_comad do
      comads {
        [create(:comad)]
      }
    end
  end

  factory :asano, class: User do
    name "浅野友希"
    email "asano@gmail.com"
    password "asano1224" 
    image_name "asano.png"
    occupation "エンジニア"
    comad_id "asano"
    description "asanoです。"
    organization "京都工芸繊維大学"
  end

  trait :as_using_comad do
    uid '100001962590247'
  end

  trait :as_not_using_comad do
  end
end
