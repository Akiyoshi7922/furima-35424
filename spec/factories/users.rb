FactoryBot.define do
  factory :user do
    nick_name              {'マリオ'}
    email                  {Faker::Internet.free_email}
    password               {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    last_name              {'赤'}
    first_name             {'ピクミン'}
    last_name_kana         {'ソリッド'}
    first_name_kana        {'スネーク'}
    birthday               {'1889-09-23'}
  end # password_confirmation
end