class OrderAddres
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_numbe, :commit

  with_options presence: true do
  validates :postal_code
  validates :city
  validates :house_number
  validates :building_name
  validates :phone_numbe

  end

  with_options numericality:  { other_than: 1 } do
   validates :prefecture_id
  end

  def save

  donation = Orders.create(user: user_id,  item: item_id)
  Addresses.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_numbe: phone_numbe, donation_id: donation.id)
  end

end