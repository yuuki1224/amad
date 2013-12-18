# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asano, class: User do
    name "浅野友希"
    email "asano.1224.softtennis@gmail.com"
    password "yuuki1224" 
    image_name "asano.png"
    occupation "エンジニア"
    comad_id "yuuki1224"
    description "学生エンジニアです。好きな言語はPHPです。"
    question1 "立命館大学"
    question2 "Ruby"
    question3 "Phothoshop"
    question4 "Vim"
  end

  trait :as_using_comad do
    uid '100001962590247'
  end

  trait :as_not_using_comad do
  end
end
