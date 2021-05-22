FactoryBot.define do
  factory :item do
    association :user
    product_name          {'ゼルダの伝説スカイウォードソード'}
    product_description   {'マスターソード創生の秘密が今明かされる！'}
    category_id           {7}
    product_status_id     {7}
    shipping_id           {7}
    prefecture_id         {7}
    shipping_day_id       {7}
    price                 {77777}
    # ActiveStorageの場合
  after(:build) do |item|
    item.image.attach(io: File.open('public/images/333.jpeg'), filename: '333.jpeg')
    end
  end
end
