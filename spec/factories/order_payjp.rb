FactoryBot.define do
  factory :order_payjp do
    postal_code                    {'150-4567'}
    prefecture_id                  {7}
    city                           {'キノコ区'}
    address                        {'キノコ1-1'}
    building_name                  {}
    phone_number                   {'09012345678'}
    token                          {"tok_abcdefghijk00000000000000000"}
  end
end
