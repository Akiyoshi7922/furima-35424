class OrderPayjp
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :address, :city, :house_number, :building_name, :phone_number, :commit, :user_id, :item_id

  with_options presence: true do
  validates :city
  validates :house_number
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "Input only number"}
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}


  end

  with_options numericality:  { other_than: 1 } do
   validates :prefecture_id
  end

  def save

  donation = Orders.create(user: user_id,  item: item_id)
  Addresses.create(postal_code: postal_code, prefecture_id: prefecture_id, address: address, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, donation_id: donation.id)
  end

end